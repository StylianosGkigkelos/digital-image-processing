panses = load('panses.mat');
panses = panses.pan;

[panses_x, panses_y] = size(panses);

rand_matrix = rand(panses_x, panses_y);

salts = find(rand_matrix >= 0.1 & rand_matrix <=0.2);

salted_panses = panses;
salted_panses(salts) = 255;

peppers = find(rand_matrix >= 0.6 & rand_matrix <=0.7);
salted_and_peppered_panses = salted_panses;
salted_and_peppered_panses(peppers) = 0;

mean_panses = mean_filter(salted_and_peppered_panses);
median_panses = median_filter(salted_and_peppered_panses);

figure(1);
subplot(1,3,1);
imshow(uint8(panses));
title('Original Panses');
subplot(1,3,2);
imshow(uint8(salted_panses));
title('Panses with Salt');
subplot(1,3,3);
imshow(uint8(salted_and_peppered_panses));
title('Panses with Salt and Pepper');

figure(2);
subplot(1,3,1);
imshow(uint8(salted_and_peppered_panses));
title('Panses with Salt and Pepper');
subplot(1,3,2);
imshow(uint8(mean_panses));
title('Mean Filter Panses');
subplot(1,3,3);
imshow(uint8(median_panses));
title('Median Filter Panses');

test = median_filter(median_panses);
test = mean_filter(test);
figure(3)
imshow(uint8(test));
