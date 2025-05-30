%2022e048
%BANDARA H.G.T.D.
%Lab04-Part-A
%Part 1
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

xd = x(1:3:end);     % Downsample by 3
fsd = fs/3;          % New sampling frequency

% Plot
figure;
subplot(2,1,1); 
plot((0:length(x)-1)*fs/N, abs(fft(x))); title('Original Spectrum'); xlabel('Hz');
subplot(2,1,2); 
plot((0:length(xd)-1)*fsd/length(xd), abs(fft(xd))); title('Downsampled Spectrum (No Filter)'); xlabel('Hz');

