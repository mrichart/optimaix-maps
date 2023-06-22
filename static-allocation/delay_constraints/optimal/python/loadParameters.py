import numpy as np
from createA import createA
from createB import createB

#Number of services, microservices and servers
num_service=3
num_microservice=4
num_infraElems=5

# Infra storage capacities
#num_microservice * num_service
ST=np.array([[1,2,3,4],[5,6,7,8],[9,10,11,12]])
# Infra bandwidth capacities
#num_microservice * num_service
BW=np.array([[1,2,3,4],[5,6,7,8],[9,10,11,12]])
# Infra cpu capacities
#num_microservice * num_service
CPU=np.array([[1,2,3,4],[5,6,7,8],[9,10,11,12]])
# Storage, bandwidth and cpu constraints
sigma=np.array([[4,4,4,4,4]])
beta=np.array([[4,4,4,4,4]])
kappa=np.array([[4,4,4,4,4]])
#Create A and b for linear constraints
A=createA(ST,BW,CPU,num_infraElems)
b=createB(sigma,beta,kappa,num_service,num_microservice)
# Parameters for the optimization

#upper and lower bounds
lb=np.zeros(1,np.dot(np.dot(num_service,num_microservice),num_infraElems))
ub=np.ones(1,np.dot(np.dot(num_service,num_microservice),num_infraElems))
# int variables
intcon=np.arange(1,np.dot(np.dot(num_service,num_microservice),num_infraElems))
numVars=np.dot(np.dot(num_service,num_microservice),num_infraElems)
