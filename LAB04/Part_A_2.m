%2022e048
%BANDARA H.G.T.D.
%Lab04-Part-A
%Part 2

% Given signal parameters
fs = 15000; % Sampling frequency
N = 2048;   % Number of samples
t = (0:N-1)/fs; % Time vector

% Signal components
A1 = 3000; f1 = 1000;
A2 = 2000; f2 = 2000;
A3 = 1000; f3 = 5500;

% Sampled signal
x = A1*sin(2*pi*f1*t) + A2*sin(2*pi*f2*t) + A3*sin(2*pi*f3*t);

% Low-pass filter design (cutoff = fs/6)
fc = fs/6;
[b,a] = butter(8, 2*fc/fs); 
x_filtered = filter(b, a, x);
xd_f = x_filtered(1:3:end);
fsd = fs/3;

% Plot in Hz
figure;
subplot(3,1,1); 
plot((0:length(x)-1)*fs/N, abs(fft(x))); title('Original Spectrum'); xlabel('Hz');
subplot(3,1,2); 
plot((0:length(x_filtered)-1)*fs/N, abs(fft(x_filtered))); title('Filtered Spectrum'); xlabel('Hz');
subplot(3,1,3); 
plot((0:length(xd_f)-1)*fsd/length(xd_f), abs(fft(xd_f))); title('Downsampled with Filter'); xlabel('Hz');

% Plot in rad
figure;
subplot(3,1,1); 
freqz(x,1); title('Original');
subplot(3,1,2); 
freqz(x_filtered,1); title('Filtered');
subplot(3,1,3); 
freqz(xd_f,1); title('Downsampled');
