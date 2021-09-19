disp('Part a');
x=input('Input value for range');
n=-x:1:x;
del1=n==0;
u1=n>=0;
figure(1)
subplot(2,2,1)
stem(del1)
xlabel('n')
ylabel('y')
title('Unit-impulse')
subplot(2,2,2)
stem(u1)
xlabel('n')
ylabel('y')
title('Unit-step')

disp('Part b');
A=4;
alpha=[-4 -0.5 0.5 4];
figure(2)
subplot(4,1,1)
plot(A.*(alpha(1).^(n)))
xlabel('n')
ylabel('y')
title('alpha=-4')
subplot(4,1,2)
plot(A.*(alpha(2).^(n)))
xlabel('n')
ylabel('y')
title('alpha=-0.5')
subplot(4,1,3)
plot(A.*(alpha(3).^(n)))
xlabel('n')
ylabel('y')
title('alpha=0.5')
subplot(4,1,4)
plot(A.*(alpha(4).^(n)))
xlabel('n')
ylabel('y')
title('alpha=4')

disp('Part c');
t=-50:50;
f=0.08;
Amp=2.5;
phi=90;
out=Amp*sin((2*pi.*f.*t)+phi);
figure(3)
plot(out)