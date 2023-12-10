% Ángulo de ejemplo
angulo = 149.43758;

% Transformación del ángulo al intervalo [-pi, pi] sin condicionales
angulo_transformado = mod(angulo + pi, 2 * pi) - pi;

disp(['Ángulo original: ' num2str(angulo)]);
disp(['Ángulo transformado: ' num2str(angulo_transformado)]);
