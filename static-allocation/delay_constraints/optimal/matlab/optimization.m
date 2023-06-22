% Set nondefault solver options
options = optimoptions("surrogateopt","Display","iter","PlotFcn",[]);

% Call to solver
% x = surrogateopt(fun,lb,ub,intcon,A,B,Aeq,Beq,options)
[sol, objectiveValue] = surrogateopt(@objConstrFcn,zeros(numVars,1),...
    ones(numVars,1),intcon,A,b,[],[],options);

% Clear variables
clearvars options