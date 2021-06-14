function [transformed_image] = log_transform(image, c)
 
    s = c .* log(1 + image);

    transformed_image = s;
end

