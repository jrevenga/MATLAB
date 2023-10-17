% Definir las matrices A y b
A = [0 2 10 7; 2 7 7 1; 1 9 0 5; 4 0 0 6; 2 8 4 1; 10 5 0 3; 2 6 4 0; 1 1 9 3; 6 4 8 2; 0 3 0 9];
As = [90; 59; 15; 10; 80; 17; 93; 51; 41; 76];

b = [0.110 0 1 0; 0 3.260 0 1; 0.425 0 1 0; 0 3.574 0 1; 0.739 0 1 0; 0 3.888 0 1; 1.054 0 1 0; 0 4.202 0 1; 1.368 0 1 0; 0 4.516 0 1];
bs = [317; 237; 319; 239; 321; 241; 323; 243; 325; 245];

% 1. Obtener el número de condición de la matriz A
c = cond(A);
disp(['Número de condición de A: ' num2str(c)]);

% 2. Resolver los sistemas de ecuaciones A = As y b = bs
X = linsolve(A, As);
disp('Solución del sistema de ecuaciones A:');
disp(X);
Y = linsolve(b,bs);
disp('Solución del sistema de ecuaciones b (sin ruido):');
disp(Y)

% 3. Añadir ruido a la matriz b y resolver el sistema
r = normrnd(0, 1, 10, 1);
b2 = bs + r;

% 4. Resolver el sistema de ecuaciones b = bs
B = b;
Y = linsolve(B, b2);
disp('Solución del sistema de ecuaciones b (con ruido):');
disp(Y);
