% Crear una variable 'inputs' que tome las columnas 1 a 5 (sonar_04, sonar_07, sonar_09, sonar_10, sonar_11)
inputs = training_data(:, [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12])';

% Crear una variable 'outputs' que tome las columnas 18 y 19 (ang_volante y vel_angular_ackerman_kmh)
outputs = training_data(:, [18, 19])';

inputs(isinf(inputs)) = 5.0;
inputs = double(inputs);
outputs = double(outputs);

% Ejemplo en MATLAB
net = feedforwardnet([8, 4]); % 8 nodos en la primera capa oculta, 4 nodos en la segunda y 2 en la tercera
net = configure(net,inputs,outputs);
net = trainlm(net, inputs, outputs); % Entrenar con tus datos
predictions = net(inputs); % Hacer predicciones

Ts=100e-3;

gensim(net, Ts);

%%
training_data = [];
save datos_entrenamiento training_data