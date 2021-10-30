# MTL712-Computational-Methods-for-DEs
MATLAB codes for the course MTL712


### Adaptive Step Size Selection  
1. Plot for step size vs x for Euler method:  

Note that the second derivative of y in LTE(Local Truncation error) is approximated using the following:  
<img src="https://render.githubusercontent.com/render/math?math=y_n^{''} = \frac{y_{n+1}^' - y_n^'}{h_n}"> 

   tol = 1e-2    
![alt text](adaptive_step_size_selection/euler_adaptive_size_tol_1e-2.png)

   tol = 1e-4
![alt text](adaptive_step_size_selection/euler_tol_1e-4.png)

2. Plot for Global error vs. x for Euler method:

   tol = 1e-2
![global error euler 1e-2](adaptive_step_size_selection/euler_error_tol_1e-2.png)

   tol = 1e-4
![global error euler 1e-4](adaptive_step_size_selection/euler_error_tol_1e-4.png)

   both the tolerances on the same plot
![global error euler combined](adaptive_step_size_selection/GE_tol_1e-2_1e-4.png)


