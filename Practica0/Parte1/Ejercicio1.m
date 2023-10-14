% Paso 1: Crear la matriz A y el vector v
A = [1 2; 3 4; 5 6; 7 8];
v = [14; 16; 18; 20];

% Paso 2: Obtener y visualizar la matriz B concatenando A y v
B = [A v]; 

% Paso 3: Obtener y visualizar un vector fila concatenando las filas de B
vector_fila = [B(1,:) B(2,:) B(3,:) B(4,:)]
% Opción 2:
vector_fila = reshape(B', 1, []);

% Paso 4: Obtener y visualizar un vector columna concatenando las columnas de B
vector_columna = [B(:,1); B(:,2); B(:,3)]
% Opción 2:
vector_columna = reshape(B, [], 1);

% Visualizar los resultados
disp('Matriz B:');
disp(B);
disp('Vector fila resultante de concatenar filas de B:');
disp(vector_fila);
disp('Vector columna resultante de concatenar columnas de B:');
disp(vector_columna);