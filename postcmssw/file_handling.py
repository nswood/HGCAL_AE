import uproot
import pandas as pd
import re
from coffea.nanoevents import NanoEventsFactory, NanoAODSchema
import os.path
import os

def get_nanoevents(fname, entry_stop=None):
    '''
    get nanoevents nanoevents objects from ntuple file
    @param fname: [string] filename of ntuple file
    @output nanoevents: [list of nanoevents] data from ntuple file for each chain
    @output namesECON: [list of str] name of ECON concentrator for each chain
    @output names2d: [list of str] name of 2d clustering algo for each chain
    @output names3d: [list of str] name of 3d clustering algo for each chain
    '''
    f = uproot.open(fname)
    treenames = get_treenames(f)
    nanoevents = []
    names3d = []
    names2d = []
    namesECON = []
    for treename in treenames:
        nanoevents.append(NanoEventsFactory.from_root(fname, 
                                                      treepath=treename, 
                                                      schemaclass=NanoAODSchema,
                                                      entry_stop=entry_stop).events())
        #trim off "nTuple" and "DummyFloatingpoint"
        name = treename[13:-32]
        splitted = [s for s in re.split("([A-Z][^A-Z]*)", name) if s]
        name3d = splitted[-1]
        name2d = splitted[-2]
        nameECON = name[:-(len(name3d)+len(name2d))]

        names3d.append(name3d)
        names2d.append(name2d)
        namesECON.append(nameECON)
    return nanoevents, namesECON, names2d, names3d

def get_treenames(f):
    '''
    helper function for get_nanoevents()
    gets treenames from uproot file
    '''
    keys = f.keys()
    treenames = []
    for key in keys:
        if '/' in key:
            continue
        treenames.append(key+"/HGCalTriggerNtuple")
    return treenames

def get_fname(base, nameECON, name2d, name3d):
    return os.path.join(base, "%s_%s_%s.parquet"%(nameECON, name2d, name3d))

def write_some_dfs(folder,
                   namesECON, names2d, names3d,
                   df_l, props, gen=None):
    os.makedirs(folder, exist_ok=True)
    for i in range(len(namesECON)):
        fname = get_fname(folder, namesECON[i], 
                                  names2d[i],
                                  names3d[i])
        df_l[i].to_parquet(fname)

    if props is not None:
        props.to_parquet(os.path.join(folder, 'props.parquet'))
    if gen is not None:
        gen.to_parquet(os.path.join(folder, 'gen.parquet'))

def write_all_dfs(folder, 
              namesECON, names2d, names3d,
              tcdf_l, tcprops,
              waferdf_l, waferprops,
              gen_eledf, reco_eledf_l):
    os.makedirs(folder, exist_ok=True)

    #do tcs
    tcpath = os.path.join(folder, 'tcs')
    write_some_dfs(tcpath, 
                   namesECON, names2d, names3d,
                   tcdf_l, tcprops)

    waferpath = os.path.join(folder, 'wafers')
    write_some_dfs(waferpath,
                   namesECON, names2d, names3d,
                   waferdf_l, waferprops)

    elepath = os.path.join(folder, 'eles')
    write_some_dfs(elepath,
                   namesECON, names2d, names3d,
                   reco_eledf_l, props=None, gen=gen_eledf)

def read_names(folder):
    namesECON = []
    names2d = []
    names3d = []

    files = os.listdir(os.path.join(folder, 'tcs'))
    for fname in files:
        if fname == 'props.parquet' or fname == 'gen.parquet':
            continue
        splitted = fname[:-4].split('_')
        namesECON.append(splitted[0])
        names2d.append(splitted[1])
        names3d.append(splitted[2])
    return namesECON, names2d, names3d

def read_some_dfs(folder,
                  namesECON, names2d, names3d):
    dfs_l = []
    for i in range(len(namesECON)):
        fname = get_fname(folder, namesECON[i],
                                  names2d[i],
                                  names3d[i])
        dfs_l.append(pd.read_pickle(fname))

    propsname = os.path.join(folder, 'props.parquet')
    if os.path.exists(propsname):
        props = pd.read_pickle(propsname)
    else:
        props = None

    genname = os.path.join(folder, 'gen.parquet')
    if os.path.exists(genname):
        gen = pd.read_pickle(genname)
    else:
        gen = None

    return dfs_l, props, gen

def read_all_dfs(folder):
    namesECON, names2d, names3d = read_names(folder)
    
    #do tcs
    tcpath = os.path.join(folder, 'tcs')
    tcdf_l, tcprops, _ = read_some_dfs(tcpath, 
                                       namesECON, names2d, names3d)
    
    #do wafers
    waferpath = os.path.join(folder, 'wafers')
    waferdf_l, waferprops, _ = read_some_dfs(waferpath,
                                             namesECON, names2d, names3d)

    #do eles
    elepath = os.path.join(folder, 'eles')
    reco_eledf_l, _, gen_eledf = read_some_dfs(elepath,
                                               namesECON, names2d, names3d)

    return namesECON, names2d, names3d, \
           tcdf_l, tcprops, \
           waferdf_l, waferprops, \
           gen_eledf, reco_eledf_l
