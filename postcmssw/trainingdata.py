
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
