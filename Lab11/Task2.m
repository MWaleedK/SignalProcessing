totalTime=5;
[Y1,Fs1]=audioread('Recording.wav');%8kHz
[Y2,Fs2]=audioread('BeatBox@44_1kHz.wav'); %44.1kHz
%upsampling to 48,000Hz from 44,100Hz
interBG=resample(Y2,480,441);


%changing 8kHz to 480/80
newFG=resample(Y1,90,80);

%changing 48kHz to 480/8
newBG=resample(interBG,90,480);

Fs=length(newFG)./totalTime;
t=0:6/(1*Fs):(totalTime*6)-(1/Fs);%((90/80)*(480/90)=6)

finalSong=newFG+newBG;
sound(finalSong)
figure(1)
plot(t,newFG)
hold on
plot(t,newBG)
xlabel('Time')
ylabel('Amplitude')
title('Both Audios')