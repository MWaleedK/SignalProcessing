function Hd = FIRF
%FIRF Returns a discrete-time filter object.

% MATLAB Code
% Generated by MATLAB(R) 9.10 and DSP System Toolbox 9.12.
% Generated on: 25-Jun-2021 17:50:09

% FIR Window Lowpass filter designed using the FIR1 function.

% All frequency values are in Hz.
Fs = 44100;  % Sampling Frequency

N    = 100;      % Order
Fc   = 3800;     % Cutoff Frequency
flag = 'scale';  % Sampling Flag
Beta = 0.5;      % Window Parameter

% Create the window vector for the design algorithm.
win = kaiser(N+1, Beta);

% Calculate the coefficients using the FIR1 function.
b  = fir1(N, Fc/(Fs/2), 'low', win, flag);
Hd = dfilt.dffir(b);

% [EOF]
