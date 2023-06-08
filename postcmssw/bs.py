import numpy as np
import awkward as ak

import postcmssw.file_handling
import postcmssw.wafer
import postcmssw.tcs


xs_l, namesECON, names2d, names3d = postcmssw.file_handling.get_nanoevents('ntuple_10.root')
tcs_l = postcmssw.tcs.get_sitcs_l(xs_l)
wafers_l = postcmssw.wafer.make_wafers_l(tcs_l)

Es = [np.zeros((159546, 10), np.float32) for i in range(10)]

for i in range(10):
    for j in range(10):
        Es[i][wafers_l[i][j].waferid, j] = wafers_l[i][j].data
