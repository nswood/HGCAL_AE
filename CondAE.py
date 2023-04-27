import os
import sys
import pandas as pd
import torch.nn as nn
import torch.optim as optim
import numpy as np
import torch
import matplotlib.pyplot as plt
from Naive_DAE import Naive_DAE,Dropout_DAE
import AE_Stats
from load_data_fn import load_data,load_data_no_filter

from torch.autograd import Variable
from torch.utils.data import Dataset, DataLoader, TensorDataset
import importlib
from telescope_torch import *
import time
from losses import new_loss,AE_MSE, combo_loss


def train_condAE(model, dt_train, dt_test,label,cur_directory,path, loss = new_loss,num_epochs = 200, lr = 0.001,batch = 100):
    size_train = len(dt_train)
    size_test = len(dt_test)
    if size_train !=0 and size_test != 0:

        print(f'TRAINING INFO:')
        print(f'Total Dataset Size: {size_train + size_test}')
        mean = 0
        std = 1

        train_loc =dt_train
        test_loc = dt_test

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

        train = dt_train[:,0:48]
        test = dt_test[:,0:48]
        # train = torch.vstack([train,largest[0:1000]] )
        train=train[torch.randperm(train.size()[0])]
        test=test[torch.randperm(test.size()[0])]
        train_d1_flat = DataLoader(
            TensorDataset(torch.Tensor(train)),
            batch_size=batch,
            shuffle=False
        )

        test_d1_flat = DataLoader(
            TensorDataset(torch.Tensor(test)),
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
        
        for epoch in range(num_epochs):

            losses = []

            for i, data_list in enumerate(train_d1_flat):

                model.train()
                data = data_list[0]
                v_pred = model(data)
                batch_loss = loss(data[:,0:48], v_pred,epoch,mean,std)
                all_train_losses.append(batch_loss.item())
                losses.append(batch_loss.item())
                optimizer.zero_grad()
                batch_loss.backward()
                optimizer.step()


            scheduler.step(batch_loss)

            data_test = test
            model.eval()
            test_pred = model(data_test)
            batch_test = loss(data_test[:,0:48], test_pred,epoch,mean,std)
            all_test_losses.append(batch_test.item())
            running_loss = np.mean(losses)
            runningtest_loss = batch_test.item()

            if epoch % 25 == 0:
                print('Epoch {}, lr {}'.format(
                    epoch, optimizer.param_groups[0]['lr']))
                print(f"Epoch {epoch}: Train {running_loss:.3f}, Test {runningtest_loss:.3f}")
                print(f"MSE NON-NORMALIZED: Train MSE {AE_MSE(v_pred, data)*3.5280**2:.3f}, Test MSE {AE_MSE(test_pred, data_test)*3.5280**2:.3f}")

        model.eval()
    #     AE_Stats.gen_all_stats(model(dt[-size_test:,0:48]).cpu(),dt[-size_test:,0:48].cpu(),dt[-size_test:].cpu())
        torch.save(model,f'{cur_directory}/{label}')
    else:
        print('dataset too small to train')
        torch.save(model,f'{cur_directory}/{label}')
    
#pass a path to the folde
def train_condAEs(data_path,
                  dt_files,
                 batch = 100,
                 override = True,
                 model_params = [],
                 loss = new_loss,
                 tele = False,
                 path_1 = 'models/MIP_dt_1_450_250_greater_1',
                 path_2 = 'models/MIP_dt_1_450_250_greater_1',
                 path_3 = 'models/MIP_dt_1_450_250_greater_1',
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
        
    for f in dt_files:
        if not (os.path.exists(os.path.join(path, f))):
            print('made' + os.path.join(path, f))
            os.mkdir(os.path.join(path, f))
    
    trained_models = os.listdir(path)
    device = 'cuda'
    train_info = []
    
    data = []
    
    for d in dt_files:
        low = torch.load(os.path.join(data_path,d+'_low'))
        high = torch.load(os.path.join(data_path,d+'_high'))
        data.append(cond_storage(d,low,high, max_dt_size))

    for d in data:
        
        params = []
        if override == True: 
            if model_params == []:
                if int(d.name[8]) ==1:
                    mt = torch.load(path_1)
                    if append_ReLU:
                        mt.decoders.add_module('ReLU',nn.ReLU())
                    params.append(mt)
                elif int(d.name[8]) == 2:
                    mt = torch.load(path_2)
                    if append_ReLU:
                        mt.decoders.add_module('ReLU',nn.ReLU())
                    params.append(mt)
                else:
                    mt = torch.load(path_3)
                    if append_ReLU:
                        mt.decoders.add_module('ReLU',nn.ReLU())
                    params.append(mt)
            else:
                
                params.append(Naive_DAE(model_params))
            params.append(d)

            #Limiting size of training/testing to limit runtime
            
            params.append(dir_label)
            train_info.append(params)
        else:
            
            if len(os.listdir(os.path.join(path,d.name))) != 2:
                print(d.name)
                if model_params == []:
                    if int(d.name[8]) == 1:
                        params.append(torch.load(path_1))
                    elif int(d.name[8]) == 2:
                        params.append(torch.load(path_2))
                    else:
                        params.append(torch.load(path_3))
                else:
                    params.append(Naive_DAE(model_params))
                
                params.append(d)
                
                #Limiting size of training/testing to limit runtime
                
                
                params.append(dir_label)
                
                train_info.append(params)
    i = 0
    for params in train_info:
        i = i+1
        print(f'TRAINING MODEL {params[1].name}: {i}/{len(train_info)}')
        #Training model
        if tele:
            print('LOW')
            train_condAE_tele(params[0].to(device),params[1].low_train.to(device),params[1].low_test.to(device),params[1].name+'_low',os.path.join(path,params[1].name),path, batch = batch, num_epochs = epochs,loss = loss, lr = lr)
            print('HIGH')
            train_condAE_tele(params[0].to(device),params[1].high_train.to(device),params[1].high_test.to(device),params[1].name+'_high',os.path.join(path,params[1].name),path, batch = batch, num_epochs = epochs, loss = loss,lr = lr)

        else:
            print('LOW')

            train_condAE(params[0].to(device),params[1].low_train.to(device),params[1].low_test.to(device),params[1].name+'_low',os.path.join(path,params[1].name),path, batch = batch, num_epochs = epochs,loss = loss, lr = lr)
            print('HIGH')   
            train_condAE(params[0].to(device),params[1].high_train.to(device),params[1].high_test.to(device),params[1].name+'_high',os.path.join(path,params[1].name),path, batch = batch, num_epochs = epochs, loss = loss,lr = lr)

        #clear cuda after training each model
        torch.cuda.empty_cache()
        
def retrain_condAEs(data_path,
                  dt_files,
                 batch = 100,
                 override = True,
                 model_params = [],
                 loss = new_loss,
                 tele = False,
                 path_1 = 'models/MIP_dt_1_450_250_greater_1',
                 path_2 = 'models/MIP_dt_1_450_250_greater_1',
                 path_3 = 'models/MIP_dt_1_450_250_greater_1',
                 append_ReLU = False,
                 max_dt_size = 40000,
                 mse_threshold = 10,
                 epochs = 100,
                 lr = 0.001,
                 dir_label = time.strftime("%Y-%m-%d_%H-%M-%S",
                                           time.gmtime()),
                 path = '/uscms/home/nswood/nobackup/Notebooks/AE_Dev/models/batched_models'):
    path = os.path.join(path, dir_label)
    if not (os.path.exists(path) and os.path.isdir(path)):
        os.mkdir(path)
        for f in dt_files:
            os.mkdir(os.path.join(path, f))
    
    trained_models = os.listdir(path)
    device = 'cuda'
    train_info = []
    
    data = []
    
    
    
    for d in dt_files:
        low = torch.load(os.path.join(data_path,d+'_low'))
        high = torch.load(os.path.join(data_path,d+'_high'))
        data.append(cond_storage(d,low,high, max_dt_size))
    print('Data Loaded')
    #Generate Performance for retrain
    performance = []
    for d in data:
        low_mse = AE_MSE(d.low_test[:,0:48].to('cpu'),torch.load(os.path.join(path,d.name,d.name+'_low')).to('cpu')(d.low_test[:,0:48].to('cpu')))
        high_mse = AE_MSE(d.high_test[:,0:48].to('cpu'),torch.load(os.path.join(path,d.name,d.name+'_high')).to('cpu')(d.high_test[:,0:48].to('cpu')))
        performance.append([d.name,low_mse.item(),high_mse.item()])
    print('Performance Calculated')
    for d,p in zip(data,performance):
        params = []
        if model_params == 'retrain':
            params.append('retrain')
        else:
            params.append(Naive_DAE(model_params))

        params.append(d)

        #Limiting size of training/testing to limit runtime

        params.append(dir_label)
        params.append(p)
        print(p[1])
        print(p[2])
        if p[1] > mse_threshold or p[2] > mse_threshold:
            train_info.append(params)
        
                
    i = 0
    for params in train_info:
        i = i+1
        print(f'TRAINING MODEL {params[1].name}: {i}/{len(train_info)}')
        #Training model
        print('LOW')
        if params[0] == 'retrain':
            model_low = torch.load(os.path.join(path,d.name, d.name +'_low'))
        else:
            model_low = params[0]
        
        low_train = params[1].low_train.to(device)
        
        retrain_condAE(model_low.to(device),low_train,params[1].low_test.to(device),params[1].name+'_low',os.path.join(path,params[1].name),path, params[-1][1], batch = batch, num_epochs = epochs,loss = loss, lr = lr, mse_threshold = mse_threshold)
        print('HIGH')   
        if params[0] == 'retrain':
            model_high= torch.load(os.path.join(path,d.name, d.name +'_high'))
        else:
            model_high = params[0]
        
            retrain_condAE(model_high.to(device),params[1].high_train.to(device),params[1].high_test.to(device),params[1].name+'_high',os.path.join(path,params[1].name),path,params[-1][2], batch = batch, num_epochs = epochs, loss = loss,lr = lr, mse_threshold = mse_threshold)

        #clear cuda after training each model
    torch.cuda.empty_cache()
        

def retrain_condAE(model, dt_train, dt_test,label,cur_directory,path, mse, mse_threshold = 10, loss = new_loss,num_epochs = 200, lr = 0.001,batch = 100):
    print('retraining')
    size_train = len(dt_train)
    size_test = len(dt_test)
    if size_train !=0 and size_test != 0:

        print(f'TRAINING INFO:')
        print(f'Total Dataset Size: {size_train + size_test}')
        mean = 0
        std = 1

        train_loc =dt_train
        test_loc = dt_test

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

        train = dt_train[:,0:48]
        test = dt_test[:,0:48]
        # train = torch.vstack([train,largest[0:1000]] )
        train=train[torch.randperm(train.size()[0])]
        test=test[torch.randperm(test.size()[0])]
        train_d1_flat = DataLoader(
            TensorDataset(torch.Tensor(train)),
            batch_size=batch,
            shuffle=False
        )

        test_d1_flat = DataLoader(
            TensorDataset(torch.Tensor(test)),
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
        
        for epoch in range(num_epochs):

            losses = []

            for i, data_list in enumerate(train_d1_flat):

                model.train()
                data = data_list[0]
                v_pred = model(data)
                batch_loss = loss(data[:,0:48], v_pred,epoch,mean,std)
                all_train_losses.append(batch_loss.item())
                losses.append(batch_loss.item())
                optimizer.zero_grad()
                batch_loss.backward()
                optimizer.step()


            scheduler.step(batch_loss)

            data_test = test
            model.eval()
            test_pred = model(data_test)
            batch_test = loss(data_test[:,0:48], test_pred,epoch,mean,std)
            all_test_losses.append(batch_test.item())
            running_loss = np.mean(losses)
            runningtest_loss = batch_test.item()

            if epoch % 25 == 0:
                print('Epoch {}, lr {}'.format(
                    epoch, optimizer.param_groups[0]['lr']))
                print(f"Epoch {epoch}: Train {running_loss:.3f}, Test {runningtest_loss:.3f}")
                print(f"MSE NON-NORMALIZED: Train MSE {AE_MSE(v_pred, data)*3.5280**2:.3f}, Test MSE {AE_MSE(test_pred, data_test)*3.5280**2:.3f}")

        model.eval()
    #     AE_Stats.gen_all_stats(model(dt[-size_test:,0:48]).cpu(),dt[-size_test:,0:48].cpu(),dt[-size_test:].cpu())
        print(AE_MSE(test_pred, data_test).item())
        print(mse)
        if AE_MSE(test_pred, data_test).item() <= mse:
            torch.save(model,f'{cur_directory}/{label}')
        else:
            print('mse was not improved, model not saved')
    else:
        print('dataset too small to train')
        torch.save(model,f'{cur_directory}/{label}')
    torch.cuda.empty_cache()
class cond_storage():
    
    def __init__(self,name, low, high,max_dt_size):
        self.name = name
        
        if len(low) < max_dt_size:
            self.low_train = low[0: int(0.8*len(low))]
            self.low_test = low[int(0.8*len(low)):]
        else:
            self.low_train = low[0: int(0.8*max_dt_size)]
            self.low_test = low[int(0.8*max_dt_size):]
        
        if len(high) < max_dt_size:
            self.high_train = low[0: int(0.8*len(high))]
            self.high_test = low[int(0.8*len(high)):]
        else:
            self.high_train = low[0: int(0.8*max_dt_size)]
            self.high_test = low[int(0.8*max_dt_size):]
        
    