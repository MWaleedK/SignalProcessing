Fs=8000;
totalTime=5;
%audioObject=audiorecorder(Fs,16,1);
%disp('Start Speaking');
%recordblocking(audioObject, totalTime);
%disp('That will be enough');
%Y=getaudiodata(audioObject);
%audiowrite('Recording.wav',Y,Fs);

[audio,Fs]=audioread('Recording.wav');
t=0:1/Fs:totalTime-(1/Fs);

FreqDom=abs(fft(audio));
n=0:length(FreqDom)-1;

dsConst=2;
upsampledAudio=upsample(audio,dsConst);
%t1=0:((dsConst*1)/Fs):totalTime-((dsConst*1)/Fs);
t1=0:((1)/Fs):(totalTime*dsConst)-((1)/Fs);

FreqDom_1=abs(fft(upsampledAudio));
n_1=0:length(FreqDom_1)-1;



disp('Original Audio')
sound(audio);
pause(4);
disp('upsampled Audio')
sound(upsampledAudio);



figure('Name','ThePlots')
subplot(4,1,1)
plot(t,audio)
ylabel('Magnitude')
xlabel('Time')
title('Original Audio')
subplot(4,1,2)
plot(t1,upsampledAudio)
ylabel('Magnitude')
xlabel('Time')
title('upsampled Audio')

subplot(4,1,3)
plot(n,FreqDom)
ylabel('Amplitude')
xlabel('Frequncy')
title('Original Audio')
subplot(4,1,4)
plot(n_1,FreqDom_1)
ylabel('Amplitude')
xlabel('Frequncy')
title('upsampled Audio')

sgtitle('UpSamplingBy2')