clear,clc

[A, map] = imread('Lena.bmp');
A = double(A);
figure(1)
imshow(A, map)
title('Original Image')


a = 0:1;
M = 2;
k = 0:1;

[X, Y] = meshgrid(a, k);


H_coeff = exp(1j * (2*pi.*X.*Y/M))

H0_num = H_coeff(1, :);
H0_den = [1];

H1_num = H_coeff(2, :);
H1_den = [1];

%H2_num = H_coeff(3, :);
H2_den = [1];

%H3_num = H_coeff(4, :);
H3_den = [1];


F0_num = exp(1j * 2*pi*0/M) * H_coeff(1, :);
F0_den = [1];

F1_num = exp(1j * 2*pi*1/M) * H_coeff(2, :);
F1_den = [1];

%F2_num = exp(1j * 2*pi*2/M) * H_coeff(3, :);
F2_den = [1];

%F3_num = exp(1j * 2*pi*3/M) * H_coeff(4, :);
F3_den = [1];


H0_num
H1_num
F0_num
F1_num

branch1 = branch(A, H0_num, H0_den, F0_num, F0_den, 2);
branch2 = branch(A, H1_num, H1_den, F1_den, F1_den, 2);
%branch3 = branch(A, H0_num, H0_den, F0_num, F0_den, 4);
%branch4 = branch(A, H0_num, H0_den, F0_num, F0_den, 4);


x_hat = branch1 + branch2;% + branch3 + branch4;

figure(2)
imshow(0.25*x_hat, map)
title('Reconstructed Image')
