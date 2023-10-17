% Paso 1: Solicitar al usuario el tamaño de la matriz cuadrada
n = input('Indique el tamaño de la matriz: ');
% Paso 2: Generar una matriz aleatoria de tamaño n x n
matriz = rand(n);
% a) Mostrar la matriz generada
disp('Matriz generada:');
disp(matriz);
% b) Obtener una segunda matriz con las columnas impares de la matriz inicial
matriz_impares = matriz(:, 1:2:end);
disp('Segunda matriz con columnas impares:');
disp(matriz_impares);
% c) Obtener y mostrar los elementos de la diagonal de la matriz generada
diagonal = diag(matriz);
disp('Elementos de la diagonal:');
disp(diagonal);
% d) Calcular y graficar el máximo, mínimo, medio y varianza de cada fila
maximos = max(matriz, [], 2);
minimos = min(matriz, [], 2);
medios = mean(matriz, 2);
varianzas = var(matriz, 0, 2);
% Crear un gráfico de barras para los valores calculados
figure;
bar([maximos, minimos, medios, varianzas]);
title('Valores por fila');
xlabel('Número de fila');
ylabel('Valor');
legend('Máximo', 'Mínimo', 'Medio', 'Varianza');