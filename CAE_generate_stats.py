import numpy as np
import torch
import os
import matplotlib.pyplot as plt
import AE_Stats

from torch.autograd import Variable
from torch.utils.data import Dataset, DataLoader, TensorDataset
import importlib
import time

from losses import *

def gen_batch_stats(model_path,data_path,dt_size = 2000):
    models = os.listdir(model_path)
    performance = []
    all_data =[]
    all_pred =[]
    for m in models:
        model = torch.load(os.path.join(model_path,m)).to('cpu')
        model.device = 'cpu'
        data = torch.load(os.path.join(data_path,m)).to('cpu')
        sum_tc = torch.unsqueeze(torch.sum(data[:,0:48],dim = 1),dim=1).to('cpu')
        pred = model(data.to('cpu')[:,0:48],sum_tc)
        performance.append([m, data, pred])
        if int(0.05*len(data))< dt_size:
            dt_size = int(0.05*len(data))
        
        all_data.append(torch.tensor(data[-dt_size:]))
        all_pred.append(torch.tensor(pred[-dt_size:]))
 

    all_data_tensor = torch.vstack(all_data)
    all_pred_tensor = torch.vstack(all_pred)  
    AE_Stats.generate_stats(all_pred_tensor, all_data_tensor[:,0:48],all_data_tensor)
    return all_data_tensor,all_pred_tensor