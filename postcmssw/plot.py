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
    'data' : '$\Delta Q$'
}

units = {
    'energy' : 'GeV',
    'mipPt' : 'MiPs',
    'prop' : '%',
    'data' : 'ADC'
}

def get_diff(df0, df1, props, quantity='energy', cuts={}, prop=False):
    first = df0[quantity].to_numpy()
    second = df1[quantity].to_numpy()
    diff = second-first
    if prop:
        diff = diff/first

    mask = np.ones_like(diff, dtype=bool)
    cutstring = ''
    for key in cuts.keys():
        if key[-1] == '0':
            varname = xlabels[key[:-1]]+"$_0$"
        elif key[-1] == '1':
            varname = xlabels[key[:-1]]+"$_1$"
        else:
            varname = xlabels[key]
        varname = '$' + varname[8:]
        if cutstring != '':
            cutstring+='; '
        if cuts[key][0] == cuts[key][1]:
            cutstring += '%s == %g'%(varname, cuts[key][0])
        elif cuts[key][1] == np.inf:
            cutstring += '%g < %s'%(cuts[key][0], varname)
        else:
            cutstring += '%g < %s <= %g'%(cuts[key][0], varname, cuts[key][1]) 

        if key[-1] != '0' and key[-1] != '1':
            var = props[key].loc[df0[quantity].columns]
            if key[:-1] == 'eta':
                var = np.abs(var)
            varmask = cut_var(var, cuts[key])
            mask[:,~varmask] = False
            continue

        if key[-1] == '0':
            var = df0[key[:-1]].to_numpy()
        elif key[-1] == '1':
            var = df1[key[:-1]].to_numpy()
        if key[:-1] == 'eta':
            var = np.abs(var)
        varmask = cut_var(var, cuts[key])
        mask = mask & varmask

    return diff[mask], mask, cutstring

def get_all_diffs(dfs_l, props, quantity='energy', cuts={}, baseline=0, prop=False):
    diffs = []
    mask = None
    for i in range(len(dfs_l)):
        if i==baseline:
            continue
        diff, _, cutstring = get_diff(dfs_l[baseline], dfs_l[i], props, quantity, cuts, prop)
        diffs.append(diff)
    return diffs, cutstring

def hist(dfs_l, props, quantity='energy', cuts={}, baseline=0, names=None, prop=False, bins=100, logy=True, xlim = [-1, 1], fname='test.png'):
    if quantity == 'data':
        xlim = [-100, 100]
    labels = []
    for i in range(len(names)):
        if i==baseline:
            continue
        labels.append(names[i])

    plt.clf()  
    diffs, cutstring = get_all_diffs(dfs_l, props, quantity, cuts, baseline, prop)
    plt.hist(diffs, bins=bins, histtype='step', label=labels, range=xlim)

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

def hist2d(df0, df1, props, quantity='energy', xquantity='energy', cuts={}, names=None, prop=False, logx=False, xbins=10, ybins=10):
    plt.clf()
    diff, mask = get_diff(df0, df1, props, quantity, cuts, prop)
    dfcols = np.unique(df0.columns.get_level_values(0))
    if xquantity in dfcols:
        xval = df0[xquantity].to_numpy()[mask]
    else:
        xval = props[xquantity].loc[df0[quantity].columns].to_numpy()
        xval = np.repeat(xval[None, :], mask.shape[0], axis=0)[mask]
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

