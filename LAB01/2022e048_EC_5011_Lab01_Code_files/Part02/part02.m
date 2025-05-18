%BANDARA H.G.T.D. 2022e048
%Part 02

% Load audio file
[y, Fs] = audioread('Uoj.wav');  % y = signal, Fs = sampling frequency

% Time axis in milliseconds
t = (0:length(y)-1) / Fs * 1000;  % Convert to milliseconds

% Plot time-domain signal
figure;
subplot(4,1,1);
plot(t, y);
xlabel('Time (ms)');
ylabel('Amplitude');
title('Time Domain Signal');

% Compute FFT
N = length(y);
Y = fft(y);
Y = Y(1:N/2+1);  % Take only up to Nyquist frequency
f_hz = Fs * (0:N/2) / N;         % Frequency in Hz
f_rad = 2 * pi * f_hz / Fs;      % Frequency in radians/sample
f_norm = f_hz / Fs;              % Normalized frequency

% Plot (a) Frequency in Hz
subplot(4,1,2);
plot(f_hz, abs(Y));
xlabel('Frequency (Hz)');
ylabel('|Y(f)|');
title('Frequency Spectrum (Hz)');

% Plot (b) Frequency in radians/sample
subplot(4,1,3);
plot(f_rad, abs(Y));
xlabel('Frequency (radians/sample)');
ylabel('|Y(\omega)|');
title('Frequency Spectrum (Radians/sample)');

% Plot (c) Normalized Frequency
subplot(4,1,4);
plot(f_norm, abs(Y));
xlabel('Normalized Frequency (f / Fs)');
ylabel('|Y(f)|');
title('Frequency Spectrum (Normalized)');





