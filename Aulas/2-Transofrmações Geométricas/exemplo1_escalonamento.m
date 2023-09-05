clear;
close all;
clc;

I = imread('monalisa2.png');
figure; imshow(I);

ru = 1.5;
rv = 0.5;

A = [ru, 0, 0; 0 rv 0; 0 0 1];

T = affine2d(A.');
[I2, ref] = imwarp(I, T);

figure; imshow(I2, ref);
axis on;