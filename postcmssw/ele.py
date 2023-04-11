import awkward as ak
import numpy as np
from .util import cut_var

def get_evtcut(ne, cuts={'eta' : (1.57, np.inf)}):
    mask = np.ones(len(ne), dtype=bool)
    for key in cuts.keys():
        cutvar = ne.gen[key]
        if key=='eta':
            cutvar = np.abs(cutvar)
        passed = ak.to_numpy(ak.any(cut_var(cutvar, cuts[key]), axis=-1))
        mask = mask & passed
    return mask

def get_genele(ne):
    #treat each side separately
    fields = ['eta', 'phi', 'pt', 'energy', 'charge'] 
    eles = {}
    for field in fields:
        eles[field] = ak.Array(ak.to_numpy(ne.gen[field], allow_missing=False))
    eles = ak.zip(eles)

    zpos = eles.eta > 0
    zneg = eles.eta < 0
    
    #firsts just to get right shape. there is exactly one
    elepos = ak.to_pandas(eles[zpos])
    eleneg = ak.to_pandas(eles[zneg])

    elepos.index.name = 'event'
    eleneg.index.name = 'event'

    return elepos.append(eleneg)

def get_recoele(ne):
    #treat each side separately
    fields = ['energy', 'eta', 'phi', 'pt']
    eles = {}
    for field in fields:
        eles[field] = ne.cl3d[field]
    eles = ak.zip(eles)

    zpos = eles.eta > 0
    zneg = eles.eta < 0

    elepos = eles[zpos]
    eleneg = eles[zneg]

    hardestpos = ak.argmax(elepos.pt, axis=-1, keepdims=True)
    hardestneg = ak.argmax(eleneg.pt, axis=-1, keepdims=True)

    elepos = ak.firsts(elepos[hardestpos])
    eleneg = ak.firsts(eleneg[hardestneg])

    elepos_dict = {}
    eleneg_dict = {}
    for field in eles.fields:
        elepos_dict[field] = ak.Array(ak.to_numpy(elepos[field], allow_missing=True))
        eleneg_dict[field] = ak.Array(ak.to_numpy(eleneg[field], allow_missing=True))
    elepos = ak.to_pandas(ak.zip(elepos_dict))
    eleneg = ak.to_pandas(ak.zip(eleneg_dict))

    elepos.index.name = 'event'
    eleneg.index.name = 'event'

    return elepos.append(eleneg)

def get_recoele_l(ne_l):
    ele_l = []
    for ne in ne_l:
        ele_l.append(get_recoele(ne))
    return ele_l
