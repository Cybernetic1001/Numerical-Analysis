% Define the functions
f1 = @(x) x^2 + 2*x - 3;
f2 = @(x) x - 2^(-x);

% Define the tolerances
tol = 1e-5;

% Problem 1
disp("------Bisection Method------")
disp("Problem 1: x^2 + 2x - 3 = 0")
a1 = 0;
b1 = 2;
max_iterations = 100;
[root1, iterations1] = bisection_method(f1, a1, b1, tol, max_iterations);
approximation_error1 = abs(f1(root1));
disp("Approximated root: " + num2str(root1))
disp("Approximation error: " + num2str(approximation_error1))
disp("Number of iterations: " + num2str(iterations1))

% Problem 2
disp("Problem 2: x - 2^(-x) = 0")
a2 = 0;
b2 = 1;
[root2, iterations2] = bisection_method(f2, a2, b2, tol, max_iterations);
approximation_error2 = abs(f2(root2));
disp("Approximated root: " + num2str(root2))
disp("Approximation error: " + num2str(approximation_error2))
disp("Number of iterations: " + num2str(iterations2))
