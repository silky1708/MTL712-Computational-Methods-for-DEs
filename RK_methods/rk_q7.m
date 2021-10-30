function [error2, error4] = rk_q7(h)

f = @(x,y) -1*y*y;
y_exact = @(x) 1/x;

a = 1;
b = 10;

N = (b-a)/h + 1;
x = a:h:b;
y = zeros(1, N);
y(1) = 1;

% RK2
for i=2:N
    k1 = f(x(i-1), y(i-1));
    k2 = f(x(i-1)+0.5*h, y(i-1)+0.5*h*k1);

    y(i) = y(i-1) + h*k2;
end

error2 = abs(y(i)- y_exact(b));

% RK4
for i=2:N
    k1 = f(x(i-1), y(i-1));
    k2 = f(x(i-1)+0.5*h, y(i-1)+0.5*h*k1);
    k3 = f(x(i-1)+0.5*h, y(i-1)+0.5*h*k2);
    k4 = f(x(i-1)+h, y(i-1)+h*k3);

    y(i) = y(i-1)+ (h/6)*(k1+2*k2+2*k3+k4);
end

error4 = abs(y(i)- y_exact(b));

