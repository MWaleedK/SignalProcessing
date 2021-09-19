


%resampling all again. Resampling uses polyphase filering. Instead of
%upsample, use resample instead... upsample by 3
[newDrums_C,FsD_C]=resamplingFunc(f2MHz,FsD_,newDrums);
[newViolin_C,FsV_C]=resamplingFunc(f6MHz,FsV_,newViolin);
[newTrumpet_C,FsT_C]=resamplingFunc(f8MHz,FsT_,newTrumpet);


%to frequncyDomain
cosine_2MHz=abs(fft(cosine_2MHz));
cosine_6MHz=abs(fft(cosine_6MHz));
cosine_8MHz=abs(fft(cosine_8MHz));

newDrums_C=abs(fft(newDrums_C));
newViolin_C=abs(fft(newViolin_C));
newTrumpet_C=abs(fft(newTrumpet_C));

%adding Cosines
newDrums_C=newDrums_C.*cosine_2MHz';
newViolin_C=newViolin_C.*cosine_6MHz';
newTrumpet_C=newTrumpet_C.*cosine_8MHz';

%setting sampling frequency straights... setting it equal for all
[newDrums_C,FsD_C]=resamplingFunc(f8MHz,f2MHz,newDrums_C);
[newViolin_C,FsV_C]=resamplingFunc(f8MHz,f6MHz,newViolin_C);
[newTrumpet_C,FsT_C]=resamplingFunc(f8MHz,f8MHz,newTrumpet_C);

%combining outputs
combinedSignal=newTrumpet_C+newViolin_C+newDrums_C;
velsh=abs(ifft(combinedSignal));
FsVelsh=length(velsh)./10;
sound(velsh,FsVelsh);
%combinedSignalFFT=abs(fftshift(fft(combinedSignal)));

%combinedFs=length(combinedSignal)./tEnd;
%carange=-combinedFs/2:combinedFs/length(combinedSignal):(combinedFs/2)-(1/combinedFs);
%figure(2)
%plot(carange,combinedSignalFFT);

%bandPass filter: triband separator
reconvertedDrums=bandpass(combinedSignal,[1900000 2100000],2.5*f8MHz);
reconvertedViolin=bandpass(combinedSignal,[5900000 6100000],2.5*f8MHz);
reconvertedTrumpet=bandpass(combinedSignal,[7900000 8100000],2.5*f8MHz);

%downasmple
[downSampledDrums,FsD_DOWN]=resamplingFunc_2(FsD,compensation*FsD_C,reconvertedDrums);
[downSampledViolin,FsV_DOWN]=resamplingFunc_2(FsV,compensation*FsV_C,reconvertedViolin);
[downSampledTrumpet,FsT_DOWN]=resamplingFunc_2(FsT,compensation*FsT_C,reconvertedTrumpet);
%plot(abs(fft(downSampledDrums)));

sound((downSampledDrums),FsD_DOWN);
%sound((downSampledViolin),FsV_DOWN);
%sound((downSampledTrumpet),FsT_DOWN);