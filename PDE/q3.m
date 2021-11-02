% the boundary condition depends on time; hence needs to be calculated inside the time loop

M = 10;
dx = 1/M;
dt = 0.05;
nu = 0.1;
r = (nu*dt)/dx^2;

% calculate values at this time level
t = 0.1;
N = t/dt;
u = zeros(N+1, M+1);

x = 0:dx:1;

% setting the right boundary, (M+1)-th column
u(:,M+1) = 0;
% setting the t=0 level
u(1,:) = 0; 

left_boundary = @(s) sin(4*pi*s);

for i=2:N+1
    % setting the left boundary, 1st column
    u(i,1) = left_boundary((i-1)*dt);
    for j=2:M
        u(i,j) = u(i-1,j) + r*(u(i-1,j+1) -2*u(i-1,j) + u(i-1,j-1));
    end
end

disp(u(N+1,:));

