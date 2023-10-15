% 1.1 Representar gráficamente 𝑓(𝑘) = 2 + 5𝑘 + 𝑘^2 y su transformada

syms k z; % Define la variable simbólica k
f_k = 2 + 5*k + k.^2; 

graficarFuncionDiscreta(f_k, "f(k)");

F_z = ztrans(f_k, k, z); % Calcula la transformada Z de f(k)

graficarFuncionDiscreta(F_z, "Transformada Z de f(k)");