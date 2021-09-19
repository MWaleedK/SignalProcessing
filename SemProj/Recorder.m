clear all
Fs=22050;
myAud=audiorecorder(Fs,16,1);
recordblocking(myAud,10);
audiowrite('Trumpet.flac',getaudiodata(myAud),Fs);