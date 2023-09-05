clear;
close all;
clc;

I = imread('monalisa2.png');
figure; imshow(I);

u0 = 50;
v0 = 100;

A = [1, 0, u0; 0 1 v0; 0 0 1];

T = affine2d(A.');
[I2, ref] = imwarp(I, T);

ref.XWorldLimits(1) = ref.XWorldLimits(1) - u0;
ref.YWorldLimits(1) = ref.YWorldLimits(1) - v0;

[I3, ref] = imwarp(I, T, 'OutputView', ref);

figure; imshow(I3, ref);
axis on;