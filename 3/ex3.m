noisy_clock = load('noisy_clock');
noisy_clock = noisy_clock.y;
    
[b, H] = butterworth_filter(noisy_clock,2,30);
    
figure(1);
subplot(2,2,1);
imshow(uint8(noisy_clock));
title('Original');
subplot(2,2,2);
imshow(uint8(transform(b, 0, 255)));
title('Butterworth Filter Image');
subplot(2,2,3);
imshow(uint8(transform(H, 0, 255)));
title('Butterworth Filter - Order = 2, d_{0} = 30');
%imshow(uint8(H));
subplot(2,2,4);
mesh(H);
title('Butterworth Filter mesh');
    
[b, H] = butterworth_filter(noisy_clock,6,60);
    
figure(2);
subplot(2,2,1);
imshow(uint8(noisy_clock));
title('Original');
subplot(2,2,2);
imshow(uint8(transform(b, 0, 255)));
title('Butterworth Filter Image');
subplot(2,2,3);
imshow(uint8(transform(H, 0, 255)));
title('Butterworth Filter  - Order = 4, d_{0} = 60');
%imshow(uint8(H));
subplot(2,2,4);
mesh(H);
title('Butterworth Filter mesh');  
    
[b, H] = butterworth_filter(noisy_clock,1,40);
    
figure(3);
subplot(2,2,1);
imshow(uint8(noisy_clock));
title('Original');
subplot(2,2,2);
imshow(uint8(transform(b, 0, 255)));
title('Butterworth Filter Image');
subplot(2,2,3);
imshow(uint8(transform(H, 0, 255)));
title('Butterworth Filter  - Order = 1, d_{0} = 40');
%imshow(uint8(H));
subplot(2,2,4);
mesh(H);
title('Butterworth Filter mesh');
%mikro d0 better - order ringing 
    
figure(4);
subplot(1,3,1);
imshow(uint8(noisy_clock));
title('Original Image');
subplot(1,3,2);
imshow(uint8(b));
title('Butterworth');
[l, l2] = laplacian_filter(b);
subplot(1,3,3);
imshow(uint8(l2));
title('After Laplace');
    


