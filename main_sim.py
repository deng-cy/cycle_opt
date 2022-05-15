import numpy as np
import optuna
import matlab.engine
import time
import multiprocessing as mp
import pickle
import logging
import sys
import os
from argparse import ArgumentParser


# define study (the job for each worker)
def func_study(study_name, n_trials, timeout, storage, worker_id=0):
    n_timestep = 16
    T_SOC = [
        (25, 10),
        (25, 70),
        (45, 70),
        (60, 70),
    ]
    T_SOC.reverse()

    names = matlab.engine.find_matlab()
    eng = matlab.engine.connect_matlab(names[worker_id])

    time_start = time.time()
    with open('processed_data/sim_dict.pkl', 'rb') as f:
        ca_dict = pickle.load(f)

    logger = logging.getLogger(__name__)
    formatter = logging.Formatter('%(asctime)s:%(message)s')
    file_handler = logging.FileHandler(f'error_{study_name}.log')
    file_handler.setFormatter(formatter)
    logger.addHandler(file_handler)  # comment this out if you do not want log file
    print_handler = logging.StreamHandler(sys.stdout)
    logger.addHandler(print_handler)
    logger.setLevel(logging.DEBUG)

    study = optuna.load_study(
        study_name=study_name,
        storage=storage,
        pruner=optuna.pruners.SuccessiveHalvingPruner(reduction_factor=4),
        sampler=optuna.samplers.TPESampler(n_startup_trials=20),
    )

    def objective(trial):
        const_dict = {}
        trial.suggest_loguniform('k_SEI', 1E-14, 1E-12)
        trial.suggest_loguniform('lambda_SEI0', 1E5, 1E8)
        trial.suggest_uniform('Ea_SEI', 10E3, 100E3)
        n_fit = 3

        sol = trial.suggest_categorical('sol', [True, False])
        if sol:
            n_fit += 2
            trial.suggest_uniform('k_sol', 0., 1)
            trial.suggest_uniform('Ea_sol', 20e3, 100e3)
        else:
            const_dict['k_sol'] = 0.

        dis = trial.suggest_categorical('dis', [True, False])
        if dis:
            n_fit += 2
            trial.suggest_loguniform('k_diss_Kindermann', 1E-9, 1E-5)
            trial.suggest_uniform('Ea_diss_Kindermann', 50e3, 200e3)
        else:
            const_dict['k_diss_Kindermann'] = 0.

        error = 0
        df = len(T_SOC) * n_timestep - n_fit - 1

        step = 0
        for T, SOC_storage in T_SOC:
            for sub_step in range(n_timestep + 1):
                try:
                    params = {'T': T + 273.15, 'SOC_storage': SOC_storage / 100,
                              **{k: float(v) for k, v in trial.params.items() if v not in (True, False)}, **const_dict}
                    if sub_step == 0:
                        Qbase = eng.comsol_api_ca_final(params, 1)
                    else:
                        Q = eng.comsol_api_ca_final(params) / Qbase
                        Q_sim = ca_dict[(T, SOC_storage, sub_step)]
                        error_this_step = (Q - Q_sim) ** 2
                        error += error_this_step
                        trial.set_user_attr('{:d},{:d},{:d}'.format(T, SOC_storage, sub_step), Q)
                        logger.info(
                            'Trial:{:d},Worker:{:d},Sub_step:{:d},Step:{:d},Time:{:d} min,SOC:{:d},T:{:d},Q:{:4.3f},Q_sim:{:4.3f}'.format(
                                trial.number, worker_id, sub_step, step, int((time.time() - time_start) / 60),
                                SOC_storage, T, Q, Q_sim))

                except Exception:
                    logger.exception(f"Exception occurred, tiral number {trial.number}")
                    trial.set_user_attr('reason', 'failed')
                    raise optuna.TrialPruned()

                if sub_step != 0:
                    value = np.sqrt(error / (step + 1) * len(T_SOC) * n_timestep / df)
                    trial.report(value, step)
                    step += 1
                    if trial.should_prune():
                        trial.set_user_attr('reason', 'auto')
                        raise optuna.TrialPruned()

        return np.sqrt(error / df)

    study.optimize(objective, n_trials=n_trials, timeout=timeout)


if __name__ == '__main__':
    parser = ArgumentParser()
    parser.add_argument("--n_trials", type=int, default=60, help="trials per worker; I used 5 engines(workers), so 60 is default for 300 trials")
    parser.add_argument("--timeout", type=int, default=None, help="total running time time (in second)")
    parser.add_argument("--rpts", type=int, nargs=2, default=[0, 0],
                        help="file index, change it if you want to repeat optmizations; for instance, [3,5] will generate three files sim_03.db, sim_04.db, sim_05.db")
    parser.add_argument("--engs", type=int, nargs=2, default=None,
                        help="engine index, change it if you want to use partial MATLAB/COMSOL engines; for instance, if you open 15 MATLAB/COMSOL engines, you can use [0,4] to run this script only on the first 5 engines")

    args = parser.parse_args()

    if args.timeout is not None:
        args.n_trial = None

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

    if not os.path.exists('logs'):
        os.makedirs('logs')

    mp.set_start_method('spawn')

    args.rpts[1] += 1
    for rpt in range(*args.rpts):
        study_name = 'study'
        storage = f'sqlite:///./result/sim_{rpt:02d}.db'
        try:
            optuna.study.delete_study(study_name, storage)
        except:
            pass

        study = optuna.create_study(study_name=study_name,
                                    storage=storage,
                                    direction='minimize',
                                    pruner=optuna.pruners.SuccessiveHalvingPruner(reduction_factor=4),
                                    sampler=optuna.samplers.TPESampler(n_startup_trials=20),
                                    )
        if num_worker == 1:
            func_study(study_name, args.n_trials, args.timeout, storage, args.engs[0])
        else:
            ps = []
            for i in range(num_worker):
                p = mp.Process(target=func_study, args=(study_name, args.n_trials, args.timeout, storage, args.engs[i]))
                p.start()
                ps.append(p)
            for p in ps:
                p.join()
