%assignment 3
%eetu härkönen 0488832 
logistics
%git test update fast
function logistics()
%logistic script from the book
f = @(u, t) 0.1*(1 - u/500)*u;
U_0 = 100;  
T = 100;
dt = 30;    %initial dt value 
k = 0;      
[u_1,t_1] = ode_FE(f,U_0,dt,T);     %first u and t values from initial dt
fprintf('Initial dt value = %f, k = %f .\n', dt, k)
condition = true;
while condition == true
    dt_k = 2^(-k)*dt;   %new dt value
    
    [u_2, t_2] = ode_FE(f, U_0, dt_k, T);   %new u and t with new variables
    plot(t_1, u_1, 'b-', t_2, u_2, 'r');    %plot old ut and new ut
    xlabel('t');  ylabel('N(t)');
    value = input('type 1 to continue with new dt value \n'); %loop condition
%     fprintf('value of dt_k = %f, k being %.f. \n', dt_k, k)
    if value == 1   %save u and t values for new round
        u_1 = u_2;
        t_1 = t_2;
%         fprintf('value of dt_k = %f, k being %.f. \n', dt_k, k)
    else
        condition = false;
    end
    k = k + 1;  %refresh k
    fprintf('value of dt_k = %f, k being %.f. \n', dt_k, k)
end
end

function [sol, time] = ode_FE(f, U_0, dt, T)
N_t = floor(T/dt);
u = zeros(N_t+1, 1);
t = linspace(0, N_t*dt, length(u));
u(1) = U_0;
for n = 1:N_t
u(n+1) = u(n) + dt*f(u(n), t(n));
end
sol = u;
time = t;
end

