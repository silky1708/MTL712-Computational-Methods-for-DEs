% Non homogeneous partial differential eqn
M = 20;
dx = 1/M;
dt = 0.05;
nu = 1;
r = (nu*dt)/dx^2;

% calculate values at this time level
t = 0.06;
N = t/dt;
u = zeros(N+1, M+1);

x = 0:dx:1;
% setting the left boundary, 1st column
u(:,1) = 0;
% setting the right boundary, (M+1)-th column
u(:,M+1) = 0;
% setting the t=0 level
u(1,:) = 0; 

% non-homogeneous part of the PDE
F = @(s,t) sin(2*pi*s)*sin(4*pi*t);

for i=2:N+1
    for j=2:M
        u(i,j) = u(i-1,j) + r*(u(i-1,j+1) -2*u(i-1,j) + u(i-1,j-1)) + F((j-1)*dx, (i-1)*dt);
    end
end

disp(u(N+1,:));

