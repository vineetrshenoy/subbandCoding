clear,clc

[A, map] = imread('Lena.bmp');
A = double(A);
figure(1)
title('Original')
imshow(A, map)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% PART 1


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

figure(2)
title('Part 1')
imshow(0.25*x_hat, map)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% PART 2

N   = 5;        % FIR filter order
Fp  = 24e3;       % 20 kHz passband-edge frequency
Fs  = 96e3;       % 96 kHz sampling frequency
Rp  = 0.00057565; % Corresponds to 0.01 dB peak-to-peak ripple
Rst = 1e-4;       % Corresponds to 80 dB stopband attenuation

eqnum = firceqrip(N,Fp/(Fs/2),[Rp Rst],'passedge'); % eqnum = vec of coeffs


H0_num = [0.0399, -0.1287, 0.6179, 0.6179, -0.1287, 0.0399];  % N Even;
H0_den = [1];

H1_num = [0.0399, 0.1287, 0.6179, -0.6179, -0.1287, -0.0399];
H1_den = [1];

F0_num = [0.0399, -0.1287, 0.6179, 0.6179, -0.1287, 0.0399];
F0_den = [1];

F1_num = -1*[0.0399, 0.1287, 0.6179, -0.6179, -0.1287, -0.0399];
F1_den = [1];

branch1 = branch(A, H0_num, H0_den, F0_num, F0_den, 2);
branch2 = branch(A, H1_num, H1_den, F1_num, F1_den, 2);


x_hat = branch1 + branch2;

figure(3)
title('Part 2')
imshow(x_hat, map)




