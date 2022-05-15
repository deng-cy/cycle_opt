# A script to post-process results. Run the function you need.
import numpy as np
import optuna
import pickle
study_name = 'study'

def val_and_percentage_sim():
    # get the info of the objectives vs. number of trials (used to plot figure 2C), and ratios of statuses (used to plot figure 2D)
    percentage_area = np.zeros((65, 4))  # running, failed, auto, bound
    dict_area = {'complete': 0, 'failed': 1, 'auto': 2, 'bound': 3}
    for i_study in range(1, 16):
        best_val = []

        storage_name = f'sqlite:///result/sim_{i_study:02d}.db'
        study = optuna.load_study(study_name=study_name, storage=storage_name)
        for trial in study.trials:

            if trial.last_step is None:
                percentage_area[:, dict_area[trial.user_attrs['reason']]] += 1
                best_val.append('none')

            elif trial.last_step < 63:
                percentage_area[trial.last_step + 1:, dict_area[trial.user_attrs['reason']]] += 1
                percentage_area[:trial.last_step + 1, dict_area['complete']] += 1
                best_val.append('none')
            else:
                best_val.append(trial.value)
                percentage_area[:, dict_area['complete']] += 1

        with open("data_best_val_sim.txt", "a") as f:
            for i in best_val:
                f.write(f'{i},')
            f.write('\n')
    np.savetxt("data_percentage_sim.csv", percentage_area / 15 / 300, delimiter=",")


def val_and_percentage_exp():
    # get the info of the objectives vs. number of trials (used to plot figure 3B), and ratios of statuses (used to plot figure 3C)
    percentage_area = np.zeros((65, 4))  # running, failed, auto, bound
    dict_area = {'complete': 0, 'failed': 1, 'auto': 2, 'bound': 3}
    for i_study in range(1, 16):
        best_val = []

        storage_name = f'sqlite:///result/exp_{i_study:02d}.db'
        study = optuna.load_study(study_name=study_name, storage=storage_name)
        for trial in study.trials:

            if trial.last_step is None:
                percentage_area[:, dict_area[trial.user_attrs['reason']]] += 1
                best_val.append('none')

            elif trial.last_step < 63:
                percentage_area[trial.last_step + 1:, dict_area[trial.user_attrs['reason']]] += 1
                percentage_area[:trial.last_step + 1, dict_area['complete']] += 1
                best_val.append('none')
            else:
                best_val.append(trial.value)
                percentage_area[:, dict_area['complete']] += 1

        with open("data_best_val_exp.txt", "a") as f:
            for i in best_val:
                f.write(f'{i},')
            f.write('\n')
    np.savetxt("data_percentage_exp.csv", percentage_area / 15 / 300, delimiter=",")

def best_one_sim():
    # output the best one for simulation case (Case 1), used to plot figure 2A
    T_SOC = [
        (25, 10),
        (25, 70),
        (45, 70),
        (60, 70),
    ]
    n_substep = 16
    storage_name = f'sqlite:///result/sim_12.db'  # the best optimization among 15 repetitions
    study = optuna.load_study(study_name=study_name, storage=storage_name)
    with open('processed_data/sim_dict.pkl', 'rb') as f:
        data_dict = pickle.load(f)
    for T, SOC_storage in T_SOC:
        Q = [data_dict[(T, SOC_storage, sub_step)] for sub_step in range(1, n_substep + 1)]
        with open("best_one_sim.txt", "a") as f:
            f.write(f'{T}, {SOC_storage}\n')
            for i in Q:
                f.write(f'{i},')
            f.write('\n')
            Q = [study.best_trial.user_attrs[f'{T},{SOC_storage},{sub_step + 1}'] for sub_step in range(n_substep)]
            for i in Q:
                f.write(f'{i},')
            f.write('\n')

def best_one_exp():
    # output the best one for experiment case (Case 2), used to plot figure 3A
    T_SOC = [
        (25, 10),
        (25, 70),
        (45, 70),
        (60, 70),
    ]
    n_substep = 16
    n_timestep = 30
    storage_name = f'sqlite:///result/exp_05.db'  # the best optimization among 15 repetitions
    study = optuna.load_study(study_name=study_name, storage=storage_name)
    with open('caw_dict.pkl', 'rb') as f:
        coef_dict = pickle.load(f)
    for T, SOC_storage in T_SOC:
        coef = coef_dict[(T, SOC_storage)]
        Q_exp = np.polyval(coef, np.arange(0, n_timestep * n_substep + 1, n_timestep))
        with open("best_one_exp.txt", "a") as f:
            f.write(f'{T}, {SOC_storage}\n')
            for i in Q_exp:
                f.write(f'{i},')
            f.write('\n')
            Q = [study.best_trial.user_attrs[f'{T},{SOC_storage},{sub_step + 1}'] for sub_step in range(n_substep)]
            for i in Q:
                f.write(f'{i},')
            f.write('\n')

def sim_noprune():
    # output the TPE for simulation case (Case 2), used to plot figure 2E
    for i_study in range(1, 4): # 1 16
        best_val = []
        current_best=1000
        last_step = []
        reason = []
        points_list=[]
        n_points=0
        storage_name = f'sqlite:///result/sim_noprune_{i_study:02d}.db'
        study = optuna.load_study(study_name=study_name, storage=storage_name)
        for trial in study.trials:

            if trial.last_step is None:
                n_points += 1

            elif trial.last_step < 63:
                n_points += (trial.last_step+1)//16+trial.last_step
            else:
                current_best=min(current_best,trial.value)
                n_points += 68

            best_val.append(current_best)
            points_list.append(n_points)
        with open("data_best_val_noprune.txt", "a") as f:
            for i in points_list:
                f.write(f'{i},')
            f.write('\n')
            for i in best_val:
                f.write(f'{i},')
            f.write('\n')

def trajectory():
    # output the TPE for simulation case (Case 2), used to plot figure 2B
    storage_name = f'sqlite:///result/sim_12.db'
    study = optuna.load_study(study_name=study_name, storage=storage_name)
    params=[]
    for trial in study.trials:
        param=trial.params
        if param['dis']==False and param['sol']==False:
            cate=0
        elif param['sol'] == True and param['dis'] == False:
            cate=1
        elif param['sol'] == False and param['dis'] == True:
            cate=2
        else:
            cate=3
        params.append([np.log10(param['k_SEI']/1E-14)/2,np.log10(param['lambda_SEI0']/1e5)/3, (param['Ea_SEI']-10e3)/90e3, cate])

    with open("trajectory.txt", "a") as f:
        for i in params:
            for j in i:
                f.write(f'{j},')
            f.write('\n')