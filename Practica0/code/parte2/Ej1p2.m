%1: Representación en 3D, en función de k y de a
syms k a z; % Define las variables simbólicas k y a
f_k = sin(k) * exp(-a * k); % Define la función

% Crea una malla de valores de k y a
[k_values, a_values] = meshgrid(1:10, 1:10);

% Evalúa la función en la malla de valores
f_values = double(subs(f_k, [k, a], {k_values, a_values}));

% Grafica en 3D
figure;
surf(k_values, a_values, f_values);
title('Gráfica 3D de f(k, a)');
xlabel('k');
ylabel('a');
zlabel('f(k, a)');


F_z = ztrans(f_k, k, z); % Calcula la transformada Z de f(k)

% Evalúa la función en la malla de valores
F_values = double(subs(F_z, [z, a], {k_values, a_values}));

% Grafica en 3D
figure;
surf(k_values, a_values, F_values);
title('Gráfica 3D de f(z, a)');
xlabel('k');
ylabel('a');
zlabel('f(k, a)');

%2: Representación en 2D, con a = -1

f_k = sind(k) * exp(1*k);

% Crear una función anónima que evalúe la expresión simbólica f(k)
f = matlabFunction(f_k);

% Evaluar la función en el rango de índices (vamos a usar 1:10)
valores = f(1:10);

figure;
% Graficar la función discreta utilizando stem
stem(1:10, valores);
title("f(k)");
xlabel('Índices');
ylabel('Valores');

F_z = ztrans(f_k, k, z); % Calcula la transformada Z de f(k)

% Crear una función anónima que evalúe la expresión simbólica F(z)
f = matlabFunction(F_z);

% Evaluar la función en el rango de índices 1:10
valores = f(1:10);

figure;
% Graficar la función discreta utilizando stem
stem(1:10, valores);
title("Transformada Z de f(k)");
xlabel('Índices');
ylabel('Valores');