%BANDARA H.G.T.D. 2022e048
%Part 02_02

% Load the full audio
[y, Fs] = audioread('Uoj.wav');

% Time vector for full signal (optional for reference)
t_full = (0:length(y)-1)/Fs;

% --- Estimated sample ranges (you must adjust these based on your audio plot) ---
university_range = 00001:16000;
of_range         = 16000:19500;
jaffna_range     = 20000:30000;

% --- Extract words ---
university = y(university_range);
of_word    = y(of_range);
jaffna     = y(jaffna_range);

% --- Time vectors for each word ---
t_uni = (0:length(university)-1)/Fs * 1000;  % ms
t_of  = (0:length(of_word)-1)/Fs * 1000;     % ms
t_jaf = (0:length(jaffna)-1)/Fs * 1000;      % ms

% --- Plotting ---
figure;

subplot(3,1,1);
plot(t_uni, university);
xlabel('Time (ms)');
ylabel('Amplitude');
title('Word: University');

subplot(3,1,2);
plot(t_of, of_word);
xlabel('Time (ms)');
ylabel('Amplitude');
title('Word: of');

subplot(3,1,3);
plot(t_jaf, jaffna);
xlabel('Time (ms)');
ylabel('Amplitude');
title('Word: Jaffna');
