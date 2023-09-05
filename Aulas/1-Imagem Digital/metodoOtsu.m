clear;
close all;
clc;

I = imread('castle.jpg');

L = 255*graythresh(I);

O = (I >= L);

figure; imshow(I);
figure; imshow(O);