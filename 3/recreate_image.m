function [image] = recreate_image(imageV, imageP)
    fourier1 = fft2(imageV);
    absolute = abs(fourier1);
    fourier2 = fft2(imageP);
    phase = fourier2./abs(fourier2);
    image = ifft2(absolute .* phase);
    
end

