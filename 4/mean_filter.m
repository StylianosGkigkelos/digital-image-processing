function [filtered_image] = mean_filter(image)
    filter = 1/9 * ones(3);
    
    filtered_image = conv2(image, filter, 'same');
end

