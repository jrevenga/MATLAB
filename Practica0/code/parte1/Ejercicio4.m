% Inicializar matrices para almacenar los tiempos de procesamiento
tiempo_rango = [];
tiempo_determinante = [];

% Bucle para calcular los tiempos
for n = 1:25
    % Generar una matriz aleatoria de tamaño n x n
    matriz = rand(n, n);
    
    % Calcular el tiempo para el cálculo del rango
    tic;
    rango = rank(matriz);
    tiempo_rango(n) = toc;
    
    % Calcular el tiempo para el cálculo del determinante
    tic;
    determinante = det(matriz);
    tiempo_determinante(n) = toc;
end

% Crear una figura para representar los tiempos
figure;
plot(tiempo_rango);
hold on;
plot(tiempo_determinante);
xlabel('Tamaño de la matriz');
ylabel('Tiempo (segundos)');
title('Tiempo de cálculo del rango y determinante en función del tamaño de la matriz');
legend('Tiempo de cálculo del rango', 'Tiempo de cálculo del determinante');

hold off;
