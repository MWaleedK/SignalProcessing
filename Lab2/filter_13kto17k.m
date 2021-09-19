function [a4,b4]=filter_13kto17k(Fs)
%Filtrul 4
Rp4=0.5;
Rs4=30;
Fp4=1e3*[13.4,16.8]/(Fs/2);
Fs4=1e3*[13,17.5]/(Fs/2);
n4=cheb1ord(Fp4,Fs4,Rp4,Rs4);
[b4,a4]=cheby1(n4,Rp4,Fp4);
end