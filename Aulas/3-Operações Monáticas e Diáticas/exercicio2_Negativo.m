clear;
clc;
close all;

I = imread('castle.jpg');
I = im2double(I);
figure; imshow(I);
figure; imhist(I);

%obtendo negativo
I2 = 1 - I;

figure; imshow(I2);
figure; imhist(I2);