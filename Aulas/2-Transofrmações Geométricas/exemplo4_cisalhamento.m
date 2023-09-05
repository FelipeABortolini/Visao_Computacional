clear;
close all;
clc;

I = imread('monalisa2.png');
figure; imshow(I);

su = 0.2;
sv = 0.5;

A = [1, su, 0;...
    sv, 1, 0;...
    0 0 1];

T = affine2d(A.');
[I2, ref] = imwarp(I, T);

figure; imshow(I2, ref);
axis on;