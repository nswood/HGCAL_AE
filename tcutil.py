import uproot
import numpy as np
import awkward as ak
from coffea.nanoevents import NanoEventsFactory, NanoAODSchema
import matplotlib.pyplot as plt

def get_nanoevents(fname):
    f = uproot.open(fname)
    treenames = get_treenames(f)
    nanoevents = []
    names = []
    for treename in treenames:
        nanoevents.append(NanoEventsFactory.from_root(fname, 
                                                      treepath=treename, 
                                                      schemaclass=NanoAODSchema).events())
        names.append(treename[13:-45])
    return names, nanoevents

def get_treenames(f):
    keys = f.keys()
    treenames = []
    for key in keys:
        if '/' in key:
            continue
        treenames.append(key+"/HGCalTriggerNtuple")
    return treenames

def get_siwafers(t):
    variables = ['id', 'subdet', 'zside', 'layer', 'waferu', 'waferv', 'wafertype', 'cellu', 'cellv', 'data', 'pt', 'mipPt', 'energy', 'simenergy', 'eta', 'phi', 'x', 'y', 'z', 'cluster_id', 'multicluster_id', 'multicluster_pt']
    mask = t.tc.subdet!=10
    d = {var : t.tc[var][mask] for var in variables}
    return ak.zip(d)

def pivoted_cell_df_l(cells_l):
    result = [pivoted_cell_df(cells) for cells in cells_l]
    return pad_pivoted_l(result)

def pivoted_cell_df(cells):
    zipped = ak.zip({'E': cells.energy, 'ID' : cells.id})
    return get_pivoted(zipped)
    
def pivoted_wafer_df_l(wafers_l):
    result = [pivoted_wafer_df(wafers) for wafers in wafers_l]
    return pad_pivoted_l(result)

def pivoted_wafer_df(wafers):
    waferEsums = ak.sum(wafers.energy, axis=-1)
    waferIDs = ak.firsts(wafers.waferid, axis=-1)

    zipped = ak.zip({'E' : waferEsums, 'ID' : waferIDs})
    return get_pivoted(zipped)

def get_pivoted(zipped, values=['E'], kind='event', columns='ID'):
    df = ak.to_pandas(zipped).droplevel(1)
    df['event'] = df.index
    if kind=='waferevent':
        minwafer = ak.min(zipped.wafer_id)
        maxevt = np.max(df['event'])+2
        df['waferevent'] = df['event'] + (df['wafer_id'] - minwafer) * maxevt
    elif kind!='event':
        raise ValueError("Invalid kind in get_pivoted. Must be one of 'event', 'waferevent'")
    return df.pivot(kind, columns=columns, values=values).fillna(0)
    
def pad_pivoted_l(pivoted_l):
    #pad so that they all are compatible in numpy
    #by adding them all together multiplied by 0 or 1
    #ie result[0] = pivoted[0] + 0*pivoted[1] + 0*pivoted[2] ...
    result = []
    for i in range(len(pivoted_l)):
        As = np.zeros(len(pivoted_l))
        As[i] = 1
        result.append(As[0] * pivoted_l[0])
        for j in range(1, len(pivoted_l)):
            result[-1] += As[j] * pivoted_l[j]
    return result

def plot_hist(pivoted, names, Emin=0, baseIdx=0):
    base = pivoted[baseIdx]
    mask = base.to_numpy().flatten() > Emin

    to_plot = []
    labels = []
    for i in range(len(pivoted)):
        if i==baseIdx:
            continue
        labels.append(names[i])
        to_plot.append((pivoted[i] - base).to_numpy().flatten()[mask])
    plt.clf()
    plt.hist(to_plot, bins=100, histtype='step', range=[-1,1], label=labels)
    plt.legend()
    plt.xlabel("Difference w.r.t. threshold0 [GeV]")
    plt.ylabel("Counts")

def group_by_wafer(tcs):
    sortvar = get_waferid(tcs)
    sortidx = ak.argsort(sortvar, axis=-1)

    sortvar = sortvar[sortidx]

    tcs = tcs[sortidx]
    runs = ak.flatten(ak.run_lengths(sortvar))
    tcs['waferid'] = sortvar
    tcs = ak.unflatten(tcs, ak.flatten(runs, axis=None), axis=-1)
    return tcs

idxfromuv = np.asarray([
[47, 46, 45, 44, -1, -1, -1, -1],
[16, 43, 42, 41, 40, -1, -1, -1],
[20, 17, 39, 38, 37, 36, -1, -1],
[24, 21, 18, 35, 34, 33, 32, -1],
[28, 25, 22, 19, 3, 7, 11, 15],
[-1, 29, 26, 23, 2, 6, 10, 14],
[-1, -1, 30, 27, 1, 5, 9, 13],
[-1, -1, -1, 31, 0, 4, 8, 12]])
def get_train_idx(tcs):
    u = tcs.cellu
    v = tcs.cellv
    lens = ak.num(u)
    u = ak.flatten(u)
    v = ak.flatten(v)
    idx = idxfromuv[u, v]
    return ak.unflatten(idx, lens)

def get_waferid(tcs):
    u = tcs.waferu
    v = tcs.waferv
    l = tcs.layer
    z = tcs.zside
    return z * (l + 60*(u + 20) + 60*40*(v + 20))

def get_train_E(tcs, kind):
    if kind=='ADC':
        E = tcs.data
    elif kind=='ADCT':
        E = tcs.data/np.cosh(tcs.eta)
    elif kind=='MIP':
        E = tcs.mipPt*np.cosh(tcs.eta)
    elif kind=='MIPT':
        E = tcs.mipPt
    elif kind=='E':
        E = tcs.energy
    elif kind=='ET':
        E = tcs.energy/np.cosh(tcs.eta)
    else:
        raise ValueError("Invalid kind in get_train_E(). Must be one of 'ADC', 'ADCT', 'MIP', 'MIPT', 'E', 'ET'")
    return E


defaulttree='FloatingpointThreshold0DummyHistomaxDummynTuple/HGCalTriggerNtuple'
def get_training_data(fname, treename=defaulttree, kind='MIPT',
                      entry_start=0, entry_stop=None):
    ''' 
    get training dataframe from file

    kind : what energy units to use as trainig data
           must be one of ['ADC', 'ADCT', 'MIP', 'MIPT', 'E', 'ET']
           recommendation: test both 'MIP' and 'MIPT'

    result: dataframe with row=one wafer in one event
    columns are: CALQ_%d   : trigger cell energy value 
                 etaWt     : energy-weighted mean wafer eta
                 phiWt     : energy-weighted mean wafer phi
                 layer     : the HGCAL layer the wafer is in
                 subdet    : the HGCAL subdetector index the wafer is in
                               I suspect this is 1==EM section 2==Hadronic section?? Not positive
                 wafer_id  : an arbitrary integer which uniquely specifies each wafer
                 wafertype : an integer identifying the wafer thickness
                 simenergy : the total sim energy in the wafer
    '''

    #get nanoevents object
    evts = NanoEventsFactory.from_root(fname, 
                                       treepath=treename, 
                                       schemaclass=NanoAODSchema,
                                       entry_stop=entry_stop, 
                                       entry_start=entry_start).events()
    #get only tcs from silicon wafers
    tcs = get_siwafers(evts) 
    #convert u,v to index from 0 to 47 (inclusive)
    trainidx = get_train_idx(tcs)
    #get arbitrary wafer id value
    wafer_id = get_waferid(tcs)
    #get energy value according to kind choice
    E = get_train_E(tcs, kind)

    #build awkward array with all the necessary values
    zipped = ak.zip({'E' : E, 
                     'wafer_id' : wafer_id, 
                     'trainidx' : trainidx, 
                     'ID' : tcs.id,
                     'wafertype' : tcs.wafertype,
                     'subdet' : tcs.subdet,
                     'layer' : tcs.layer,
                     'etaEwt': tcs.eta * E, #used for energy-weighted eta
                     'phiEwt': tcs.phi * E, #used for energy-weighted phi
                     'simenergy': tcs.simenergy,
                     'cellu' : tcs.cellu,
                     'cellv' : tcs.cellv})

    #pivot dataframe to organize with each wafer in one row, and the columns=the 0-47 trainidx
    pivoted = get_pivoted(zipped, kind='waferevent', columns='trainidx')['E']
    pivoted.columns = ['CALQ_%d'%i for i in range(48)]

    #this should be outsorced to a different function but for now it's here
    #make dataframe from awkward array and add event and unique waferevent indices
    df = ak.to_pandas(zipped).droplevel(1)
    df['event'] = df.index
    minwafer = ak.min(zipped.wafer_id)
    maxevt = np.max(df['event'])+2
    df['waferevent'] = df['event'] + (df['wafer_id'] - minwafer) * maxevt

    #conpute average quantities per wafer per event
    #NB may of these are stupid because they're constant per wafer
    meandf = df.pivot_table(index='waferevent', values=['wafer_id', 'wafertype', 'subdet', 'layer', 'etaEwt', 'phiEwt'], aggfunc='mean')
    pivoted = pivoted.join(meandf)

    #compute total quantities per wafer per event
    sumdf = df.pivot_table(index='waferevent', values=['simenergy'], aggfunc='sum')
    pivoted = pivoted.join(sumdf)

    return pivoted