[myAudio,Fs]=audioread('EC313S21BCE B- Corrupted Audio.wav');
N=length(myAudio);
T=N./Fs;
t=0:1/Fs:T-(1/Fs);
sound(myAudio,Fs);
freqMyAudio=abs(fft(myAudio));

processedAudio=filter(FilNew,myAudio);
newT=length(processedAudio)./Fs;
t2=0:1/Fs:newT-(1/Fs);

newFreqAudio=zeros(1,N);
Y=prctile(freqMyAudio,50);
for i= 1:length(freqMyAudio)
    if freqMyAudio(1)~=0
        newFreqAud(i)=freqMyAudio(i);

    end
end

freqProcAud=abs(fft(processedAudio));

figure(1)
periodogram(myAudio,[],[],Fs);

figure(2)
subplot(1,2,1)
plot(t,myAudio)
title('OriginalSignal')
xlabel('Time')
ylabel('Amplitude')
subplot(1,2,2)
plot(t2,processedAudio)
title('ProcessedSignal')
xlabel('Time')
ylabel('Amplitude')
sgtitle('TimeDomain')

figure(3)
subplot(3,2,1)
plot(freqMyAudio);
title('OriginalSignal')
xlabel('Freq')
ylabel('Amplitude')

subplot(3,2,2)
plot(freqProcAud);
title('ProcessedSignal')
xlabel('Freq')
ylabel('Amplitude')

subplot(3,1,2)
plot(newFreqAudio);
title('ProcessedSignal add zero method')
xlabel('Freq')
ylabel('Amplitude')
sgtitle('FreqDomain')
