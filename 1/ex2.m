a = load('image1');
b = load('church1');

maximumA = max(a.im(:));
minimumA = min(a.im(:));

maximumB = max(b.ch(:));
minimumB = min(b.ch(:));

rangeA = maximumA - minimumA;
rangeB = maximumB - minimumB;

histOldA = zeros(256,1);
histOldB = zeros(256,1);
histNewA = zeros(256,1);
histNewB = zeros(256,1);
    
for i = 1:length(a.im(:,1))
	for j = 1 : length(a.im(1,:))
		histOldA(a.im(i,j)+1) = histOldA(a.im(i,j)+1) + 1;
	end
end
    
probA = histOldA ./ (length(a.im(:,1)) * length(a.im(1,:)));
    
matrixA = zeros(256,1);
for i = 1:256
    matrixA(i) = 255 .* sum(probA(1:i,1));
end

roundedMatrixA = round(matrixA);

finalPicA = zeros(544,811);
for i = 1:length(a.im(:,1))
    for j = 1 : length(a.im(1,:))
        finalPicA(i,j) = roundedMatrixA(a.im(i,j)+1);
    end
end
    
for i = 1:length(finalPicA(:,1))
    for j = 1 : length(finalPicA(1,:))
        histNewA(finalPicA(i,j)+1) = histNewA(finalPicA(i,j)+1) + 1;
    end
end
    
    
    
for i = 1:length(b.ch(:,1))
    for j = 1:length(b.ch(1,:))
        histOldB(b.ch(i,j)+1) = histOldB(b.ch(i,j)+1) + 1;
    end
end
       
probB = histOldB ./ (length(b.ch(:,1)) * length(b.ch(1,:)));
    
matrixB = zeros(256,1);
for i = 1:256
    matrixB(i) = 255 .* sum(probB(1:i));
end
    
    
roundedMatrixB = round(matrixB);

    
finalPicB = zeros(440,427);
for i = 1:length(b.ch(:,1))
    for j = 1 : length(b.ch(1,:))
        finalPicB(i,j) = roundedMatrixB(b.ch(i,j)+1);
    end
end
    
for i = 1:length(b.ch(:,1))
    for j = 1:length(b.ch(1,:))
        histNewB(finalPicB(i,j)+1) = histNewB(finalPicB(i,j)+1) + 1;
     end
end
    
    
figure(1)
subplot(2,2,1);
bar(histOldA);
title('Old Bike')
%histogram(a.im);
subplot(2,2,2);
bar(histOldB);
title('Old Church')
%histogram(b.ch);
subplot(2,2,3);
bar(histNewA)
title('New Bike')
subplot(2,2,4);
bar(histNewB)
title('New Church')
    
    
figure(2)
subplot(2,2,1)
imshow(uint8(b.ch))
title('Original Bike')
subplot(2,2,2)
imshow(uint8(finalPicB))
title('High Contrast Bike')
subplot(2,2,3)
imshow(uint8(a.im))
title('Original Church')
subplot(2,2,4)
imshow(uint8(finalPicA))
title('High Contrast Church')


