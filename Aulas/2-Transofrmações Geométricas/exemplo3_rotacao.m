clear;
close all;
clc;

I = imread('monalisa2.png');
figure; imshow(I);

theta = 30;

A = [cosd(theta), -sind(theta), 0;...
    sind(theta), cosd(theta), 0;...
    0 0 1];

T = affine2d(A.');
[I2, ref] = imwarp(I, T);

figure; imshow(I2, ref);
axis on;