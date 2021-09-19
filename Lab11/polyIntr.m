%Interpolation using polyphase decomposition
clear all;
close all;

[x,fs] = audioread('Recording.wav');
x = x(:,1); % dropping the stereo sound
%N = 256;
N = length(x);
%x = x(1:N);

L = 40;
M = 2;%interpolation by 2
wc = 1/M;

h = fir1(L-1, wc);

p0 = h(1:2:L);
p1 = h(2:2:L);

figure(1);
subplot(311), stem(h), ylabel('h');
subplot(312), stem(p0), ylabel('p0');
subplot(313), stem(p1), ylabel('p1');

y = zeros(1, 2*N-1);
y(1:2:2*N-1) = x;
% pause

figure(2);
[X, wx] = freqz(x, 1, N, 'whole');
[Y, wy] = freqz(y, 1, N, 'whole');
[H, wh] = freqz(h, 1, 1024, 'whole');

subplot(311), plot(wx/(2*pi), abs(X));
subplot(312), plot (wh/(2*pi), abs(H));
subplot(313), plot(wy/(2*pi), abs(Y), 'r');

% pause
yi = conv(h, y);

figure(3);
plot(abs(Y));
hold on;
plot(abs(fft(yi)), 'r');
hold off;
legend('Before interpolation(Only Zeros inserted)','After Interpolation with filter');
% pause

figure(4);
y0 = conv(x, p0);
y1 = conv(x, p1);
yp = zeros(1,2*length(y0));
yp(1:2:end) = y0;
yp(2:2:end) = y1;
subplot(211), plot(yi), ylabel('yi');
subplot(212), plot(yp), ylabel('yp');
% pause

figure(5);
plot(abs(fft(yi)));
hold on;
plot(abs(fft(yp)), 'r');
hold off;
legend('Interpolation without polyphase decomposition','Interpolation with polyphase decomposition');
title('Completely Same');



