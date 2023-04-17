import torch
import numpy as np
from telescope_torch import telescopeMSE2
def AE_MSE(data,pred):
    return torch.mean(torch.sum((data-pred)**2,dim=1))

def loss_high_e(data,pred,epoch,mean,std,alpha = 0.2,cut = 100):
    s = torch.sum(data[:,0:48],dim=1)
    s[s ==0.0000] = 1
    return new_loss(data,pred,epoch,mean,std) + 0.5*np.abs(torch.mean(torch.sum(pred-data[:,0:48],dim=1)/s).item()*100)
def AE_MAE(data,pred):
    return torch.mean(torch.sum(torch.abs(data-pred),dim=1))

def weighted_AE_MSE(data, pred):
    return torch.mean(torch.sum((data[:,0:48])**2,dim=1)*torch.sum((data-pred)**2,dim=1))

def dif_weighted_AE_MSE(data, pred,alpha = 0.2):
    return torch.mean(((torch.sum(data[:,0:48]**2,dim=1)**0.5)*alpha+1)*(torch.sum((data-pred)**2,dim=1)))

def log_dif_weighted_AE_MSE(data, pred,alpha = 1):
    return torch.mean(torch.log((torch.sum(data[:,0:48]**2,dim=1)**0.5)*alpha+1)*(torch.sum((data-pred)**2,dim=1)))

def calcQ_Error(data,pred, mean,std):
    return torch.mean(torch.sum(torch.abs(data-pred),dim=1))*std
    
def std_error(data,pred):
    return torch.mean(torch.sum(torch.abs(torch.subtract(data,pred)),dim=1))

# def AE_MSE_avg(data,pred):
#     return torch.mean(torch.max(torch.ones(len(data)),1.5-0.12*((torch.sum(data[:,0:48]**2,dim=1)**0.5)-5.2586)**2)*(torch.sum((data-pred)**2,dim=1)))

def combo_loss(data,pred,epoch,mean,std,alpha = 0.2,cut = 5):
    error = AE_MSE(data,pred)
    tele_loss = torch.mean(telescopeMSE2(data[:,0:48], pred))
    if epoch < cut:
        return error + 0.25*tele_loss
    else:
        #Energy Conservation
        sum_dt, sum_pred = torch.sum(data, dim=1), torch.sum(pred,dim=1)
        sum_error = torch.mean(torch.norm(sum_dt-sum_pred))
        
    
        return  error + 0.25*tele_loss #+ 0.01*sum_error*np.min([(epoch-cut)/cut,1])

    
def new_loss(data,pred,epoch,mean,std,alpha = 0.2,cut = 50):
    #Reconstruction
    error = dif_weighted_AE_MSE(data,pred,alpha = alpha)
    if epoch < cut:
        return error
    else:
        #Energy Conservation
        sum_dt, sum_pred = torch.sum(data, dim=1), torch.sum(pred,dim=1)
        sum_error = torch.mean(torch.norm(sum_dt-sum_pred))
        
    
        return  error + 0.01*sum_error*np.min([(epoch-cut)/cut,1])