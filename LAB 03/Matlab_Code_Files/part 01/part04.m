% BANDARA H.G.T.D.
% 2022e048 
% LABORATORY SESSION 3
% Part 04 

%% PART 04 – Filtering a Composite Signal
clear; clc; close all;

%% Sampling and time vector
Fs = 12000;           % Sampling frequency
t = 0:1/Fs:1;         % 1 second signal

%% Create composite signal with 4 frequencies
x = sin(2*pi*600*t) + ...
    sin(2*pi*1100*t) + ...
    sin(2*pi*2300*t) + ...
    sin(2*pi*5000*t);

%% DESIGN A FILTER (Use one from Part 02 or Part 03)

% Example: Elliptic IIR filter (from Part 02)
rp = 0.1;             % Passband ripple (dB)
rs = 40;              % Stopband attenuation (dB)
wp = 2000/(Fs/2);     % Normalized passband freq
ws = 3500/(Fs/2);     % Normalized stopband freq
[n, Wn] = ellipord(wp, ws, rp, rs);
[b, a] = ellip(n, rp, rs, Wn);  % Filter coefficients

%% Filter the signal
y = filter(b, a, x);

%% Compute FFT of both input and output
Nfft = 4096;
X_fft = fft(x, Nfft);
Y_fft = fft(y, Nfft);

% Take only positive frequencies
X_fft = abs(X_fft(1:Nfft/2));
Y_fft = abs(Y_fft(1:Nfft/2));
f = (0:Nfft/2 - 1) * Fs / Nfft;

%% Plot magnitude spectrum of input and output
figure;
subplot(2,1,1);
plot(f, 20*log10(X_fft));
xlabel('Frequency (Hz)'); ylabel('Magnitude (dB)');
title('Part 04: Input Signal Spectrum'); grid on;

subplot(2,1,2);
plot(f, 20*log10(Y_fft));
xlabel('Frequency (Hz)'); ylabel('Magnitude (dB)');
title('Part 04: Filtered Signal Spectrum'); grid on;
