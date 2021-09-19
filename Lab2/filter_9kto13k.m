function [a3,b3]=filter_9kto13k(Fs)
%Filtrul 3
Rp3=0.5;
Rs3=30;
Fp3=1e3*[8.95,13.25]/(Fs/2);                   
Fs3=1e3*[8.35,13.65]/(Fs/2);
n3=cheb1ord(Fp3,Fs3,Rp3,Rs3);
[b3,a3]=cheby1(n3,Rp3,Fp3);
end