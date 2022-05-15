import csv
from sklearn.linear_model import Ridge
import numpy as np
import matplotlib.pyplot as plt
import matplotlib

import matplotlib

plt.rcParams['font.size'] = '16'

# load file
T_list = [25, 45, 60]
raw_dict = {}
for T in T_list:
    with open(f'./raw_data/{T}.csv', newline='') as csvfile:
        spamreader = csv.reader(csvfile, delimiter=',')
        for row in spamreader:
            if row[0] == 'x':
                soc = int(row[1])
                raw_dict[(T, soc)] = []
            else:
                raw_dict[(T, soc)].append(row)

# convert string list to np array
raw_dict = {key: np.array(raw_dict[key]).astype(float) for key in raw_dict.keys()}

# fit curve
degree = 3  # use three-order polynomial to smoothen the data
T_SOC = [
    (25, 10),
    (25, 70),
    (45, 70),
    (60, 70),
]
coef_dict = {}


def poly(x, d):
    out = x.reshape(-1, 1)
    for de in range(1, d):
        out = np.hstack((out, x.reshape(-1, 1) ** (de + 1)))
    return out


plt.figure(figsize=(8, 6), dpi=300)
for keys in T_SOC:
    clf = Ridge(fit_intercept=False, alpha=0)
    x = np.array(raw_dict[keys])[:, 0]
    X = poly(np.array(raw_dict[keys])[:, 0], degree)
    y = -np.array(raw_dict[keys])[:, 1] / 100
    clf.fit(X, y)
    coef = np.append(1, clf.coef_)
    coef_dict[keys] = coef[::-1]

    # plot
    plt.plot(range(500), 1 + clf.predict(poly(np.arange(500), degree)))
    plt.scatter(x, y + 1, label=f'T={keys[0]}, SOC={keys[1]}%')

plt.xlabel('days')
plt.ylabel('retention rate')
plt.legend()
plt.show()

# save
import pickle

with open('caw_dict.pkl', 'wb') as f:
    pickle.dump(coef_dict, f)
