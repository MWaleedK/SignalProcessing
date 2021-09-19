%input Signal

totalTime=10;
tx=0:0.01:totalTime;
Y=(exp(-(tx-2).^2).*cos(2*pi*50*tx)+exp(-(tx-2).^2).*cos(2*pi*70*tx)+exp(-(tx-3).^2).*cos(2*pi*100*tx+1)+exp(-(tx-3).^2).*cos(2*pi*130*tx+1)+exp(-(tx-4).^2).*cos(2*pi*150*tx+2)+exp(-(tx-3).^2).*cos(2*pi*210*tx+1));
N=length(Y)-1;
freqY=abs(fft(Y));
f=0:1/totalTime:100;

Y1=filter(Hd,Y);
Fs=length(Y1)./totalTime;
tx1=0:1/Fs:totalTime-(1/Fs);
freqY1=abs(fft(Y1));
N1=length(Y1)-1;

figure(1)
subplot(1,2,1)
plot(tx,Y);
xlabel('time')
ylabel('amplitude')
title('Time Domain')
subplot(1,2,2)
plot(f,freqY);
xlabel('Frequency')
ylabel('amplitude')
title('Freq Domain')
xlim([-50 5000])
sgtitle('Original Signal')

figure(2)
subplot(1,2,1)
plot(tx1,Y1);
xlabel('time')
ylabel('amplitude')
title('Time Domain')
subplot(1,2,2)
plot(freqY1);
xlabel('Frequency')
ylabel('amplitude')
title('Freq Domain')
xlim([-50 2000])
sgtitle('Filtered Signal (FIR)')
