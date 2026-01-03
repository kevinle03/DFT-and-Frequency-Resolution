%% 2. (a) function to calculate the DTFT

function output_dtft = calculate_dtft(x,w)
    n = (0:length(x)-1)';
    output_dtft = sum(x'.*exp(-1j.*w.*n),1);
end