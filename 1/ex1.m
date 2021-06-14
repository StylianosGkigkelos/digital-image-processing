a = load("flowers");
b = load("clock");
c = load("Merilin");

new_a = transform(a.x_fl, 0, 255);
new_b = transform(b.x_cl, 0, 255);
new_c = transform(c.Mer, 0, 255);
    
figure(1)
subplot(3,2,1);
imshow(uint8(a.x_fl));
title('Original Flowers');
subplot(3,2,2);
imshow(uint8(new_a));
title('Linearly Transformed Flowers');
subplot(3,2,3);
imshow(uint8(b.x_cl));
title('Original Clock');
subplot(3,2,4);
imshow(uint8(new_b));
title('Linearly Transformed Clock');
subplot(3,2,5);
imshow(uint8(c.Mer));
title('Original Merlin');
subplot(3,2,6);
imshow(uint8(new_c));
title('Linearly Transformed Merlin');
