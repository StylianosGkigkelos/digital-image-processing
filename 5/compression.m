function [compressed_image] = compression(image, Z)
    compressed_image = zeros(size(image));
    
    % This works only for square images
    intervals = (0:8:size(image)) + 1;

    for i = 1:(size(intervals')-1)
        
        for j = 1:(size(intervals')-1)
            current_x = intervals(i):(intervals(i+1)-1);
            current_y = intervals(j):(intervals(j+1)-1);
            cropped_image = image(current_x, current_y);

            dct_image = dct2(cropped_image);

            normalized_image = round(dct_image ./ Z);

            inverse_quantizing = normalized_image .* Z;

            compressed_image(current_x, current_y) = idct2(inverse_quantizing);

        end
     end
    
end

