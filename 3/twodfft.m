function [linear, logarithmic] = twodfft(image)
    fourier = fft2(image);
    shifted = fftshift(fourier);
    shifted = abs(shifted);
    
    linear = transform(shifted,0,255);
    
    
    logarithm = log_transform(shifted, 2);
    logarithmic = transform(logarithm,0,255);
    
end

