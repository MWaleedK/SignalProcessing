[Y,Fs]=audioread('Bach.wav');
Y = Y(:,1);
totalTime = length(Y)./Fs;
t=0:1/Fs:totalTime-(1/Fs);
N=length(Y);
freq=abs(fft(Y));
%sound(Y,Fs);

%getting 10Highest frequencies from the end
last10Frequencies=freq(end-10:end-1);
l10F=length(last10Frequencies)./Fs;
t2=0:1/Fs:l10F-(1/Fs);
last10inTime=abs(ifft(last10Frequencies));
%sound(last10inTime,Fs);

%Desigining filter fir1()
M=10;
L=40;Wn=1/M;
newFilt=fir1(L-1,Wn);
out=conv(newFilt,Y);
downAudi=downsample(newFilt,10);
newFs=length(downAudi)./totalTime;


figure(1)
subplot(1,2,1)
plot(t,Y)
xlabel('time')
ylabel('amplitue')
title('Time Domain')
subplot(1,2,2)
stem(freq)
xlabel('Freq(Hz)')
ylabel('amplitue')
title('Frequency Domain')
sgtitle('original Image')


figure(2)
subplot(1,2,1)
plot(t2,last10inTime)
xlabel('time')
ylabel('amplitue')
title('Time Domain')
subplot(1,2,2)
stem(last10Frequencies)
xlabel('Freq(Hz)')
ylabel('amplitue')
title('Frequency Domain')
sgtitle('Last10HigestFreqs')