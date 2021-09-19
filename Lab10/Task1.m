f=10;
Fs=12;
t=0:1/Fs:5-(1/Fs);
Y1=cos(2*pi*f*t);

double_=2;
Fs_1=double_*Fs;
t1=0:1/(Fs_1):5-(1/(Fs_1));
u1=cos(2*pi*f*t1); %Fs=2*Fc


randVal=(randi([3,10],1));
Fs_2=randVal*Fs;
t2=0:(1/(Fs_2)):5-(1/(Fs_2));
u2=cos(2*pi*f*t2); %Fs>2*Fc

threeFourth=(3/4);
Fs_3=threeFourth*Fs;
t3=0:(1/(Fs_3)):5-(1/(Fs_3));
u3=cos(2*pi*f*t3); %Fs<2*Fc


figure('Name','UpSampling')
subplot(4,1,1)
plot(t,Y1)
title('Input Signal')
subplot(4,1,2)
plot(t,Y1)
hold on
stem(t1,u1)
title('Fs=2Fc')
subplot(4,1,3)
plot(t,Y1)
hold on
stem(t2,u2)
title('Fs>2Fc')
subplot(4,1,4)
plot(t,Y1)
hold on
stem(t3,u3)
title('Fs<2Fc')
sgtitle('UpSampling')