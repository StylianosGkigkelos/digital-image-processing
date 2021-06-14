n2 = load('noisy_image2.mat');
n2 = n2.y2;

median_im = 0;
variance=0;

s = imcrop(uint8(n2));

[a,b,probability] = hist(s);

for i = 0:255
    median_im = median_im + i.*probability(i+1); 
end

for i = 0:255
    variance = variance + (i-median_im)^2 * probability(i+1);
end

figure(1)
imshow(uint8(a));
figure(2);
bar(probability);
% figure(3);
% imshow(uint8(n2));