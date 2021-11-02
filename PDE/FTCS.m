% an explicit method to solve IBVP- FTCS
M = 10;
dx = 1/M;
dt = 0.02;
nu = 1/6;
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
u(1,:) = sin(2*pi*x); 

for i=2:N+1
    for j=2:M
        u(i,j) = u(i-1,j)+r*(u(i-1,j+1) -2*u(i-1,j) + u(i-1,j-1));
    end
end

% answer at (N+1)-th time level
disp(u(N+1,:));
