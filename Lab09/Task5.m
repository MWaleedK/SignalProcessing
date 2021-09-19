num=[0 1];
den=[1 -1 -1];
[H,W]=freqz(num,den);
figure(1)
plot(W/pi,20*log10(abs(H)))
title('Magnitude')
xlabel('Frequency (\times\pi rad/sample)')
ylabel('Magnitude (dB)')
figure(2)
plot(W/pi,365/(2*pi)*angle(H)+360)
title('Phase')
xlabel('Frequency Hz')
ylabel('Phase')
ylim([180 260])
xlim([0 1])
figure(3)
[r p k]=residuez(num,den);
zplane(num,den);
roc=max(abs(p))

%non-causal and stable
