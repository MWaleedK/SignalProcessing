clear all
b = [0.5 0.5];
a = [1 0.25];
%DF1 equations
hd = dfilt.df1(b,a);
t=1:0.1:24;
f=50;
sig=sin(2*pi*f*t);
fil1_1=filter(hd,sig,1);
n=length(sig);
x=sig;
y=ones(1,n);
for i= 2:n:1
    y(i)=(b(1)*x(i))+(b(2)*x(i-1))+(a(2)*y(i-1));
end

fil1_2=conv(y,sig);
nVal=cast((length(fil1_2)/2),'uint8');
fil1_2=fil1_2(1:1:nVal);

%DF2 Equations
lengthDen=length(a);
z=zeros(lengthDen);
%b=b/a(1);
%a=a/a(1);%normalize parameters

Ynew=zeros(1,n);
for m =1:length(Ynew)
   Ynew(m)=b(1)*sig(m)+z(1);
   for i=2:lengthDen
       z(i-1)=b(i)*sign(m)+z(i)-a(i)*Ynew(m);
   end
end

Hd2=dfilt.df2(b,a);
fil2_1=filter(Hd2,sig,1);
fil2_2=conv(Ynew,sig);
nVal2=cast((length(fil2_2)/2),'uint8');
fil2_2=fil2_2(1:1:nVal2);


%Difference:
fil3_1=fil2_1-fil1_1;
fil3_2=fil2_2-fil1_2;

figure(1)
subplot(1,2,1)
plot(fil1_1)
title('DF1Command')
subplot(1,2,2)
plot(fil1_2)
title('manualFilt')
sgtitle('DF1')

figure(2)
subplot(1,2,1)
plot(fil2_1)
title('DF2Command')
subplot(1,2,2)
plot(fil2_2)
title('manualFilt')
sgtitle('DF2')

figure(3)
subplot(1,2,1)
plot(fil3_1)
title('DF2-DF1 by Command')
subplot(1,2,2)
plot(fil3_2)
title('DF2-DF1 by manualFilt')
sgtitle('Difference')
