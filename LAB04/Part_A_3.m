%2022e048
%BANDARA H.G.T.D.
%Lab04-Part-A
%Part 3

%% EC5011 Lab 4A - Part 3: Upsampling by 3 with filtering

fs = 15000; N = 2048; t = (0:N-1)/fs;
A1 = 3000; f1 = 1000;
A2 = 2000; f2 = 2000;
A3 = 1000; f3 = 5500;
x = A1*sin(2*pi*f1*t) + A2*sin(2*pi*f2*t) + A3*sin(2*pi*f3*t);

% Upsample by 3 (insert 2 zeros between samples)
y_up = upsample(x, 3);

% Design interpolation filter (low-pass, cutoff at pi/3)
h = fir1(100, 1/3);

% Filter the upsampled signal
y_filt = filter(h, 1, y_up);

% Frequency axes
N_up = length(y_up);
f_x = (0:N-1)*(fs/N);
f_up = (0:N_up-1)*(fs*3/N_up);

% Plot magnitude spectra (Hz)
figure;
subplot(3,1,1);
plot(f_x, abs(fft(x)));
title('Input Signal Spectrum');
xlabel('Frequency (Hz)'); ylabel('|X(f)|');
xlim([0 fs/2]);

subplot(3,1,2);
plot(f_up, abs(fft(y_up)));
title('Upsampled Signal Spectrum (Before Filtering)');
xlabel('Frequency (Hz)'); ylabel('|Y_{up}(f)|');
xlim([0 fs*3/2]);

subplot(3,1,3);
plot(f_up, abs(fft(y_filt)));
title('Upsampled Signal Spectrum (After Filtering)');
xlabel('Frequency (Hz)'); ylabel('|Y_{filt}(f)|');
xlim([0 fs*3/2]);

% Plot magnitude spectra (rad/sample)
w_x = linspace(0, pi, N);
w_up = linspace(0, pi, N_up);

figure;
subplot(3,1,1);
plot(w_x, abs(fft(x)));
title('Input Spectrum (rad/sample)');
xlabel('Frequency (rad/sample)'); ylabel('|X(e^{j\omega})|');

subplot(3,1,2);
plot(w_up, abs(fft(y_up)));
title('Upsampled Spectrum (rad/sample)');
xlabel('Frequency (rad/sample)'); ylabel('|Y_{up}(e^{j\omega})|');

subplot(3,1,3);
plot(w_up, abs(fft(y_filt)));
title('Filtered Upsampled Spectrum (rad/sample)');
xlabel('Frequency (rad/sample)'); ylabel('|Y_{filt}(e^{j\omega})|');
