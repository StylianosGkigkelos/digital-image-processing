function [final_absolute,final_phase] = getphase(image)   
    fourier = fft2(image);
    absolute = abs(fourier);
    phase = fourier./absolute;
    final_absolute = ifft2(absolute);%transform(ifft2(absolute),0, 255);
    final_phase = ifft2(phase);%transform(ifft2(phase), 0, 255);
end

