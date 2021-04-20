# Generate all unique sequences possible for Box-task with a stated ratio
## Outputs a CSV-file named 'HighProb_LowProb_Sequences.csv' in your current working directory (see console for printed path and name)
## Input number of boxes on line 5, and highest probability in ratio on line 6, then run

Nbox = 15 #Input number of boxes
ProbHigh = 0.60 #Input the highest probability in the ratio
NMaj = round(ProbHigh*Nbox)

import itertools

longlist = list(itertools.product([True, False], repeat=Nbox))

reduced_list = [L for L in longlist if sum(L) == NMaj]

import pandas as pd

df = pd.DataFrame(reduced_list)

import os

name = os.getcwd()
name=(name, '/', str(round(ProbHigh, ndigits=2)), '_', str(round((1-ProbHigh),ndigits=2)), '_Sequences.csv')
name = "".join(name)

print('File name and path is:',name)

df.to_csv(name)