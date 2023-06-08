import matplotlib.pyplot as plt
import matplotlib.colors
import numpy as np
from .util import cut_var

xlabels = {
    'energy' : '$\Delta E$',
    'mipPt' : '$\Delta p_T$',
    'eta' : '$\Delta |\eta|$',
    'phi' : '$\Delta \phi$',
    'dR' : '$\Delta R$',
    'data' : '$\Delta Q$',
}
xlabels['pt'] = xlabels['mipPt']

units = {
    'energy' : 'GeV',
    'mipPt' : 'MiPs',
    'prop' : '%',
    'data' : 'ADC',
}
units['pt'] = units['energy']

def get_cut(df0, df1, cuts={}):
    mask = np.ones_like(df0.eta.to_numpy(), dtype=bool)
    cutstring = ''
    for key in cuts.keys():
        if cuts[key][0] == -np.inf and cuts[key][1] == np.inf:
            continue;

        if key[-1] == '0':
            varname = xlabels[key[:-1]]+"$_0$"
        elif key[-1] == '1':
            varname = xlabels[key[:-1]]+"$_1$"
        else:
            raise ValueError("Need to specify for each cut variable which side to apply it to")

        varname = '$' + varname[8:]
        if cutstring != '':
            cutstring+='; '
        if cuts[key][0] == cuts[key][1]:
            cutstring += '%s == %g'%(varname, cuts[key][0])
        elif cuts[key][1] == np.inf:
            cutstring += '%g < %s'%(cuts[key][0], varname)
        elif cuts[key][0] == -np.inf:
            cutstring += '%s <= %g'%(varname, cuts[key][1])
        else:
            cutstring += '%g < %s <= %g'%(cuts[key][0], varname, cuts[key][1]) 

        if key[-1] == '0':
            var = df0[key[:-1]].to_numpy()
        elif key[-1] == '1':
            var = df1[key[:-1]].to_numpy()
        if key[:-1] == 'eta':
            var = np.abs(var)

        varmask = cut_var(var, cuts[key])
        mask = mask & varmask

    return mask, cutstring

def hist(dfs_l, quantity='energy', cuts={}, baseline=0, names=None, prop=False, bins=100, logy=True, xlim = [-1, 1], fname='test.png', chainmask=None):
    if quantity == 'data':
        xlim = [-100, 100]

    qs = [df[quantity].to_numpy() for df in dfs_l]
    q0 = qs[baseline]
    if prop:
        dqs = [100*(q - q0)/q0 for q in qs]
    else:
        dqs = [q - q0 for q in qs]
        

    masks = []
    for i in range(len(qs)):
        mask, cutstring = get_cut(dfs_l[baseline], dfs_l[i], cuts)
        masks.append(mask)

    print(cutstring)
    dqs = [dq[mask] for dq,mask in zip(dqs, masks)]

    if chainmask is None:
        chainmask = [True] * len(dfs_l)

    chainmask[baseline] = False

    xs = [dqs[i] for i in range(len(dfs_l)) if chainmask[i]]
    labels = [names[i] for i in range(len(dfs_l)) if chainmask[i]]

    plt.clf()  
    plt.hist(xs, bins=bins, histtype='step', label=labels, range=xlim)

    if names is not None:
        plt.legend()
    if logy:
        plt.yscale('log')

    xlabel = xlabels[quantity]
    if prop:
        xlabel += " [%s]"%units['prop']
    elif quantity in units:
        xlabel += " [%s]"%units[quantity]
    plt.xlabel(xlabel)

    plt.title(cutstring)

    plt.savefig(fname, bbox_inches='tight', format='png')

def hist2d(df0, df1, quantity='energy', xquantity='energy', cuts={}, names=None, prop=False, logx=False, xbins=10, ybins=10):
    plt.clf()
    diff, mask = get_diff(df0, df1, quantity, cuts, prop)
    dfcols = np.unique(df0.columns.get_level_values(0))

    xval = df0[xquantity].to_numpy()[mask]
    if xquantity == 'eta':
        xval = np.abs(xval)

    ybins = np.linspace(diff.min(), diff.max(), ybins+1)
    if logx:
        xbins = np.geomspace(max(xval.min(), 1e-2), xval.max(), xbins+1)
        plt.xscale('log')
    else:
        xbins = np.linspace(xval.min(), xval.max(), xbins+1)
    plt.hist2d(xval, diff, cmap="Reds", norm=matplotlib.colors.LogNorm(), bins=[xbins, ybins])
    plt.colorbar()
    plt.savefig('test2.png')

