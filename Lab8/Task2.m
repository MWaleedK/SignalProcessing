clear all;

syms z;
H_z=((10*(z^3))-(3*z))/((60*(z^3))+(28*(z^2))-(61*z)-1);
num=[10 0 -3 0];
den=[60 28 -61 -1];
[R,P,K]=residuez(num,den)
[z1,p1,k1]=tf2zp(num,den);
lo=tf()
zplane(z1,p1)

%unstable and nonCausal
