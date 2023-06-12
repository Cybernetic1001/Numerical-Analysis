% Fixed-Point Iteration Method
format long

% Function f(x) = x^3 - x - 1
f = @(x) x^3 - x - 1;

% First representation g(x) = x^3-1
g1 = @(x) x^3-1;

% Second representation g(x) = (x + 1)^(1/3)
g2 = @(x) (x + 1)^(1/3);

% Initial guess
p0 = 1;

% Tolerance
tol = 1e-2;

% Maximum number of iterations
maxIterations = 10;

% Initialize variables
p1 = p0;
p2 = p0;
k1 = 0;
k2 = 0;

% Fixed-Point Iteration
fprintf('Iterations for g1(x) = x^3-1:\n');
for i = 1:maxIterations
    p1_prev = p1;
    p1 = g1(p1);
    k1 = abs((p1 - p1_prev) / (g1(p1) - g1(p1_prev))); % calculated as the abs value of the ratio of difference between 2 points
    fprintf('Iteration %d: p1 = %.10f\n', i, p1);
    
    if abs(f(p1)) < tol
        fprintf('Approximate solution found using g1(x) = x^3-1: %.10f\n', p1);
        fprintf('Convergence factor k1: %.10f\n', k1);
        break;
    end
end

fprintf('\nIterations for g2(x) = (x + 1)^(1/3):\n');
for i = 1:maxIterations
    p2_prev = p2;
    p2 = g2(p2);
    k2 = abs((p2 - p2_prev) / (g2(p2) - g2(p2_prev)));
    fprintf('Iteration %d: p2 = %.10f\n', i, p2);
    
    if abs(f(p2)) < tol
        fprintf('Approximate solution found using g2(x) = (x + 1)^(1/3): %.10f\n', p2);
        fprintf('Convergence factor k2: %.10f\n', k2);
        break;
    end
end

if i == maxIterations
    fprintf('Maximum number of iterations reached. No solution found.\n');
end
