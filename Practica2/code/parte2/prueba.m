% Tiempo de muestreo
Ts = 100e-3;

% Referencia x-y de posicion
x_0 = 0.3;
y_0 = 0.1;
th_0 = 0;

% Referencia x-y de objeto
obsx= 1.5; 
obsy= 2.95;

% Ejecutar simulación
sim('EvitarObstaculo_Trajectory.slx');

% Obtener datos de salida
x=salida_x.signals.values;
y=salida_y.signals.values;
x2=entrada_x.signals.values;
y2=entrada_y.signals.values;
    
% Visualizar la trayectoria y el objeto
figure;
plot(x, y, x2, y2);
grid on;
hold on;
    
% Mostrar obstáculo
plot(obsx, obsy, 'bo', 'MarkerSize', 10, 'MarkerFaceColor', 'b');
    
title('Simulación');
legend('Trayectoria', 'Generado', 'Obstáculo');
xlabel('Posición X');
ylabel('Posición Y');