% function [error,x] = adapt_step_euler(tol)
% adaptive step size selection

clc;
close all;

% given f(x,y)
f = @(x,y) (1-2*x)*y;

% true solution: will be used in finding error at each time step
y_exact = @(x) exp(x - x.^2);

% function for y^(2): will NOT be used in approximating LTE
% y2 = @(x,y) ((1-2*x)^2 - 2)*y;

tol = 10^(-4); % 10^(-2) | 10^(-4)

% when to stop finding h_n?
N = 200;

% initialize h(step sizes) array
h = zeros(1,N);
h(1) = 0.1*tol;

% initialize x array
x = zeros(1,N+1);
x(1) = 0;

y = zeros(1,N+1);
y(1) = 1;

i = 1;

%fprintf('going inside the loop\n');
while i<= N
    x(i+1) = x(i)+h(i);
    % numr = 1 + 0.5*h(i)*(1 - 2*x(i));
    % denomr = 1 - 0.5*h(i)*(1 - 2*x(i+1));

    y(i+1) = y(i) + h(i)*f(x(i), y(i));
    %fprintf('y_1: %f\n', y(i+1));

%     approximate LTE at (x_n+1, y_n+1) = 0.5*h*(x'(t_n + h_n) - x'(t_n))
    %lte = abs(((h(i)^2)/2) * y2(x(i+1), y(i+1)));
    lte = abs(0.5*h(i)*(f(x(i+1),y(i+1)) - f(x(i), y(i))));
    %fprintf('lte: %f\n', lte);

    if lte<tol
        i = i+1;
        h(i) = h(i-1)*((tol/lte)^(1/2));
    else 
        h(i) = h(i)*((tol/lte)^(1/2));
        %fprintf('calculating h_new: %f\n', h(i));
    end
end

% finding out the global error
y_exact_values = y_exact(x);
error = y_exact_values-y;

%disp(h);
%disp(x);

figure
%plot(x,h,'-r')
%title('step size vs. x_n for Euler method with adaptive step size selection, tol=1e-4')
%ylabel('step size, h_n')
%xlabel('x_n')

plot(x, error, '-b')
title('Global error vs. x_n for euler method with adaptive step size selection, tol=10^{-4}')
ylabel('error, |y(x_n)-y_n|')
xlabel('x_n')