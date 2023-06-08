import torch
import torch.nn as nn
import numpy as np
import torch.nn.functional as F

class View(nn.Module):
    def __init__(self, dim,  shape):
        super(View, self).__init__()
        self.dim = dim
        self.shape = shape

    def forward(self, input):
        new_shape = list(input.shape)[:self.dim] + list(self.shape) + list(input.shape)[self.dim+1:]
        return input.view(*new_shape)


def prepInput(normData):
    arrange =  np.array([28,29,30,31,0,4,8,12,
                     24,25,26,27,1,5,9,13,
                         20,21,22,23,2,6,10,14,
                         16,17,18,19,3,7,11,15,
                         47,43,39,35,35,34,33,32,
                         46,42,38,34,39,38,37,36,
                         45,41,37,33,43,42,41,40,
                         44,40,36,32,47,46,45,44])

    arrMask= np.array([1,1,1,1,1,1,1,1,
                       1,1,1,1,1,1,1,1,
                       1,1,1,1,1,1,1,1,
                       1,1,1,1,1,1,1,1,
                       1,1,1,1,0,0,0,0,
                       1,1,1,1,0,0,0,0,
                       1,1,1,1,0,0,0,0,
                       1,1,1,1,0,0,0,0,])

    calQMask=np.array([1,1,1,1,1,1,1,1,
                        1,1,1,1,1,1,1,1,
                        1,1,1,1,1,1,1,1,
                        1,1,1,1,1,1,1,1,
                        1,1,1,1,0,0,0,0,
                        1,1,1,1,0,0,0,0,
                        1,1,1,1,0,0,0,0,
                        1,1,1,1,0,0,0,0,])
    shape = (1,8,8)
    inputdata = normData[:,arrange]

    inputdata[:,arrMask==0]=0  #zeros out repeated entries

    shaped_data = inputdata.reshape(len(inputdata),shape[0],shape[1],shape[2])
    
    return shaped_data
      
class CAE_conv_encoder_cond_arch_CMSSW(nn.Module):
    def __init__(self,latent_dims,device = 'cpu'):
        super(CAE_conv_encoder_cond_arch_CMSSW,self).__init__()
        self.device = device

        self.encoders = nn.Sequential(nn.Linear(73,16).to(self.device),
                                     nn.ReLU().to(self.device))
        
        self.linear_enc = nn.Linear(17,16).to(self.device)
        self.linear_mean = nn.Linear(16,latent_dims).to(self.device)
        self.linear_sig = nn.Linear(16,latent_dims).to(self.device)
        self.conv1 = nn.Conv2d(1, 8, 3,stride = (2,2)).to(self.device)
        self.N       = torch.distributions.Normal(0, 1)
        self.N.loc   = self.N.loc 
        self.N.scale = self.N.scale
        self.kl = 0
        self.i = 0
        self.arrange = np.array([28,29,30,31,0,4,8,12,
                         24,25,26,27,1,5,9,13,
                             20,21,22,23,2,6,10,14,
                             16,17,18,19,3,7,11,15,
                             47,43,39,35,35,34,33,32,
                             46,42,38,34,39,38,37,36,
                             45,41,37,33,43,42,41,40,
                             44,40,36,32,47,46,45,44])
        self.arrMask = np.array([1,1,1,1,1,1,1,1,
                           1,1,1,1,1,1,1,1,
                           1,1,1,1,1,1,1,1,
                           1,1,1,1,1,1,1,1,
                           1,1,1,1,0,0,0,0,
                           1,1,1,1,0,0,0,0,
                           1,1,1,1,0,0,0,0,
                           1,1,1,1,0,0,0,0,])
        self.calQMask=np.array([1,1,1,1,1,1,1,1,
                            1,1,1,1,1,1,1,1,
                            1,1,1,1,1,1,1,1,
                            1,1,1,1,1,1,1,1,
                            1,1,1,1,0,0,0,0,
                            1,1,1,1,0,0,0,0,
                            1,1,1,1,0,0,0,0,
                            1,1,1,1,0,0,0,0,])
        
    def forward(self, x):
        c = torch.unsqueeze(torch.sum(x[:,0:48],dim = 1),dim=1)
        shape = (x.shape[0],1,8,8)
        inputdata = x[:,self.arrange]
        inputdata[:,self.arrMask==0]=0
        shaped_data = torch.reshape(inputdata,shape)
        x = shaped_data
        x = F.relu(self.conv1(x))
        x = torch.flatten(x, start_dim=1)
        x = torch.hstack((x,c))
        for i, enc in enumerate(self.encoders):
            if i == len(self.encoders) - 1:
                x = enc(x)
            else:
                x = enc(x)
        return torch.hstack((x,c))    
class CAE_conv_encoder_cond_arch(nn.Module):
    def __init__(self,latent_dims,device = 'cpu'):
        super(CAE_conv_encoder_arch, self).__init__()
        self.device = device
        self.encoders = nn.Sequential(nn.Linear(73,16).to(self.device),
                                     nn.ReLU().to(self.device))
        
        self.linear_enc = nn.Linear(17,16).to(self.device)
        self.linear_mean = nn.Linear(16,latent_dims).to(self.device)
        self.linear_sig = nn.Linear(16,latent_dims).to(self.device)
        self.conv1 = nn.Conv2d(1, 8, 3,stride = (2,2)).to(self.device)
        self.N       = torch.distributions.Normal(0, 1)
        self.N.loc   = self.N.loc 
        self.N.scale = self.N.scale
        self.kl = 0
        
    def __getstate__(self):
        return self.i
    def __setstate__(self, i):
        self.i = i
        
    def forward(self, x,c):
       
        x = F.relu(self.conv1(x))
        x = torch.flatten(x, start_dim=1)
        x = torch.hstack((x,c))
        for i, enc in enumerate(self.encoders):
            if i == len(self.encoders) - 1:
                x = enc(x)
            else:
                x = enc(x)
        
        return x    

class CAE_conv_encoder_cond_arch_CMSSW(nn.Module):
    def __init__(self,latent_dims,device = 'cpu'):
        super(CAE_conv_encoder_cond_arch_CMSSW,self).__init__()
        self.device = device

        self.encoders = nn.Sequential(nn.Linear(73,16).to(self.device),
                                     nn.ReLU().to(self.device))
        
        self.linear_enc = nn.Linear(17,16).to(self.device)
        self.linear_mean = nn.Linear(16,latent_dims).to(self.device)
        self.linear_sig = nn.Linear(16,latent_dims).to(self.device)
        self.conv1 = nn.Conv2d(1, 8, 3,stride = (2,2)).to(self.device)
        self.N       = torch.distributions.Normal(0, 1)
        self.N.loc   = self.N.loc 
        self.N.scale = self.N.scale
        self.kl = 0
        self.i = 0
        self.arrange = np.array([28,29,30,31,0,4,8,12,
                         24,25,26,27,1,5,9,13,
                             20,21,22,23,2,6,10,14,
                             16,17,18,19,3,7,11,15,
                             47,43,39,35,35,34,33,32,
                             46,42,38,34,39,38,37,36,
                             45,41,37,33,43,42,41,40,
                             44,40,36,32,47,46,45,44])
        self.arrMask = np.array([1,1,1,1,1,1,1,1,
                           1,1,1,1,1,1,1,1,
                           1,1,1,1,1,1,1,1,
                           1,1,1,1,1,1,1,1,
                           1,1,1,1,0,0,0,0,
                           1,1,1,1,0,0,0,0,
                           1,1,1,1,0,0,0,0,
                           1,1,1,1,0,0,0,0,])
        self.calQMask=np.array([1,1,1,1,1,1,1,1,
                            1,1,1,1,1,1,1,1,
                            1,1,1,1,1,1,1,1,
                            1,1,1,1,1,1,1,1,
                            1,1,1,1,0,0,0,0,
                            1,1,1,1,0,0,0,0,
                            1,1,1,1,0,0,0,0,
                            1,1,1,1,0,0,0,0,])
        
    def forward(self, x):
        c = torch.unsqueeze(torch.sum(x[:,0:48],dim = 1),dim=1)
        shape = (x.shape[0],1,8,8)
        inputdata = x[:,self.arrange]
        inputdata[:,self.arrMask==0]=0
        shaped_data = torch.reshape(inputdata,shape)
        x = shaped_data
        x = F.relu(self.conv1(x))
        x = torch.flatten(x, start_dim=1)
        x = torch.hstack((x,c))
        for i, enc in enumerate(self.encoders):
            if i == len(self.encoders) - 1:
                x = enc(x)
            else:
                x = enc(x)
        return torch.hstack((x,c))     
    
class CAE_conv_large_encoder_arch_CMSSW(nn.Module):
    def __init__(self,latent_dims,device = 'cpu'):
        super(CAE_conv_large_encoder_arch_CMSSW,self).__init__()
        self.device = device

        self.encoders = nn.Sequential(nn.Linear(72,48).to(self.device),
                                     nn.ReLU().to(self.device),
                                     nn.Linear(48,16).to(self.device),
                                     nn.ReLU().to(self.device))
        
        self.linear_enc = nn.Linear(17,16).to(self.device)
        self.linear_mean = nn.Linear(16,latent_dims).to(self.device)
        self.linear_sig = nn.Linear(16,latent_dims).to(self.device)
        self.conv1 = nn.Conv2d(1, 8, 3,stride = (2,2)).to(self.device)
        self.N       = torch.distributions.Normal(0, 1)
        self.N.loc   = self.N.loc 
        self.N.scale = self.N.scale
        self.kl = 0
        self.i = 0
        self.arrange = np.array([28,29,30,31,0,4,8,12,
                         24,25,26,27,1,5,9,13,
                             20,21,22,23,2,6,10,14,
                             16,17,18,19,3,7,11,15,
                             47,43,39,35,35,34,33,32,
                             46,42,38,34,39,38,37,36,
                             45,41,37,33,43,42,41,40,
                             44,40,36,32,47,46,45,44])
        self.arrMask = np.array([1,1,1,1,1,1,1,1,
                           1,1,1,1,1,1,1,1,
                           1,1,1,1,1,1,1,1,
                           1,1,1,1,1,1,1,1,
                           1,1,1,1,0,0,0,0,
                           1,1,1,1,0,0,0,0,
                           1,1,1,1,0,0,0,0,
                           1,1,1,1,0,0,0,0,])
        self.calQMask=np.array([1,1,1,1,1,1,1,1,
                            1,1,1,1,1,1,1,1,
                            1,1,1,1,1,1,1,1,
                            1,1,1,1,1,1,1,1,
                            1,1,1,1,0,0,0,0,
                            1,1,1,1,0,0,0,0,
                            1,1,1,1,0,0,0,0,
                            1,1,1,1,0,0,0,0,])
        
    def forward(self, x):
        c = torch.unsqueeze(torch.sum(x[:,0:48],dim = 1),dim=1)
        shape = (x.shape[0],1,8,8)
        inputdata = x[:,self.arrange]
        inputdata[:,self.arrMask==0]=0
        shaped_data = torch.reshape(inputdata,shape)
        x = shaped_data
        x = F.relu(self.conv1(x))
        x = torch.flatten(x, start_dim=1)
        
        for i, enc in enumerate(self.encoders):
            if i == len(self.encoders) - 1:
                x = enc(x)
            else:
                x = enc(x)
        return torch.hstack((x,c)) 
class CAE_conv_large_encoder_arch(nn.Module):
    def __init__(self,latent_dims,device = 'cpu'):
        super(CAE_conv_large_encoder_arch, self).__init__()
        self.device = device
        self.encoders = nn.Sequential(nn.Linear(72,48).to(self.device),
                                     nn.ReLU().to(self.device),
                                     nn.Linear(48,16).to(self.device),
                                     nn.ReLU().to(self.device))
        
        self.linear_enc = nn.Linear(17,16).to(self.device)
        self.linear_mean = nn.Linear(16,latent_dims).to(self.device)
        self.linear_sig = nn.Linear(16,latent_dims).to(self.device)
        self.conv1 = nn.Conv2d(1, 8, 3,stride = (2,2)).to(self.device)
        self.N       = torch.distributions.Normal(0, 1)
        self.N.loc   = self.N.loc 
        self.N.scale = self.N.scale
        self.kl = 0
        
    def __getstate__(self):
        return self.i
    def __setstate__(self, i):
        self.i = i
        
    def forward(self, x,c):
       
        x = F.relu(self.conv1(x))
        x = torch.flatten(x, start_dim=1)
        
        for i, enc in enumerate(self.encoders):
            if i == len(self.encoders) - 1:
                x = enc(x)
            else:
                x = enc(x)
#         x = torch.hstack((x,c))
#         x = F.relu(self.linear_enc(x))
        
        
        return x
    
class CAE_conv_large_encoder_cond1_arch_CMSSW(nn.Module):
    def __init__(self,latent_dims,device = 'cpu'):
        super(CAE_conv_large_encoder_cond1_arch_CMSSW,self).__init__()
        self.device = device

        self.encoders = nn.Sequential(nn.Linear(73,48).to(self.device),
                                     nn.ReLU().to(self.device),
                                     nn.Linear(48,16).to(self.device),
                                     nn.ReLU().to(self.device))
        
        self.linear_enc = nn.Linear(17,16).to(self.device)
        self.linear_mean = nn.Linear(16,latent_dims).to(self.device)
        self.linear_sig = nn.Linear(16,latent_dims).to(self.device)
        self.conv1 = nn.Conv2d(1, 8, 3,stride = (2,2)).to(self.device)
        self.N       = torch.distributions.Normal(0, 1)
        self.N.loc   = self.N.loc 
        self.N.scale = self.N.scale
        self.kl = 0
        self.i = 0
        self.arrange = np.array([28,29,30,31,0,4,8,12,
                         24,25,26,27,1,5,9,13,
                             20,21,22,23,2,6,10,14,
                             16,17,18,19,3,7,11,15,
                             47,43,39,35,35,34,33,32,
                             46,42,38,34,39,38,37,36,
                             45,41,37,33,43,42,41,40,
                             44,40,36,32,47,46,45,44])
        self.arrMask = np.array([1,1,1,1,1,1,1,1,
                           1,1,1,1,1,1,1,1,
                           1,1,1,1,1,1,1,1,
                           1,1,1,1,1,1,1,1,
                           1,1,1,1,0,0,0,0,
                           1,1,1,1,0,0,0,0,
                           1,1,1,1,0,0,0,0,
                           1,1,1,1,0,0,0,0,])
        self.calQMask=np.array([1,1,1,1,1,1,1,1,
                            1,1,1,1,1,1,1,1,
                            1,1,1,1,1,1,1,1,
                            1,1,1,1,1,1,1,1,
                            1,1,1,1,0,0,0,0,
                            1,1,1,1,0,0,0,0,
                            1,1,1,1,0,0,0,0,
                            1,1,1,1,0,0,0,0,])
        
    def forward(self, x):
        c = torch.unsqueeze(torch.sum(x[:,0:48],dim = 1),dim=1)
        shape = (x.shape[0],1,8,8)
        inputdata = x[:,self.arrange]
        inputdata[:,self.arrMask==0]=0
        shaped_data = torch.reshape(inputdata,shape)
        x = shaped_data
        x = F.relu(self.conv1(x))
        x = torch.flatten(x, start_dim=1)
        x = torch.hstack((x,c))
        for i, enc in enumerate(self.encoders):
            if i == len(self.encoders) - 1:
                x = enc(x)
            else:
                x = enc(x)
        return torch.hstack((x,c)) 
class CAE_conv_large_encoder_cond1_arch(nn.Module):
    def __init__(self,latent_dims,device = 'cpu'):
        super(CAE_conv_large_encoder_cond1_arch, self).__init__()
        self.device = device
        self.encoders = nn.Sequential(nn.Linear(73,48).to(self.device),
                                     nn.ReLU().to(self.device),
                                     nn.Linear(48,16).to(self.device),
                                     nn.ReLU().to(self.device))
        
        self.linear_enc = nn.Linear(17,16).to(self.device)
        self.linear_mean = nn.Linear(16,latent_dims).to(self.device)
        self.linear_sig = nn.Linear(16,latent_dims).to(self.device)
        self.conv1 = nn.Conv2d(1, 8, 3,stride = (2,2)).to(self.device)
        self.N       = torch.distributions.Normal(0, 1)
        self.N.loc   = self.N.loc 
        self.N.scale = self.N.scale
        self.kl = 0
        
    def __getstate__(self):
        return self.i
    def __setstate__(self, i):
        self.i = i
        
    def forward(self, x,c):
       
        x = F.relu(self.conv1(x))
        x = torch.flatten(x, start_dim=1)
        x = torch.hstack((x,c))
        for i, enc in enumerate(self.encoders):
            if i == len(self.encoders) - 1:
                x = enc(x)
            else:
                x = enc(x)
#         x = torch.hstack((x,c))
#         x = F.relu(self.linear_enc(x))
        
        
        return x
class CAE_conv_large_encoder_cond2_arch_CMSSW(nn.Module):
    def __init__(self,latent_dims,device = 'cpu'):
        super(CAE_conv_large_encoder_cond2_arch_CMSSW,self).__init__()
        self.device = device

        self.encoder1 = nn.Sequential(nn.Linear(72,48).to(self.device),
                                     nn.ReLU().to(self.device))
        self.encoder2 = nn.Sequential(nn.Linear(49,16).to(self.device),
                                     nn.ReLU().to(self.device))
        
        self.linear_enc = nn.Linear(17,16).to(self.device)
        self.linear_mean = nn.Linear(16,latent_dims).to(self.device)
        self.linear_sig = nn.Linear(16,latent_dims).to(self.device)
        self.conv1 = nn.Conv2d(1, 8, 3,stride = (2,2)).to(self.device)
        self.N       = torch.distributions.Normal(0, 1)
        self.N.loc   = self.N.loc 
        self.N.scale = self.N.scale
        self.kl = 0
        self.i = 0
        self.arrange = np.array([28,29,30,31,0,4,8,12,
                         24,25,26,27,1,5,9,13,
                             20,21,22,23,2,6,10,14,
                             16,17,18,19,3,7,11,15,
                             47,43,39,35,35,34,33,32,
                             46,42,38,34,39,38,37,36,
                             45,41,37,33,43,42,41,40,
                             44,40,36,32,47,46,45,44])
        self.arrMask = np.array([1,1,1,1,1,1,1,1,
                           1,1,1,1,1,1,1,1,
                           1,1,1,1,1,1,1,1,
                           1,1,1,1,1,1,1,1,
                           1,1,1,1,0,0,0,0,
                           1,1,1,1,0,0,0,0,
                           1,1,1,1,0,0,0,0,
                           1,1,1,1,0,0,0,0,])
        self.calQMask=np.array([1,1,1,1,1,1,1,1,
                            1,1,1,1,1,1,1,1,
                            1,1,1,1,1,1,1,1,
                            1,1,1,1,1,1,1,1,
                            1,1,1,1,0,0,0,0,
                            1,1,1,1,0,0,0,0,
                            1,1,1,1,0,0,0,0,
                            1,1,1,1,0,0,0,0,])
        
    def forward(self, x):
        c = torch.unsqueeze(torch.sum(x[:,0:48],dim = 1),dim=1)
        shape = (x.shape[0],1,8,8)
        inputdata = x[:,self.arrange]
        inputdata[:,self.arrMask==0]=0
        shaped_data = torch.reshape(inputdata,shape)
        x = shaped_data
        x = F.relu(self.conv1(x))
        x = torch.flatten(x, start_dim=1)
        for i, enc in enumerate(self.encoder1):
            if i == len(self.encoder1) - 1:
                x = enc(x)
            else:
                x = enc(x)
        x = torch.hstack((x,c))
        for i, enc in enumerate(self.encoder2):
            if i == len(self.encoder2) - 1:
                x = enc(x)
            else:
                x = enc(x)
        return torch.hstack((x,c)) 
class CAE_conv_large_encoder_cond2_arch(nn.Module):
    def __init__(self,latent_dims,device = 'cpu'):
        super(CAE_conv_large_encoder_cond2_arch, self).__init__()
        self.device = device
        self.encoder1 = nn.Sequential(nn.Linear(72,48).to(self.device),
                                     nn.ReLU().to(self.device))
        self.encoder2 = nn.Sequential(nn.Linear(49,16).to(self.device),
                                     nn.ReLU().to(self.device))
        self.linear_enc = nn.Linear(17,16).to(self.device)
        self.linear_mean = nn.Linear(16,latent_dims).to(self.device)
        self.linear_sig = nn.Linear(16,latent_dims).to(self.device)
        self.conv1 = nn.Conv2d(1, 8, 3,stride = (2,2)).to(self.device)
        self.N       = torch.distributions.Normal(0, 1)
        self.N.loc   = self.N.loc 
        self.N.scale = self.N.scale
        self.kl = 0
        
    def __getstate__(self):
        return self.i
    def __setstate__(self, i):
        self.i = i
        
    def forward(self, x,c):
       
        x = F.relu(self.conv1(x))
        x = torch.flatten(x, start_dim=1)
        
        for i, enc in enumerate(self.encoder1):
            if i == len(self.encoder1) - 1:
                x = enc(x)
            else:
                x = enc(x)
        x = torch.hstack((x,c))
        for i, enc in enumerate(self.encoder2):
            if i == len(self.encoder2) - 1:
                x = enc(x)
            else:
                x = enc(x)
#         x = torch.hstack((x,c))
#         x = F.relu(self.linear_enc(x))
        
        
        return x
    
    
class CAE_conv_encoder_arch_CMSSW(nn.Module):
    def __init__(self,latent_dims,device = 'cpu'):
        super(CAE_conv_encoder_arch_CMSSW,self).__init__()
        self.device = device

        self.encoders = nn.Sequential(nn.Linear(72,16).to(self.device),
                                     nn.ReLU().to(self.device))
        
        self.linear_enc = nn.Linear(17,16).to(self.device)
        self.linear_mean = nn.Linear(16,latent_dims).to(self.device)
        self.linear_sig = nn.Linear(16,latent_dims).to(self.device)
        self.conv1 = nn.Conv2d(1, 8, 3,stride = (2,2)).to(self.device)
        self.N       = torch.distributions.Normal(0, 1)
        self.N.loc   = self.N.loc 
        self.N.scale = self.N.scale
        self.kl = 0
        self.i = 0
        self.arrange = np.array([28,29,30,31,0,4,8,12,
                         24,25,26,27,1,5,9,13,
                             20,21,22,23,2,6,10,14,
                             16,17,18,19,3,7,11,15,
                             47,43,39,35,35,34,33,32,
                             46,42,38,34,39,38,37,36,
                             45,41,37,33,43,42,41,40,
                             44,40,36,32,47,46,45,44])
        self.arrMask = np.array([1,1,1,1,1,1,1,1,
                           1,1,1,1,1,1,1,1,
                           1,1,1,1,1,1,1,1,
                           1,1,1,1,1,1,1,1,
                           1,1,1,1,0,0,0,0,
                           1,1,1,1,0,0,0,0,
                           1,1,1,1,0,0,0,0,
                           1,1,1,1,0,0,0,0,])
        self.calQMask=np.array([1,1,1,1,1,1,1,1,
                            1,1,1,1,1,1,1,1,
                            1,1,1,1,1,1,1,1,
                            1,1,1,1,1,1,1,1,
                            1,1,1,1,0,0,0,0,
                            1,1,1,1,0,0,0,0,
                            1,1,1,1,0,0,0,0,
                            1,1,1,1,0,0,0,0,])
        
    def forward(self, x):
        c = torch.unsqueeze(torch.sum(x[:,0:48],dim = 1),dim=1)
        shape = (x.shape[0],1,8,8)
        inputdata = x[:,self.arrange]
        inputdata[:,self.arrMask==0]=0
        shaped_data = torch.reshape(inputdata,shape)
        x = shaped_data
        x = F.relu(self.conv1(x))
        x = torch.flatten(x, start_dim=1)
        
        for i, enc in enumerate(self.encoders):
            if i == len(self.encoders) - 1:
                x = enc(x)
            else:
                x = enc(x)
        x = torch.hstack((x,c))
        x = F.relu(self.linear_enc(x))                        
        return torch.hstack((x,c))

class CAE_conv_encoder_arch(nn.Module):
    def __init__(self,latent_dims,device = 'cpu'):
        super(CAE_conv_encoder_arch, self).__init__()
        self.device = device
        self.encoders = nn.Sequential(nn.Linear(72,16).to(self.device),
                                     nn.ReLU().to(self.device))        
        self.linear_enc = nn.Linear(17,16).to(self.device)
        self.linear_mean = nn.Linear(16,latent_dims).to(self.device)
        self.linear_sig = nn.Linear(16,latent_dims).to(self.device)
        self.conv1 = nn.Conv2d(1, 8, 3,stride = (2,2)).to(self.device)
        self.N       = torch.distributions.Normal(0, 1)
        self.N.loc   = self.N.loc 
        self.N.scale = self.N.scale
        self.kl = 0
        
    def __getstate__(self):
        return self.i
    def __setstate__(self, i):
        self.i = i
        
    def forward(self, x,c):       
        x = F.relu(self.conv1(x))
        x = torch.flatten(x, start_dim=1)        
        for i, enc in enumerate(self.encoders):
            if i == len(self.encoders) - 1:
                x = enc(x)
            else:
                x = enc(x)        
        return x
class CAE_conv_encoder_arch(nn.Module):
    def __init__(self,latent_dims,device = 'cpu'):
        super(CAE_conv_encoder_arch, self).__init__()
        self.device = device
        self.encoders = nn.Sequential(nn.Linear(72,16).to(self.device),
                                     nn.ReLU().to(self.device))
        
        self.linear_enc = nn.Linear(17,16).to(self.device)
        self.linear_mean = nn.Linear(16,latent_dims).to(self.device)
        self.linear_sig = nn.Linear(16,latent_dims).to(self.device)
        self.conv1 = nn.Conv2d(1, 8, 3,stride = (2,2)).to(self.device)
        self.N       = torch.distributions.Normal(0, 1)
        self.N.loc   = self.N.loc 
        self.N.scale = self.N.scale
        self.kl = 0
        
    def __getstate__(self):
        return self.i
    def __setstate__(self, i):
        self.i = i
        
    def forward(self, x,c):
       
        x = F.relu(self.conv1(x))
        x = torch.flatten(x, start_dim=1)
        
        for i, enc in enumerate(self.encoders):
            if i == len(self.encoders) - 1:
                x = enc(x)
            else:
                x = enc(x)
#         x = torch.hstack((x,c))
#         x = F.relu(self.linear_enc(x))
        
        return x

