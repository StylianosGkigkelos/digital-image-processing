function [filtered, result] = laplacian_filter(image)
    filter = [1 1 1; 1 -8 1; 1 1 1;];
    %filter = [0 1 0; 1 -4 1; 0 1 0;];
    filtered = conv2(image,filter, 'same');
    result = image - filtered;
end

