N=2;
Ts=100e-3;
E_d_vec=[];
E_theta_vec=[];
V_vec=[];
W_vec=[];
for i=1:N
    refx=10*rand-5;
    refy=10*rand-5;
    sim('PositionControl.slx');
    sim('PositionControlNet.slx');
    % Mostrar
    x=salida_x.signals.values;
    y=salida_y.signals.values;
    x_net=salida_x_net.signals.values;
    y_net=salida_y_net.signals.values;
    figure;
    plot(x,y);
    hold on;
    plot(x_net,y_net);
    hold off;
    grid on;
end