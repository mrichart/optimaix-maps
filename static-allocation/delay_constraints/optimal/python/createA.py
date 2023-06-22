import numpy as np
import numpy.matlib

def createA(ST, BW, CPU, cant_servers):

#   createA Create the A matrix for the optimization solver
#   Given the demand matrices for storage (ST), bandwidth (BW) and
#   computing (CPU) and the number of cloud server elements, returns the A
#   matrix for the linear inequalities.
#   The demand matrices are of the form num_servicesXnum_microservices.
#   The function asumes that all services have the same amount of
#   microservices.
    
    # transfor demand matrices into row vectors
    ST_vec=np.reshape(ST.T,(1,-1))
    BW_vec=np.reshape(BW.T,(1,-1))
    CPU_vec=np.reshape(CPU.T,(1,-1))

    cant_services=np.size(ST,0)
    cant_microServices=np.size(ST,1)
    n=cant_services*cant_microServices

    st_aux=np.zeros((cant_servers,cant_servers*n))
    bw_aux=np.zeros((cant_servers,cant_servers*n))
    cpu_aux=np.zeros((cant_servers,cant_servers*n))

    # replicate vectors
    for i in range(1,cant_servers):
        st_aux[i,:]=np.concatenate((np.zeros((1,(i-1)*n)),ST_vec,np.zeros((1,(cant_servers-i)*n))),1)
        bw_aux[i,:]=np.concatenate((np.zeros((1,(i-1)*n)),BW_vec,np.zeros((1,(cant_servers-i)*n))),1)
        cpu_aux[i,:]=np.concatenate((np.zeros((1,(i-1)*n)),CPU_vec,np.zeros((1,(cant_servers-i)*n))),1)
    
    # create aux matrix for repetition constraint
    aux=np.zeros((n,cant_servers*n))
    for i in range(1,n):
        aux_vec=np.concatenate((np.zeros((1,i-1)),[[1]],np.zeros((1,n-i))),1)
        aux[i,:]=np.matlib.repmat(aux_vec,1,cant_servers)
    
    # create matrix A
    A=np.concatenate(([st_aux],[bw_aux],[cpu_aux],[aux]),1)
    return A
    
if __name__ == '__main__':
    pass
    