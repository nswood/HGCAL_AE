import os
import sys
import pandas as pd
import torch.nn as nn
import torch.optim as optim
import numpy as np
import torch
import matplotlib.pyplot as plt
from Naive_DAE import CVAE
import AE_Stats
from load_data_fn import load_data,load_data_no_filter

from torch.autograd import Variable
from torch.utils.data import Dataset, DataLoader, TensorDataset
import importlib
from telescope_torch import *
import time
from losses import new_loss,AE_MSE

class data_storage():
    
    def __init__(self,name, dt,max_dt_size):
        self.name = name

        if len(dt) < max_dt_size:
            self.dt_train = dt[0: int(0.8*len(dt))]
            self.dt_test = dt[int(0.8*len(dt)):]
        else:
            self.dt_train = dt[0: int(0.8*max_dt_size)]
            self.dt_test = dt[-int(0.2*max_dt_size):]




def train_CVAE(model, train,test,label,cur_directory,path = '/uscms/home/nswood/nobackup/Notebooks/AE_Dev/models/batched_models'
              , loss = new_loss,num_epochs = 200, lr = 0.001,batch = 100):

    print(f'TRAINING INFO:')
    print(f'Total Dataset Size: {len(train) + len(test)}')
    mean = 0
    std = 1

    train_loc = train
    test_loc = test

    # train = torch.vstack([train,largest[0:1000]] )
    train_loc=train_loc[torch.randperm(train_loc.size()[0])]
    test_loc=test_loc[torch.randperm(test_loc.size()[0])]
    train_loc_d1_flat = DataLoader(
        TensorDataset(torch.Tensor(train_loc)),
        batch_size=batch,
        shuffle=False
    )

    test_loc_d1_flat = DataLoader(
        TensorDataset(torch.Tensor(test_loc)),
        batch_size=batch,
        shuffle=False
    )

    train = train[:,0:48]
    test = test[:,0:48]
    train_tc_sum = torch.unsqueeze(torch.sum(train[:,0:48],dim = 1),dim=1)
    test_tc_sum = torch.unsqueeze(torch.sum(test[:,0:48],dim = 1),dim=1)


    # train = torch.vstack([train,largest[0:1000]] )
    train=train[torch.randperm(train.size()[0])]
    test=test[torch.randperm(test.size()[0])]
    train_d1_flat = DataLoader(
        TensorDataset(torch.Tensor(train),train_tc_sum),
        batch_size=batch,
        shuffle=False
    )

    test_d1_flat = DataLoader(
        TensorDataset(torch.Tensor(test),test_tc_sum),
        batch_size=batch,
        shuffle=False
    )
    #fine-tune autoencoder
    #batch 500

    optimizer = optim.Adam(model.parameters(), lr,weight_decay=5e-2)
    scheduler = torch.optim.lr_scheduler.ReduceLROnPlateau(optimizer, 'min',factor = 0.5)

    all_test_losses = []
    all_train_losses = []
    # train
    running_loss = float("inf")
    data_test = test
    sum_TC_test = torch.unsqueeze(torch.sum(data_test[:,0:48],dim = 1),dim=1)

    for epoch in range(num_epochs):

        losses = []

        for i, (data,sum_TC) in enumerate(train_d1_flat):

            model.train()
            v_pred = model(data,sum_TC)
            batch_loss = loss(data[:,0:48], v_pred,epoch,mean,std)
            all_train_losses.append(batch_loss.item())
            losses.append(batch_loss.item())
            optimizer.zero_grad()
            batch_loss.backward()
            optimizer.step()


        scheduler.step(batch_loss)
        model.eval()
        test_pred = model(data_test,sum_TC_test)
        batch_test = loss(data_test[:,0:48], test_pred,epoch,mean,std)
        all_test_losses.append(batch_test.item())
        running_loss = np.mean(losses)
        runningtest_loss = batch_test.item()

        if epoch % 25 == 0:
            print('Epoch {}, lr {}'.format(
                epoch, optimizer.param_groups[0]['lr']))
            print(f"Epoch {epoch}: Train {running_loss:.3f}, Test {runningtest_loss:.3f}")
            print(f"MSE NON-NORMALIZED: Train MSE {AE_MSE(v_pred, data)*3.5280**2:.3f}, Test MSE {AE_MSE(test_pred, data_test)*3.5280**2:.3f}")
            if epoch == 0:
                if AE_MSE(v_pred, data)*3.5280**2 > 20:
                    for g in optimizer.param_groups:
                        g['lr'] = g['lr']
         

    model.eval()
#     AE_Stats.gen_all_stats(model(dt[-size_test:,0:48]).cpu(),dt[-size_test:,0:48].cpu(),dt[-size_test:].cpu())
    torch.save(model,f'{path}/{label}')
    del model,train,test
        

def train_CVAEs(data_path,
               dt_files,
                 batch = 100,
                 override = True,
                 model_params = [],
                 loss = new_loss,
                 path_1_high = 'models/MIP_dt_1_450_250_greater_1',
                 path_2_high = 'models/MIP_dt_2_450_250_greater_1',
                 path_3_high = 'models/MIP_dt_3_450_250_greater_1',
                 path_1_low =  'models/MIP_dt_1_450_250_greater_1',
                 path_2_low  = 'models/MIP_dt_2_450_250_greater_1',
                 path_3_low  = 'models/MIP_dt_3_450_250_greater_1',
                 append_ReLU = False,
                 max_dt_size = 40000,
                 epochs = 100,
                 lr = 0.001,
                 dir_label = time.strftime("%Y-%m-%d_%H-%M-%S",
                                           time.gmtime()),
                 path = '/uscms/home/nswood/nobackup/Notebooks/AE_Dev/models/batched_models'):
    path = os.path.join(path, dir_label)
    
    if not (os.path.exists(path) and os.path.isdir(path)):
        os.mkdir(path)
    
    trained_models = os.listdir(path)
    device = 'cuda'
    
    
    
    train_info = []
    
    data = []
    
    for d in dt_files:
        
        data.append(data_storage(d,torch.load(f'{data_path}/{d}'), max_dt_size))
    
    for d in data:
        
        params = []
        if override == True: 
            if model_params == []:
                if int(d.name[8]) == 1:
                    if int(d.name[10:]) <=12:
                        mt = torch.load(path_1_low)
                    else:
                        mt = torch.load(path_1_high)
                    if append_ReLU:
                        mt.decoders.add_module('ReLU',nn.ReLU())
                    params.append(mt)
                elif int(d.name[8]) == 2:
                    if int(d.name[10:]) <=12:
                        mt = torch.load(path_2_low)
                    else:
                        mt = torch.load(path_2_high)
                    if append_ReLU:
                        mt.decoders.add_module('ReLU',nn.ReLU())
                    params.append(mt)
                else:
                    if int(d.name[10:]) <=12:
                        mt = torch.load(path_3_low)
                    else:
                        mt = torch.load(path_3_high)
                    if append_ReLU:
                        mt.decoders.add_module('ReLU',nn.ReLU())
                    params.append(mt)
            else:
                
                params.append(CVAE(model_params))
            params.append(d)

            #Limiting size of training/testing to limit runtime
           

            
            params.append(dir_label)
            train_info.append(params)
        else:
            if not d.name in trained_models:
                
                if model_params == []:
                    if int(d.name[8]) == 1:
                        if int(d.name[10:]) <=12:
                            mt = torch.load(path_1_low)
                        else:
                            mt = torch.load(path_1_high)
                        if append_ReLU:
                            mt.decoders.add_module('ReLU',nn.ReLU())
                        params.append(mt)
                    elif int(d.name[8]) == 2:
                        if int(d.name[10:]) <=12:
                            mt = torch.load(path_2_low)
                        else:
                            mt = torch.load(path_2_high)
                        if append_ReLU:
                            mt.decoders.add_module('ReLU',nn.ReLU())
                        params.append(mt)
                    else:
                        if int(d.name[10:]) <=12:
                            mt = torch.load(path_3_low)
                        else:
                            mt = torch.load(path_3_high)
                        if append_ReLU:
                            mt.decoders.add_module('ReLU',nn.ReLU())
                        params.append(mt)
                else:
                    params.append(CVAE(model_params))
                
                params.append(d)
                
                #Limiting size of training/testing to limit runtime
                
                
                
                params.append(dir_label)
                
                train_info.append(params)
        
    for params in train_info:
        
        print(f'TRAINING MODEL {params[1].name}')
        #Training model
        print(params[1].name)
        print(os.path.join(path,params[1].name))
        train_CVAE(params[0].to(device),
                  params[1].dt_train.to(device),
                  params[1].dt_test.to(device),
                  params[1].name,
                  os.path.join(path,params[1].name),
                  path = path,batch = batch, num_epochs = epochs, lr = lr)
        #clear cuda after training each model
        torch.cuda.empty_cache()
#def train_CAE(model,train,test,label,cur_directory,path, loss = new_loss,num_epochs = 200, lr = 0.001,batch = 100):
def retrain_CVAEs(data_path,
               dt_files,
               losses,
                 loss_threshold = 10,
                 batch = 100,
                 override = True,
                 model_params = [],
                 loss = new_loss,
                 path_1_high = 'models/MIP_dt_1_450_250_greater_1',
                 path_2_high = 'models/MIP_dt_2_450_250_greater_1',
                 path_3_high = 'models/MIP_dt_3_450_250_greater_1',
                 path_1_low =  'models/MIP_dt_1_450_250_greater_1',
                 path_2_low  = 'models/MIP_dt_2_450_250_greater_1',
                 path_3_low  = 'models/MIP_dt_3_450_250_greater_1',
                 append_ReLU = False,
                 max_dt_size = 40000,
                 epochs = 100,
                 lr = 0.001,
                 dir_label = time.strftime("%Y-%m-%d_%H-%M-%S",
                                           time.gmtime()),
                 path = '/uscms/home/nswood/nobackup/Notebooks/AE_Dev/models/batched_models'):
    path = os.path.join(path, dir_label)
    
    
    
    trained_models = os.listdir(path)
    device = 'cuda'
    
    
    
    train_info = []
    
    data = []
    
    for d in dt_files:
        data.append(data_storage(d,torch.load(f'{data_path}/{d}'), max_dt_size))
    i = 0
    for d in data:
        if i == len(losses):
            break
        params = []
        if losses[i] >= loss_threshold:
            
            if model_params == 'retrain':
                mt = torch.load(os.path.join(path,d.name))
                params.append(mt)
            elif model_params == []:
                if int(d.name[8]) == 1:
                    if int(d.name[10:]) <=12:
                        mt = torch.load(path_1_low)
                    else:
                        mt = torch.load(path_1_high)
                    if append_ReLU:
                        mt.decoders.add_module('ReLU',nn.ReLU())
                    params.append(mt)
                elif int(d.name[8]) == 2:
                    if int(d.name[10:]) <=12:
                        mt = torch.load(path_2_low)
                    else:
                        mt = torch.load(path_2_high)
                    if append_ReLU:
                        mt.decoders.add_module('ReLU',nn.ReLU())
                    params.append(mt)
                else:
                    if int(d.name[10:]) <=12:
                        mt = torch.load(path_3_low)
                    else:
                        mt = torch.load(path_3_high)
                    if append_ReLU:
                        mt.decoders.add_module('ReLU',nn.ReLU())
                    params.append(mt)
            else:
                params.append(CAE(model_params))
            params.append(d)

        #Limiting size of training/testing to limit runtime


        
            params.append(dir_label)
            params.append(losses[i])
            print(losses[i])
            train_info.append(params)
        i = i+1
    
    for params in train_info:
        
        print(f'TRAINING MODEL {params[1].name}')
        #Training model
        print(f'cur loss = {params[-1]}')
        retrain_CVAE(params[0].to(device),
                  params[1].dt_train.to(device),
                  params[1].dt_test.to(device),
                  params[1].name,
                  params[-1],
                  os.path.join(path,params[1].name),
                  
                  path,batch = batch, num_epochs = epochs, lr = lr)
        #clear cuda after training each model
        torch.cuda.empty_cache()

        
        
def retrain_CVAE(model, train,test,label,loss_threshold, cur_directory,path, loss = new_loss,num_epochs = 200, lr = 0.001,batch = 100):
    device = 'cuda'
    print(f'TRAINING INFO:')
    print(f'Total Dataset Size: {len(train) + len(test)}')
    mean = 0
    std = 1

    train_loc = train
    test_loc = test

    # train = torch.vstack([train,largest[0:1000]] )
    train_loc=train_loc[torch.randperm(train_loc.size()[0])]
    test_loc=test_loc[torch.randperm(test_loc.size()[0])]
    train_loc_d1_flat = DataLoader(
        TensorDataset(torch.Tensor(train_loc)),
        batch_size=batch,
        shuffle=False
    )

    test_loc_d1_flat = DataLoader(
        TensorDataset(torch.Tensor(test_loc)),
        batch_size=batch,
        shuffle=False
    )

    train = train[:,0:48]
    test = test[:,0:48]
    train_tc_sum = torch.unsqueeze(torch.sum(train[:,0:48],dim = 1),dim=1)
    test_tc_sum = torch.unsqueeze(torch.sum(test[:,0:48],dim = 1),dim=1)
    model.device = 'cuda'

    # train = torch.vstack([train,largest[0:1000]] )
    train=train[torch.randperm(train.size()[0])]
    test=test[torch.randperm(test.size()[0])]
    train_d1_flat = DataLoader(
        TensorDataset(torch.Tensor(train),train_tc_sum),
        batch_size=batch,
        shuffle=False
    )

    test_d1_flat = DataLoader(
        TensorDataset(torch.Tensor(test),test_tc_sum),
        batch_size=batch,
        shuffle=False
    )
    #fine-tune autoencoder
    #batch 500

    optimizer = optim.Adam(model.parameters(), lr,weight_decay=5e-2)
    scheduler = torch.optim.lr_scheduler.ReduceLROnPlateau(optimizer, 'min',factor = 0.5)

    all_test_losses = []
    all_train_losses = []
    # train
    running_loss = float("inf")
    data_test = test
    sum_TC_test = torch.unsqueeze(torch.sum(data_test[:,0:48],dim = 1),dim=1)

    for epoch in range(num_epochs):

        losses = []

        for i, (data,sum_TC) in enumerate(train_d1_flat):

            model.train()
            v_pred = model(data,sum_TC)
            batch_loss = loss(data[:,0:48], v_pred,epoch,mean,std)
            all_train_losses.append(batch_loss.item())
            losses.append(batch_loss.item())
            optimizer.zero_grad()
            batch_loss.backward()
            optimizer.step()


        scheduler.step(batch_loss)
        model.eval()
        test_pred = model(data_test,sum_TC_test)
        batch_test = loss(data_test[:,0:48], test_pred,epoch,mean,std)
        all_test_losses.append(batch_test.item())
        running_loss = np.mean(losses)
        runningtest_loss = batch_test.item()

        if epoch % 5 == 0:
            print('Epoch {}, lr {}'.format(
                epoch, optimizer.param_groups[0]['lr']))
            print(f"Epoch {epoch}: Train {running_loss:.3f}, Test {runningtest_loss:.3f}")
            print(f"MSE NON-NORMALIZED: Train MSE {AE_MSE(v_pred, data)*3.5280**2:.3f}, Test MSE {AE_MSE(test_pred, data_test)*3.5280**2:.3f}")

    model.eval()
#     AE_Stats.gen_all_stats(model(dt[-size_test:,0:48]).cpu(),dt[-size_test:,0:48].cpu(),dt[-size_test:].cpu())
    if runningtest_loss < loss_threshold:
        print(f'model saved, loss lowered: {loss_threshold} -> {runningtest_loss}')
        torch.save(model,f'{path}/{label}')

        
       