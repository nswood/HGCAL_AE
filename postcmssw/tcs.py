import awkward as ak
from .wafer import get_waferid
from .util import get_pivoted, pad_pivoted_l
import pandas as pd

waferfields = ['id', 'subdet', 'zside', 'layer', 
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
    d = {var : t.tc[var][mask] for field in waferfields}
    d['waferid'] = get_waferid(d)
    return ak.zip(d)

def get_tc_properties(tcs):
    '''
    get df with trigger cell properties which are not different event-to-event
        (type, subdet, layer, eta, phi)
    '''
    df = ak.to_pandas(tcs)
    maxdf = df.pivot_table(index='id', aggfunc = 'max', values=waferfields)
    return maxdf

def get_tc_properties_l(tcs_l):
    '''
    list version of get_tc_properties()
    does the appropriate merging to ensure that result contains all tcs
      even if they are not necessarily present in every chain
    '''
    dfs = [get_tc_properties(tcs) for tcs in tcs_l]
    return pd.concat(dfs).groupby(level=0).max()

def pivoted_tc_df_l(tcs_l, simE=False):
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
    result = [pivoted_tc_df(tcs, simE=simE) for tcs in tcs_l]
    return pad_pivoted_l(result)

def pivoted_tc_df(tcs, simE=False):
    '''
    Single chain version of pivoted_tc_df_l()
    Obviously, does not include the same padding
    See pivoted_tc_df_l() for more docs
    '''
    values = ['energy', 'mipPt', 'data', 'wafertype', 'subdet', 'layer',
              'zside', 'waferu', 'waferv', 'cellu', 'cellv', 'waferid',
              'eta', 'phi', 'x', 'y', 'z']
    if simE:
        values.append('simenergy')
    ans = get_pivoted(tcs, values=values, columns='id')
    ans.index.name = 'event'
    return ans
