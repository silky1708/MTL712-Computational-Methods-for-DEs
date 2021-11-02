% BTCS- implicit method
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
    % constructing the matrix..
    A = diag((1+2*r)*ones(1,M+1))+diag(-1*r*ones(1,M),1) +diag(-1*r*ones(1,M),-1);
    b = u(i-1,:);
    b = b';
    v = A\b;
    u(i,:) = v';
end

disp(u(N+1,:));


