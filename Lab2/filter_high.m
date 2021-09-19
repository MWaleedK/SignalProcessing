function [a5,b5]=filter_high(Fs)
%Filtrul 5
Rp5=0.5;
Rs5=30;
Fp5=1e3*17/(Fs/2);                  
Fs5=1e3*17.4/(Fs/2);
n5=cheb1ord(Fp4,Fs4,Rp4,Rs4);
[b5,a5]=cheby1(n5,Rp5,Fp5,'high');
end