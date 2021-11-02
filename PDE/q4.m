% Q4: a variation of heat eqn; use centered difference approximation for the v_x term

M = 20;
dx = 1/M;
dt = 0.001;
nu = 1;
r = (nu*dt)/dx^2;

% calculate values at this time level
t = 0.06;
N = t/dt;

a = 2;
z = (-1*a*dt)/(2*dx);

u = zeros(N+1, M+1);

x = 0:dx:1;
% setting the left boundary, 1st column
u(:,1) = 0;
% setting the right boundary, (M+1)-th column
u(:,M+1) = 0;
% setting the t=0 level
u(1,:) = sin(4*pi*x); 

for i=2:N+1
    for j=2:M
        u(i,j) = u(i-1,j)+ z*(u(i-1,j+1) - u(i-1,j-1)) + r*(u(i-1,j+1) -2*u(i-1,j) + u(i-1,j-1));
    end
end

disp(u(N+1,:));

