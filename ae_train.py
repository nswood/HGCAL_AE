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
from losses import new_loss,AE_MSE


def eval_model(model, dt, size_train, size_test):
    
    test_loc = dt[-size_test:]
    # train = torch.vstack([train,largest[0:1000]] )
    train_loc=train_loc[torch.randperm(train_loc.size()[0])]
    test_loc=test_loc[torch.randperm(test_loc.size()[0])]
    train_loc_d1_flat = DataLoader(
        TensorDataset(torch.Tensor(train_loc)),
        batch_size=100,
        shuffle=False
    )

    test_loc_d1_flat = DataLoader(
        TensorDataset(torch.Tensor(test_loc)),
        batch_size=100,
        shuffle=False
    )

    train = dt[0:size_train,0:48]
    test = dt[-size_test:,0:48]
    # train = torch.vstack([train,largest[0:1000]] )
    train=train[torch.randperm(train.size()[0])]
    test=test[torch.randperm(test.size()[0])]
    train_d1_flat = DataLoader(
        TensorDataset(torch.Tensor(train)),
        batch_size=100,
        shuffle=False
    )

    test_d1_flat = DataLoader(
        TensorDataset(torch.Tensor(test)),
        batch_size=100,
        shuffle=False
    )
    #fine-tune autoencoder
    #batch 500
    test = dt[-size_test:,0:48]
    optimizer = optim.Adam(model.parameters(), lr,weight_decay=5e-2)
    scheduler = torch.optim.lr_scheduler.ReduceLROnPlateau(optimizer, 'min',factor = 0.5)
    test = dt[-size_test:,0:48]

    AE_Stats.gen_all_stats(model(dt[-size_test:,0:48]).cpu(),dt[-size_test:,0:48].cpu(),dt[-size_test:].cpu())

def train_model(model, dt, size_train, size_test,label,cur_directory,path, loss = new_loss,num_epochs = 200, lr = 0.001,batch = 100):
    if size_train !=0 and size_test != 0:

        print(f'TRAINING INFO:')
        print(f'Total Dataset Size: {size_train + size_test}')
        mean = 0
        std = 1

        train_loc = dt[0:size_train]
        test_loc = dt[-size_test:]

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

        train = dt[0:size_train,0:48]
        test = dt[-size_test:,0:48]
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
                print(f"Epoch {epoch}: Train {AE_MSE(v_pred, data):.3f}, Test {AE_MSE(test_pred, data_test):.3f}")
                print(f"MSE NON-NORMALIZED: Train MSE {running_loss*3.5280**2:.3f}, Test MSE {runningtest_loss*3.5280**2:.3f}")

        model.eval()
    #     AE_Stats.gen_all_stats(model(dt[-size_test:,0:48]).cpu(),dt[-size_test:,0:48].cpu(),dt[-size_test:].cpu())
        torch.save(model,f'{path}/{label}')
    else:
        print('dataset too small to train')
        torch.save(model,f'{path}/{label}')
        
# Label_dir convention is this :'batch_4_models_tt_bar_norm_mean_0_var_1'
# batch_{number of models}_models_{daSta type}_norm_mean_{0 or nonzero}_var_{var}
def train_models(data,
                 batch = 100,
                 override = True,
                 model_params = [],
                 loss = new_loss,
                 path_1 = 'models/MIP_dt_1_450_250_greater_1',
                 path_2 = 'models/MIP_dt_2_450_250_greater_1',
                 path_3 = 'models/MIP_dt_3_450_250_greater_1',
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
    for d in data:
        dt = d[0]
        params = []
        if override == True: 
            if model_params == []:
                if int(d[1][8]) == 1:
                    mt = torch.load(path_1)
                    if append_ReLU:
                        mt.decoders.add_module('ReLU',nn.ReLU())
                    params.append(mt)
                elif int(d[1][8]) == 2:
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
            params.append(dt)

            #Limiting size of training/testing to limit runtime
            if len(dt) <= max_dt_size:
                params.append(int(0.8*len(dt)))
                params.append(int(0.19*len(dt)))
            else:
                params.append(int(0.8*max_dt_size))
                params.append(int(0.19*max_dt_size))

            params.append(d[1])
            params.append(dir_label)
            train_info.append(params)
        else:
            if not d[1] in trained_models:
                
                if model_params == []:
                    if int(d[1][8]) == 1:
                        params.append(torch.load(path_1))
                    elif int(d[1][8]) == 2:
                        params.append(torch.load(path_2))
                    else:
                        params.append(torch.load(path_3))
                else:
                    params.append(Naive_DAE(model_params))
                
                params.append(dt)
                
                #Limiting size of training/testing to limit runtime
                if len(dt) <= max_dt_size:
                    params.append(int(0.8*len(dt)))
                    params.append(int(0.19*len(dt)))
                else:
                    params.append(int(0.8*max_dt_size))
                    params.append(int(0.19*max_dt_size))
                
                params.append(d[1])
                params.append(dir_label)
                
                train_info.append(params)
        
    for params in train_info:
        print(params)
        print(f'TRAINING MODEL {params[4]}')
        #Training model
        train_model(params[0].to(device),params[1].to(device),params[2],params[3],params[4],params[5],path,batch = batch, num_epochs = epochs, lr = lr)
        #clear cuda after training each model
        torch.cuda.empty_cache()
        
#want to try non-normalized with this thing to see if its better
def train_models_prime(data,batch = 100, model_params = [],max_dt_size = 40000,epochs = 100,lr = 0.001, dir_label = time.strftime("%Y-%m-%d_%H-%M-%S", time.gmtime()), path = '/uscms/home/nswood/nobackup/Notebooks/AE_Dev/models/batched_models'):
    path = os.path.join(path, dir_label)
    if not (os.path.exists(path) and os.path.isdir(path)):
        os.mkdir(path)
    device = 'cuda'
    train_info = []
    for d in data:
        dt = d[0]
        params = []
        if model_params == []:
            if int(d[1][3]) == 1:
                params.append(torch.load('models/dt_1_greater_0_450_250_100_dif_2'))
                
            elif int(d[1][3]) == 2:
                params.append(torch.load('models/dt_2_greater_0_450_250_100_dif_2'))
            else:
                params.append(torch.load('models/dt_3_greater_0_450_250_100_dif_2'))
        else:
            print(f'created model {d[1]} with {model_params}')
            params.append(Naive_DAE(model_params))
        params.append(dt)
        
        #Limiting size of training/testing to limit runtime
        if len(dt) <= max_dt_size:
            params.append(int(0.8*len(dt)))
            params.append(int(0.19*len(dt)))
        else:
            params.append(int(0.8*max_dt_size))
            params.append(int(0.19*max_dt_size))
        
        params.append(d[1])
        params.append(dir_label)
        train_info.append(params)

    for params in train_info:
        print(f'TRAINING MODEL {params[4]}')
        #Training model
        train_model(params[0].to(device),params[1].to(device),params[2],params[3],params[4],params[5],path,batch = batch, num_epochs = epochs, lr = lr)
        #clear cuda after training each model
        torch.cuda.empty_cache()
        
        
'''
Want to be able to take a file full of models and retrain only the ones with MSE 
This will help training spend more time on models only that need the improvement




'''
def retrain_models(data,mse,mse_threshold = 5, batch = 100,override = True, model_params = [],max_dt_size = 40000,epochs = 100,lr = 0.001, dir_label = time.strftime("%Y-%m-%d_%H-%M-%S", time.gmtime()), path = '/uscms/home/nswood/nobackup/Notebooks/AE_Dev/models/batched_models'):
    path = os.path.join(path, dir_label)
    
    if not (os.path.exists(path) and os.path.isdir(path)):
        os.mkdir(path)
    
    trained_models = os.listdir(path)
    mse_to_retrain = []
    device = 'cuda'
    train_info = []
    i = 0
    for d in data:
        dt = d[0]
        cur_mse = mse[i]
        i = i + 1
        params = []
        if cur_mse > mse_threshold:
            mse_to_retrain.append(cur_mse)
            print(f'Model {d[1]} has MSE of {cur_mse} and is being retrained')
            if params == 'retrain':
                params.append(torch.load(os.path.join(path,d[1])))
            elif params == []:
                if int(d[1][8]) == 1:
                    mt = torch.load('models/dt_1_greater_0_450_250_100_dif_2')
                    mt.decoders.add_module('ReLU',nn.ReLU())
                    params.append(mt)
                elif int(d[1][8]) == 2:
                    mt = torch.load('models/dt_2_greater_0_450_250_100_dif_2')
                    mt.decoders.add_module('ReLU',nn.ReLU())
                    params.append(mt)
                else:
                    mt = torch.load('models/dt_3_greater_0_450_250_100_dif_2')
                    mt.decoders.add_module('ReLU',nn.ReLU())
                    params.append(mt)
            else:
                print(f'created model {d[1]} with {model_params}')
                params.append(Naive_DAE(model_params))
               

            params.append(dt)

            #Limiting size of training/testing to limit runtime
            if len(dt) <= max_dt_size:
                params.append(int(0.8*len(dt)))
                params.append(int(0.19*len(dt)))
            else:
                params.append(int(0.8*max_dt_size))
                params.append(int(0.19*max_dt_size))

            params.append(d[1])
            params.append(dir_label)
            train_info.append(params)
            
    i = 0
    for params in train_info:
        cur_mse = mse_to_retrain[i]
        print(f'TRAINING MODEL {params[4]}')
        i=i+1
        #Training mode
        retrain_model(params[0].to(device),
                      cur_mse,
                      params[1].to(device),
                      params[2],
                      params[3],
                      params[4],
                      params[5],
                      path,batch = batch,
                      num_epochs = epochs,
                      lr = lr)
        #clear cuda after training each model
        torch.cuda.empty_cache()



def retrain_models_specified(data,
                             mse,
                             specified,
                             loss = new_loss,
                             batch = 100,
                             override = True,
                             model_params = [],
                             append_ReLU = False,
                             max_dt_size = 40000,
                             epochs = 100,
                             path_1 = 'models/MIP_dt_1_450_250_greater_1',
                             path_2 = 'models/MIP_dt_1_450_250_greater_2',
                             path_3 = 'models/MIP_dt_1_450_250_greater_3',
                             lr = 0.001,
                             dir_label = time.strftime("%Y-%m-%d_%H-%M-%S", time.gmtime()),
                             path = '/uscms/home/nswood/nobackup/Notebooks/AE_Dev/models/batched_models'):
    path = os.path.join(path, dir_label)
    
    if not (os.path.exists(path) and os.path.isdir(path)):
        os.mkdir(path)
    
    
    mse_to_retrain = []
    device = 'cuda'
    train_info = []
    i = 0
    for d in data:
        dt = d[0]
        cur_mse = mse[i]
        i = i + 1
        params = []
        if d[1] in specified:
            mse_to_retrain.append(cur_mse)
            print(f'Model {d[1]} is being retrained')
            if model_params == 'retrain':
                params.append(torch.load(os.path.join(path,d[1])))
            elif model_params == []:
                if int(d[1][8]) == 1:
                    mt = torch.load(path_1)
                    if append_ReLU:
                        mt.decoders.add_module('ReLU',nn.ReLU())
                    params.append(mt)
                    
                elif int(d[1][8]) == 2:
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
                print(f'created model {d[1]} with {model_params}')
                params.append(Naive_DAE(model_params))
               

            params.append(dt)

            #Limiting size of training/testing to limit runtime
            if len(dt) <= max_dt_size:
                params.append(int(0.8*len(dt)))
                params.append(int(0.19*len(dt)))
            else:
                params.append(int(0.8*max_dt_size))
                params.append(int(0.19*max_dt_size))

            params.append(d[1])
            params.append(dir_label)
            
            train_info.append(params)
            
    i = 0
    for params in train_info:
        cur_mse = mse_to_retrain[i]
        print(f'TRAINING MODEL {params[4]}')
        i=i+1
        #Training mode
        retrain_model(params[0].to(device),
                      cur_mse,
                      params[1].to(device),
                      params[2],
                      params[3],
                      params[4],
                      params[5],
                      path,batch = batch,
                      num_epochs = epochs,
                      loss = loss,
                      lr = lr)
        #clear cuda after training each model
        torch.cuda.empty_cache()
        

def retrain_model(model, mse,dt, size_train, size_test,label,cur_directory,path, loss = new_loss, num_epochs = 200, lr = 0.001,batch = 100):
    print(f'TRAINING INFO:')
    print(f'Total Dataset Size: {size_train + size_test}')
    mean = 0
    std = 1
    train_loc = dt[0:size_train]
    test_loc = dt[-size_test:]
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

    train = dt[0:size_train,0:48]
    test = dt[-size_test:,0:48]
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

            
            batch_loss = torch.mean(telescopeMSE2(data[:,0:48], v_pred))
            all_train_losses.append(batch_loss.item())
            losses.append(batch_loss.item())
            optimizer.zero_grad()
            batch_loss.backward()
            optimizer.step()
            
            
        scheduler.step(batch_loss)
        
        data_test = test
        model.eval()
        test_pred = model(data_test)
        batch_test = torch.mean(telescopeMSE2(data_test[:,0:48], test_pred))
        all_test_losses.append(batch_test.item())
        running_loss = np.mean(losses)
        runningtest_loss = batch_test.item()
        if epoch % 25 == 0:
            print('Epoch {}, lr {}'.format(
                epoch, optimizer.param_groups[0]['lr']))
            print(f"Epoch {epoch}: Train {AE_MSE(v_pred, data):.3f}, Test {AE_MSE(test_pred, data_test):.3f}")
            print(f"MSE NON-NORMALIZED: Train MSE {running_loss*3.5280**2:.3f}, Test MSE {runningtest_loss*3.5280**2:.3f}")

    model.eval()
#     AE_Stats.gen_all_stats(model(dt[-size_test:,0:48]).cpu(),dt[-size_test:,0:48].cpu(),dt[-size_test:].cpu())
    if AE_MSE(test_pred, data_test)*3.5280**2 < mse:
        torch.save(model,f'{path}/{label}')
    else:
        print(f'MSE of {AE_MSE(test_pred, data_test)*3.5280**2} was larger than initial of {mse} and was not saved')

        
        
def train_model_telescope(model, dt, size_train, size_test,label,cur_directory,path,num_epochs = 200, lr = 0.001,batch = 100):
    print(f'TRAINING INFO:')
    print(f'Total Dataset Size: {size_train + size_test}')
    mean = 0
    std = 1
    train_loc = dt[0:size_train]
    test_loc = dt[-size_test:]
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

    train = dt[0:size_train,0:48]
    test = dt[-size_test:,0:48]
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

            
            batch_loss = torch.mean(telescopeMSE2(data[:,0:48].cpu(), v_pred.cpu()))
            all_train_losses.append(batch_loss.item())
            losses.append(batch_loss.item())
            optimizer.zero_grad()
            batch_loss.backward()
            optimizer.step()
            
            
        scheduler.step(batch_loss)
        
        data_test = test
        model.eval()
        test_pred = model(data_test)
        batch_test = torch.mean(telescopeMSE2(data_test[:,0:48].cpu(), test_pred.cpu()))
        all_test_losses.append(batch_test.item())
        running_loss = np.mean(losses)
        runningtest_loss = batch_test.item()
        if epoch % 25 == 0:
            print('Epoch {}, lr {}'.format(
                epoch, optimizer.param_groups[0]['lr']))
            print(f"Epoch {epoch}: Train {AE_MSE(v_pred, data):.3f}, Test {AE_MSE(test_pred, data_test):.3f}")
            print(f"MSE NON-NORMALIZED: Train MSE {running_loss*3.5280**2:.3f}, Test MSE {runningtest_loss*3.5280**2:.3f}")

    model.eval()
#     AE_Stats.gen_all_stats(model(dt[-size_test:,0:48]).cpu(),dt[-size_test:,0:48].cpu(),dt[-size_test:].cpu())
    torch.save(model,f'{path}/{label}')

# Label_dir convention is this :'batch_4_models_tt_bar_norm_mean_0_var_1'
# batch_{number of models}_models_{data type}_norm_mean_{0 or nonzero}_var_{var}
def train_models_telescope(data,
                 batch_size = 100,
                 override = True,
                 model_params = [],
                 path_1 = 'models/MIP_dt_1_450_250_greater_1',
                 path_2 = 'models/MIP_dt_1_450_250_greater_2',
                 path_3 = 'models/MIP_dt_1_450_250_greater_3',
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
    for d in data:
        dt = d[0]
        params = []
        if override == True: 
            if model_params == []:
                if int(d[1][8]) == 1:
                    mt = torch.load(path_1)
                    if append_ReLU:
                        mt.decoders.add_module('ReLU',nn.ReLU())
                    params.append(mt)
                elif int(d[1][8]) == 2:
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
            params.append(dt)

            #Limiting size of training/testing to limit runtime
            if len(dt) <= max_dt_size:
                params.append(int(0.8*len(dt)))
                params.append(int(0.19*len(dt)))
            else:
                params.append(int(0.8*max_dt_size))
                params.append(int(0.19*max_dt_size))

            params.append(d[1])
            params.append(dir_label)
            train_info.append(params)
        else:
            if not d[1] in trained_models:
                if model_params == []:
                    if int(d[1][8]) == 1:
                        params.append(torch.load('models/dt_1_greater_0_450_250_100_dif_2_tele'))
                    elif int(d[1][8]) == 2:
                        params.append(torch.load('models/dt_2_greater_0_450_250_100_dif_2_tele'))
                    else:
                        params.append(torch.load('models/dt_3_greater_0_450_250_100_dif_2_tele'))
                else:
                    
                    params.append(Naive_DAE(model_params))
                params.append(dt)

                #Limiting size of training/testing to limit runtime
                if len(dt) <= max_dt_size:
                    params.append(int(0.8*len(dt)))
                    params.append(int(0.19*len(dt)))
                else:
                    params.append(int(0.8*max_dt_size))
                    params.append(int(0.19*max_dt_size))

                params.append(d[1])
                params.append(dir_label)
                train_info.append(params)

    for params in train_info:
        print(f'TRAINING MODEL {params[4]}')
        #Training model
        train_model(params[0].to(device),params[1].to(device),params[2],params[3],params[4],params[5],path,batch = batch_size, num_epochs = epochs, lr = lr)
        #clear cuda after training each model
        torch.cuda.empty_cache()
        
def retrain_models_telescope(data,mse,mse_threshold = 5, batch = 100,override = True, model_params = [],max_dt_size = 40000,epochs = 100,lr = 0.001, dir_label = time.strftime("%Y-%m-%d_%H-%M-%S", time.gmtime()), path = '/uscms/home/nswood/nobackup/Notebooks/AE_Dev/models/batched_models'):
    path = os.path.join(path, dir_label)
    
    if not (os.path.exists(path) and os.path.isdir(path)):
        os.mkdir(path)
    
    trained_models = os.listdir(path)
    mse_to_retrain = []
    device = 'cuda'
    train_info = []
    i = 0
    for d in data:
        dt = d[0]
        cur_mse = mse[i]
        i = i + 1
        params = []
        if cur_mse > mse_threshold:
            mse_to_retrain.append(cur_mse)
            print(f'Model {d[1]} has Telescope of {cur_mse} and is being retrained')
            if params == 'retrain':
                params.append(torch.load(os.path.join(path,d[1])))
            elif params == []:
                if int(d[1][8]) == 1:
                    print('models/high_layer_tele')
                    mt = torch.load('models/dt_1_greater_0_450_250_100_dif_2_tele')
#                     mt.decoders.add_module('ReLU',nn.ReLU())
                    params.append(mt)
                elif int(d[1][8]) == 2:
                    mt = torch.load('models/dt_2_greater_0_450_250_100_dif_2_tele')
#                     mt.decoders.add_module('ReLU',nn.ReLU())
                    params.append(mt)
                else:
                    mt = torch.load('models/dt_3_greater_0_450_250_100_dif_2_tele')
#                     mt.decoders.add_module('ReLU',nn.ReLU())
                    params.append(mt)
            else:
                print(f'created model {d[1]} with {model_params}')
                params.append(Naive_DAE(model_params))
               

            params.append(dt)

                #Limiting size of training/testing to limit runtime
            if len(dt) <= max_dt_size:
                params.append(int(0.8*len(dt)))
                params.append(int(0.19*len(dt)))
            else:
                params.append(int(0.8*max_dt_size))
                params.append(int(0.19*max_dt_size))

            params.append(d[1])
            params.append(dir_label)
            train_info.append(params)
            
    i = 0
    for params in train_info:
        cur_mse = mse_to_retrain[i]
        print(f'TRAINING MODEL {params[4]}')
        i=i+1
        #Training mode
        retrain_model_telescope(params[0].to(device),
                      cur_mse,
                      params[1].to(device),
                      params[2],
                      params[3],
                      params[4],
                      params[5],
                      path,batch = batch,
                      num_epochs = epochs,
                      lr = lr)
        #clear cuda after training each model
        torch.cuda.empty_cache()

def retrain_model_telescope(model, mse,dt, size_train, size_test,label,cur_directory,path,num_epochs = 200, lr = 0.001,batch = 100):
    print(f'TRAINING INFO:')
    print(f'Total Dataset Size: {size_train + size_test}')
    mean = 0
    std = 1
    train_loc = dt[0:size_train]
    test_loc = dt[-size_test:]
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

    train = dt[0:size_train,0:48]
    test = dt[-size_test:,0:48]
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

            
            batch_loss = torch.mean(telescopeMSE2(data[:,0:48].cpu(), v_pred.cpu()))
            all_train_losses.append(batch_loss.item())
            losses.append(batch_loss.item())
            optimizer.zero_grad()
            batch_loss.backward()
            optimizer.step()
            
            
        scheduler.step(batch_loss)
        
        data_test = test
        model.eval()
        test_pred = model(data_test)
        batch_test = torch.mean(telescopeMSE2(data_test[:,0:48].cpu(), test_pred.cpu()))
        all_test_losses.append(batch_test.item())
        running_loss = np.mean(losses)
        runningtest_loss = batch_test.item()
        if epoch % 25 == 0:
            print('Epoch {}, lr {}'.format(
                epoch, optimizer.param_groups[0]['lr']))
            print(f"Epoch {epoch}: Train {AE_MSE(v_pred, data):.3f}, Test {AE_MSE(test_pred, data_test):.3f}")
            print(f"MSE NON-NORMALIZED: Train MSE {running_loss*3.5280**2:.3f}, Test MSE {runningtest_loss*3.5280**2:.3f}")

    model.eval()
#     AE_Stats.gen_all_stats(model(dt[-size_test:,0:48]).cpu(),dt[-size_test:,0:48].cpu(),dt[-size_test:].cpu())
    if running_loss*3.5280**2 < mse:
        torch.save(model,f'{path}/{label}')
    else:
        print(f'Telescope of {running_loss*3.5280**2} was larger than initial of {mse} and was not saved')