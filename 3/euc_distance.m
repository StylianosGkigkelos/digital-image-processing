function [distance] = euc_distance(point1,point2)
    distance = ((point1(1) - point2(1)).^2 + (point1(2) - point2(2)).^2).^(1/2);
end

