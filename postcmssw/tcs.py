import awkward as ak
from .wafer import get_waferid
from .util import get_pivoted, pad_pivoted_l
import pandas as pd
import pyarrow as pa

tcfields = ['id', 'subdet', 'zside', 'layer', 
               'waferu', 'waferv', 'wafertype', 
               'cellu', 'cellv', 
               'data', 'pt', 'mipPt', 
               'energy', 'simenergy', 
               'eta', 'phi', 'x', 'y', 'z'] 

def get_sitcs_l(t_l):
    '''
    get list of silicon wafer arrays from list of nanoevents objects
    see get_sitcs() for more docs
    '''
    return [get_sitcs(t) for t in t_l]

def get_sitcs(t):
    '''
    get silicon wafers from nanoevents object
    @param: t [nanoevents] data from ntuple file
    @output: [awkward recordarray] silicon wafers
    '''
    mask = t.tc.subdet!=10
    print("got mask")
    d = {field : t.tc[field][mask] for field in tcfields}
    print("got d")
    d['waferid'] = get_waferid(d)
    print("got waferid")
    return ak.zip(d)

def pivoted_tc_df_l(tcs_l):
    '''
    convert list of trigger cell arrays into pandas dataframe
    resulting data frame is row = event, column = tc
    data frames are padded such that they are the same shape for each chain
        even if there are tcs in some that do not appear in others

    @param: tcs_l [list of awkward recordarrays] list of tc arrays
                                                 from output of get_sitcs()
    @result: [pandas dataframe] df with row=event, column=tc
                                padded to be shape-compatible with eachother 
                                even if the list of tcs in each chain are not identical
    '''
    result = [pivoted_tc_df(tcs) for tcs in tcs_l]
    return pad_pivoted_l(result)

def pivoted_tc_df(tcs):
    '''
    Single chain version of pivoted_tc_df_l()
    Obviously, does not include the same padding
    See pivoted_tc_df_l() for more docs
    '''
    ans = get_pivoted(tcs, values=tcfields, columns='id')
    ans.index.name = 'event'
    return ans

def pa_tcdf(tcdf):
    ans = {}
    for field in tcfields:
        if field=='id':
            continue
        ans[field] = tcdf[field].to_numpy().flatten()
    return pa.Table.from_pydict(ans)

def pa_tcdf_l(tcdf_l):
    return [pa_tcdf(tcdf) for tcdf in tcdf_l]
