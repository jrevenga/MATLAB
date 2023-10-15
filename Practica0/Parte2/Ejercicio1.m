syms k
F= 2 + 5 * k + k ^ 2;
fplot(F)
Fz = ztrans(F);
hold on
fplot(Fz)
hold off

E = sind(k) * exp(1*k);
Ez = ztrans(E);
fplot(E)
hold on
fplot(Ez)
hold off

sys = tf([0.4 0 0], [1 -1 0.1 0.02]);
impulse(sys)
hold on
step(sys)