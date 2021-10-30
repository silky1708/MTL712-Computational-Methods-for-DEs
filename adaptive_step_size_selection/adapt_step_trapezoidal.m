function [error,x] = adapt_step_trapezoidal(N, tol)
% adaptive step size selection

clc;
close all;

%oldprecision = digits(64);
% given f(x,y)
f = @(x,y) (1-2*x)*y;

% true solution: will be used in finding error at each time step
y_exact = @(x) exp(x - x.^2);

%tol = 10^(-4); % 10^(-2) | 10^(-4)

% when to stop finding h_n?
% N = 38;

% initialize h(step sizes) array
h = zeros(1,N);
h(1) = 0.1*tol;

% initialize x array
x = zeros(1,N+1);
x(1) = 0;

y = zeros(1,N+1);
y(1) = 1;

i = 1;

%fprintf('going inside the loop...\n');
while i<= N
    x(i+1) = x(i)+h(i);

    %fprintf('i=%d, h(i)=%f \n', i, h(i));
    numr = 1 + 0.5*h(i)*(1 - 2*x(i));
    denomr = 1 - 0.5*h(i)*(1 - 2*x(i+1));

    y(i+1) = y(i)*(numr/denomr);

%   approximate LTE for trapezoidal at (x_n+1, y_n+1)
    if i == 1
        left = f(x(i)-h(i), y_exact(x(i)-h(i)));
    else
        left = f(x(i-1), y(i-1));
    end

    middle = f(x(i), y(i));
    right = f(x(i+1), y(i+1));
    lte = abs((h(i)/12)*(left+right-2*middle));

    %fprintf('lte: %f\n', lte);
    if lte<=tol
        i = i+1;
        h(i) = h(i-1)*((tol/lte)^(1/3));
    else 
        h(i) = h(i)*((tol/lte)^(1/3));
        %fprintf('calculating h_new: %f\n', h(i));
    end
end

% finding out the global error
y_exact_values = y_exact(x);
error = abs(y_exact_values-y);

%fprintf('out of while loop..\n');
%disp(h);
%disp(x);
disp(error);

figure
%plot(x,h,'-r')
%title('step size vs. x_n for trapezoidal method with adaptive step size selection, tol=10^{-2}')
%ylabel('step size, h_n')
%xlabel('x_n')

plot(x, error, '-b')
title('Global error vs. x_n for euler method with adaptive step size selection, tol=10^{-4}')
ylabel('error, |y(x_n)-y_n|')
xlabel('x_n')

%digits(oldprecision);
