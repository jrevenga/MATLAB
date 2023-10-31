% Tiempo de muestreo
Ts = 100e-3;

% Número de simulaciones a realizar
num_simulations = 4;

% Inicializa vectores para almacenar los errores
errors = zeros(num_simulations, 1);

for i = 1:num_simulations
    % Genera valores aleatorios para refx y refy
    refx = 10 * rand - 5;
    refy = 10 * rand - 5;

    % Ejecuta Simulación 1 (PositionControl.slx)
    sim('PositionControl.slx');

    % Obtiene las trayectorias
    x = salida_x.signals.values;
    y = salida_y.signals.values;

    % Ejecuta Simulación 2 (PositionControlNet.slx)
    sim('PositionControlNet.slx');

    % Obtiene las trayectorias de la red
    x_net = salida_x_net.signals.values;
    y_net = salida_y_net.signals.values;

    % Asegura que las trayectorias tengan la misma longitud
    min_length = min(length(x), length(x_net));
    x = x(1:min_length);
    y = y(1:min_length);
    x_net = x_net(1:min_length);
    y_net = y_net(1:min_length);

    % Calcula el error entre las trayectorias
    error = sqrt((x - x_net).^2 + (y - y_net).^2);

    % Almacena el error en el vector de errores
    errors(i) = mean(error);

    % Muestra las trayectorias
    figure;
    plot(x, y);
    hold on;
    plot(x_net, y_net);
    hold off;
    grid on;
    title(sprintf('Simulación %d: refx=%.2f, refy=%.2f', i, refx, refy));
    legend('PositionControl', 'PositionControlNet');
end

% Calcula el error promedio de todas las simulaciones
average_error = mean(errors);

% Muestra el error promedio
fprintf('Error promedio entre las trayectorias: %.4f\n', average_error);




