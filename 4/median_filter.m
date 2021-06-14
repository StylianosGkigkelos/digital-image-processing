function [filtered_image] = median_filter(image)
    filtered_image = image;
    [image_x, image_y] = size(image);
    % Starts with 2 because the filter needs a 3x3 array
    % Ends on image_x-1 and image_y-1 because we can't filter the last row
    % and column
    for i = 2:image_x-1
        for j = 2:image_y-1
            sub_matrix = [image((i-1), (j-1):((j-1)+2)) image(i, (j-1):((j-1)+2)) image((i+1), (j-1):((j-1)+2))];
            sorted = sort(sub_matrix);
            filtered_image(i,j) = sorted(5);
        end
    end
end

