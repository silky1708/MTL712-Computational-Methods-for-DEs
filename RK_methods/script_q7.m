h = 0.01

[error2_h, error4_h] = rk_q7(h);

[error2_2h, error4_2h]= rk_q7(2*h);

rate_of_convg_rk2 = log2(error2_2h/error2_h);
rate_of_convg_rk4 = log2(error4_2h/error4_h); 

fprintf('rate of convergence of RK2: %f\n', rate_of_convg_rk2);
fprintf('rate of convergence of RK4: %f\n', rate_of_convg_rk4);