%Solve system using Gauss-Seidel Method
% 0.625x1-x2+0.5x3= 7.5
%-x1+5x2+2.12x3= -8.68
%0.5x1+2.12x2+3.6x3 = -0.24
%Initial guess: xi = (0 0 0)
clc
clear all

A = [0.625 -1 0.5;
    -1 5 2.12;
    0.5 2.12 3.6];
B = [7.5; -8.68; -0.24];
[m,n] = size(A);

N = 100;

err = 0.001;

x = [0 0 0];
for k = 2: N
for i = 1:n
    s = 0;
    for j = 1:n
        if j ~= i
            s = s + A(i,j)*x(j);
        end
    end
    x(i)= (1/A(i,i))*(B(i)-s);
end

xx(k,:) = x; kk = k;
Err = abs(max(xx(k,:)-xx(k-1,:))); if Err() < err, break; end
end 
disp(['The roots are: [' num2str(x) '], with accuracy: ' num2str(Err) ' , NO Iterations' num2str(kk)]);