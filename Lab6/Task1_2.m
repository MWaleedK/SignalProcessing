amp=5;
Fs=5000;
freq=5;
T=1/Fs;
L=1000;
t=(0:1/Fs:1);

sig=amp.*cos(2.*pi.*freq.*t- pi/2);
fourierTransform=abs(fft(sig));
noisyBoi=awgn(fourierTransform,10,'measured');
inverseFourierTransform=abs(ifft(noisyBoi));

%i do not know what is happening but ma'am says this works so ok 
Rp1=0.5;
Rs1=30;
Fp1=0.1e2/(Fs/2);                     
Fs1=0.5e2/(Fs/2);                     
n1=cheb1ord(Fp1,Fs1,Rp1,Rs1);
[a,b]=cheby1(n1,Rp1,Fp1,'low');


h = filter(a,b,inverseFourierTransform);


figure(1)
plot(t,sig)
xlim([-1.1 1.1])
ylabel('Amplitude')
xlabel('Time')
title('Signal')
figure(2)
subplot(1,2,1)
plot(fourierTransform)
xlim([-1000 6000])
ylabel('Amplitude')
xlabel('Frequency')
title('FT')
subplot(1,2,2)
plot(fourierTransform)
xlim([0 100])
ylabel('Amplitude')
xlabel('Frequency')
title('FT, 100 samples')

figure(3)
subplot(1,2,1)
plot(noisyBoi)
xlim([-1000 6000])
ylabel('Amplitude')
xlabel('Frequency')
title('Noise')
subplot(1,2,2)
plot(noisyBoi)
xlim([0 100])
ylabel('Amplitude')
xlabel('Frequency')
title('Noise, 100 samples')

figure(4)
plot(t,noisyBoi)
xlim([-1.1 1.1])
ylabel('Amplitude')
xlabel('Time')
title('Noise in time domain')

figure(5)
plot(t,h)
xlim([-1.5 1.5])
ylabel('Amplitude')
xlabel('Time')
title('Inverse Fourier Transform trough filter')
