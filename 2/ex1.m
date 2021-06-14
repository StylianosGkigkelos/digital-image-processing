a = imread('church2.jpg');
b = imread('San-Francisco.jpg');

a_gs = rgb2gray(a);
b_gs = rgb2gray(b);
    
a_sobel = sobel(a_gs);
a_threshold = total_threshold(a_sobel, 128);
a_coloured = colourize(a_threshold);

figure(1)
subplot(2,2,1);
imshow((a));
title('Original')
subplot(2,2,2);
imshow(uint8(a_sobel));
title('Sobel')
subplot(2,2,3);
imshow(uint8(a_threshold));
title('Threshold')
subplot(2,2,4);
imshow(uint8(a_coloured));
title('Colourized')
    
b_sobel = sobel(b_gs);
b_threshold = total_threshold(b_sobel, 128);
b_coloured = colourize(b_threshold);
    
figure(2)
subplot(2,2,1);
imshow(b);
title('Original')
subplot(2,2,2);
imshow(uint8(b_sobel));
title('Sobel')
subplot(2,2,3);
imshow(uint8(b_threshold));
title('Threshold')
subplot(2,2,4);
imshow(uint8(b_coloured));
title('Colourized')
