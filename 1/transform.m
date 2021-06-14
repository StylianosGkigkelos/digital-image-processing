function [transformed_image] = transform(image, new_min, new_max)
    maximum = max(image(:));
    minimum = min(image(:));
    fprintf("Range:[%d, %d] \n", minimum, maximum);
    w1 = (new_max - new_min)./(maximum - minimum);
    w2 = new_min - w1 .* minimum;
    transformed_image = w1.* image + w2;
end

