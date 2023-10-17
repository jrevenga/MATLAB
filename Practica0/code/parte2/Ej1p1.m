% 1.1 Representar gráficamente 𝑓(𝑘) = 2 + 5𝑘 + 𝑘^2 y su transformada

syms k z; % Define las variables simbólicas k y z
f_k = 2 + 5*k + k.^2; 

% Crear una función anónima que evalúe la expresión simbólica f(k)
f = matlabFunction(f_k);

% Evaluar la función en el rango de índices (vamos a usar 1:10)
valores = f(1:10);

figure; % Crea una gráfica nueva

% Graficar la función discreta utilizando stem
stem(1:10, valores);
title("f(k)");
xlabel('Índices');
ylabel('Valores');

F_z = ztrans(f_k, k, z); % Calcula la transformada Z de f(k)

% Crear una función anónima que evalúe la expresión simbólica F(z)
f = matlabFunction(F_z);

% Evaluar la función en el rango de índices (vamos a usar 1:10)
valores = f(1:10);

figure; % Crea una gráfica nueva

% Graficar la función discreta utilizando stem
stem(1:10, valores);
title("Transformada Z de f(k)");
xlabel('Índices');
ylabel('Valores');