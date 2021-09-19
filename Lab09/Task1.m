
b=[1];
a=poly([0.9 0.9 -0.9]);
[R,P,K]=residuez(b,a)
Trans=tf(b,a);
Trans
pzmap(Trans)