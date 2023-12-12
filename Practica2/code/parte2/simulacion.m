% Tiempo de muestreo
Ts = 100e-3;

% Referencia x-y de posición aleatoria
refx = 5;
refy = 5;

obsx= 2.5; 
obsy= 2.5;

% Ejecutar simulación
sim('EvitarObstaculo.slx');

% Obtener datos de salida
x = salida_x.signals.values;
y = salida_y.signals.values;
    
% Visualizar la trayectoria y el objeto
figure;
plot(x, y);
grid on;
hold on;
    
% Mostrar referencia
plot(refx, refy, 'ro', 'MarkerSize', 10, 'MarkerFaceColor', 'r');
    
% Mostrar obstáculo
plot(obsx, obsy, 'bo', 'MarkerSize', 10, 'MarkerFaceColor', 'b');
    
title('Simulación');
legend('Trayectoria', 'Referencia', 'Obstáculo');
xlabel('Posición X');
ylabel('Posición Y');