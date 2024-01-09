%% INICIALIZACIÓN DE ROS
% Se definen las variables de entorno ROS_MASTER_URI (IP del Master) y ROS_IP (IP de la máquina donde se ejecuta Matlab). Si se está conectado a la misma red, la variable ROS_IP no es necesario definirla.

setenv('ROS_MASTER_URI','http://192.168.110.106:11311')
setenv('ROS_IP','192.168.110.245')

rosinit % Inicialización de ROS

%% DECLARACIÓN DE SUBSCRIBERS
odom=rossubscriber('/robot0/odom'); % Subscripción a la odometría

%% DECLARACIÓN DE PUBLISHERS
pub = rospublisher('/robot0/cmd_vel', 'geometry_msgs/Twist'); %

%% GENERACIÓN DE MENSAJE
msg=rosmessage(pub); %% Creamos un mensaje del tipo declarado en "pub" (geometry_msgs/Twist)


% Rellenamos los campos del mensaje para que el robot avance a 0.2 m/s

% Velocidades lineales en x,y y z (velocidades en y o z no se usan en robots diferenciales y entornos 2D)
msg.Linear.X=0.2;
msg.Linear.Y=0;
msg.Linear.Z=0;

% Velocidades angulares (en robots diferenciales y entornos 2D solo se utilizará el valor Z)
msg.Angular.X=0;
msg.Angular.Y=0;
msg.Angular.Z=0;

%% Definimos la perodicidad del bucle (10 hz)
r = robotics.Rate(10);

%% Nos aseguramos recibir un mensaje relacionado con el robot "robot0"
pause(1); % Esperamos 1 segundo para asegurarnos que ha llegado algún mensaje odom, porque sino ls función strcmp da error al tener uno de los campos vacios.

while (strcmp(odom.LatestMessage.ChildFrameId,'robot0')~=1)
 odom.LatestMessage
end

%% Inicializamos la primera posición (coordenadas x,y,z)
initpos=odom.LatestMessage.Pose.Pose.Position;

%% Bucle de control infinito
while (1)
    %% Obtenemos la posición actual
    pos=odom.LatestMessage.Pose.Pose.Position;
    %% Calculamos la distancia euclÃdea que se ha desplazado
    dist=sqrt((initpos.X-pos.X)^2+(initpos.Y-pos.Y)^2);
    
    %% Si el robot se ha desplazado más de un metro detenemos el robot (velocidad lineal 0) y salimos del bucle
    if (dist>1)
        msg.Linear.X=0;
        % Comando de velocidad
        send(pub,msg);
        % Salimos del bucle de control
        break;
    else
        % Comando de velocidad
        send(pub,msg);
    end
    
    % Temporización del bucle según el parámetro establecido en r
    waitfor(r)
end

%% DESCONEXIÓN DE ROS
rosshutdown;