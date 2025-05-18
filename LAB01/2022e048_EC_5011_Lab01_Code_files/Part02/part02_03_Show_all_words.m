%BANDARA H.G.T.D. 2022e048
%Part 02_02_all in one plot

% Load the audio
[y, Fs] = audioread('Uoj.wav');

% Define sample ranges (update these based on your waveform!)
university_range = 00001:16000;
of_range         = 16000:19500;
jaffna_range     = 20000:30000;

% Extract word signals
university = y(university_range);
of_word    = y(of_range);
jaffna     = y(jaffna_range);

% Create time axes in milliseconds
t_uni = (0:length(university)-1)/Fs * 1000;
t_of  = (length(university):(length(university)+length(of_word)-1))/Fs * 1000;
t_jaf = (length(university)+length(of_word):(length(university)+length(of_word)+length(jaffna)-1))/Fs * 1000;

% Concatenate time and amplitude for continuity in x-axis
figure;
hold on;
plot(t_uni, university, 'b', 'DisplayName', 'University');
plot(t_of, of_word, 'r', 'DisplayName', 'of');
plot(t_jaf, jaffna, 'g', 'DisplayName', 'Jaffna');
xlabel('Time (ms)');
ylabel('Amplitude');
title('Words: University, of, Jaffna');
legend;
grid on;
