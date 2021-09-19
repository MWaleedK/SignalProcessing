n1=25:1:90;
n2=15:1:45;

sig1=0.5.^n1;
sig2=((1/(0.5)).^n2);

val1=myTry_convolution(sig1,sig2,n1,n2);
totalLength=n1(1)+n2(1):n1(end)+n2(end);
%change strategy, manipulate x-axis
%noOverlap
x1=n1(1)+n2(1)-1;



figure(1)
subplot(2,1,1);
stem(totalLength,val1);
title('Conv') 

subplot(2,1,2);
stem(totalLength,val1);
axis([0 x1 0 20])
title('First No overlap') 

figure(2)
subplot(2,1,1)
stem(totalLength,val1);
axis([46 54 0 20])
title('First Partial overlap')

subplot(2,1,2)
stem(totalLength,val1);
axis([55 86 0 20])
title('Full overlap')

figure(3)
subplot(2,1,1)
stem(totalLength,val1);
axis([87 92 0 20])
title('Second Partial overlap')


subplot(2,1,2)
stem(totalLength,val1);
axis([93 (n1(end)+n2(end)-1) 0 20])
title('Second No overlap')





