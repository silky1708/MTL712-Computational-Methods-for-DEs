% find eigen values of the matrix A
A = [-5 -2; 2 -5];

% e is a column vector consisting of eigen values of A
e = eig(A);
disp(e);

% eigen values of B are 10 times the eigen values of A
B = A.*10;
eb = eig(B);

% region of absolute stability defined for RK2 method
R = @(x) 1 + x + (x.^2)/2;

% for i=1:length(e)
%     syms h;
%     S = solve(R(h*e(i))< 1, 'ReturnConditions', true);
%     %for j=1:length(S)
%     %    minm = min(S(j), minm);
%     %end
%     disp(S.conditions);
% end


syms h real positive;
assume(h>0);
assumeAlso(in(h, 'real'));

Re = real(e).*h;
disp(Re);

Com = imag(e).*h;
disp(Com);

F = Re+1i*Com;
disp(F);
V = R(F);
re = real(V);
img = imag(V);

% h_hat = complex(Re, Com);
% disp(h_hat);
S = solve(re.^2 + img.^2 < 1, 'ReturnConditions', true);
% S.h
disp(S.conditions);

% S.conditions returns a cubic polynomial, find its root graphically.
syms z real positive;
solve(z^3 - (20*z^2)/29 + (200*z)/841 - 40/841==0, z)

f = @(z) z.^3 - (20*z.^2)/29 + (200*z)/841 - 40/841;
f(0.392)
x = linspace(-3, 3);
figure
plot(x, f(x), '-r')
hold on
plot(x, 0, 'xb')
hold off
