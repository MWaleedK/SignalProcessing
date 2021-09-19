function Hd = lP4KhzFilter
%LP4KHZFILTER Returns a discrete-time filter object.

% MATLAB Code
% Generated by MATLAB(R) 9.10 and DSP System Toolbox 9.12.
% Generated on: 25-Jun-2021 17:53:51

% Equiripple Lowpass filter designed using the FIRPM function.

% All frequency values are in Hz.
Fs = 22050;  % Sampling Frequency

N     = 50;    % Order
Fpass = 1;     % Passband Frequency
Fstop = 4000;  % Stopband Frequency
Wpass = 1;     % Passband Weight
Wstop = 1;     % Stopband Weight
dens  = 20;    % Density Factor

% Calculate the coefficients using the FIRPM function.
b  = firpm(N, [0 Fpass Fstop Fs/2]/(Fs/2), [1 1 0 0], [Wpass Wstop], ...
           {dens});
Hd = dfilt.dffir(b);

% [EOF]
