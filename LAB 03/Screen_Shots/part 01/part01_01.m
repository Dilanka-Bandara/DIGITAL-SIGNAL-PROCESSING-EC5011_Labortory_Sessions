% BANDARA H.G.T.D.
% 2022e048 
% LABORATORY SESSION 3
% Part 01 01 

%% PART 01 - FIR Low Pass Filter Design

clear; clc; close all;

%% Q1 & Q2: Ideal Impulse Response hd[n] and Apply Rectangular Window

N = 9;                    % Filter length
fs = 8000;                % Sampling frequency (Hz)
fc = 1200;                % Cutoff frequency (Hz)
wc = 2 * pi * fc / fs;    % Digital cutoff frequency in radians/sample

n = 0:N-1;                % Sample indices
alpha = (N-1)/2;          % Center index for symmetry

% Ideal impulse response of ideal low-pass filter
hd = sin(wc * (n - alpha)) ./ (pi * (n - alpha));
hd(alpha + 1) = wc / pi;  % Handle division by zero at n = alpha

% Apply rectangular window (all ones)
h = hd;

%% Q3: Plot Frequency Response Using FFT (not freqz)

Nfft = 4096;
H_fft = fft(h, Nfft);            % Compute FFT of filter
H_fft = H_fft(1:Nfft/2);         % Take positive frequencies
f = (0:Nfft/2 - 1) * fs / Nfft;  % Frequency axis in Hz

mag_dB = 20 * log10(abs(H_fft)); % Magnitude in dB
phase_rad = angle(H_fft);        % Phase in radians

figure;
subplot(2,1,1);
plot(f, mag_dB);
xlabel('Frequency (Hz)');
ylabel('Magnitude (dB)');
title('Q3: FFT Magnitude Response');
grid on;

subplot(2,1,2);
plot(f, phase_rad);
xlabel('Frequency (Hz)');
ylabel('Phase (radians)');
title('Q3: FFT Phase Response');
grid on;

%% Q4: FIR Filter Using fir1 with Rectangular Window

% fir1 takes normalized cutoff frequency (0 to 1)
h_fir1 = fir1(N-1, 2 * fc / fs, rectwin(N));  % Order = N-1

[H1, f1] = freqz(h_fir1, 1, 4096, fs);  % Use freqz to get frequency response

figure;
subplot(2,1,1);
plot(f1, 20 * log10(abs(H1)));
xlabel('Frequency (Hz)');
ylabel('Magnitude (dB)');
title('Q4: FIR1 Magnitude Response');
grid on;

subplot(2,1,2);
plot(f1, angle(H1));
xlabel('Frequency (Hz)');
ylabel('Phase (radians)');
title('Q4: FIR1 Phase Response');
grid on;

%% Q5: FIR Filter Using firpm (Parks-McClellan Optimal Design)

% Normalized frequency bands [0 0.3 0.4 1] * Nyquist (1 = fs/2)
h_pm = firpm(N-1, [0 0.3 0.4 1], [1 1 0 0]);

[H2, f2] = freqz(h_pm, 1, 4096, fs);

figure;
subplot(2,1,1);
plot(f2, 20 * log10(abs(H2)));
xlabel('Frequency (Hz)');
ylabel('Magnitude (dB)');
title('Q5: FIRPM Magnitude Response');
grid on;

subplot(2,1,2);
plot(f2, angle(H2));
xlabel('Frequency (Hz)');
ylabel('Phase (radians)');
title('Q5: FIRPM Phase Response');
grid on;

%% Q6: Compare the Three Magnitude Responses

[H_manual, ~] = freqz(h, 1, 4096, fs);  % From Q3 (same as using freqz)

figure;
plot(f1, 20 * log10(abs(H_manual)), 'r', ...
     f1, 20 * log10(abs(H1)), 'g--', ...
     f1, 20 * log10(abs(H2)), 'b:');
xlabel('Frequency (Hz)');
ylabel('Magnitude (dB)');
legend('Manual (Q3)', 'fir1 (Q4)', 'firpm (Q5)');
title('Q6: Comparison of FIR Filters');
grid on;
