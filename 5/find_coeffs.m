function [rec_I] = find_coeffs(image, percent)
    %numel = number of elements
    % Used round to bypass scientific notation
    multitude = round((percent / 100) * numel(image));
    
    fft_I = fft2(image);
    abs_fft_I = abs(fft_I);
    sorted_fft_I = sort(abs_fft_I(:));
    index = round(numel(image)- multitude + 1);
    coeffs = sorted_fft_I(index: size(sorted_fft_I));
    Z = zeros(size(image));
    
    for i = 1:size(coeffs)
        [x,y] = find(abs_fft_I == coeffs(i));
        Z(x,y) = fft_I(x,y);
    end
    
    rec_I = ifft2(Z);
    
    
end

