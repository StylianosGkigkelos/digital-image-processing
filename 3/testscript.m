m = 6000;
n = 3000;
tic;
a = toeplitz(cos((0:2*m-1) .*pi), cos((0:2*n-1) .*pi));
x = toc;

tic;
b = zeros(2*m, 2*n);
for i = 1: 2*m
    for j = 1:2*n
        b(i,j) = (-1).^(i+j);
    end
end
y = toc;