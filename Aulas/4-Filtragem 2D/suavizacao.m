clear;
clc;
close all;

I = imread('castle.jpg');
figure; imshow(I);

% filtro normalizado
w = 10;
K = 1/(w^2) * ones(w,w);

% filtragem 2d
I2 = filter2(K,I,'same');
%I2 = I2/255;
I2 = uint8(I2);

figure; imshow(I2);

% Apresentar resultado intermediário - continuar fazendo operações com os
% valores gerados pela filtragem
%figure; imagesc(I2);
%colormap gray;
%colorbar;