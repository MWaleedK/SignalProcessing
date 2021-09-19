function [filteredAudio,lengthMyAudio,totalTime]=Preprocessing(myAudio,Fs)
    [m,n]=size(myAudio);

%convering audio to mono
    if m>n
        myAudio=myAudio(1:m,1);
    elseif n>m
        myAudio=myAudio(1:n,1);
    end
%totalTime
    lengthMyAudio=length(myAudio);
    totalTime=lengthMyAudio./Fs;
    lP4KhzFilter2=lP4KhzFilter;
    filteredAudio=filter(lP4KhzFilter2,myAudio);
end