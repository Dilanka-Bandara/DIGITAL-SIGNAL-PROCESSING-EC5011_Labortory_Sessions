
%Lab04-Part-A
%Part 4

%% EC5011 Lab 4A - Part 4: Change sampling frequency to 6 kHz

fs = 15000; N = 2048; t = (0:N-1)/fs;
A1 = 3000; f1 = 1000;
A2 = 2000; f2 = 2000;
A3 = 1000; f3 = 5500;
x = A1*sin(2*pi*f1*t) + A2*sin(2*pi*f2*t) + A3*sin(2*pi*f3*t);

% Resample from 15 kHz to 6 kHz (factor 2.5:1)
% Use MATLAB's resample function (includes filtering)
y = resample(x, 6, 15);

% Frequency axes
N_y = length(y);
f_x = (0:N-1)*(fs/N);
f_y = (0:N_y-1)*(6000/N_y);

% Plot magnitude spectra
figure;
subplot(2,1,1);
plot(f_x, abs(fft(x)));
title('Input Signal Spectrum');
xlabel('Frequency (Hz)'); ylabel('|X(f)|');
xlim([0 fs/2]);

subplot(2,1,2);
plot(f_y, abs(fft(y)));
title('Resampled Signal Spectrum (6 kHz)');
xlabel('Frequency (Hz)'); ylabel('|Y(f)|');
xlim([0 3000]);
