sys = tf([0.4 0 0], [1 -1 0.1 0.02]);%Definición del sistema a partir de su función de transferencia
impulse(sys)%Respuesta al impulso del sistema
figure;
step(sys)%Respuesta a entrada escalón