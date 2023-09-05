clear;
close all;
clc;

I = imread('monalisa2.png');
figure; imshow(I);

A = [-1, 0, 0;...
    0, 1, 0;...
    0 0 1];

T = affine2d(A.');
[I2, ref] = imwarp(I, T);

figure; imshow(I2, ref);
axis on;