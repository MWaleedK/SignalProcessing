totalT=5;
Fs=8000;
    recAudio=audiorecorder(Fs,8,1);
    disp("Say something, chief");
    recordblocking(recAudio,totalT);
    disp("Aaaand Cut!");
    play(recAudio);
    pause(9);
    
    y=getaudiodata(recAudio);
    y=y';
    y=y(end:-1:1);
    disp("Summoning Demons");
    sound(y,8000,8);
    pause(9);
    

    t=0:1/(Fs):((length(y)-1)/Fs);
    f1=1000;
    f2=1500;
    wave1=cos(2*pi.*f1.*t);
    wave1=wave1';
    wave2=cos(2*pi.*f2.*t);
    wave2=wave2';
    disp('2cosineWaves Superimposed')
    superimposedWave=wave1+wave2+getaudiodata(recAudio);
    sound(superimposedWave,Fs,8);
    pause(9);
    
    disp('the a+b thingy')
    a=y(1:(length(y)/2));
    b=y((length(y)/2)+1:end);
    sound((a+b),Fs,8);
    pause(9);
    
    disp('the a*2+b*0.5 thingy')
    newValue=((a*2)+(b*0.5));
    sound(newValue,Fs,8);
    pause(9);
    
    
    
    
    
    figure
    subplot(4,1,1)
    plot(getaudiodata(recAudio))
    title('Original Sound')
    subplot(4,1,2)
    plot(y)
    title('Inverted Sound')
    subplot(4,1,3)
    plot(superimposedWave)
    title('CosineWaves Superimposed')
    subplot(4,1,4)
    plot(newValue)
    title('(a*2)+(b*0.5)')
    