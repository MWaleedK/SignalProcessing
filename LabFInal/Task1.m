totalTime=5;
[myAudio,Fs]=audioread('myFile.wav');
n=length(myAudio);
t=0:1/Fs:totalTime-(1/Fs);
inFreq=abs(fft(myAudio));

filteredAudioFir=conv(myAudio,Fir);
filteredAudioIIR=conv(myAudio,IIR);
samples1000Fir=filteredAudioFir(1:1000);
samples1000IIR=filteredAudioIIR(1:1000);

M=8;
downVal=downsample(myAudio,M);
Fs2=length(downVal)/totalTime;
dwTime=0:(1/Fs2):totalTime/M;
inFreqDown=abs(fft(downVal));


figure(1)
subplot(2,1,1)
plot(t,myAudio)
title('Time Domain')
subplot(2,1,2)
plot(inFreq)
title('Freq Domain')

figure(2)
subplot(2,2,1)
plot(samples1000Fir)
title('FIR')
subplot(2,2,2)
plot(samples1000IIR)
title('IIR')
sgtitle('1000Samples')

figure(3)
subplot(2,2,1)
plot(downVal)
title('time')
subplot(2,2,2)
plot(inFreqDown)
title('Freq')
sgtitle('8Khz')