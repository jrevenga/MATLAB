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

% ...

% Verificación de disponibilidad de mensajes de todos los sensores antes de avanzar
while isempty(sonar_0.LatestMessage) || isempty(sonar_1.LatestMessage) || isempty(sonar_2.LatestMessage) || ...
      isempty(sonar_3.LatestMessage) || isempty(sonar_4.LatestMessage) || isempty(sonar_5.LatestMessage) || ...
      isempty(sonar_6.LatestMessage) || isempty(sonar_7.LatestMessage) || isempty(sonar_8.LatestMessage) || ...
      isempty(sonar_9.LatestMessage) || isempty(sonar_10.LatestMessage) || isempty(sonar_11.LatestMessage)
    % Espera hasta que todos los mensajes de sonar sean recibidos
    waitfor(r);
end

%AVANCES
distancia = 0.5;
vel_lineal_ackerman_kmh = -15;    % (km/h)
steering_wheel_angle = 0;       % desde -90 a 90 grados.
avanzar_ackerman;

distancia = 1.5;
vel_lineal_ackerman_kmh = -15;    % (km/h)
steering_wheel_angle = 10;       % desde -90 a 90 grados.
avanzar_ackerman;

distancia = 2;
vel_lineal_ackerman_kmh = -15;    % (km/h)
steering_wheel_angle = 0;       % desde -90 a 90 grados.
avanzar_ackerman;

distancia = 1.5;
vel_lineal_ackerman_kmh = -15;    % (km/h)
steering_wheel_angle = -10;       % desde -90 a 90 grados.
avanzar_ackerman;

distancia = 3.15;
vel_lineal_ackerman_kmh = -15;    % (km/h)
steering_wheel_angle = 0;       % desde -90 a 90 grados.
avanzar_ackerman;

distancia = 2.6;
vel_lineal_ackerman_kmh = -10;    % (km/h)
steering_wheel_angle = 90;       % desde -90 a 90 grados.
avanzar_ackerman;

distancia = 1;
vel_lineal_ackerman_kmh = -10;    % (km/h)
steering_wheel_angle = 30;       % desde -90 a 90 grados.
avanzar_ackerman;

distancia = 3.5;
vel_lineal_ackerman_kmh = -15;    % (km/h)
steering_wheel_angle = 0;       % desde -90 a 90 grados.
avanzar_ackerman;


% ...

% Guardar datos de entrenamiento solo si el usuario desea
respuesta = input('¿Desea guardar la simulación? (Sí: s / No: n): ', 's');

if strcmpi(respuesta, 's')
    save datos_training training_data;
    disp('Simulación guardada.');
else
    disp('Simulación no guardada.');
    % Puedes agregar aquí el código para realizar acciones adicionales si la simulación no se guarda
end


