import numpy as np
from scipy.stats import binned_statistic
import torch
import matplotlib.pyplot as plt

from matplotlib import cm
from matplotlib.colors import Normalize 
from scipy.interpolate import interpn

import os

'''

gen_n_batch_hist

Give function a folder path for image storage. 

Creates a folder called file_indic

saves n images in that folder with name file_indic_i


inputs:

filter_data: nx1 torch tensor of data to bin data into (CaclQ sum, eta, ...)

n: number of histograms

dif: nx1 data of error (Per tc or per wafer)

truth: True values used to calculate error (per tc or per wafer)

label: Descriptor used to label graph "______ % Error from x to y"

file_indic: name to save file

path: path to where to save file
'''


def gen_n_batch_hist(filter_data, n, dif, truth, label,file_indic,path = '/uscms/home/nswood/nobackup/Notebooks/AE_Dev/testing_saving/'):
    min_f = filter_data.min().item() - 10e-5
    max_f = filter_data.max().item() + 10e-5
    bins = []
    
    path = os.path.join(path, file_indic)
    if not (os.path.exists(path) and os.path.isdir(path)):
        os.mkdir(path)

    
    
    bins = np.percentile(filter_data, np.linspace(0,100,n+1))
    inds = find_bin(bins,filter_data)
        
    for i in range(n):
        plt.figure()
        plt.title(f'{label} {bins[i]:.2f} to {bins[i+1]:.2f}')
        plt.hist(100*percent_get_data(inds, dif,truth, i),bins = 50, log = True)
        plt.xlim([0,100])
        plt.ylim([0,10e4])
        strFile = f'{path}/{file_indic}_{i}'
        if os.path.isfile(strFile):
            os.remove(strFile)   
        plt.savefig(strFile)
        
        plt.show()

def percent_get_data(inds, data,truth, i):
    dt = data[np.where(inds ==i)[0]]
    dt_t = truth[np.where(inds ==i)[0]]
    p = dt/dt_t
    
    return p[np.isfinite(p)]

def find_bin(bins, data):
    indic = []
    for d in data:
        for j in range(len(bins)-1):
            if d < bins[j+1]:
                indic.append(j)
                break
    return np.array(indic)

def using_hist2d(fig,ax, x, y, bins=(50, 50)):
    # https://stackoverflow.com/a/20105673/3015186
    # Answer by askewchan
    h = ax.hist2d(x, y, bins, cmap=plt.cm.jet)
    fig.colorbar(h[3], ax=ax)

def gen_all_stats(decoded, truth,test_loc):
    pref = generate_stats(decoded, truth,test_loc)
    gen_avg_perf(decoded, truth,test_loc)
    return pref

def gen_all_stats_no_percent(decoded, truth,test_loc):
    pref = generate_stats_no_percent(decoded, truth,test_loc)
    return pref


def density_scatter( x , y, ax = None, sort = True, bins = 20, **kwargs )   :
    """
    Scatter plot colored by 2d histogram
    """
    if ax is None :
        fig , ax = plt.subplots()
    data , x_e, y_e = np.histogram2d( x, y, bins = bins, density = True )
    z = interpn( ( 0.5*(x_e[1:] + x_e[:-1]) , 0.5*(y_e[1:]+y_e[:-1]) ) , data , np.vstack([x,y]).T , method = "splinef2d", bounds_error = False)

    #To be sure to plot all data
    z[np.where(np.isnan(z))] = 0.0

    # Sort the points by density, so that the densest points are plotted last
    if sort :
        idx = z.argsort()
        x, y, z = x[idx], y[idx], z[idx]

    ax.scatter( x, y, c=z, **kwargs )

    norm = Normalize(vmin = np.min(z), vmax = np.max(z))
    cbar = fig.colorbar(cm.ScalarMappable(norm = norm), ax=ax)
    cbar.ax.set_ylabel('Density')

    return ax
def std_error(data,pred):
    return torch.mean(torch.sum(torch.abs(torch.subtract(data,pred)),dim=1))

def generate_stats(decoded, truth,test_loc):
    
    eps = 10e-10
    #Printing basic info
    print(f'MSE {torch.mean(torch.sum((decoded-truth)**2,dim =1))}')
    print(f'Median {torch.median(torch.sum((decoded-truth)**2,dim =1))}')
    print(f'Standard Devitaion {torch.std(torch.sum((decoded-truth)**2,dim =1))}')
    print(f'Average std error {std_error(decoded,truth)}')
    print(f'Average % Error of Energy Reconstruction {torch.mean(100*torch.abs(torch.sum(decoded-truth,dim=1))/torch.abs(torch.sum(truth,dim=1)))}')

    en_recon =100*torch.sum(decoded-truth,dim=1)/torch.sum(truth,dim=1)

    sum_calcq = torch.sum(truth,dim=1).repeat_interleave(1)+1
    sum_repeated = torch.unsqueeze(torch.sum(truth,dim=1).repeat_interleave(48)+1,dim=1)

    pref = torch.hstack((test_loc[:,-2:].cpu(),
                        torch.unsqueeze(sum_calcq,dim=1),
                         torch.sum((decoded-truth)**2,dim=1,keepdim = True),
                         torch.sum(torch.abs((decoded-truth)),dim=1,keepdim = True)))





    plt.figure()
    plt.title('sum CalcQ loss as % of sum truth calcQ')
    plt.hist(100*(torch.sum(decoded-truth,dim=1)/sum_calcq).detach().numpy(),range = [0,300], bins = 100, log = True)
    plt.show()

    density_scatter((pref[:,2].detach().numpy()),(pref[:,-2].detach().numpy()), bins = [50,50],s = 5, alpha = 0.75)
    plt.title('MSE Loss vs Log10 Sum CalcQ')
    plt.xlabel('Sum CalcQ')
    
    plt.ylabel('MSE Loss')
    plt.show()

    fig, ax = plt.subplots()
    using_hist2d(fig,ax,(pref[:,2].detach().numpy()),(pref[:,-2].detach().numpy()),bins =[50,50])
    plt.title('MSE Loss vs Sum CalcQ')
    plt.xlabel('Sum CalcQ')
    
    plt.ylabel('MSE Loss')
    plt.show()

    density_scatter((pref[:,2].detach().numpy()),
                    100*torch.sum(decoded-truth,dim=1).detach().numpy()/pref[:,-3].detach().numpy(),
                              bins = [50,50],
                             s = 5,
                             alpha = 0.75)
    plt.title('Loss of Sum CalcQ as % of sum calcQ truth vs Sum CalcQ')
    plt.xlabel('Sum CalcQ')
    plt.ylabel('% Loss of Sum CalcQ')
    plt.show()

    fig, ax = plt.subplots()
    using_hist2d(fig,ax,(pref[:,2].detach().numpy()),
                 100*torch.sum(decoded-truth,dim=1).detach().numpy()/pref[:,-3].detach().numpy(),
                 bins =[50,50])
    plt.title('Loss of Sum CalcQ as % of sum calcQ truth vs Sum CalcQ')
    plt.xlabel('Sum CalcQ')
    plt.ylabel(' % Loss of Sum CalcQ')
    plt.show()

    plt.figure()
    plt.title('mse loss vs eta')
    plt.scatter(pref[:,0].detach().numpy(),pref[:,-2].detach().numpy(), s = 1, alpha = 0.75)
    plt.show()

    fig, ax = plt.subplots()
    using_hist2d(fig,ax,pref[:,0].detach().numpy(),pref[:,-2].detach().numpy(),bins =[50,50])
    plt.title('mse loss vs eta')
    plt.xlabel('eta')
    plt.ylabel('mse loss')
    plt.show()


    plt.figure()
    plt.title('mse loss vs phi')
    plt.scatter(pref[:,1].detach().numpy(),pref[:,-2].detach().numpy(), s = 1, alpha = 0.75)
    plt.show()

    fig, ax = plt.subplots()
    using_hist2d(fig,ax,pref[:,1].detach().numpy(),pref[:,-2].detach().numpy(),bins =[50,50])
    plt.title('mse loss vs phi')
    plt.xlabel('phi')
    plt.ylabel('mse loss')
    plt.show()

    plt.figure()
    plt.title('mse loss vs sum calcq')
    plt.scatter(pref[:,2].detach().numpy(),pref[:,-2].detach().numpy(), s = 1, alpha = 0.75)
    plt.show()


    plt.figure()
    plt.title('mse loss vs sum calcq')
    plt.scatter((pref[:,2].detach().numpy()),(pref[:,-2].detach().numpy()), s = 1, alpha = 0.75)
    plt.show()


    plt.figure()
    plt.hist((torch.sum(torch.sqrt((decoded-truth).cpu()**2+eps),dim =1).detach().numpy()), bins = 50)
    plt.xlabel('RSE')
    plt.ylabel('#')
    plt.title('Residual Distribution')
    plt.show()

    plt.figure()
    plt.ylabel('Occurances')
    plt.xlabel('% Energy Reconstruction')
    plt.title('Histogram of Energy Recon')
    plt.hist(en_recon.detach().numpy(), bins = 50,range=(-200, 200))
    plt.show()
    # plotting residual distribution

    plt.figure()
    plt.hist((torch.sum((decoded-truth).cpu()**2 +eps,dim =1).detach().numpy()), bins = 50)
    plt.xlabel('SE')
    plt.ylabel('#')
    plt.title('Residual Distribution')
    plt.show()


    plt.figure()
    plt.hist((torch.sum((decoded-truth).cpu()**2 +eps,dim =1).detach().numpy()), bins = 50)
    plt.xlabel('SE')
    plt.ylabel('#')
    plt.title('Residual Distribution')
    plt.show()


    
    return pref



def gen_avg_perf(decoded,truth,test_loc):
    
    perf_data = torch.hstack((test_loc[:,-2:],torch.sum((decoded)**2,dim=1,keepdim = True)**0.5,torch.sum((decoded-truth)**2,dim=1,keepdim = True)))
    plt.figure()
    plt.title('Eta distribution in test data')
    plt.hist(perf_data[:,0].detach().numpy(), bins = 30)
    plt.show()

    plt.figure()
    plt.title('Phi distribution in test data')
    plt.hist(perf_data[:,1].detach().numpy(), bins = 30)
    plt.show()
    
    eta_bins = 9
    eta_stat = binned_statistic(perf_data[:,0].detach().numpy(), perf_data[:,3].detach().numpy(), 
                                 statistic='mean', 
                                 bins=eta_bins, 
                                 range=(1.5, 3.25))
    eta_labels = []
    for i in range(len(eta_stat.statistic)):
        start = eta_stat.bin_edges[i]
        end = eta_stat.bin_edges[i+1]
        eta_labels.append(str(np.round(start,2)) + ' to ' + str(np.round(end,2)))
    plt.figure()
    plt.title('Avg MSE vs Eta')
    plt.barh(eta_labels, eta_stat.statistic, color ='maroon')
    plt.show()
    
    
    #want to find average performance over regions of eta and magnitude

    magn_stat = binned_statistic(perf_data[:,2].detach().numpy(), perf_data[:,3].detach().numpy(), 
                                 statistic='mean', 
                                 bins=20, 
                                 range=(0, 1000))
    eta_labels = []
    for i in range(len(magn_stat.statistic)):
        start = magn_stat.bin_edges[i]
        end = magn_stat.bin_edges[i+1]
        eta_labels.append(str(np.round(start,2)) + ' to ' + str(np.round(end,2)))
    plt.figure()
    plt.title('Avg MSE vs Wafer Magnitude')
    plt.barh(eta_labels, magn_stat.statistic, color ='maroon')
    plt.show()
    
    plt.figure()
    plt.title("Log10 of Number of data values in bin")
    plt.barh(np.unique(eta_stat.binnumber,return_counts = True)[0], np.log10(np.unique(eta_stat.binnumber,return_counts = True)[1]), color = 'maroon')
    
    
    
def generate_stats_no_percent(decoded, truth,test_loc):
    
    eps = 10e-10
    #Printing basic info
    print(f'MSE {torch.mean(torch.sum((decoded-truth)**2,dim =1))}')
    print(f'Median {torch.median(torch.sum((decoded-truth)**2,dim =1))}')
    print(f'Standard Devitaion {torch.std(torch.sum((decoded-truth)**2,dim =1))}')
    print(f'Average % Error {torch.mean(100*torch.mean(torch.abs((decoded-truth))/torch.abs(truth+eps),dim =1))}')


    #plotting residual distribution
    
    plt.figure()
    plt.hist(np.log10(torch.sum((decoded-truth).cpu()**2 +eps,dim =1).detach().numpy()), bins = 50)
    plt.xlabel('Log SE')
    plt.ylabel('#')
    plt.title('Residual Distribution')
    plt.show()

    plt.figure()
    plt.hist((torch.sum(torch.sqrt((decoded-truth).cpu()**2+eps),dim =1).detach().numpy()), bins = 50)
    plt.xlabel('RSE')
    plt.ylabel('#')
    plt.title('Residual Distribution')
    plt.show()

    pref = torch.hstack((test_loc[:,-2:],torch.sum((truth)**2,dim=1,keepdim = True)**0.5,torch.sum((decoded-truth)**2,dim=1,keepdim = True),torch.sum(torch.abs((decoded-truth)),dim=1,keepdim = True)))
    
    

 
   
    plt.figure()
    plt.title('mse loss vs eta')
    plt.scatter(pref[:,0].detach().numpy(),pref[:,-2].detach().numpy(), s = 1, alpha = 0.75)
    plt.show()
    
  

    plt.figure()
    plt.title('mse loss vs phi')
    plt.scatter(pref[:,1].detach().numpy(),pref[:,-2].detach().numpy(), s = 1, alpha = 0.75)
    plt.show()
    
    

    plt.figure()
    plt.title('mse loss vs magnitude')
    plt.scatter(pref[:,2].detach().numpy(),pref[:,-2].detach().numpy(), s = 1, alpha = 0.75)
    plt.show()
    
    
    plt.figure()
    plt.title('log10 mse loss vs magnitude')
    plt.scatter((pref[:,2].detach().numpy()),np.log10(pref[:,-2].detach().numpy()), s = 1, alpha = 0.75)
    plt.show()

    plt.figure()
    plt.title('magnitude vs eta')
    plt.scatter(pref[:,0].detach().numpy(),pref[:,2].detach().numpy(), s = 1, alpha = 0.75)
    plt.show()
    
   
    return pref