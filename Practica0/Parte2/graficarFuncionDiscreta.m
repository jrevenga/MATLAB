function graficarFuncionDiscreta(funcion_simbolica, titulo)
    % función_simbolica: Expresión simbólica de la función discreta

    % Crear una función anónima que evalúe la expresión simbólica
    f = matlabFunction(funcion_simbolica);

    % Evaluar la función en el rango de índices (vamos a usar 1:10)
    valores = f(1:10);

    figure; % Crea una figura nueva

    % Graficar la función discreta utilizando stem
    stem(1:10, valores);
    title(titulo);
    xlabel('Índices');
    ylabel('Valores');
end
