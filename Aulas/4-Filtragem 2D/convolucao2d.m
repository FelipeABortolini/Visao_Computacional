clear;
clc;
close all;

% imagem de entrada
I = 100*ones(8,8,'uint8')

% kernel
K = ones(3,3);

% filtragem 2d (convolução 2d)
%I2 = conv2(I, K, 'same') % same = mantém a mesma dimensão da imagem de saída e entrada
I2 = conv2(I, K, 'valid') % valid = mantém na imagem de saída apenas o intervalo válido da imagem de entreada (bordas não completam o Kernel ficando inválido)