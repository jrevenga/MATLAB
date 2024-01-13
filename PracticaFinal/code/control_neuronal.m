% Crear una variable 'inputs' que tome las columnas 1 a 5 (sonar_04, sonar_07, sonar_09, sonar_10, sonar_11)
inputs = training_data(:, [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12])';

% Crear una variable 'outputs' que tome las columnas 18 y 19 (ang_volante y vel_angular_ackerman_kmh)
outputs = training_data(:, [18, 19])';

inputs(isinf(inputs)) = 5.0;
inputs = double(inputs);
outputs = double(outputs);

% Ejemplo en MATLAB
net = feedforwardnet([64, 6]);
net = configure(net,inputs,outputs);
net = train(net, inputs, outputs);


% Evalúa el rendimiento en datos de prueba
outputs_pred = net(inputs);
performance = perform(net, outputs, outputs_pred);

disp(['Rendimiento en datos de prueba: ', num2str(performance)]);

Ts=100e-3;
gensim(net, Ts);




