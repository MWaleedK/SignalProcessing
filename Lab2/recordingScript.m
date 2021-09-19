totalT=5;
Fs=8000;
    recAudio=audiorecorder(Fs,8,1);
    disp("Say something, chief");
    recordblocking(recAudio,totalT);
    disp("Aaaand Cut!");
    audiowrite('meRecording.wav',getaudiodata(recAudio),Fs);
    