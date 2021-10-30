% script to plot Global errors for two tolerance values on the same figure

tol1 = 10^(-2);
[error1, x1] = adapt_step_trapezoidal(10, tol1);

tol2 = 10^(-4);
[error2, x2] = adapt_step_trapezoidal(38, tol2);

figure
plot(x1, error1, '-r')
hold on
plot(x2, error2, '-b')
hold off
title('Global error vs. x_n for trapezoidal method with tol= 1e-2, 1e-4')
xlabel('x_n')
ylabel('error')
legend('tol=10^{-2}', 'tol=10^{-4}')

