clear,clc

[A, map] = imread('Lena.bmp');
A = double(A);
figure(1)
imshow(A, map)

branch1 = branch(A, [2 1], [-3 2], 2);
branch2 = branch(A, [3 2], [2 -1], 2);


x_hat = branch1 + branch2;

figure(3)
imshow(0.5*x_hat, map)








