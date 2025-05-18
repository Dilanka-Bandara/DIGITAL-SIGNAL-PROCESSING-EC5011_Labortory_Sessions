%BANDARA H.G.T.D. 2022e048
%Part 01

Fs = 4000;                   % Sampling frequency
t = 0:1/Fs:1-1/Fs;           % Time vector (1 sec)
x = cos(2*pi*100*t) + cos(2*pi*500*t) + ...
    cos(2*pi*2000*t) + cos(2*pi*2750*t);
y = 0.2 + x;                 % y[n] = 0.2 + x[n]

N = length(y);
Y = fft(y);
f = (0:N-1)*(Fs/N);          % (a) Frequency in Hz
w = 2*pi*f/Fs;               % (b) In radians
f_norm = f / (Fs/2);         % (c) Normalized

% Plot y[n] and frequency domain in 4 subplots
subplot(4,1,1); plot(t, y); title('Time-Domain Signal y[n]'); xlabel('Time (s)'); ylabel('Amplitude');

subplot(4,1,2); plot(f, abs(Y)); title('Spectrum - Hz'); xlim([0 Fs/2]); xlabel('Frequency (Hz)');
subplot(4,1,3); plot(w, abs(Y)); title('Spectrum - Radians'); xlim([0 2*pi]); xlabel('Frequency (rad/sample)');
subplot(4,1,4); plot(f_norm, abs(Y)); title('Spectrum - Normalized'); xlim([0 1]); xlabel('Normalized Frequency');

%02 finding dc value 
dc_value = mean(y);
disp(['DC Value = ', num2str(dc_value)]);

