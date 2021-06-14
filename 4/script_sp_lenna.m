lenna = load('lenna.mat');
lenna = lenna.x_le;

[lenna_x, lenna_y] = size(lenna);

rand_matrix = rand(lenna_x, lenna_y);

salts = find(rand_matrix >= 0.1 & rand_matrix <=0.2);

salted_lenna = lenna;
salted_lenna(salts) = 255;

peppers = find(rand_matrix >= 0.6 & rand_matrix <=0.7);
salted_and_peppered_lenna = salted_lenna;
salted_and_peppered_lenna(peppers) = 0;

mean_lenna = mean_filter(salted_and_peppered_lenna);
median_lenna = median_filter(salted_and_peppered_lenna);

figure(1);
subplot(1,3,1);
imshow(uint8(lenna));
title('Original Lenna');
subplot(1,3,2);
imshow(uint8(salted_lenna));
title('Lenna with Salt');
subplot(1,3,3);
imshow(uint8(salted_and_peppered_lenna));
title('Lenna with Salt and Pepper');

figure(2);
subplot(1,3,1);
imshow(uint8(salted_and_peppered_lenna));
title('Lenna with Salt and Pepper');
subplot(1,3,2);
imshow(uint8(mean_lenna));
title('Mean Filter Lenna');
subplot(1,3,3);
imshow(uint8(median_lenna));
title('Median Filter Lenna');

test = median_filter(median_lenna);
test = mean_filter(test);
figure(3)
imshow(uint8(test));
