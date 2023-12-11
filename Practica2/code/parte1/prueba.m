%Tiempo de muestreo
Ts=100e-3;
% Referencia x-y de posicion
x_0 = 0;
y_0 = 0.15;
% Ejecutar Simulacion
sim('PositionControl2.slx')
% Mostrar
x=salida_x.signals.values;
y=salida_y.signals.values;
figure;
plot(x,y);
grid on;
hold on;