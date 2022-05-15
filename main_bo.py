import logging
import multiprocessing as mp
import os
import pickle
import sys
import time
from argparse import ArgumentParser

import matlab.engine
import numpy as np
from ax.service.ax_client import AxClient

time_start = time.time()
n_timestep = 16
T_SOC = [
    (25, 10),
    (25, 70),
    (45, 70),
    (60, 70),
]
df = len(T_SOC) * n_timestep - 7 - 1

with open('processed_data/sim_dict.pkl', 'rb') as f:
    ca_dict = pickle.load(f)


def evaluate(parameters, work_id, q, trial_index):
    n_points = 0
    step = 0
    error = 0
    names = matlab.engine.find_matlab()
    eng = matlab.engine.connect_matlab(names[work_id])
    try:
        for T, SOC_storage in T_SOC:
            for sub_step in range(n_timestep + 1):
                n_points += 1
                params = {'T': T + 273.15, 'SOC_storage': SOC_storage / 100,
                          **{k: float(v) for k, v in parameters.items()}, }
                if sub_step == 0:
                    Qbase = eng.comsol_api_ca_final(params, 1)
                else:
                    Q = eng.comsol_api_ca_final(params) / Qbase
                    Q_sim = ca_dict[(T, SOC_storage, sub_step)]
                    error_this_step = (Q - Q_sim) ** 2
                    error += error_this_step

                    print(
                        'Trial:{:d},,Sub_step:{:d},Step:{:d}, Time:{:d} min, SOC:{:d},T:{:d},Q:{:4.3f},Q_sim:{:4.3f}'.format(
                            trial_index, sub_step, step, int((time.time() - time_start) / 60), SOC_storage, T, Q,
                            Q_sim))

                if sub_step != 0:
                    step += 1

        q.put({'idx': trial_index, 'res': (np.sqrt(error / df), 0), 'success': True, 'n_points': n_points})
    except Exception:
        print(Exception)
        q.put({'idx': trial_index, 'res': (0, 0), 'success': False, 'n_points': n_points})


def main(rpt, n_trials, engs_id):
    logger = logging.getLogger(__name__)
    formatter = logging.Formatter('%(asctime)s:%(message)s')
    file_handler = logging.FileHandler(f'log_{rpt:02d}.log')
    file_handler.setFormatter(formatter)
    logger.addHandler(file_handler)  # comment this out if you do not want log file
    print_handler = logging.StreamHandler(sys.stdout)
    logger.addHandler(print_handler)
    logger.setLevel(logging.DEBUG)

    ax_client = AxClient()
    ax_client.create_experiment(
        name="main_ca_60sim",
        parameters=[
            {
                "name": "k_SEI",
                "type": "range",
                "bounds": [1E-14, 1E-12],
                "log_scale": True,
            },
            {
                "name": "lambda_SEI0",
                "type": "range",
                "bounds": [1.E5, 1.E8],
                "log_scale": True,

            },
            {
                "name": "k_sol",
                "type": "range",
                "bounds": [0.0, 1.0],
            },
            {
                "name": "Ea_sol",
                "type": "range",
                "bounds": [20.e3, 100.e3],
            },
            {
                "name": "k_diss_Kindermann",
                "type": "range",
                "bounds": [1E-9, 1E-5],
                "log_scale": True,

            },
            {
                "name": "Ea_diss_Kindermann",
                "type": "range",
                "bounds": [50.e3, 200.e3],
            },
        ],
        objective_name="error",
        minimize=True,
        choose_generation_strategy_kwargs={"max_parallelism_override": 10},
    )

    n_result = 0
    total_points = 0
    q = mp.Queue()
    ps = []
    current_best = 1000

    for i in range(len(engs_id)):
        parameters, trial_index = ax_client.get_next_trial()
        p = mp.Process(target=evaluate, args=(parameters, engs_id[i], q, trial_index))
        p.start()
        ps.append(p)
    while n_result < n_trials:
        # get result
        res = q.get(block=True)
        if res['success'] == True:
            ax_client.complete_trial(trial_index=res['idx'], raw_data=res['res'])
            if current_best > res['res']:
                current_best = res['res']
        else:
            ax_client.log_trial_failure(trial_index=res['idx'])

        # log
        n_result += 1
        total_points += res['n_points']

        logger.info(f"Total points, {total_points}, current best value, {current_best}")

        # input a new parameter
        for i in range(len(engs_id)):
            if ps[i].is_alive() == False:
                parameters, trial_index = ax_client.get_next_trial()
                p = mp.Process(target=evaluate, args=(parameters, engs_id[i], q, trial_index))
                p.start()
                ps[i] = p

    best_parameters, values = ax_client.get_best_parameters()
    print(best_parameters)
    ax_client.save_to_json_file(filepath=f'./result/sim_{rpt:02d}.json')


if __name__ == '__main__':
    parser = ArgumentParser()
    parser.add_argument("--n_trials", type=int, default=60, help="trials per worker")
    parser.add_argument("--rpts", type=int, nargs=2, default=[0, 1],
                        help="file index, change it if you want to repeat optmizations; for instance, [3,5] will generate three files exp_03.db, exp_04.db, exp_05.db")
    parser.add_argument("--engs", type=int, nargs=2, default=None,
                        help="engine index, change it if you want to use partial MATLAB/COMSOL engines; for instance, if you open 15 MATLAB/COMSOL engines, you can use [0,4] to run this script only on the first 5 engines")

    args = parser.parse_args()

    print(f'Number of worker(s) in total: {len(matlab.engine.find_matlab())}')

    if args.engs is None:
        num_worker = len(matlab.engine.find_matlab())
        args.engs = list(range(num_worker))
    else:
        num_worker = args.engs[1] - args.engs[0] + 1
        args.engs = list(range(args.engs[0], args.engs[1] + 1))

    if num_worker == 0:
        print('Error: no Matlab worker detected')
        exit()
    else:
        print(f'Index of worker(s) in use: {args.engs}')

    if not os.path.exists('result'):
        os.makedirs('result')

    mp.set_start_method('spawn')

    args.rpts[1] += 1
    for rpt in range(*args.rpts):
        main(rpt, args.n_trials, args.engs)
