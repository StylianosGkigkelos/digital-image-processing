a = imread('museum.jpg');
b = imread('DSCN1078.jpg');

newA = zeros(length(a(:,1,1)),length(a(1,:,1)), length(a(1,1,:)));

for i = 1:3
    [newA(:,:,i), newAhist, oldAhist] = hist( a(:,:,i) );
end
    
newB = zeros(length(b(:,1,1)),length(b(1,:,1)), length(b(1,1,:)));
for i = 1:3
    [newB(:,:,i), newBhist, oldBhist] = hist( b(:,:,i) );
end
    
hsvA = rgb2hsv(a);
[hsvA(:,:,3), hsvAhist] = histHSV(hsvA(:,:,3));
rgbA = hsv2rgb(hsvA);
  

hsvB = rgb2hsv(b);
[hsvB(:,:,3), hsvBhist] = histHSV(hsvB(:,:,3));
rgbB = hsv2rgb(hsvB);
    
figure(1);
subplot(2,3,1);
bar(oldAhist);
title('Original Museum');

subplot(2,3,2);
bar(newAhist);
title('Museum RGB histogram');

subplot(2,3,3);
bar(hsvAhist);
title('Museum RGB -> HSV -> RGB histogram');

subplot(2,3,4);
bar(oldBhist);
title('Original DSCN');

subplot(2,3,5);
bar(newBhist);
title('DSCN RGB histogram');

subplot(2,3,6);
bar(hsvBhist);
title('DSCN RGB -> HSV -> RGB histogram');


figure(2)
subplot(2,3,1);
imshow(a);
title('Original Museum');
subplot(2,3,2);
imshow(uint8(newA));
title('Histogram on RGB Museum');
subplot(2,3,3);
imshow(uint8(rgbA));
title('Histogram on RGB->HSV->RGB Museum');
subplot(2,3,4);
imshow(b);
title('Original DSCN');
subplot(2,3,5);
imshow(uint8(newB));
title('Histogram on RGB DSCN');
subplot(2,3,6);
imshow(uint8(rgbB));
title('Histogram on RGB->HSV->RGB DSCN');

