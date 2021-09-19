
[Y,Fs]=audioread('Recording.wav');
totalTime = length(Y)./Fs;
t=0:1/Fs:totalTime-(1/Fs);
N=length(Y);
M=4;L=40;Wn=1/M;%prctile(max(Y),70); %using 70 percentile high frequncy values
b=fir1(L-1,Wn,'low');

output=conv(b,Y);
Fs2=length(output)./totalTime;
%downsampling
dwSampled=downsample(output,M);
dwTime=0:(1/Fs2):(totalTime/M);

%going polypahse
%filterbanks
p0 = b(1:M:end);
p1 = b(2:M:end);
p2 = b(3:M:end);
p3 = b(4:M:end); %took every 4th sample, roll with this for downsampling b 4

%select polyphase signals
x0=Y(1:M:end);
x1=Y(4:M:end);%Y[-3]
x2=Y(3:M:end);%Y[-2]
x3=Y(2:M:end);%Y[-1]
polyPhaseDown=conv(p0,x0)+conv(p1,x1)+conv(p2,x2)+conv(p3,x3);

%upsampling
usam = zeros(1, (M*N)-1);
usam(1:M:M*N-1) = Y;
ups=conv(usam,b);
uFs=length(ups)./totalTime;
uTime=0:M/(uFs):(totalTime*M)-(1/uFs);
%upsample polyphase signals
uPol0=conv(Y,p0);
uPol1=conv(Y,p1);
uPol2=conv(Y,p2);
uPol3=conv(Y,p3);
uPoly=zeros(1,M*length(uPol0));
uPoly(1:M:end) = uPol0;
uPoly(2:M:end) = uPol1;
uPoly(3:M:end) = uPol2;
uPoly(4:M:end) = uPol3;

figure(1)
subplot(2,2,1)
plot(t,Y)
xlabel('time')
ylabel('amplitue')
title('Original Sound')
subplot(2,2,2)
plot(dwTime,dwSampled)
xlabel('time')
ylabel('amplitue')
title('Dwonsampled Filtered Sound via fir1, the normal way')
subplot(3,1,3)
plot(uTime,ups)
xlabel('time')
ylabel('amplitue')
title('Upsampled Filtered Sound via fir1, the normal way')


figure(2);
subplot(511), stem(b), ylabel('filter');
subplot(512), stem(p0), ylabel('p0');
subplot(513), stem(p1), ylabel('p1');
subplot(514), stem(p2), ylabel('p2');
subplot(515), stem(p3), ylabel('p3');
v=dwTime(1:1:end-1);
u=uTime(1:1:end-2);
figure(3)
subplot(1,2,1)
plot(v,polyPhaseDown)
xlabel('time')
ylabel('amplitue')
title('Filtered Sound via polyphase Downsampled')
subplot(1,2,2)
plot(u,uPoly)
xlabel('time')
ylabel('amplitue')
title('Filtered Sound via polyphase UpSampled')