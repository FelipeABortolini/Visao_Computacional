clc;
close all;
clear;

I = imread('castle.jpg');
I = im2double(I);
figure; imshow(I);

%suavização
sig = 2;
w = 6*sig+1;
K = fspecial('gaussian', w, sig);

I = filter2(K, I, 'same');

Ku = [-1 0 1; -2 0 2; -1 0 1];
Iu = filter2(Ku, I, 'same');

Kv = Ku.';
Iv = filter2(Kv, I, 'same');

M = sqrt(Iu.^2 + Iv.^2);
figure; imagesc(M);
colormap gray;
colorbar;

L = 0.5;
Ib = M > L;

figure; imshow(Ib);