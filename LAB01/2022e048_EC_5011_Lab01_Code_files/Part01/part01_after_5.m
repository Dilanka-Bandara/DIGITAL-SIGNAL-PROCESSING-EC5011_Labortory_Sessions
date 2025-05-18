%BANDARA H.G.T.D. 2022e048
%Part 01_05 

% Original signal with Fs = 4000 Hz (hard to see 2000 Hz)
Fs1 = 4000;
t1 = 0:1/Fs1:1-1/Fs1;
y1 = 0.2 + cos(2*pi*100*t1) + cos(2*pi*500*t1) + cos(2*pi*2000*t1);

Y1 = fft(y1);
f1 = (0:length(Y1)-1)*(Fs1/length(Y1));

figure;
subplot(2,1,1);
plot(f1, abs(Y1));
title('Spectrum (Fs = 4000 Hz)'); xlabel('Frequency (Hz)'); xlim([0 Fs1]);

% Improved signal with Fs = 8000 Hz (clearly shows 2000 Hz)
Fs2 = 8000;
t2 = 0:1/Fs2:1-1/Fs2;
y2 = 0.2 + cos(2*pi*100*t2) + cos(2*pi*500*t2) + cos(2*pi*2000*t2);

Y2 = fft(y2);
f2 = (0:length(Y2)-1)*(Fs2/length(Y2));

subplot(2,1,2);
plot(f2, abs(Y2));
title('Spectrum (Fs = 8000 Hz)'); xlabel('Frequency (Hz)'); xlim([0 Fs2]);

%q05 after 
Fs = 4000;
n = 0:3999;  % 4000 samples = 1 second

x = cos(2*pi*100*n/Fs) + cos(2*pi*500*n/Fs) + ...
    cos(2*pi*2000*n/Fs) + cos(2*pi*2750*n/Fs);  % original signal
p = cos(2*pi*900*n/Fs) + cos(2*pi*1200*n/Fs);   % new signal


q = zeros(size(n));
q(1:400) = x(1:400);           % 0 ≤ n < 400
q(401:end) = p(401:end);       % 400 ≤ n < 4000


%Step 3: Plot q[n] and its spectrum
figure;

% Time domain
subplot(2,1,1);
plot(n, q);
xlabel('n'); ylabel('q[n]');
title('Signal q[n]');

% Frequency domain
Q = fft(q);
f = (0:length(Q)-1)*(Fs/length(Q));

subplot(2,1,2);
plot(f(1:end/2), abs(Q(1:end/2)));
xlabel('Frequency (Hz)');
ylabel('|Q(f)|');
title('Magnitude Spectrum of q[n]');

%Solution: Use r[n] = x[n] + p[n]
r = x + p;

R = fft(r);
f = (0:length(R)-1)*(Fs/length(R));

figure;
plot(f(1:end/2), abs(R(1:end/2)));
xlabel('Frequency (Hz)');
ylabel('|R(f)|');
title('Spectrum of r[n] = x[n] + p[n]');

