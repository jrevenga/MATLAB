% Almacena los conjuntos de datos en una celda
training_data = {training_data_def, training_data_o, training_data1, training_data2, training_data3, training_data4, training_data5, training_data6, training_data7, training_data8, training_data9, training_data10};

% Inicializa las matrices que almacenarán todas las entradas y salidas
all_data = [];

% Concatena todas las simulaciones en una sola matriz
for i = 1:length(training_data)
    % Concatena las matrices de entrada y salida a lo largo de las columnas
    all_data = [all_data; training_data{i}];
end

% Selecciona las columnas deseadas para las entradas y salidas
selected_input_columns = 1:12;
selected_output_columns = [18, 19];

inputs = all_data(:, selected_input_columns)';
outputs = all_data(:, selected_output_columns)';

inputs(isinf(inputs)) = 5.0;
inputs = double(inputs);
outputs = double(outputs);

% Crea la red neuronal
net = feedforwardnet([64, 128, 32]);
net = configure(net, inputs, outputs);
net = train(net, inputs, outputs);

Ts=100e-3;
gensim(net, Ts);




