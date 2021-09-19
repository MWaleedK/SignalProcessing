function [a2,b2]=filter_4kto8k(Fs)
%Filtrul 2
Rp2=0.5;
Rs2=30;
Fp2=1e3*[4.25,8.75]/(Fs/2);                   
Fs2=1e3*[3.9,9.35]/(Fs/2);
n2=cheb1ord(Fp2,Fs2,Rp2,Rs2);
[b2,a2]=cheby1(n2,Rp2,Fp2);
end