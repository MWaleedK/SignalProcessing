
z = tf('z');
func1=(1- z^-1 -4*z^-2 + 4*z^-3)/(1 - 2.75*z^-1 + 1.625*z^-2 - 0.25*z^-3);
pzmap(zero(func1),pole(func1))
disp('Using residuez')
[num,den]=tfdata(func1,'v');
num=num(1:4);
den=den(1:4);
[R P C]=residuez(num, den)
syms z
func1=(1- z^-1 -4*z^-2 + 4*z^-3)/(1 - 2.75*z^-1 + 1.625*z^-2 - 0.25*z^-3);
disp('Using iztrans')
iz=iztrans(func1);
disp(iz)

roc=max(abs(p))
%non-causal and unstable
