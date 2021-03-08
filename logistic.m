%assignment 3
%eetu härkönen 0488832 Pierupaska1234
test_ode

function logistics()
%logistic script from the book
f = @(u, t) 0.1*(1 - u/500)*u;
U_0 = 100;  
T = 60;

condition = true
while condition == true
    dt_k = 2^(-k)*dt;  
    
    [u, t] = ode_FE(f, U_0, dt_k, T);
    plot(t, u, 'b-');
    xlabel('t');  ylabel('N(t)');
    filestem = strcat('tmp_',num2str(dt_k));

    dt_k = 20;  T = 100;
    [u, t] = ode_FE(f, U_0, dt_k, T);
    plot(t, u, 'b-');
    xlabel('t');  ylabel('N(t)');
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

function test_ode()
    function r= f(u,t)
        r = 0.1*u;
    end
[u,t] = ode_FE(@f,100,0.5,20);
plot(t,u,t,100*exp(0.1*t));

end
