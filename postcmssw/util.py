import awkward as ak
import pandas as pd
import numpy as np
import numpy as np
from time import time

def get_pivoted(zipped, values=['E'], kind='event', columns='ID'):
    t0 = time()
    df = ak.to_pandas(zipped).droplevel(1)
    df['event'] = df.index
    if kind=='waferevent':
        minwafer = ak.min(zipped.wafer_id)
        maxevt = np.max(df['event'])+2
        df['waferevent'] = df['event'] + (df['wafer_id'] - minwafer) * maxevt
    elif kind!='event':
        raise ValueError("Invalid kind in get_pivoted. Must be one of 'event', 'waferevent'")
    print("getting pivoted took %0.3f sec\n"%(time()-t0))
    return df.pivot(kind, columns=columns, values=values).fillna(0)

def pad_pivoted_l(pivoted_l):
    #pad so that they all are compatible in numpy
    #by adding them all together multiplied by 0 or 1
    #ie result[0] = pivoted[0] + 0*pivoted[1] + 0*pivoted[2] ...
    t0=time()

    '''
    allcolumns = set()
    for i in range(len(pivoted_l)):
        allcolumns.update(pivoted_l[i]['energy'].columns)
    print(len(allcolumns))

    for i in range(len(pivoted_l)):
        columns = set(pivoted_l[i]['energy'].columns)
        setdiff = allcolumns.difference(columns)
        rows = pivoted_l[i].index
        pivoted_l[i].join(pd.DataFrame(np.nan, index=rows, columns=setdiff))
        pivoted_l[i].sort_index(axis=1, inplace=True)
        print(len(pivoted_l[i].columns))

    result=pivoted_l
    '''
    
    align0 = pivoted_l[0]
    for i in range(1, len(pivoted_l)):
        align0, _ = align0.align(pivoted_l[i])

    result = [align0]
    for i in range(1, len(pivoted_l)):
        result.append(pivoted_l[i].align(align0)[0])
    
    '''
    result = []
    for i in range(len(pivoted_l)):
        As = np.zeros(len(pivoted_l))
        As[i] = 1
        result.append(As[0] * pivoted_l[0])
        for j in range(1, len(pivoted_l)):
            result[-1] += As[j] * pivoted_l[j]
    '''
    print("padding pivoted took %0.3f\n"%(time()-t0))
    return result

def cut_var(var, cut):
    if cut[0] == cut[1]:
        return var == cut[0]
    else:
        return (var>cut[0]) & (var<=cut[1])
