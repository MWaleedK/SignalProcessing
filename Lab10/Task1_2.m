f1=50;
f2=200;
Fs=202;
t=0:1/Fs:5-(1/Fs);
Y1=sin(2*pi*f1*t)+cos(2*pi*f2*t);

double_=2;
Fs_1=double_*Fs;
t1=0:1/(Fs_1):5-(1/(Fs_1));
u1=sin(2*pi*f1*t1)+cos(2*pi*f2*t1); %Fs=2*Fc


randVal=(randi([3,10],1));
Fs_2=randVal*Fs;
t2=0:(1/(Fs_2)):5-(1/(Fs_2));
u2=sin(2*pi*f1*t2)+cos(2*pi*f2*t2); %Fs>2*Fc

threeFourth=(3/4);
Fs_3=threeFourth*Fs;
t3=0:(1/(Fs_3)):5-(1/(Fs_3));
u3=sin(2*pi*f1*t3)+cos(2*pi*f2*t3); %Fs<2*Fc


figure(1)
plot(t,Y1)
title('Input Signal')
figure(2)
plot(t,Y1)
hold on
stem(t1,u1)
title('Fs=2Fc')
hold off
figure(3)
plot(t,Y1)
hold on
stem(t2,u2)
title('Fs>2Fc')
hold off
figure(3)
plot(t,Y1)
hold on
stem(t3,u3)
title('Fs<2Fc')

