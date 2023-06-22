import numpy as np

def createB(sigma, beta, kappa, cant_services, cant_microservices):
#   createB Create vector of constraints
#   receives vector of storage, bandwicth and computing capacity of each
#   server
    
    b=np.concatenate((sigma.T,beta.T,kappa.T,np.ones((cant_services*cant_microservices,1))),0)
    return b
    
if __name__ == '__main__':
    pass
    