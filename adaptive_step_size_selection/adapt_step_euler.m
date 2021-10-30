function [h,x] = adapt_step_euler(tol)
% adaptive step size selection

clc;
close all;

% given f(x,y)
f = @(x,y) (1-2*x)*y;

% function for y^(2): will be used in approximating LTE
y2 = @(x,y) ((1-2*x)^2 - 2)*y;

% tol = 10^(-2); % 10^(-2) | 10^(-4)

% when to stop finding h_n?
N = 500;

% initialize h(step sizes) array
h = zeros(1,N);
h(1) = 0.1*tol;

% initialize x array
x = zeros(1,N+1);
x(1) = 0;

y = zeros(1,N+1);
y(1) = 1;

i = 1;

%printf('going inside the loop\n');
while i<= N
    x(i+1) = x(i)+h(i);
    % numr = 1 + 0.5*h(i)*(1 - 2*x(i));
    % denomr = 1 - 0.5*h(i)*(1 - 2*x(i+1));

    y(i+1) = y(i) + h(i)*f(x(i), y(i));
    %printf('y_1: %f\n', y(i+1));

%     approximate LTE at (x_n+1, y_n+1)
    %lte = abs(((h(i)^2)/2) * y2(x(i+1), y(i+1)));
    lte = abs(0.5*h(i)*(f(x(i+1),y(i+1)) - f(x(i), y(i))));
    %printf('lte: %f\n', lte);

    if lte<tol
        i = i+1;
        h(i) = h(i-1)*((tol/lte)^(1/2));
    else 
        h(i) = h(i)*((tol/lte)^(1/2));
        %printf('calculating h_new: %f\n', h(i));
    end
end

%disp(h);
%disp(x);
% plot(x,h,'-')
