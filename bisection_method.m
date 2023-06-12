function [root, iterations] = bisection_method(f, a, b, tol, max_iterations)

    % Check if the function has opposite signs at the endpoints
    if sign(f(a)) == sign(f(b))
        error('Function has the same sign at the endpoints. No root in this interval.')
    end

    % Initialize the variables
    iterations = 0;
    root = NaN;
    
    % Perform bisection iterations
    while iterations < max_iterations
        % Compute the midpoint of the interval
        c = (a + b) / 2;
        
        % Check if the root has been found within the tolerance
        if abs(f(c)) < tol
            root = c;
            return;
        end
        
        % Update the interval by narrowing it down
        if sign(f(c)) == sign(f(a))
            a = c;
        else
            b = c;
        end
        
        iterations = iterations + 1; % Increment the iteration counter
    end
    
    % Maximum number of iterations reached without finding the root
    warning('Maximum number of iterations reached. The root may not have been found within the desired tolerance.');
end
