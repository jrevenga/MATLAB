% Definir el rango de valores para x y y
x = -5:0.1:5;
y = -5:0.1:5;

% Crear una malla de valores para x y y
[X, Y] = meshgrid(x, y);

% Calcular la función z en función de x y y
Z = Y .* sin(pi * X / 10) + 5 * cos((X.^2 + Y.^2) / 8) + cos(X + Y) * cos(3 * X - Y);

figure;

subplot(2, 2, 1);
surf(X, Y, Z);
title('Superficie');
xlabel('Eje X');
ylabel('Eje Y');

subplot(2, 2, 2);
mesh(X, Y, Z);
title('Superficie en Forma de Malla');
xlabel('Eje X');
ylabel('Eje Y');

subplot(2, 2, 3);
contourf(X, Y, Z);
colorbar;
title('Contorno con Barra de Color');
xlabel('Eje X');
ylabel('Eje Y');

% Ajustar tamaño a la pantalla
set(gcf, 'Position', get(0, 'Screensize'));

