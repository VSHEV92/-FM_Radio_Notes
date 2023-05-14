function Hd = Audio_Lowpass_FIR_Coeff(Fs, Fpass, Fstop)
%AUDIO_LOWPASS_FIR_COEFF Returns a discrete-time filter object.

% MATLAB Code
% Generated by MATLAB(R) 9.6 and DSP System Toolbox 9.8.
% Generated on: 14-May-2023 11:57:52

% Equiripple Lowpass filter designed using the FIRPM function.

% All frequency values are in kHz.
% Fs = 1200;  % Sampling Frequency
% 
% Fpass = 110;             % Passband Frequency
% Fstop = 160;             % Stopband Frequency
Dpass = 0.057501127785;  % Passband Ripple
Dstop = 0.0001;          % Stopband Attenuation
dens  = 20;              % Density Factor

% Calculate the order from the parameters using FIRPMORD.
[N, Fo, Ao, W] = firpmord([Fpass, Fstop]/(Fs/2), [1 0], [Dpass, Dstop]);

% Calculate the coefficients using the FIRPM function.
b  = firpm(N, Fo, Ao, W, {dens});
Hd = dfilt.dffir(b);

% [EOF]
