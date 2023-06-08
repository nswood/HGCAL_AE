import postcmssw.file_handling
import postcmssw.plot
import numpy as np

namesECON, names2d, names3d, tcdf_l, tcprops, waferdf_l, waferprops, gen_eledf, reco_eledf_l = postcmssw.file_handling.read_all_dfs('dfs')

cut = {
  'energy0' : (0, np.inf),
  #'energy1' : (0, np.inf)
}

print(namesECON)
t0 = 4

etabins = [-np.inf, np.inf]
for i in range(1):
    cut['eta0'] = (etabins[i], etabins[i+1])
    #postcmssw.plot.hist(waferdf_l, waferprops, cuts=cut, quantity='energy', names=namesECON, fname='wafer_etabin%d_energy.png'%i, prop=False, xlim=[-1, 1], baseline=t0)
    #postcmssw.plot.hist(waferdf_l, waferprops, cuts=cut, quantity='mipPt', names=namesECON, fname='wafer_etabin%d_mipT.png'%i, prop=False, xlim=[-1, 1], baseline=t0)
    #postcmssw.plot.hist(waferdf_l, waferprops, cuts=cut, quantity='data', names=namesECON, fname='wafer_etabin%d_ADC.png'%i, prop=False, xlim=[-1, 1], baseline=t0)

    postcmssw.plot.hist([gen_eledf, *reco_eledf_l], None, cuts=cut, quantity='energy', names=["", *namesECON], fname='ele_etabin%d_energy.png'%i, prop=False, xlim=[-10, 10], bins=10, logy=False)

    cut['eta'] = cut['eta0']
    del cut['eta0']
    #postcmssw.plot.hist(tcdf_l, tcprops, cuts=cut, quantity='energy', names=namesECON, fname='tc_etabin%d_energy.png'%i, prop=False, xlim=[-1, 1], baseline=t0)
    #postcmssw.plot.hist(tcdf_l, tcprops, cuts=cut, quantity='mipPt', names=namesECON, fname='tc_etabin%d_mipT.png'%i, prop=False, xlim=[-1, 1], baseline=t0)
    #postcmssw.plot.hist(tcdf_l, tcprops, cuts=cut, quantity='data', names=namesECON, fname='tc_etabin%d_ADC.png'%i, prop=False, xlim=[-1, 1], baseline=t0)
    #del cut['eta0']
    del cut['eta']
