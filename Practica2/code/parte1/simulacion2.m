% Tiempo de muestreo
Ts = 100e-3;

% Referencia x-y de posicion
x_0 = 0.1;
y_0 = 0;
th_0 = 0;

% Ejecutar simulación
sim('PositionControl2.slx');

% Obtener datos de salida
x=salida_x.signals.values;
y=salida_y.signals.values;
    
% Visualizar la trayectoria y el objeto
figure;
plot(x, y);
grid on;
hold on;
    
title('Simulación');
legend('Trayectoria');
xlabel('Posición X');
ylabel('Posición Y');