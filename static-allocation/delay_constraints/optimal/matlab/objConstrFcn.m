function f = objConstrFcn(x)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Define the objective function

% Weights of the objective function
p = [10,10,10,100; 10,10,10,100;10,10,10,100];
p_aux = repmat(reshape(p', 1, []), 1, 5);

%Objective function
f.Fval = -p_aux*x';

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Define non-linear constraints

% No encontre como pasar estas cosas como argumentos a esta funcion

num_service=3;
num_microservice=4;
num_infraElems = 5;
n = num_service*num_microservice;

%Redefine x as a matrix
x_aux = reshape(x,n,num_infraElems);

%Define the infra delay parameters as the latency between each two infra
%elements
D=[0,1,1,10,1;1,0,1,1,1;1,1,0,1,1;10,1,1,0,1;1,1,1,1,0];

%Define the delay constraints as the delay requirements between each
%microservice within a service
d1=[0,20,20,20;20,0,20,20;20,20,0,20;20,20,20,0];
d2=[0,20,20,20;20,0,20,20;20,20,0,20;20,20,20,0];
d3=[0,20,20,20;20,0,20,20;20,20,0,20;20,20,20,0];

%Create the matrix of constraints
%Use a very high value to complete the matrix (inf does not work)
d=[d1,repmat(100,4,4),repmat(100,4,4);repmat(100,4,4),d2,repmat(100,4,4);repmat(100,4,4),repmat(100,4,4),d3];

%Define the constraint as a vector where each row has to be <0
J = reshape(x_aux*D*x_aux',n*n,1) - reshape(d,n*n,1);
f.Ineq = J;
end