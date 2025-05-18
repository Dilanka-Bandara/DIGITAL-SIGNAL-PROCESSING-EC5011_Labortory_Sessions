%BANDARA H.G.T.D. 2022e048
%Part 02_02_Play three words

% Load the full audio
[y, Fs] = audioread('Uoj.wav');

% === Step 1: Define sample ranges for each word ===
university_range = 00001:16000;
of_range         = 16000:19500;
jaffna_range     = 20000:30000;

% === Step 2: Extract each word ===
university = y(university_range);
of_word    = y(of_range);
jaffna     = y(jaffna_range);

% === Step 3: Play each word with a pause in between ===
disp('Playing "University"');
sound(university, Fs);
pause(length(university)/Fs + 0.5);  % wait for playback + short gap

disp('Playing "of"');
sound(of_word, Fs);
pause(length(of_word)/Fs + 0.5);

disp('Playing "Jaffna"');
sound(jaffna, Fs);
pause(length(jaffna)/Fs + 0.5);
%5) Save them 
audiowrite('university.wav', university, Fs);
audiowrite('of.wav', of_word, Fs);
audiowrite('jaffna.wav', jaffna, Fs);
