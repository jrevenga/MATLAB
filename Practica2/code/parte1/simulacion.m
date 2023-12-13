% Tiempo de muestreo
Ts = 100e-3;

% Número de simulaciones a realizar
numSimulations = 5;

for i = 1:numSimulations
    % Referencia x-y de posición aleatoria
    refx = 15 * rand - 5;
    refy = 15 * rand - 5;

    % Ejecutar simulación
    sim('PositionControl.slx');

    % Obtener datos de salida
    x = salida_x.signals.values;
    y = salida_y.signals.values;

    % Visualizar la trayectoria
    figure;
    plot(x, y);
    grid on;
    hold on;

    % Mostrar referencia
    plot(refx, refy, 'ro', 'MarkerSize', 10, 'MarkerFaceColor', 'r');
    title(['Simulación ', num2str(i)]);
    legend('Trayectoria', 'Referencia');
    xlabel('Posición X');
    ylabel('Posición Y');

    % Pausa para visualizar antes de pasar a la siguiente simulación
    pause(1);
end