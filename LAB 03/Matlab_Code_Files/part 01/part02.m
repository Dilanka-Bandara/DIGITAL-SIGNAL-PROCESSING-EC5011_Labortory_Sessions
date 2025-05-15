% BANDARA H.G.T.D.
% 2022e048 
% LABORATORY SESSION 3
% Part 02  

% Part 2
fs = 12000;
wp = 2000 / (fs/2); % normalized
ws = 3500 / (fs/2);
rp = 0.1;
rs = 40;

% Butterworth
[Nb, Wnb] = buttord(wp, ws, rp, rs);
[b_b, a_b] = butter(Nb, Wnb);

% Chebyshev I
[Nc1, Wnc1] = cheb1ord(wp, ws, rp, rs);
[b_c1, a_c1] = cheby1(Nc1, rp, Wnc1);

% Chebyshev II
[Nc2, Wnc2] = cheb2ord(wp, ws, rp, rs);
[b_c2, a_c2] = cheby2(Nc2, rs, Wnc2);

% Elliptic
[Ne, Wne] = ellipord(wp, ws, rp, rs);
[b_e, a_e] = ellip(Ne, rp, rs, Wne);

% Plotting
filters = {{b_b,a_b,'Butter'}, {b_c1,a_c1,'Cheby1'}, {b_c2,a_c2,'Cheby2'}, {b_e,a_e,'Ellip'}};

for k = 1:4
    [H, f] = freqz(filters{k}{1}, filters{k}{2}, 4096, fs);
    figure;
    plot(f, 20*log10(abs(H))); grid on;
    title([filters{k}{3}, ' Magnitude Response']);
    xlabel('Frequency (Hz)'); ylabel('Magnitude (dB)');
end
