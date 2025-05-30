%2022e048
%BANDARA H.G.T.D.
%Lab04-Part-A
%Part 2

%% EC5011 Lab 4A - Part 2: Downsampling by 3 with filtering

fs = 15000; N = 2048; t = (0:N-1)/fs;
A1 = 3000; f1 = 1000;
A2 = 2000; f2 = 2000;
A3 = 1000; f3 = 5500;
x = A1*sin(2*pi*f1*t) + A2*sin(2*pi*f2*t) + A3*sin(2*pi*f3*t);

% Design low-pass FIR filter (cutoff at fs/6 = 2.5 kHz)
fc = fs/6; % 2500 Hz
norm_cutoff = fc/(fs/2);
h = fir1(100, norm_cutoff);

% Filter the signal
x_filt = filter(h, 1, x);

% Downsample by 3
y = x_filt(1:3:end);

% Frequency axes
f_x = (0:N-1)*(fs/N);
N_y = length(y);
f_y = (0:N_y-1)*(fs/3/N_y);

% Plot magnitude spectra (Hz)
figure;
subplot(3,1,1);
plot(f_x, abs(fft(x)));
title('Input Signal Spectrum');
xlabel('Frequency (Hz)'); ylabel('|X(f)|');
xlim([0 fs/2]);

subplot(3,1,2);
plot(f_x, abs(fft(x_filt)));
title('Filtered Signal Spectrum');
xlabel('Frequency (Hz)'); ylabel('|X_{filt}(f)|');
xlim([0 fs/2]);

subplot(3,1,3);
plot(f_y, abs(fft(y)));
title('Downsampled Signal Spectrum (With Filtering)');
xlabel('Frequency (Hz)'); ylabel('|Y(f)|');
xlim([0 fs/6]);

% Plot magnitude spectra (rad/sample)
w_x = linspace(0, pi, N);
w_y = linspace(0, pi, N_y);

figure;
subplot(3,1,1);
plot(w_x, abs(fft(x)));
title('Input Spectrum (rad/sample)');
xlabel('Frequency (rad/sample)'); ylabel('|X(e^{j\omega})|');

subplot(3,1,2);
plot(w_x, abs(fft(x_filt)));
title('Filtered Spectrum (rad/sample)');
xlabel('Frequency (rad/sample)'); ylabel('|X_{filt}(e^{j\omega})|');

subplot(3,1,3);
plot(w_y, abs(fft(y)));
title('Downsampled Spectrum (rad/sample)');
xlabel('Frequency (rad/sample)'); ylabel('|Y(e^{j\omega})|');
