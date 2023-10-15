% Paso 1: Solicitar las dimensiones de las matrices al usuario
dimensiones_A = input('Introduce las dimensiones de la matriz A en formato [filas cols]: ');
dimensiones_B = input('Introduce las dimensiones de la matriz B en formato [filas cols]: ');

% Paso 2: Generar las matrices A y B
A = IntroducirMatriz(dimensiones_A);
B = IntroducirMatriz(dimensiones_B);

% Paso 4: Realizar los cálculos y mostrar los resultados
disp('Matriz A:');
disp(A);
disp('Matriz B:');
disp(B);
disp('Transpuesta de A:');
disp(A');
disp('Transpuesta de B:');
disp(B');

if isequal(size(A), size(B)) && size(A,1) == size(A,2)
    disp('Determinante de A: ');
    disp(det(A));
else
    disp('A no es una matriz cuadrada, no se puede calcular el determinante.');
end

if isequal(size(B), size(A)) && size(B,1) == size(B,2)
    disp('Determinante de B: ');
    disp(det(B));
else
    disp('B no es una matriz cuadrada, no se puede calcular el determinante.');
end

disp(['Rango de A: ' num2str(rank(A))]);
disp(['Rango de B: ' num2str(rank(B))]);

disp('Producto matricial A*B:');
if size(A,2) == size(B,1)
    disp(A * B);
else
    disp('No se puede calcular el producto matricial A*B debido a dimensiones incompatibles.');
end

disp('Producto elemento a elemento A.*B:');
if isequal(size(A), size(B))
    disp(A .* B);
else
    disp('No se puede calcular el producto elemento a elemento A.*B debido a dimensiones incompatibles.');
end

vector_fila = [A(1, :), B(1, :)];
disp('Vector fila obtenido concatenando la primera fila de A y B:');
disp(vector_fila);

vector_columna = [A(:, 1); B(:, 1)];
disp('Vector columna obtenido concatenando la primera columna de A y B:');
disp(vector_columna);