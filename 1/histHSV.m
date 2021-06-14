function [finalPic, histNew] = histHSV(image)
    maximum = max(image(:));
    minimum = min(image(:));
       
    range = maximum - minimum;
    
    histOld = zeros(256,1);
    histNew = zeros(256,1);
    


    sorted = sort(image(:));
    uniqueVals = unique(sorted);
    
    histOld = zeros(length(uniqueVals),1);
    histNew = zeros(length(uniqueVals),1);
    for i = 1:length(uniqueVals)
        indices = find(sorted == uniqueVals(i));
        histOld(i)= length(indices);
    end
    
    
    prob = histOld ./ (length(image(:,1)) * length(image(1,:)));
        
    matrix = zeros(length(histOld),1);
    
    for i = 1:length(histOld)
        matrix(i) = (length(histOld)-1) .* sum(prob(1:i,1));
    end
    disp(matrix);
    
    roundedMatrix = round(matrix);
    %disp(roundedMatrix);
    
    finalPic = zeros(length(image(:,1)),length(image(1,:)));
    for i = 1:length(image(:,1))
        for j = 1 : length(image(1,:))
           index = image(i,j) == uniqueVals;
           finalPic(i,j) = roundedMatrix(index);
        end
    end
    
    
    sorted = sort(finalPic(:));
    uniqueVals = unique(sorted);
    for i = 1:length(uniqueVals)
        indices = find(sorted == uniqueVals(i));
        histNew(i)= length(indices);
    end

    
end

