function [finalPic, histNew, histOld] = hist(image)
    maximum = max(image(:));
    minimum = min(image(:));
       
    range = maximum - minimum;
    
    histOld = zeros(256,1);
    histNew = zeros(256,1);
    
    for i = 1:length(image(:,1))
        for j = 1 : length(image(1,:))
%             disp(image(i,j));
            histOld(image(i,j)+1) = histOld(image(i,j)+1) + 1;
        end
    end
    
    prob = histOld ./ (length(image(:,1)) * length(image(1,:)));
    
    matrix = zeros(256,1);
    for i = 1:256
        matrix(i) = 255 .* sum(prob(1:i,1));
    end
    
    
    roundedMatrix = round(matrix);
%     disp(roundedMatrix)
    
    finalPic = zeros(length(image(:,1)),length(image(1,:)));
    for i = 1:length(image(:,1))
        for j = 1 : length(image(1,:))
           finalPic(i,j) = roundedMatrix(image(i,j)+1);
        end
    end
    
    for i = 1:length(finalPic(:,1))
        for j = 1 : length(finalPic(1,:))
            histNew(finalPic(i,j)+1) = histNew(finalPic(i,j)+1) + 1;
        end
    end
end

