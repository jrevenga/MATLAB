% Número de ciclos de entrenamiento
num_epochs = 4;

% Configurar y entrenar la red neuronal con desordenamiento en cada ciclo
for epoch = 1:num_epochs
    % Desordenar las filas de los datos de entrenamiento
    num_samples = size(training_data, 1);
    permuted_index = randperm(num_samples);
    training_data_permuted = training_data(permuted_index, :);

    % Crear una variable 'inputs' que tome las columnas 1 a 12
    inputs = training_data_permuted(:, 1:12)';
    
    % Crear una variable 'outputs' que tome las columnas 18 y 19
    outputs = training_data_permuted(:, [18, 19])';

    inputs(isinf(inputs)) = 5.0;
    inputs = double(inputs);
    outputs = double(outputs);

    % Configurar y entrenar la red neuronal
    net = feedforwardnet([6, 7, 6]);
    net = configure(net, inputs, outputs);
    net = train(net, inputs, outputs);

    % Evaluar el rendimiento en datos de prueba
    outputs_pred = net(inputs);
    performance = perform(net, outputs, outputs_pred);

    disp(['Rendimiento en datos de prueba (Epoch ', num2str(epoch), '): ', num2str(performance)]);
end

Ts = 100e-3;
gensim(net, Ts);






