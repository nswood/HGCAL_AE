import uproot
import numpy as np
import awkward as ak
from coffea.nanoevents import NanoEventsFactory, NanoAODSchema
import matplotlib.pyplot as plt
import re

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
