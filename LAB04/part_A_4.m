%2022e048
%BANDARA H.G.T.D.
%Lab04-Part-A
%Part 4

% Step 1: Low-pass filter before downsampling
fc = 3000; 
[b,a] = butter(8, 2*fc/fs);
x_f = filter(b, a, x);

% Step 2: Downsample by 5
x_d = x_f(1:5:end);

% Step 3: Upsample by 2
x_u = upsample(x_d, 2);

% Step 4: Filter after upsampling
[b2, a2] = butter(8, 1/5);
x_final = filter(b2, a2, x_u);
fs_final = 6000;

% Plot in Hz
figure;
subplot(4,1,1); plot((0:length(x)-1)*fs/N, abs(fft(x))); title('Original Spectrum'); xlabel('Hz');
subplot(4,1,2); plot((0:length(x_f)-1)*fs/N, abs(fft(x_f))); title('Filtered'); xlabel('Hz');
subplot(4,1,3); plot((0:length(x_d)-1)*fs/5/length(x_d), abs(fft(x_d))); title('Downsampled'); xlabel('Hz');
subplot(4,1,4); plot((0:length(x_final)-1)*fs_final/length(x_final), abs(fft(x_final))); title('Final Output at 6kHz'); xlabel('Hz');
