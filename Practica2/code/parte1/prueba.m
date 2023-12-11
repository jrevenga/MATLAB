%Tiempo de muestreo
Ts=100e-3;
% Referencia x-y de posicion
x_0 = 0.1;
y_0 = 0.1;
th_0 = -1;

% Ejecutar Simulacion
sim('PositionControl2.slx')

% Mostrar
x=salida_x.signals.values;
y=salida_y.signals.values;
x2=entrada_x.signals.values;
y2=entrada_y.signals.values;

figure;
plot(x,y,x2,y2);
legend('Borroso','Generado')
grid on;
hold on;