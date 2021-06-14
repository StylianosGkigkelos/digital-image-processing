function [rgb_image] = colourize(image)
    maxX = length(image(:,1));
    maxY = length(image(1,:));

    rgb_image = zeros(maxX, maxY, 3);
    
    for i = 1:maxX
        for j = 1:maxY
            if image(i,j) == 255
                rgb_image(i,j,1) = 255;
                rgb_image(i,j,2) = 255;
            elseif image(i,j) == 0
                rgb_image(i,j,3) = 255;
            end   
        end
    end
end

