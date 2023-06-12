% Define the system of equations
A = [6.25, -1, 0.5;
    -1, 5, 2.12;
    0.5, 2.12, 3.6];
b = [7.5; -8.68; -0.24];

% Initial guess
x0 = [0; 0; 0];

% Stopping criterion
epsilon = 0.001;

% Initialize variables
x = x0;
tol = Inf;
k = 0;

% Create a table to store the results
table_results = [];

% Perform iterations
while tol >= epsilon
    x_prev = x;
    
    for i = 1:length(x)
        x(i) = (b(i) - A(i, 1:i-1)*x(1:i-1) - A(i, i+1:end)*x_prev(i+1:end)) / A(i, i);
    end
    
    tol = norm(x - x_prev, 2);
    k = k + 1;
    
    % Append results to the table
    table_results = [table_results; k, x', tol];
end

% Display the table
fprintf('k  x1        x2        x3        tol\n');
fprintf('-----------------------------------\n');
for i = 1:size(table_results, 1)
    fprintf('%d  %f  %f  %f  %f\n', table_results(i, :));
end
