import matlab.engine
import pickle
import io
import matplotlib.pyplot as plt
import numpy as np

names = matlab.engine.find_matlab()
engs = []
for name in names:
    engs.append(matlab.engine.connect_matlab(name))
num_worker = len(names)
eng = engs[0]

if __name__ == '__main__':
    if num_worker == 0:
        print('Error: no Matlab worker detected')
    else:
        print('Number of worker(s): {:d}'.format(num_worker))

    T_SOC = [
        (25,10),
        (25,70),
        (45,70),
        (60,70),
    ]
    T_SOC.reverse()
    params_const = {
        'k_SEI': 5e-13,
        'lambda_SEI0':5e6,
        'Ea_SEI':50e3,
        'k_sol':0.3,
        'Ea_sol':50e3,
        'k_diss_Kindermann':1e-6,
        'Ea_diss_Kindermann':80e3
    }

    ca_dict_sim={}
    for T, SOC_storage in T_SOC:
        params = {'T': T + 273.15, 'SOC_storage': SOC_storage / 100, **params_const}
        for sub_step in range(17):
            if sub_step == 0:
                Qbase = eng.comsol_api_ca_final(params, 1)
                print(Qbase)
            else:
                Q_sim = eng.comsol_api_ca_final(params) / Qbase
                ca_dict_sim[(T, SOC_storage, sub_step)] = Q_sim
                print(T, SOC_storage, sub_step, Q_sim)

    with open('dict_sim2.pkl', 'wb') as f:
        pickle.dump(ca_dict_sim, f)
