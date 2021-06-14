function [new_image] = total_threshold(image, threshold)
    maxX = length(image(:,1));
    maxY = length(image(1,:));
    new_image = zeros(maxX, maxY);
    
    for i = 1:maxX
        for j = 1:maxY
            if image(i,j) >= threshold
                new_image(i,j) = 255;
            else
                new_image(i,j) = 0;
            end
        end
    end
    
end

