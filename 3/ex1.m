a = load('cycle1.mat');
a = a.H1;

[aFinal, aFinalLog] = twodfft(a);
figure(1)
subplot(1,3,1);
imshow(uint8(a));
title('Original cycle1');
subplot(1,3,2);
imshow(uint8(aFinal));
title('Linear Transformation cycle1');
subplot(1,3,3);
imshow(uint8(aFinalLog));
title('Logarithmic Transformation cycle1');
    
b = load('cycle2.mat');
b = b.H2;
    
[bFinal, bFinalLog] = twodfft(b);
figure(2)
subplot(1,3,1);
imshow(uint8(b));
title('Original cycle2');
subplot(1,3,2);
imshow(uint8(bFinal));
title('Linear Transformation cycle2');
subplot(1,3,3);
imshow(uint8(bFinalLog));
title('Logarithmic Transformation cycle2');
    
c = load('rectangle.mat');
c = c.a;
    
[cFinal, cFinalLog] = twodfft(uint8(c));
figure(3)
subplot(1,3,1);
imshow(uint8(c));
title('Original rectangle');
subplot(1,3,2);
imshow(uint8(cFinal));
title('Linear Transformation rectangle');
subplot(1,3,3);
imshow(uint8(cFinalLog));
title('Logarithmic Transformation rectangle');
    
d = load('bridge.mat');
d = d.im;
    
[dFinal, dFinalLog] = twodfft(d);
figure(4)
subplot(1,3,1);
imshow(uint8(d));
title('Original bridge');
subplot(1,3,2);
imshow(uint8(dFinal));
title('Linear Transformation bridge');
subplot(1,3,3);
imshow(uint8(dFinalLog));
title('Logarithmic Transformation bridge');
  
c2 = imrotate(c, 360-45);
[c2Final, c2FinalLog] = twodfft(c2);
figure(5)
subplot(1,3,1);
imshow(uint8(c2));
title('Rotated rectangle');
subplot(1,3,2);
imshow(uint8(c2Final));
title('Linear Transformation');
subplot(1,3,3);
imshow(uint8(c2FinalLog));
title('Logarithmic Transformation');
    
d2 = imrotate(d, 45);
[d2Final, d2FinalLog] = twodfft(d2);
figure(6)
subplot(1,3,1);
imshow(uint8(d2));
title('Rotated bridge');
subplot(1,3,2);
imshow(uint8(d2Final));
title('Linear Transformation');
subplot(1,3,3);
imshow(uint8(d2FinalLog));
title('Logarithmic Transformation');

    