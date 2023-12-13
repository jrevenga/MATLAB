% Tiempo de muestreo
Ts = 100e-3;

% Referencia x-y de posicion
x_0 = 0.3;
y_0 = 0;
th_0 = 0;

% Referencia x-y de objeto
obsx= 1.5; 
obsy= 1.956;

% Ejecutar simulación
sim('EvitarObstaculo_Trajectory.slx');

% Obtener datos de salida
x=salida_x.signals.values;
y=salida_y.signals.values;
    
% Visualizar la trayectoria y el objeto
figure;
plot(x, y);
grid on;
hold on;
    
% Mostrar obstáculo
plot(obsx, obsy, 'bo', 'MarkerSize', 10, 'MarkerFaceColor', 'b');
    
title('Simulación');
legend('Trayectoria', 'Obstáculo');
xlabel('Posición X');
ylabel('Posición Y');