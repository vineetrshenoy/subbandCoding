clear,clc

[A, map] = imread('Lena.bmp');
A = double(A);
figure(1)
imshow(A, map)


H0_num = [2 6 1 5 0 1];
H0_den = [1];

H1_num = [2 -6 1 -5 0 -1];
H1_den = [1];

F0_num = [2 6 1 5 0 1];
F0_den = [12 0 16 0 7 0 1];

F1_num = [-2 6 -1 5 0 1];
F1_den = [12 0 16 0 7 0 1];

branch1 = branch(A, H0_num, H0_den, F0_num, F0_den, 2);
branch2 = branch(A, H1_num, H1_den, F1_num, F1_den, 2);


x_hat = branch1 + branch2;

figure(3)
imshow(0.25*x_hat, map)








