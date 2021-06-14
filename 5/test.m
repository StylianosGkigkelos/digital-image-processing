n = 0.1;

a = load('lenna.mat');
steps = 0.1:1:10;
[~, sz] = size(steps);
lenna = a.x_le;
fft_mean = zeros(sz,1);

for i = 1:sz
    lenna_fft = find_coeffs_dct(lenna, steps(i));
    fft_mean(i) = mean2(abs(lenna - lenna_fft));
    disp(i);
end

plot(fft_mean);