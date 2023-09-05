clc;
clear;
close all;

sig = 2;
w = 6*sig+1;

K = fspecial('gaussian', w, sig);

figure;surf(K);
zlim([0, 0.25]);
xlim([1,w]);
ylim([1,w]);

I = imread('castle.jpg');
figure; imshow(I);

I2 = filter2(K, I, 'same');
figure; imshow(I2/255);