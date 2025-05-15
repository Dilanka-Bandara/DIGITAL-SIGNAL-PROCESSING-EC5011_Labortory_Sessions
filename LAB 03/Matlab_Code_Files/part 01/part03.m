% BANDARA H.G.T.D.
% 2022e048 
% LABORATORY SESSION 3
% Part 03  

%% PART 03 – FIR Filter Design Matching Part 02 Specifications
clear; clc; close all;

%% Filter specifications
Fs = 12000;               % Sampling frequency in Hz
fp = 2000;                % Passband edge in Hz
fsb = 3500;               % Stopband edge in Hz
rp = 0.1;                 % Passband ripple in dB
rs = 40;                  % Stopband attenuation in dB

%% Convert to normalized frequencies (0 to 1, where 1 = Fs/2 = 6000 Hz)
f = [0 fp fsb Fs/2] / (Fs/2);  % = [0 2000 3500 6000] / 6000

%% Desired amplitude response
a = [1 1 0 0];            % Gain: 1 in passband, 0 in stopband

%% Convert ripple and attenuation to linear scale (deviations)
dev_pass = (10^(rp/20)-1)/(10^(rp/20)+1);  % Passband ripple (linear)
dev_stop = 10^(-rs/20);                    % Stopband attenuation (linear)
dev = [dev_pass dev_stop];                 % Deviation for pass and stop

%% Estimate FIR filter order using firpmord
[n, fo, ao, w] = firpmord([fp fsb], [1 0], dev, Fs);

% Ensure even filter order for linear phase
n = n + mod(n, 2);

%% Design filter using Parks-McClellan method
b_fir3 = firpm(n, fo, ao, w);   % FIR filter coefficients

%% Plot frequency response using FVTool
fvtool(b_fir3, 1, 'Fs', Fs);
title('Part 03: FIR Filter (Parks-McClellan) Matching Part 02 Specs');

%% Display filter order
fprintf('Designed FIR filter order (Part 03): %d\n', n);
