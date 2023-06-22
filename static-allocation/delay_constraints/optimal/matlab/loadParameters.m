%Number of services, microservices and servers
num_service=3;
num_microservice=4;
num_infraElems = 5;

% Infra storage capacities
%num_microservice * num_service
ST = [1,2,3,4; 5,6,7,8;9,10,11,12];

% Infra bandwidth capacities
%num_microservice * num_service
BW = [1,2,3,4; 5,6,7,8;9,10,11,12];

% Infra cpu capacities
%num_microservice * num_service
CPU = [1,2,3,4; 5,6,7,8;9,10,11,12];

% Storage, bandwidth and cpu constraints
sigma = [4,4,4,4,4];
beta = [4,4,4,4,4];
kappa = [4,4,4,4,4];

%Create A and b for linear constraints
A = createA(ST,BW,CPU,num_infraElems);
b = createB(sigma,beta,kappa,num_service,num_microservice);

% Parameters for the optimization

%upper and lower bounds
lb = zeros(1,num_service*num_microservice*num_infraElems);
ub = ones(1,num_service*num_microservice*num_infraElems);

% int variables
intcon = 1:num_service*num_microservice*num_infraElems;

numVars = num_service*num_microservice*num_infraElems;

