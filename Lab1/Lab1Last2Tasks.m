totalT=5;
Fs=8000;
    recAudio=audiorecorder(Fs,8,1);
    disp("Say something, chief");
    recordblocking(recAudio,totalT);
    disp("Aaaand Cut!");
newValue= getaudiodata(recAudio);
newValue=newValue;
t2=0:1/Fs:(length(newValue)-1)/Fs;
    cosine0=cos(2*pi.*500.*t2);
    cosine0=cosine0';
    cosine1=cos(2*pi.*1000.*t2);
    cosine1=cosine1';
    cosine2=cos(2*pi.*2200.*t2);
    cosine2=cosine2';
    cosine3=cos(2*pi.*3800.*t2);
    cosine3=cosine3';
    cosines_4=cosine0+cosine1+cosine2+cosine3+newValue;
    disp('4Cosines!');
    sound(newValue,Fs,8);
    pause(9);
    
    for i=1:5
        newValues2=downsample(newValue,2);
    end
    disp('Downsampled')
    sound(newValue,Fs,8);
    
subplot(3,1,1)
plot(newValue)
title('Original Boi')
subplot(3,1,2)
plot(cosines_4)
title('4 sineWaves to signal')
subplot(3,1,3)
plot(newValues2)
title('Sampling rate drop: "Madlad Mode"')