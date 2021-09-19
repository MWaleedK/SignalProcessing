[Y, Fs]=audioread('Bach2.wav');
figure
plot(Y)
ylabel('Amplitude')
xlabel('Frequency')

figure(2)
lP=filter(LowPass,Y);
plot(lP)
ylabel('Amplitude')
xlabel('Frequency')

figure(3)
hP=filter(HighPass,Y);
plot(hP)
ylabel('Amplitude')
xlabel('Frequency')
