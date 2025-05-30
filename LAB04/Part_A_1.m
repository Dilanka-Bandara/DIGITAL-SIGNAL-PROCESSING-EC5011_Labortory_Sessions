%2022e048
%BANDARA H.G.T.D.
%Lab04-Part-A
%Part 1

%% EC5011 Lab 4A - Part 1: Downsampling by 3 without filtering

fs = 15000;           % Sampling frequency (Hz)
N = 2048;             % Number of samples
t = (0:N-1)/fs;       % Time vector

% Generate the sampled signal x[n]
A1 = 3000; f1 = 1000;
A2 = 2000; f2 = 2000;
A3 = 1000; f3 = 5500;
x = A1*sin(2*pi*f1*t) + A2*sin(2*pi*f2*t) + A3*sin(2*pi*f3*t);

% Downsample by 3 (no filtering)
y = x(1:3:end);

% Frequency axes
f_x = (0:N-1)*(fs/N);
N_y = length(y);
f_y = (0:N_y-1)*(fs/3/N_y);

% Plot magnitude spectra
figure;
subplot(2,1,1);
plot(f_x, abs(fft(x)));
title('Input Signal Spectrum');
xlabel('Frequency (Hz)'); ylabel('|X(f)|');
xlim([0 fs/2]);

subplot(2,1,2);
plot(f_y, abs(fft(y)));
title('Downsampled Signal Spectrum (No Filtering)');
xlabel('Frequency (Hz)'); ylabel('|Y(f)|');
xlim([0 fs/6]);
