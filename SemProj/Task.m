
%loading Aduio
[myAudioD,FsD]=audioread('Drums.flac');%8
[myAudioT,FsT]=audioread('Trumpet.flac');
[myAudioV,FsV]=audioread('Violin.flac');


%acquiring Parameters
TimeD=length(myAudioD)./FsD;
tD=0:1/FsD:TimeD-(1/FsD);
TimeT=length(myAudioT)./FsT;
tT=0:1/FsT:TimeT-(1/FsT);
TimeV=length(myAudioV)./FsV;
tV=0:1/FsV:TimeV-(1/FsV);

%Removing frequencies above 4KHz
[filteredAudioD,lengthMyAudioD,totalTimeD]=Preprocessing(myAudioD,FsD);
[filteredAudioT,lengthMyAudioT,totalTimeT]=Preprocessing(myAudioT,FsT);
[filteredAudioV,lengthMyAudioV,totalTimeV]=Preprocessing(myAudioV,FsV);

%getting max Fs
FsMax=max([FsD FsT, FsV]);


%resampling all to FsMax
[newDrums,FsD_]=resamplingFunc(FsD,FsMax,filteredAudioD);
[newViolin,FsV_]=resamplingFunc(FsV,FsMax,filteredAudioV);
[newTrumpet,FsT_]=resamplingFunc(FsT,FsMax,filteredAudioT);


%cosines in MHz
tEnd=max([tD,tV,tT]);
f2MHz=2000000;
f6MHz=6000000;
f8MHz=8000000;
nyquistConst=2;
Fs2MHz=f2MHz*nyquistConst;
Fs6MHz=f6MHz*nyquistConst;
Fs8MHz=f8MHz*nyquistConst;

%tEnd seems to have problems, idk what
%also, following nyquist theorem here

t2MHz=0:1/(Fs2MHz):10-(1/(Fs2MHz));
t6MHz=0:1/(Fs6MHz):10-(1/(Fs6MHz));
t8MHz=0:1/(Fs8MHz):10-(1/(Fs8MHz));
cosine_2MHz=cos(2*pi*f2MHz*t2MHz);
cosine_6MHz=cos(2*pi*f6MHz*t6MHz);
cosine_8MHz=cos(2*pi*f8MHz*t8MHz);


%resampling all again. Resampling uses polyphase filering. Instead of
%upsample, use resample instead... upsample by 
[newDrums_C,FsD_C]=resamplingFunc(Fs2MHz,FsD_,newDrums);
[newViolin_C,FsV_C]=resamplingFunc(Fs6MHz,FsV_,newViolin);
[newTrumpet_C,FsT_C]=resamplingFunc(Fs8MHz,FsT_,newTrumpet);


%merging Cosines with the signals
newDrums_C=newDrums_C.*cosine_2MHz';
newViolin_C=newViolin_C.*cosine_6MHz';
newTrumpet_C=newTrumpet_C.*cosine_8MHz';
aDvalue=max(newDrums_C);

DFs=length(newDrums_C)./10;
VFs=length(newViolin_C)./10;
TFs=length(newTrumpet_C)./10;
rangeD=-DFs/2:DFs/length(newDrums_C):(DFs/2)-(DFs/length(newDrums_C));
rangeV=-VFs/2:VFs/length(newViolin_C):(VFs/2)-(VFs/length(newViolin_C));
rangeT=-TFs/2:TFs/length(newTrumpet_C):(TFs/2)-(TFs/length(newTrumpet_C));
figure(1)
plot(rangeD,newDrums_C);
figure(2)
plot(rangeV,newViolin_C);
figure(3)
plot(rangeT,newTrumpet_C);

%To time doamin
%newDrums=abs(ifft(newDrums));
%newViolin=abs(ifft(newViolin));
%newTrumpet=abs(ifft(newTrumpet));

%setting sampling frequency straights... setting it equal for all
[newDrums_C,FsD_C]=resamplingFunc(Fs8MHz,Fs2MHz,newDrums_C);
[newViolin_C,FsV_C]=resamplingFunc(Fs8MHz,Fs6MHz,newViolin_C);
[newTrumpet_C,FsT_C]=resamplingFunc(Fs8MHz,Fs8MHz,newTrumpet_C);

disp('Adding em all')
%combining outputs
combinedSignal=newTrumpet_C+newViolin_C+newDrums_C;

disp('BandSeparation');
%bandPass filter: triband separator
reconvertedDrums=bandpass(combinedSignal,[1999500 2000500],Fs8MHz);
reconvertedViolin=bandpass(combinedSignal,[5999500 6000500],Fs8MHz);
reconvertedTrumpet=bandpass(combinedSignal,[7999500 8000500],nyquistConst*Fs8MHz);


%downasmple
[downSampledDrums,FsD_DOWN]=resamplingFunc_2(FsD,FsD_C,reconvertedDrums);
[downSampledViolin,FsV_DOWN]=resamplingFunc_2(FsV,FsV_C,reconvertedViolin);
[downSampledTrumpet,FsT_DOWN]=resamplingFunc_2(FsT,nyquistConst*FsT_C,reconvertedTrumpet);

disp('Almost there');
%heathens banished to the time domain
downSampledDrums=downSampledDrums/max(downSampledDrums);
downSampledViolin=downSampledViolin/max(downSampledViolin);
downSampledTrumpet=downSampledTrumpet/max(downSampledTrumpet);

disp('playDaSound');
%sound((downSampledDrums),FsD_DOWN);
sound((downSampledViolin),FsV_DOWN);
%sound((downSampledTrumpet),FsT_DOWN);
