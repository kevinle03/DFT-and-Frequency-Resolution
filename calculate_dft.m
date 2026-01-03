%% 1. (a) Function to calculate DFT

function output_dft = calculate_dft(x)
    N = length(x);
    k = 0:N-1;
    n = (0:N-1)';
    output_dft = sum(x'.*exp(-1j.*2.*pi.*n.*k./N),1);
end