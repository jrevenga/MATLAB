%% conectar
%***********************

rosshutdown
clear all
close all

rosinit('192.168.110.109')


global steering_wheel_angle;
global vel_lineal_ackerman_kmh;

%% ini_simulador_ACKERMAN
%***********************

%DECLARACIÓN DE SUBSCRIBERS
%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Odometria
sub_odom=rossubscriber('/robot0/odom');
%Laser
%sub_laser = rossubscriber('/robot0/laser_1', rostype.sensor_msgs_LaserScan);
%Sonars

sonar_0 = rossubscriber('/robot0/sonar_0', rostype.sensor_msgs_Range);
sonar_1 = rossubscriber('/robot0/sonar_1', rostype.sensor_msgs_Range);
sonar_2 = rossubscriber('/robot0/sonar_2', rostype.sensor_msgs_Range);
sonar_3 = rossubscriber('/robot0/sonar_3', rostype.sensor_msgs_Range);
sonar_4 = rossubscriber('/robot0/sonar_4', rostype.sensor_msgs_Range);
sonar_5 = rossubscriber('/robot0/sonar_5', rostype.sensor_msgs_Range);
sonar_6 = rossubscriber('/robot0/sonar_6', rostype.sensor_msgs_Range);
sonar_7 = rossubscriber('/robot0/sonar_7', rostype.sensor_msgs_Range);
sonar_8 = rossubscriber('/robot0/sonar_8', rostype.sensor_msgs_Range);
sonar_9 = rossubscriber('/robot0/sonar_9', rostype.sensor_msgs_Range);
sonar_10 = rossubscriber('/robot0/sonar_10', rostype.sensor_msgs_Range);
sonar_11 = rossubscriber('/robot0/sonar_11', rostype.sensor_msgs_Range);


%DECLARACIÓN DE PUBLISHERS
%%%%%%%%%%%%%%%%%%%%%%%%%%
%Velocidad
pub_vel=rospublisher('/robot0/cmd_vel','geometry_msgs/Twist');

%GENERACION DE MENSAJES
%%%%%%%%%%%%%%%%%%%%%%%
msg_vel=rosmessage(pub_vel);


%Definimos la periodicidad del bucle
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
r=robotics.Rate(10);

%Nos aseguramos de recibir un mensaje relacionado con el robot
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
while (strcmp(sub_odom.LatestMessage.ChildFrameId,'robot0')~=1)
     sub_odom.LatestMessage
end

disp('Inicialización ACKERMAN finalizada correctamente');

%% ***********************

training_data=[];

% Recorrido de aparcamiento para obtener datos de entrenamiento.

% Verificación de disponibilidad de mensajes de todos los sensores antes de avanzar
while isempty(sonar_0.LatestMessage) || isempty(sonar_1.LatestMessage) || isempty(sonar_2.LatestMessage) || ...
      isempty(sonar_3.LatestMessage) || isempty(sonar_4.LatestMessage) || isempty(sonar_5.LatestMessage) || ...
      isempty(sonar_6.LatestMessage) || isempty(sonar_7.LatestMessage) || isempty(sonar_8.LatestMessage) || ...
      isempty(sonar_9.LatestMessage) || isempty(sonar_10.LatestMessage) || isempty(sonar_11.LatestMessage)
    % Espera hasta que todos los mensajes de sonar sean recibidos
    waitfor(r);
end


% Definir los datos para las primeras 10 simulaciones
distancias_1 =  [0.5, 1.5, 2, 1.5, 3.5, 2.6, 1, 3.5];
velocidades_1 = [-15, -15, -15, -15, -15, -10, -10, -15];
angulos_1 =  [0, 70, 0, -70, 0, 90, 30, 0];

% Definir los datos para las siguientes 10 simulaciones
distancias_2 =  [0.5, 1.5, 2, 1.5, 3.15, 2.6, 1, 3.5];
velocidades_2= [-15, -15, -15, -15, -15, -10, -10, -15];
angulos_2 =  [0, 10, 0, -10, 0, 90, 30, 0];
% ...

% Realizar las primeras 10 simulaciones
for i = 1:10
    for j = 1:8
        distancia = distancias_1(j);
        vel_lineal_ackerman_kmh = velocidades_1(j);  % (km/h)
        steering_wheel_angle = angulos_1(j);  % Desde -90 a 90 grados
        avanzar_ackerman;
    end
    % Guardar datos de entrenamiento solo si el usuario desea
    respuesta = input('¿Desea guardar la simulación? (Sí: s / No: n): ', 's');

    if strcmpi(respuesta, 's')
        save(['datos_training_' num2str(i)], 'training_data');
        disp(['Simulación ' num2str(i) ' guardada.']);
    else
        disp(['Simulación ' num2str(i) ' no guardada.']);
    end
end

% Realizar las siguientes 10 simulaciones
for i = 1:10
    for j = 1:8
        distancia = distancias_2(i);
        vel_lineal_ackerman_kmh = velocidades_2(i);  % (km/h)
        steering_wheel_angle = angulos_2(i);  % Desde -90 a 90 grados
        avanzar_ackerman;
    end

    % Guardar datos de entrenamiento solo si el usuario desea
    respuesta = input('¿Desea guardar la simulación? (Sí: s / No: n): ', 's');

    if strcmpi(respuesta, 's')
        save(['datos_training_' num2str(i + 10)], 'training_data');
        disp(['Simulación ' num2str(i + 10) ' guardada.']);
    else
        disp(['Simulación ' num2str(i + 10) ' no guardada.']);
    end
end
