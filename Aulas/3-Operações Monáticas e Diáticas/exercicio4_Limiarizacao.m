% LIMIARIZA��O
clear;
clc;
close all;

I = imread('castle.jpg');
I = im2double(I);
figure; imshow(I);
figure; imhist(I);

%limiariza��o
L = 0.7;
I2 = (I >= L);

figure; imshow(I2);
figure; imhist(I2);