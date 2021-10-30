%function [] = RK()

f = @(x,y) (x+y)^0.5;
h = 0.2;
a = 0.4;
b = 0.8;
N = (b-a)/h + 1;
y = zeros(1, N);
y(1) = 0.41;
x = a:h:b;

for i=2:N
    k1 = f(x(i-1), y(i-1));
    k2 = f(x(i-1)+0.5*h, y(i-1)+0.5*h*k1);
    k3 = f(x(i-1)+0.5*h, y(i-1)+0.5*h*k2);
    k4 = f(x(i-1)+h, y(i-1)+h*k3);

    y(i) = y(i-1)+ (h/6)*(k1+2*k2+2*k3+k4);

end

fprintf('value at x=0.8, y=%f\n', y(i)); % y(0.8) = 0.8490
disp(y);

