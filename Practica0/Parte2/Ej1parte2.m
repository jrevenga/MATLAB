% 1.2 Representar gráficamente 𝑓(𝑘) = sen(𝑘) ∙ 𝑒^(-a*k) y su transformada

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
