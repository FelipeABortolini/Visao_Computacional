% POSTERIZA��O
clear;
clc;
close all;

I = imread('castle.jpg');

figure; imshow(I);
figure; imhist(I);

%posteriza��o
beta = 70;
I2 = beta*floor(I/beta);

figure; imshow(I2);
figure; imhist(I2);