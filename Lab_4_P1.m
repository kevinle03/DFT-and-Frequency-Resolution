%% 1. (b) Compute the DFT with varying N (zero-padding) and plot magnitude

N_list = [16,32,64,128,256];

for N = N_list
    x = [ones(1,16), zeros(1,N-16)];
    k = 0:N-1;
    X = calculate_dft(x);
    figure;
    stem(k, abs(X));
    xlabel('k')
    ylabel('DFT')
    title_string = sprintf('Magnitude of DFT with N=%d', N);
    title(title_string)
end

%% 1. (c) Compute the DTFT using Lab 3's function and plot magnitude

x = ones(1,16);

w = linspace(0, 2*pi, 1000);
X = calculate_dtft(x, w);
figure;
plot(w, abs(X));
xlabel('w')
ylabel('DTFT')
title('Magnitude of DTFT')

% returning the same DFT output using the DTFT function
N = 32;
w_ = linspace(0, 2*pi*(N-1)/N, N);
X_ = calculate_dtft(x, w_);
figure;
stem(w_, abs(X_));
xlabel('w')
ylabel('DTFT')
title_string = sprintf('Magnitude of DTFT with w Vector Length %d', N);
title(title_string)

%% 1. (d) Compute the DFT using fft() function and plot magnitude

for N = N_list
    x = [ones(1,16), zeros(1,N-16)];
    k = 0:N-1;
    X = fft(x, N);
    figure;
    stem(k, abs(X));
    xlabel('k')
    ylabel('DFT')
    title_string = sprintf('Magnitude of DFT with N=%d - Using fft()', N);
    title(title_string)
end