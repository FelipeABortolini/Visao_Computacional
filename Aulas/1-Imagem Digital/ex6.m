clear;
close all;
clc;

M = 200;
N = 400;

I = zeros(M,N,3,'double');

I(51:150,21:380, 1) = 1;
I(51:150,21:380, 2) = 1;

figure;
imshow(I);
