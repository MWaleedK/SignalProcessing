num=[0.2];
den=[1 -0.52 0.68];
[H,W]=freqz(num,den);
figure(1)
plot(W/pi,20*log10(abs(H)))
title('Magnitude')
xlabel('Frequency (\times\pi rad/sample)')
ylabel('Magnitude (dB)')
figure(2)
plot(W,360/(2*pi)*angle(H))
title('Phase')
xlabel('Frequency Hz')
ylabel('Phase')

