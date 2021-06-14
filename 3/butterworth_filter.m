function [final_image,H] = butterworth_filter(noisy_image, order , d0)
    [m, n] = size(noisy_image);
    p = 2*m;
    q = 2*n;
    
    fp = zeros(2.*m, 2.*n);
    fp(1:m,1:n) = noisy_image;
    % This is used instead of "for" loops using the (-1)^(x+y)
    % We use the cosine function to produce 1 and -1
    % k * pi = 1 for every even integer k and
    % k * pi = -1 for every odd one.
    % We then create a toeplitz matrix - a matrix where every cell of a 
    % diagonal has the same value.
    % Since we create the matrix with values 1 and -1 alternating it
    % produces the same result as (-1)^(x+y) for x+y even (1) and odd (-1)
    temp = toeplitz(cos((0:2*m-1) .*pi), cos((0:2*n-1) .*pi));
    
    g = fp.*temp;
    G = fft2(g);
    
    % Create the filter
    H = zeros(p,q);
    center = [round(p/2) round(q/2)];
    
    D = zeros(p,q);
    for u = 1:p
        for v = 1:q
            D(u,v) = euc_distance([u v], center);
            
        end
    end
    H = 1./(1 + (D./d0).^(2.*order));
    S = G.*H;
    s = real(ifft2(S)).*temp;
    
    final_image = abs(s(1:m,1:n));
end

