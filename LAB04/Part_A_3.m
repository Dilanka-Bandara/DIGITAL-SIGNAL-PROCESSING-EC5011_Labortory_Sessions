%2022e048
%BANDARA H.G.T.D.
%Lab04-Part-A
%Part 3

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

xu = upsample(x,3);

% Low-pass filter design (cutoff = fs/2)
[b,a] = butter(8, 1/3); 
xu_f = filter(b, a, xu);
fsu = fs*3;

% Plot in Hz
figure;
subplot(3,1,1); 
plot((0:length(x)-1)*fs/N, abs(fft(x))); title('Original Spectrum'); xlabel('Hz');
subplot(3,1,2); 
plot((0:length(xu)-1)*fsu/length(xu), abs(fft(xu))); title('Upsampled'); xlabel('Hz');
subplot(3,1,3); 
plot((0:length(xu_f)-1)*fsu/length(xu_f), abs(fft(xu_f))); title('Upsampled & Filtered'); xlabel('Hz');

% Plot in rad
figure;
subplot(3,1,1); freqz(x,1); title('Original');
subplot(3,1,2); freqz(xu,1); title('Upsampled');
subplot(3,1,3); freqz(xu_f,1); title('Filtered');
