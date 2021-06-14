a = load('lenna.mat');
lenna = a.x_le;
b = load('normalization_matrix.mat');
Z = b.Z;

clear a b;

n = 105;
m = n;
x = n:(n+7);
y = m:(m+7);

clear n m;
cropped_lenna = lenna(x,y);

dct_lenna = dct2(cropped_lenna);

quantized_lenna = round(dct_lenna ./ Z);

inverse_quantizing = quantized_lenna .* Z;

reconstructed_lenna =  idct2(inverse_quantizing);

figure(1);
subplot(2,2,1);
imshow(uint8(cropped_lenna));
title('Original');
subplot(2,2,2);
surf(quantized_lenna);
title('Quantized');
subplot(2,2,3);
surf(inverse_quantizing);
title('Inverse Quantization');
subplot(2,2,4);
imshow(uint8(reconstructed_lenna));
title('Reconstructed');