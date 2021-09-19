
clear ecg samplingrate corrected filtered1 peaks1 filtered2 peaks2 fresult %clear all data
load ecgdemodata1; %loadSample1

kernel=[[1 1 1],[1 1 1],[1 1 1]];%kernel too apply on signal for smoothing
%noiseReduction
fresult=fft(ecg);
fresult(1 : round(length(fresult)*5/samplingrate))=0; %remove lower frequency Samples
fresult(end - round(length(fresult)*5/samplingrate) : end)=0; %remove very high frequency Samples
semiCorrected=real(ifft(fresult)); %a nice signal with peaks
%applying smootthing filter
corrected=imfilter(semiCorrected,kernel);


filtered=abs(corrected);
peaks=filtered/(max(filtered)/7);
%   Filter by threshold filter
for data = 1:1:length(peaks)
    if peaks(data) < 4
        peaks(data) = 0;
    else
        peaks(data)=1;
    end
end
%getting all nonzero signalValues
positions=find(peaks);
distance=positions(2)-positions(1);
distanceHigh=positions(2)-positions(1);%max possible distance between any two peaks
distanceArray=zeros(length(positions)-1);
%Returns minimum distance between two peaks from all possible values, along
%with distance values of other peaks in an array
for data=1:1:length(positions)-1
    distanceArray(data)=positions(data+1)-positions(data);
    if positions(data+1)-positions(data)<distance 
        distance=positions(data+1)-positions(data);
    end
    if positions(data+1)-positions(data)>distanceHigh 
        distanceHigh=positions(data+1)-positions(data);
    end
end

meanValue=mean(find(distanceArray));
stDaviation=std(find(distanceArray));


positions2=find(distanceArray);
distanceBetweenFirstAndLastPeaks = positions2(length(positions2))-positions2(1);

averageDistanceBetweenPeaks = meanValue;

averageHeartRate = 60 * samplingrate/averageDistanceBetweenPeaks;

disp('Average Heart Rate = ');
disp(averageHeartRate);

figure(1)
stem(distanceArray)
xlabel('n')
ylabel('Amplitude')
title('The distances between R-R regions')