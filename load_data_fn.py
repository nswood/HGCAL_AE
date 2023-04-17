import torch
import pandas as pd

def load_data(num):
    
    dt = torch.tensor(pd.read_csv('AE_Data/'+ str(1)+'.csv').to_numpy(), dtype = torch.float)
    for i in range(num):
        dt = torch.vstack([dt,torch.tensor(pd.read_csv('AE_Data/'+ str(i+2)+'.csv').to_numpy(), dtype = torch.float)])
    # dt =torch.randperm(dt.size()[0])
    # dt = torch.hstack((dt[:,0:48],dt[:,50:53],dt[:, 54:]))
    mean = dt[:,0:48].mean()
    std = dt[:,0:48].std()
    dt[:,0:48] = (dt[:,0:48]-mean)/std
    dt_loc = dt[torch.randperm(dt.size()[0])]
    dt_loc = torch.hstack((dt_loc[:,0:48],dt_loc[:,-2:]))
    dt=dt[torch.randperm(dt.size()[0])][0:,0:48]

    return dt, dt_loc

def load_data_non_norm(num):
    
    dt = torch.tensor(pd.read_csv('AE_Data/'+ str(1)+'.csv').to_numpy(), dtype = torch.float)
    for i in range(num):
        dt = torch.vstack([dt,torch.tensor(pd.read_csv('AE_Data/'+ str(i+2)+'.csv').to_numpy(), dtype = torch.float)])
    # dt =torch.randperm(dt.size()[0])
    # dt = torch.hstack((dt[:,0:48],dt[:,50:53],dt[:, 54:]))
    mean = dt[:,0:48].mean()
    std = dt[:,0:48].std()
    dt_loc = dt[torch.randperm(dt.size()[0])]
    dt_loc = torch.hstack((dt_loc[:,0:48],dt_loc[:,-2:]))
    dt=dt[torch.randperm(dt.size()[0])][0:,0:48]

    return dt, dt_loc

def load_data_no_filter(num):
    dt = torch.tensor(pd.read_csv('AE_Data/'+ str(1)+'.csv').to_numpy(), dtype = torch.float)
    for i in range(num):
        dt = torch.vstack([dt,torch.tensor(pd.read_csv('AE_Data/'+ str(i+2)+'.csv').to_numpy(), dtype = torch.float)])
    dt=dt[torch.randperm(dt.size()[0])]
    return dt