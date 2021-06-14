function [rec_I] = find_coeffs_dct(image, percent)
    %numel = number of elements
    % Used round to bypass scientific notation
    multitude = round((percent / 100) * numel(image));
    
    dct_I = dct2(image);
    abs_dct_I = abs(dct_I);
    sorted_dct_I = sort(abs_dct_I(:));
    index = round(numel(image)- multitude + 1);
    coeffs = sorted_dct_I(index: size(sorted_dct_I));
    Z = zeros(size(image));
    
    for i = 1:size(coeffs)
        [x,y] = find(abs_dct_I == coeffs(i));
        Z(x,y) = dct_I(x,y);
    end
    
    rec_I = idct2(Z);
    
end

