%Part a
syms z
func1=(((5/9)*(z^-1)+(z^-2))/((1)+(4*(z^-2))));
iz=iztrans(func1);
disp(iz)

%Part b
syms n
u_n=(n>=0);
x_n=(((-1/6)^n)*heaviside(0))-(((1/10)^n)*heaviside(0));
zt=ztrans(x_n);
num=[0 0 -4/15];
den=[2,-2/15,-1/30];
[z1,p1,k1]=tf2zp(num,den);
zplane(z1,p1);
%z1=zeros(zt);
%p1=poles(zt)
disp(zt)