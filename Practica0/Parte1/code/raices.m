function [solucion, reales, complejas] = raices(poli_1, poli_2)
    % Recoge los arrays con los que se crean los polinomios
    p1 = poly2sym(poli_1);
    p2 = poly2sym(poli_2);
    
    % Solicita al usuario a cuál de los polinomios o al producto se aplicará la solución
    fprintf('Elija a cuál de los polinomios o al producto desea aplicar la solución:\n');
    fprintf('1. Polinomio 1\n');
    fprintf('2. Polinomio 2\n');
    fprintf('3. Producto de los polinomios\n');
    
    choice = input('Ingrese el número correspondiente: ');

    switch choice
        case 1
            % Calcular raíces del primer polinomio
            solucion = roots(poli_1);
        case 2
            % Calcular raíces del segundo polinomio
            solucion = roots(poli_2);
        case 3
            % Calcular raíces del producto de los polinomios
            prod_poli = conv(poli_1, poli_2);
            solucion = roots(prod_poli);
        otherwise
            error('Opción no válida. Debe elegir 1, 2 o 3.');
    end

    % Clasificar las raíces
    reales = sum(isreal(solucion));
    complejas = length(solucion) - reales;

    % Representar las raíces en el plano complejo
    figure;
    hold on;
    plot(real(solucion), imag(solucion), 'ro');
    xlabel('Parte Real');
    ylabel('Parte Imaginaria');
    title('Ubicación de las raíces en el plano complejo');
    hold off;
    
end
