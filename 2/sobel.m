function [new_image] = sobel(image)
    hx = [-1 -2 -1; 0 0 0; 1 2 1];
    hy = rot90(hx);
    
    gx = conv2(image, hx, 'same');
    gy = conv2(image, hy, 'same');
    
    new_image = zeros(length(image(:,1)), length(image(1,:)));
    
    for i= 1:length(image(:,1))
        for j = 1:length(image(1,:))
            new_image(i, j) = (gx(i,j).^2 + gy(i,j).^2).^(0.5);
        end
    end
end

