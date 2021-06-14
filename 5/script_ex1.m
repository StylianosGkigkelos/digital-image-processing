steps = 0.1:0.01:1;
[~, sz] = size(steps);
fft_mean = zeros(sz,1);
dct_mean = zeros(sz,1);


a = load('lenna.mat');
lenna = a.x_le;

for i = 1:sz
    lenna_fft = find_coeffs(lenna, steps(i));
    fft_mean(i) = mean2(abs(lenna - lenna_fft));
end


for i = 1:sz
    lenna_dct = find_coeffs_dct(lenna, steps(i));
    dct_mean(i) = mean2(abs(lenna - lenna_dct));
end

% Lenna
figure(1)

subplot(2,2,1);
imshow(uint8(lenna));
title('Original Image');

subplot(2,2,2);
plot(steps, fft_mean);
hold on;
plot(steps, dct_mean);
hold off;
title('Plots of mean');
legend('Fast Fourier Transform', 'Discrete Cosine Transform', 'Location','northwest');

subplot(2,2,3);
imshow(uint8(lenna_fft));
title('FFT');

subplot(2,2,4);
imshow(uint8(lenna_dct));
title('DCT');
% End Lenna


b = load('flowers.mat');
flowers = b.x_fl;

for i = 1:sz
    flowers_fft = find_coeffs(flowers, steps(i));
    fft_mean(i) = mean2(abs(flowers - flowers_fft));
end

for i = 1:sz
    flowers_dct = find_coeffs_dct(flowers, steps(i));
    dct_mean(i) = mean2(abs(flowers - flowers_dct));
end
% Flowers
figure(2)

subplot(2,2,1);
imshow(uint8(flowers));
title('Original Image');

subplot(2,2,2);
plot(fft_mean);
hold on;
plot(dct_mean);
hold off;
title('Plots of mean');
legend('Fast Fourier Transform', 'Discrete Cosine Transform', 'Location','northwest');

subplot(2,2,3);
imshow(uint8(flowers_fft));
title('FFT');

subplot(2,2,4);
imshow(uint8(flowers_dct));
title('DCT');
% End Flowers

