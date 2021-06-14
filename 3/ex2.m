function [] = ex2()
    lenna = load('lenna');
    lenna = lenna.x_le;
    
    [lenna_value, lenna_phase] = getphase(lenna);
    figure(1);
    subplot(1,3,1);
    imshow(uint8(lenna));
    title('Original Lenna');
    subplot(1,3,2);
    imshow(uint8(lenna_value));
    title('Lenna''s magnitude');
    subplot(1,3,3);
    imshow(uint8(transform(lenna_phase, 0, 255)));
    title('Lenna''s phase');
    
    flowers = load('flowers');
    flowers = flowers.x_fl;
    
    [flowers_value, flowers_phase] = getphase(flowers);
    figure(2);
    subplot(1,3,1);
    imshow(uint8(flowers));
    title('Original Flowers');
    subplot(1,3,2);
    imshow(uint8(flowers_value));
    title('Flowers'' magnitude');
    subplot(1,3,3);
    imshow(uint8(transform(flowers_phase, 0, 255)));
    title('Flowers'' phase');
     
     
    %a = recreate_image(lenna_value, flowers_phase);
    a = recreate_image(lenna, flowers);
    figure(3);
    imshow(uint8(transform(a,0,255)));
    title('Lenna''s magnitude - Flowers'' phase');
    
    b = recreate_image(flowers, lenna);
    figure(4);
    %imshow(uint8(transform(b,0,255)));
    imshow(uint8(b));
    title('Flowers''s magnitude - Lenna''s phase');
end


