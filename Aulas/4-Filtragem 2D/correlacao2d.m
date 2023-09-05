clear;
clc;
close all;

% imagem de entrada
I = 100*ones(8,8,'uint8')

% kernel
K = ones(3,3);

% filtragem 2d (correla��o 2d)
%I2 = filter2(K, I, 'same') % same = mant�m a mesma dimens�o da imagem de sa�da e entrada
I2 = filter2(K, I, 'valid') % valid = mant�m na imagem de sa�da apenas o intervalo v�lido da imagem de entreada (bordas n�o completam o Kernel ficando inv�lido)