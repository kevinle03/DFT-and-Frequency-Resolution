%% 2. (a) Load aaa.wav file

[y,Fs] = audioread('aaa.wav');
Fs

%% 2. (b) Plot first 300 samples of waveform

M = length(y);
n = 0:300-1;

figure;
stem(n, y(1:300));
xlabel('n')
ylabel('y')
title('Audio Waveform (First 300 Samples)')

% period = 80 samples = 80 / Fs = 80 / 8000 = 0.01 seconds

%% 2. (c) DFT of one natural period vs two natural period
y_1T = y(1:80)';
y_2T = y(1:160)';

k_1T = 0:80-1;
k_2T = 0:160-1;

Y_1T = calculate_dft(y_1T);
Y_2T = calculate_dft(y_2T);

figure;
plot(k_1T, abs(Y_1T));
xlabel('k')
ylabel('DFT')
title('DFT of 1 Natural Period')

figure;
plot(k_2T, abs(Y_2T));
xlabel('k')
ylabel('DFT')
title('DFT of 2 Natural Period')

%% 2. (d) Zero-pad the above signals to 1024 points and plot DFT
y_1T_zp = [y_1T, zeros(1, 1024-80)];
y_2T_zp = [y_2T, zeros(1, 1024-160)];

k_zp = 0:1024-1;

Y_1T_zp = calculate_dft(y_1T_zp);
Y_2T_zp = calculate_dft(y_2T_zp);

figure;
plot(k_zp, abs(Y_1T_zp));
xlabel('k')
ylabel('DFT')
title('DFT of 1 Natural Period With Zero-Padding to 1024 Points')

figure;
plot(k_zp, abs(Y_2T_zp));
xlabel('k')
ylabel('DFT')
title('DFT of 2 Natural Period With Zero-Padding to 1024 Points')

%% 2. (e) Compute and plot DFT of signal with window 1T, 2T, 3T, 4T, 5T

for i=1:5
    M = i * 80;
    y_iT = y(1:M)';
    k = 0:M-1;
    Y_iT = calculate_dft(y_iT);
    figure;
    plot(k, abs(Y_iT));
    xlabel('k')
    ylabel('DFT')
    title_string = sprintf('DFT of %d Natural Period', i);
    title(title_string)
end