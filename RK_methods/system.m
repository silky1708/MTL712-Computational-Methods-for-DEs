% Modified euler: system of equations

h = 0.1;
tf = 0.1;
t = 0:h:tf;
N = tf/h + 1; % number of steps

% 2-dim vector u,v
u = zeros(1,N);
v = zeros(1,N);
% initial condition
u(1) = 1;
v(1) = 2;

f1 = @(t,u,v) -1*t*u*v;
f2 = @(t,u,v) -1*u*u; 
for i=2:N
    k1 = [f1(t(i-1),u(i-1),v(i-1)); f2(t(i-1),u(i-1),v(i-1))];
    temp = [u(i-1); v(i-1)]+0.5*h*k1;
    k2 = [f1(t(i-1)+0.5*h, temp(1), temp(2)); f2(t(i-1)+0.5*h, temp(1), temp(2))];
    temp_sum = k1+k2;
    u(i) = u(i-1) + 0.5*h*temp_sum(1);
    v(i) = v(i-1) + 0.5*h*temp_sum(2);
end

disp(u);
disp(v);
