clear;
clc;
close all;

I = imread('church2.png');
figure; imshow(I);

I2 = histeq(I);
figure; imshow(I2);
figure; imhist(I2);
