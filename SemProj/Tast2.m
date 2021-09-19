clear all
f1=7000;
f2=1000;
Fs=44100;
t=0:1/Fs:10;

signal=cos(2*pi*f1*t);
signal=signal.*cos(2*pi*f2*t);
N=length(signal);
FreqX=-Fs/2:Fs/N:Fs/2-(1/Fs);
FreqX=FreqX;
freqSig=abs(fft(signal));
freqSig=fftshift(freqSig);
v=bandpass(signal,[8000 9000],Fs);
sound(v,Fs);
figure(1)
plot(FreqX,freqSig)
figure(2)
plot((-Fs/2:Fs/N:Fs/2-(1/Fs)),abs(fftshift(fft(v))));