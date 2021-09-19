z = tf('z');
H = (2*z^4 + 16*z^3 + 44*z^2+ 56*z + 32) / (3*z^4 + 3*z^3 - 15*z^2 +18*z -12);
zsys = zpk(H);
Z = [zsys.Z{:}]
P = [zsys.P{:}]
K = zsys.K
pzmap(H)

ROC=max(abs(P))
%system is non-causal unstable
