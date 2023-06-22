function b = createB(sigma, beta, kappa, cant_services, cant_microservices)
%createB Create vector of constraints
%   receives vector of storage, bandwicth and computing capacity of each
%   server

b = [sigma'; beta'; kappa'; ones(cant_services*cant_microservices,1)];
end