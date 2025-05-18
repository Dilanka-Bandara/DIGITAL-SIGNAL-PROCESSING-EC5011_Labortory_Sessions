%BANDARA H.G.T.D. 2022e048
%Part 01_04 

% Parameters
fs1 = 3000;       % Case 1: Low sampling rate (aliasing occurs)
fs2 = 8000;       % Case 2: Higher sampling rate (2000 Hz visible)
f_signal = 2000;  % Signal frequency in Hz
duration = 0.01;  % Signal duration in seconds

% Time vectors
t1 = 0:1/fs1:duration;
t2 = 0:1/fs2:duration;

% Generate signal y[n] = 0.2 + sin(2*pi*2000*t)
x1 = sin(2*pi*f_signal*t1);
y1 = 0.2 + x1;

x2 = sin(2*pi*f_signal*t2);
y2 = 0.2 + x2;

% FFT of y1 (low fs, aliasing)
N1 = length(y1);
Y1 = fft(y1, 1024); % Use zero-padding for better frequency resolution
f1 = fs1*(0:1023)/1024;

% FFT of y2 (high fs, 2000 Hz visible)
N2 = length(y2);
Y2 = fft(y2, 1024);
f2 = fs2*(0:1023)/1024;

% Plot full spectrum up to fs (not just fs/2)
figure;

subplot(2,1,1);
plot(f1, abs(Y1));
title('Spectrum with fs = 3000 Hz (Aliasing Case)');
xlabel('Frequency (Hz)');
ylabel('|Y(f)|');
grid on;
xlim([0 fs1]);

subplot(2,1,2);
plot(f2, abs(Y2));
title('Spectrum with fs = 8000 Hz (2000 Hz visible)');
xlabel('Frequency (Hz)');
ylabel('|Y(f)|');
grid on;
xlim([0 fs2]);
