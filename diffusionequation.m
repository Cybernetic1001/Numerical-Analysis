T = 1;
J = 10;
D = 0.5;
dx = 0.1;
dt_values = [1/50, 1/100, 1/200];

xcoord = linspace(0, 1, J+1);
vxt_sum = zeros(1, J+1);

% Compute the exact solution and error for different time steps
for dt = dt_values
    Nt = round(T/dt);
    vxt_sum = zeros(1, J+1);

    for k = 1:13
        vxt = 4*(1/((k*pi).^2))*sin(k*pi/2)*sin(k*pi*xcoord)*exp(-D*(k*pi).^2*T);
        vxt_sum = vxt_sum + vxt;
    end
    
    sol_exact = vxt_sum;
    
    % Numerical solution using explicit scheme
    vxt_num = zeros(J+1, 1);
    vxt_num(2:J) = xcoord(2:J);
    
    for n = 1:Nt
        vxt_new = zeros(J+1, 1);
        for j = 2:J
            vxt_new(j) = vxt_num(j) + (dt * D/dx^2) * (vxt_num(j+1) - 2*vxt_num(j) + vxt_num(j-1));
        end
        vxt_num = vxt_new;
    end
    
    % Compute the error
    error = abs(sol_exact - vxt_num);
    
    % Plot the exact and numerical solutions
    figure;
    plot(xcoord, sol_exact, 'b-', 'LineWidth', 2);
    hold on;
    plot(xcoord, vxt_num, 'r--', 'LineWidth', 2);
    hold off;
    xlabel('x');
    ylabel('u');
    title(sprintf('Numerical Solution (dt = %.4f)', dt));
    legend('Exact', 'Numerical');
    grid on;
    
    % Display the error
    fprintf('Error at dt = %.4f: %.6e\n', dt, max(error));
end
