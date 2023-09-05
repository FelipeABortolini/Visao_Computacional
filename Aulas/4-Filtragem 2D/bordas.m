clc;
clear;
close all;

I = imread('castle.jpg');
figure; imshow(I);

% derivada em relação a u
Ku = [-1, 0, 1; -2, 0, 2; -1, 0, 1];

Iu = filter2(Ku, I, 'same');
figure; imagesc(Iu);
colormap gray;
colorbar;

% derivada em relação a v
Kv = Ku.';

Iv = filter2(Kv, I, 'same');
figure; imagesc(Iv);
colormap gray;
colorbar;

M = sqrt(Iu.^2 + Iv.^2);
Theta = atan2(Iv,Iu);

figure; imagesc(M);
colormap gray;
colorbar;

figure; imagesc(Theta);
colormap hsv;
colorbar;

B = M > 250;
figure; imshow(B);