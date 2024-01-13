rosshutdown;
clear all;
close all;

global steering_wheel_angle;
global vel_lineal_ackerman_kmh;

for sim_number = 1:40
    % Se inicializa ROS fuera del bucle
    rosinit('192.168.110.109');

    % DECLARACIÓN DE SUBSCRIBERS, PUBLISHERS, y otras definiciones
    sub_odom = rossubscriber('/robot0/odom');
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

    % DECLARACIÓN DE PUBLISHERS
    pub_vel = rospublisher('/robot0/cmd_vel', 'geometry_msgs/Twist');

    % GENERACION DE MENSAJES
    msg_vel = rosmessage(pub_vel);

    % Definimos la periodicidad del bucle
    r = robotics.Rate(10);

    % Nos aseguramos de recibir un mensaje relacionado con el robot
    while (strcmp(sub_odom.LatestMessage.ChildFrameId,'robot0')~=1)
        sub_odom.LatestMessage
    end

    disp(['Inicialización ACKERMAN para la simulación ' num2str(sim_number) ' finalizada correctamente']);

    % Inicializar training_data para cada simulación
    training_data = [];

    % Verificación de disponibilidad de mensajes de todos los sensores antes de avanzar
    while isempty(sonar_0.LatestMessage) || isempty(sonar_1.LatestMessage) || isempty(sonar_2.LatestMessage) || ...
          isempty(sonar_3.LatestMessage) || isempty(sonar_4.LatestMessage) || isempty(sonar_5.LatestMessage) || ...
          isempty(sonar_6.LatestMessage) || isempty(sonar_7.LatestMessage) || isempty(sonar_8.LatestMessage) || ...
          isempty(sonar_9.LatestMessage) || isempty(sonar_10.LatestMessage) || isempty(sonar_11.LatestMessage)
        % Espera hasta que todos los mensajes de sonar sean recibidos
        waitfor(r);
    end

    % Definir datos para la simulación actual
    if sim_number <= 20
        distancias = [0.5, 1.5, 2, 1.5, 3.5, 2.6, 1, 3.5];
        velocidades = [-15, -15, -15, -15, -15, -10, -10, -15];
        angulos = [0, 70, 0, -70, 0, 90, 30, 0];
    else
        distancias = [0.5, 1.5, 2, 1.5, 3.15, 2.6, 1, 3.5];
        velocidades = [-15, -15, -15, -15, -15, -10, -10, -15];
        angulos = [0, 10, 0, -10, 0, 90, 30, 0];
    end

    % Realizar anvances
    for i = 1:length(distancias)
        distancia = distancias(i);
        vel_lineal_ackerman_kmh = velocidades(i);
        steering_wheel_angle = angulos(i);
        avanzar_ackerman;
    end

    % Guardar datos de entrenamiento solo si el usuario desea
    respuesta = input('¿Desea guardar la simulación? (Sí: s / No: n): ', 's');

    if strcmpi(respuesta, 's')
        save(['datos_training_' num2str(sim_number)], 'training_data');
        disp(['Simulación ' num2str(sim_number) ' guardada.']);
    else
        disp(['Simulación ' num2str(sim_number) ' no guardada.']);
    end
    
    % Hacer pausa hasta que se pulse Enter
    input('Presiona Enter para continuar con la siguiente simulación...');
end


