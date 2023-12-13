%Tiempo de muestreo
Ts=100e-3;
% Referencia x-y de posicion
x_0 = 0.1;
y_0 = 0.2;
th_0 = 0;

% Ejecutar Simulacion
sim('PositionControl2.slx')

% Mostrar
x=salida_x.signals.values;
y=salida_y.signals.values;

figure;
plot(x,y);
legend('Trayectoria')
grid on;
hold on;