function A = createA(ST, BW, CPU, cant_servers)
%createA Create the A matrix for the optimization solver
%   Given the demand matrices for storage (ST), bandwidth (BW) and
%   computing (CPU) and the number of cloud server elements, returns the A
%   matrix for the linear inequalities.
%   The demand matrices are of the form num_servicesXnum_microservices.
%   The function asumes that all services have the same amount of
%   microservices.

% transfor demand matrices into row vectors
ST_vec = reshape(ST.',1,[]);
BW_vec = reshape(BW.',1,[]);
CPU_vec = reshape(CPU.',1,[]);

cant_services = size(ST,1);
cant_microServices = size(ST,2);
n = cant_services*cant_microServices;

st_aux = zeros (cant_servers, cant_servers*n);
bw_aux = zeros (cant_servers, cant_servers*n);
cpu_aux = zeros (cant_servers, cant_servers*n);

% replicate vectors 
for i = 1:cant_servers
    st_aux (i,:) = [zeros(1,(i-1)*n), ST_vec, zeros(1,(cant_servers-i)*n)];
    bw_aux (i,:) = [zeros(1,(i-1)*n), BW_vec, zeros(1,(cant_servers-i)*n)];
    cpu_aux (i,:) = [zeros(1,(i-1)*n), CPU_vec, zeros(1,(cant_servers-i)*n)];
end

% create aux matrix for repetition constraint
aux = zeros(n, cant_servers*n);
for i = 1:n
    aux_vec = [zeros(1,(i-1)), 1, zeros(1,n-i)];
    aux(i,:) = repmat(aux_vec,1,cant_servers);
end

% create matrix A
A = [st_aux; bw_aux; cpu_aux; aux];
end