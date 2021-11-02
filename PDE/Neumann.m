% Q2: Neumann boundary conditions
% Note that the right boundary is a Neumann boundary.

M = 10;
dx = 1/M;
dt = 0.004;
nu = 1;
r = (nu*dt)/dx^2;

% calculate values at this time level
t = 0.06;
N = t/dt;
u = zeros(N+1, M+1);

x = 0:dx:1;
% setting the left boundary, 1st column
u(:,1) = 0;

% setting the t=0 level
u(1,:) = cos((pi*x)/2);
% u(1,M+1) = u(1,M);  % u(1,M+1) is given exactly

% using 1st order approximation for Neumann boundary: u_0 = u_1, or u_M = u_(M-1)
% using 2nd order approximation gives: u_1 = u_(-1), or u_(M-1) = u_(M+1)
for i=2:N+1
    for j=2:M
        u(i,j) = u(i-1,j)+r*(u(i-1,j+1)-2*u(i-1,j)+u(i-1,j-1));
    end
    % first order approximation
    % u(i,M+1) = u(i,M);

    % second order approximation at the right boundary
    u(i,M+1) = u(i-1,M+1) + 2*r*(u(i-1,M) - u(i-1,M+1));
end

disp(u(N+1,:));

