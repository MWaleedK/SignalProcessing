

[xx,fs]=audioread('Bach2.wav');
xx = xx(:,1);
x=xx;
N=length(x);
t=0:1/fs:(length(x)-1)/fs;
subplot(3,2,1)
plot(t,x)
X = fft(x);
subplot(3,2,2)
yyy = 0:length(X)-1;
plot(yyy , abs(X));

 

y1=upsample(x,3);
fs2=fs*2;
n1=0:1/fs2:(length(y1)-1)/fs2;
subplot(3,2,3)
plot(n1,y1)
Y = abs(fft(y1));
subplot(3,2,4)
yy1 = 0:length(Y)-1;
plot(yy1, (Y));

 


z1=upsample(y1,4);
fs3=fs2*4;
n2=0:1/fs3:(length(z1)-1)/fs3;
subplot(3,2,5)
plot(n2,z1)
Z = fft(z1);
yy2 = 0:length(Z)-1;
subplot(3,2,6)
plot(yy2,abs(Z));