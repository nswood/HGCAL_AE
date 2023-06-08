import uproot
import pandas as pd
import re
from coffea.nanoevents import NanoEventsFactory, NanoAODSchema
import os.path
import os
import pyarrow.parquet as pq
from tqdm import tqdm
import numpy as np
import pyarrow.dataset as ds


from .tcs import get_sitcs_l, pivoted_tc_df_l, pa_tcdf_l
from .wafer import make_wafers_l, pivoted_wafer_df_l, pa_waferdf_l
from .ele import get_genele, get_recoele_l, pa_eledf, pa_eledf_l

def get_nanoevents(fname, entry_start = 0, entry_stop=None):
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
        nextnano = (NanoEventsFactory.from_root(fname, 
                                                treepath=treename, 
                                                schemaclass=NanoAODSchema,
                                                entry_stop=entry_stop,
                                                entry_start=entry_start).events())
        evt = nextnano.event
        order = np.argsort(evt)
        nextnano = nextnano[order]
        nanoevents.append(nextnano)
        #trim off "nTuple" and "DummyFloatingpoint"
        name = treename[13:-2]
        splitted = [s for s in re.split("([A-Z][^A-Z]*)", name) if s]
        name3d = splitted[2]
        name2d = splitted[1]
        nameECON = splitted[0]

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

def get_name(nameECON, name2d, name3d):
    return "%s_%s_%s"%(nameECON, name2d, name3d)

def write_pq(patable, folder, index):
    print("writing pq")
    os.makedirs(folder, exist_ok=True)
    fname = os.path.join(folder, "part-%09d.parquet"%index)
    pq.write_table(patable, fname)

def process_tc_dfs(fname, destination='dfs/tcs', chunksize=5, offset=0):
    xs_ALL, namesECON, names2d, names3d = get_nanoevents(fname)
    names = [get_name(ECON, two, three) for (ECON, two, three) in zip(namesECON, names2d, names3d)]
    nEvt = len(xs_ALL[0])

    
    for iEvt in tqdm(range(int(np.ceil(nEvt/chunksize)))):
        xs_l, _, _, _ = get_nanoevents(fname, entry_start = iEvt*chunksize, 
                                              entry_stop = (iEvt+1)*chunksize)
        tcs_l = get_sitcs_l(xs_l)
        tcdf_l = pivoted_tc_df_l(tcs_l)
        patables_l = pa_tcdf_l(tcdf_l)
        for i in range(len(names)):
            folder = os.path.join(destination, names[i])
            print("doing ", folder)
            write_pq(patables_l[i], folder, iEvt+offset)
    return iEvt+1

def process_wafer_dfs(fname, destination='dfs/wafers', chunksize=5, offset=0):
    xs_ALL, namesECON, names2d, names3d = get_nanoevents(fname)
    names = [get_name(ECON, two, three) for (ECON, two, three) in zip(namesECON, names2d, names3d)]
    nEvt = len(xs_ALL[0])

    for iEvt in tqdm(range(int(np.ceil(nEvt/chunksize)))):
        xs_l, _, _, _ = get_nanoevents(fname, entry_start = iEvt*chunksize, 
                                              entry_stop = (iEvt+1)*chunksize)
        tcs_l = get_sitcs_l(xs_l)
        wafers_l = make_wafers_l(tcs_l)
        waferdf_l = pivoted_wafer_df_l(wafers_l)
        patables_l = pa_waferdf_l(waferdf_l)
        for i in range(len(names)):
            folder = os.path.join(destination, names[i])
            print("doing ", folder)
            write_pq(patables_l[i], folder, iEvt+offset)
    return iEvt+1

def process_ele_dfs(fname, destination='dfs/eles', chunksize=5, offset=0):
    xs_ALL, namesECON, names2d, names3d = get_nanoevents(fname)
    names = [get_name(ECON, two, three) for (ECON, two, three) in zip(namesECON, names2d, names3d)]
    nEvt = len(xs_ALL[0])

    for iEvt in tqdm(range(int(np.ceil(nEvt/chunksize)))):
        xs_l, _, _, _ = get_nanoevents(fname, entry_start = iEvt*chunksize, 
                                              entry_stop = (iEvt+1)*chunksize)
        'file:/home/submit/srothman/cmsdata/ECON_datasets/DoubleElectron_FlatPt-1To100_PU200/MINIAOD/',
        genele = get_genele(xs_l[0])
        recoele_l = get_recoele_l(xs_l)

        gen_patable = pa_eledf(genele)
        reco_patables_l = pa_eledf_l(recoele_l)

        genfolder = os.path.join(destination, "GEN")
        write_pq(gen_patable, genfolder, iEvt+offset)
        for i in range(len(names)):
            folder = os.path.join(destination, names[i])
            print("doing ", folder)
            write_pq(reco_patables_l[i], folder, iEvt+offset)
    return iEvt+1

def read_names(folder):
    namesECON = []
    names2d = []
    names3d = []
    folders = []

    files = os.listdir(os.path.join(folder))
    for fname in files:
        folders.append(os.path.join(folder, fname))
        if fname == 'GEN':
            namesECON.append(fname)
            names2d.append(fname)
            names3d.append(fname)
        else:
            splitted = fname.split('_')
            namesECON.append(splitted[0])
            names2d.append(splitted[1])
            names3d.append(splitted[2])
    return namesECON, names2d, names3d, folders

def process_folder(folder, kind):
    files = os.listdir(folder)
    offset = 0
    chunksize = 10000000
    if kind == 'wafers':
        chunksize=5
    elif kind == 'tcs':
        chunksize=1

    files.reverse()

    for file in files:
        if not file.endswith('.root'):
            continue
        print("DOING", file)
        fpath = os.path.join(folder, file)
        if len(uproot.open(fpath).keys()) == 0:
            continue

        if kind=='eles':
            offset += process_ele_dfs(fpath, chunksize=chunksize, offset=offset)
        elif kind=='wafers':
            offset += process_wafer_dfs(fpath, chunksize=chunksize, offset=offset)
        elif kind=='tcs':
            offset += process_tc_dfs(fpath, chunksize=chunksize, offset=offset)

def read_pq_to_pd(folder):
    namesECON, names2d, names3d, folders = read_names(folder)
    dfs = []
    for i in range(len(namesECON)):
        dfs.append(ds.dataset(folders[i]).to_table().to_pandas())
    return dfs, namesECON, names2d, names3d
