import postcmssw.file_handling
import postcmssw.plot
import numpy as np
import argparse
import os

parser = argparse.ArgumentParser(description="Convert dfs file into plots")
parser.add_argument("fname", type=str)
args = parser.parse_args()



path = f'/work/submit/nswood/HGCAL/CMSSW_Images/{args.fname}'
os.makedirs(path, exist_ok=True)
namesECON, names2d, names3d, tcdf_l, tcprops, waferdf_l, waferprops, gen_eledf, reco_eledf_l = postcmssw.file_handling.read_all_dfs('dfs')

cut = {
  'energy0' : (0, np.inf),
  'energy1' : (0, np.inf)
}

etabins = [1.5, 2.0, 2.5, 3.0, np.inf]
for i in range(4):
    cut['eta0'] = (etabins[i], etabins[i+1])
    postcmssw.plot.hist(waferdf_l, waferprops, cuts=cut, quantity='energy', names=namesECON, fname=f'{path}/wafer_etabin%d.png'%i, prop=False, xlim=[-1, 1])
    postcmssw.plot.hist([gen_eledf, *reco_eledf_l], None, cuts=cut, quantity='energy', names=["", *namesECON], fname=f'{path}/ele_etabin%d.png'%i, prop=True, xlim=[-1, 1])
    del cut['eta0']
    cut['eta'] = (etabins[i], etabins[i+1])
    postcmssw.plot.hist(tcdf_l, tcprops, cuts=cut, quantity='energy', names=namesECON, fname=f'{path}/tc_etabin%d.png'%i, prop=False, xlim=[-1, 1])
    del cut['eta']
