function [] = ex2()
    a = load('clock.mat');
    a = a.y_cl;
    
    b = load('flowers.mat');
    b = b.y_fl;
    
    [a_filtered, a_laplaced] = laplacian_filter(a);
    figure(1)
    subplot(1,3,1);
    imshow(uint8(a));
    title('Original');
    subplot(1,3,2);
    imshow(uint8(a_filtered));
    title('Filter');
    subplot(1,3,3);
    imshow(uint8(a_laplaced));
    title('After Laplace');
    
    [b_filtered, b_laplaced] = laplacian_filter(b);
    figure(2)
    subplot(1,3,1);
    imshow(uint8(b));
    title('Original');
    subplot(1,3,2);
    imshow(uint8(b_filtered));
    title('Filter');
    subplot(1,3,3);
    imshow(uint8(b_laplaced));
    title('After Laplace');
end

