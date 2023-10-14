% Función para generar y rellenar una matriz
function Matriz = IntroducirMatriz(Dimensiones)
    if numel(Dimensiones) == 1  % Si solo se proporciona un número, asumimos una matriz cuadrada
        filas = Dimensiones;
        cols = Dimensiones;
    elseif numel(Dimensiones) == 2
        filas = Dimensiones(1);
        cols = Dimensiones(2);
    else
        error('Formato de dimensiones incorrecto. Debe ser [filas cols].');
    end
    
    Matriz = zeros(filas, cols);
    
    for i = 1:filas
        for j = 1:cols
            fprintf('Ingrese el valor de la posición (%d, %d) (deje en blanco para aleatorio): ', i, j);
            valor = input('','s');  % Leer como cadena de caracteres
            
            if isempty(valor) || isempty(strtrim(valor))  % Si el usuario ingresa un valor vacío
                Matriz(i, j) = rand();  % Rellenar con valor aleatorio
            else
                Matriz(i, j) = str2double(valor);  % Convertir entrada a número
            end
        end
    end
end