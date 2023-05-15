import postcmssw.file_handling
import postcmssw.tcs
import postcmssw.wafer
import postcmssw.ele
import postcmssw.plot
import numpy as np

xs_l, namesECON, names2d, names3d = postcmssw.file_handling.get_nanoevents('ntuple.root', entry_stop=5)
print("got xs")

elecuts = {
  'eta' : (-np.inf, np.inf)
}
evtmask = postcmssw.ele.get_evtcut(xs_l[0], elecuts)
xs_l = [xs[evtmask] for xs in xs_l]
print("applied event mask")

tcs_l = postcmssw.tcs.get_sitcs_l(xs_l)
print("got tcs")

tcprops = postcmssw.tcs.get_tc_properties_l(tcs_l)
print("got tcprops")
tcdf_l = postcmssw.tcs.pivoted_tc_df_l(tcs_l)
print("got tcdf")

wafers_l = postcmssw.wafer.make_wafers_l(tcs_l)
print("got wafers")

waferprops = postcmssw.wafer.get_wafer_properties_l(wafers_l)
print("got waferprops")
waferdf_l = postcmssw.wafer.pivoted_wafer_df_l(wafers_l)
print("got waferdf")

gen_eledf = postcmssw.ele.get_genele(xs_l[0])
print("got gen ele")
reco_eledf_l = postcmssw.ele.get_recoele_l(xs_l)
print("got reco ele")

postcmssw.file_handling.write_all_dfs('dfs', namesECON, names2d, names3d, tcdf_l, tcprops, waferdf_l, waferprops, gen_eledf, reco_eledf_l)

