% n1=-2:1:2;
% n2=0:1:4;
% x1=[11 -13 15 7 -9];
% x2=[-12 14 6 -8 5];
% 
% figure(1)
% subplot(4,1,1)
% stem(n1-(-5),x1)
% xlabel('X')
% ylabel('Y')
% title('Shift signal right by 5')
% 
% subplot(4,1,2)
% stem(-(n1-(-5)),x1)
% xlabel('X')
% ylabel('Y')
% title('Shift signal left by 5')
% 
% subplot(4,1,3)
% stem(n2-(6),x1)
% xlabel('X')
% ylabel('Y')
% title('Shift signal left by 6')
% 
% 
% subplot(4,1,4)
% stem(-(n2-(6)),x1)
% xlabel('X')
% ylabel('Y')
% title('Shift signal right by 6')
% 
% figure(2)
% subplot(4,1,1)
% stem(n1-(-5),x2)
% xlabel('X')
% ylabel('Y')
% title('Shift signal right by 5')
% 
% subplot(4,1,2)
% stem(-(n1-(-5)),x2)
% xlabel('X')
% ylabel('Y')
% title('Shift signal left by 5')
% 
% subplot(4,1,3)
% stem(n2-(6),x2)
% xlabel('X')
% ylabel('Y')
% title('Shift signal left by 6')
% 
% 
% subplot(4,1,4)
% stem(-(n2-(6)),x2)
% xlabel('X')
% ylabel('Y')
% title('Shift signal right by 6')

n1=-15:15;
n2=-30:30;
x1=3*(n1==10);
x2=15*(n1==-7);
x=x1+x2;
y1=n2.*(n2>=0);
y2=(n2>=10);
y3=(n2>=20);
y4=(n2>=30);
y5=-0.8*(n2>=5);
y6=10.*2.^y5;
y=y1+y2+y3+(y6.*(y3-y4));
figure(1)
subplot(2,1,1)
stem(n1,x)
xlabel('X')
ylabel('Y')
title('EQ1')

subplot(2,1,2)
stem(n2,y)
xlabel('X')
ylabel('Y')
title('EQ2')
