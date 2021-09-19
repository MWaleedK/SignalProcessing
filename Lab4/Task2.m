x=(audioread('meRecording.wav'));
x=x';
M=input('Enter smoothness variable');
newVar=myTry_movingAverage(x,M);
K=kernelCreator(M);
vari=conv(newVar,K);
sound(vari);

subplot(3,1,1)
plot(x)
title('Original Plot')
subplot(3,1,2)
plot(newVar)
title('Plot through moving average')
subplot(3,1,3)
plot(vari)
title('Damped Plot')