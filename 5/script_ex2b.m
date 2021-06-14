a = load('lenna.mat');
lenna = a.x_le;
b = load('normalization_matrix.mat');
Z = b.Z;
j = 1;

% Z = 8*Z;
compressed_lenna = zeros(256, 256, 4);
err = zeros(1,4);
for i = 2.^(0:3)
    compressed_lenna(:,:,j) = compression(lenna, i*Z);
    err(j) = mean2(abs(compressed_lenna(:,:,j) - lenna));
    j = j + 1;
end


figure(1);
subplot(1,5,1);
imshow(uint8(lenna));
title('Original Lenna');
for j = 2:5
    subplot(1,5,j);
    imshow(uint8(compressed_lenna(:,:,j-1)));
	temp = (2.^(j-2));
    title("Compressed Lenna (Z="+ temp + ")");
end
figure(2);
plot(2.^(0:3), err, 'Marker', 'o');
title('Average Error');