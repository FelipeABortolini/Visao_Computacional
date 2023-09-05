clear;
clc;
close all;

I = imread('castle.jpg');
I = im2double(I);
figure; imshow(I);
figure; imhist(I);

%alteração de contraste
alfa = 1.5;
I2 = I * alfa;

%saturação
I2(I2 > 1) = 1;
I2(I2 < 0) = 0;

figure; imshow(I2);
figure; imhist(I2);