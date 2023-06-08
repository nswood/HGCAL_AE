import postcmssw.plot
import postcmssw.file_handling
import numpy as np


dfs_ele, namesECON_ele, names2d, names3d = postcmssw.file_handling.read_pq_to_pd('dfs/eles')
dfs_wafers, namesECON_wafers, names2d, names3d = postcmssw.file_handling.read_pq_to_pd('dfs/wafers')

cuts = {
    'energy0' : (0, np.inf)
}

print(namesECON_ele)
gen = namesECON_ele.index("GEN")

chainmask_ele = [False] * len(dfs_ele)
chainmask_ele[namesECON_ele.index("Threshold135")] = True
chainmask_ele[namesECON_ele.index("Nominal")] = True
chainmask_ele[namesECON_ele.index("Normbymax")] = True
chainmask_ele[namesECON_ele.index("Modulefactor")] = True
chainmask_ele[namesECON_ele.index("Normbymaxmodulefactor")] = True
chainmask_ele[namesECON_ele.index("Threshold0")] = True

t0 = namesECON_wafers.index("Threshold0")
chainmask_wafers = [False] * len(dfs_wafers)
chainmask_wafers[namesECON_wafers.index("Threshold135")] = True
chainmask_wafers[namesECON_wafers.index("Nominal")] = True
chainmask_wafers[namesECON_wafers.index("Normbymax")] = True
chainmask_wafers[namesECON_wafers.index("Modulefactor")] = True
chainmask_wafers[namesECON_wafers.index("Normbymaxmodulefactor")] = True

etabins = [1.5, 2.0, 2.5, 3.0]
pTbins = [0, 33, 66, 100]
for iEta in range(len(etabins)-1):
    for iPt in range(len(pTbins)-1):
        cuts['eta0'] = (etabins[iEta], etabins[iEta+1])
        cuts['pt0'] = (pTbins[iPt], pTbins[iPt+1])
        postcmssw.plot.hist(dfs_ele, 'pt', cuts=cuts, baseline=gen, names=namesECON_ele, prop=True, fname='eles_etabin%d_ptbin%d.png'%(iEta, iPt), xlim=None, logy=True, chainmask=chainmask_ele, bins=50)
        postcmssw.plot.hist(dfs_ele, 'pt', cuts=cuts, baseline=gen, names=namesECON_ele, prop=True, fname='eles_etabin%d_ptbin%d_inset.png'%(iEta, iPt), xlim=[-50, 50], logy=False, chainmask=chainmask_ele, bins=50)

        postcmssw.plot.hist(dfs_ele, 'eta', cuts=cuts, baseline=gen, names=namesECON_ele, prop=False, fname='eles_etabin%d_ptbin%d_eta.png'%(iEta, iPt), xlim=None, logy=False, chainmask=chainmask_ele, bins=50)
        postcmssw.plot.hist(dfs_ele, 'phi', cuts=cuts, baseline=gen, names=namesECON_ele, prop=False, fname='eles_etabin%d_ptbin%d_phi.png'%(iEta, iPt), xlim=None, logy=False, chainmask=chainmask_ele, bins=50)

        postcmssw.plot.hist(dfs_ele, 'energy', cuts=cuts, baseline=gen, names=namesECON_ele, prop=True, fname='eles_etabin%d_ptbin%d_inset_energy.png'%(iEta, iPt), xlim=[-50, 50], logy=False, chainmask=chainmask_ele, bins=50)

        cuts['pt0'] = (pTbins[iPt]/10, pTbins[iPt+1]/10)
        postcmssw.plot.hist(dfs_wafers, 'pt', cuts=cuts, baseline=t0, names=namesECON_wafers, prop=True, fname='wafers_etabin%d_ptbin%d.png'%(iEta, iPt), xlim=None, logy=True, chainmask=chainmask_wafers, bins=50)

'''

cuts = {
    'energy0' : (0, np.inf)
}

print(namesECON)
t0 = namesECON.index("Threshold0")

pts = [df.pt.to_numpy() for df in dfs]
pt0 = pts[t0]
dpt = [pt-pt0 for pt in pts]
import matplotlib.pyplot as plt
plt.hist(dpt, bins=100, label=namesECON, histtype='step')
plt.yscale('log')
plt.legend()
plt.savefig("wafers.png")
plt.show()
'''
