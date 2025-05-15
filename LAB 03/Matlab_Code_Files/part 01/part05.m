% BANDARA H.G.T.D.
% 2022e048 
% LABORATORY SESSION 3
% Part 05  

N = 9;
fc = 1200;
fs = 8000;

hp_fir = fir1(N-1, 2*fc/fs, 'high', rectwin(N));
[H, f] = freqz(hp_fir, 1, 4096, fs);

figure;
subplot(2,1,1); plot(f, 20*log10(abs(H))); title('High Pass FIR Magnitude');
subplot(2,1,2); plot(f, angle(H)); title('High Pass FIR Phase');
