%% RGB
clear;
close all;
clc;

I = imread('flowers4.png');

figure; imshow(I);
% Mostra apenas o vermelho da imagem:
figure; imshow(I(:,:,1));
% Mostra apenas o verde da imagem:
figure; imshow(I(:,:,2));
% Mostra apenas o azul da imagem:
figure; imshow(I(:,:,3));
imtool(I);

%% HSV
clear;
close all;
clc;

I = imread('flowers4.png');

I2 = rgb2hsv(I);

figure; imshow(I2);
% Mostra apenas a cor da imagem:
figure; imshow(I2(:,:,1));
% Mostra apenas a saturação da imagem, quanto maior menos esbranquiçada:
figure; imshow(I2(:,:,2));
% Mostra apenas o brilho da imagem, quanto maior menos escuro:
figure; imshow(I2(:,:,3));

imtool(I2);

%% Escala Cinza

clear;
close all;
clc;

I = imread('flowers4.png');

R = I(:,:,1);
G = I(:,:,2);
B = I(:,:,3);

I3 = 0.2989*R + 0.5860*G + 0.1140*B;

figure; imshow(I3);

