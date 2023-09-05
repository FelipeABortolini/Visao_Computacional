clear;
clc;
close all;

I = imread('chromakey.png');
% figure; imshow(I);
I_clouds = imread('clouds.png');
%imtool(I);

M = size(I,1);
N = size(I,2);

lab_ref = [77 0 0];

beta = 10;

I_copy = I;

R = I(:,:,1);
G = I(:,:,2);
B = I(:,:,3);

delta = 0.23;

Mr = (R >= 30) & (R <= 155);
Mg = (G >= 120) & (G <= 255);

I_2 = Mr & Mg;

%figure; imshow(I_2);

%alteração de contraste

I(I_2 == 0) = I(I_2 == 0) * beta;
% figure; imshow(I);
% figure; imshow(I_2);

I2 = rgb2lab(I);
I2 = uint8(I2);

% figure; imshow(I2);
% imtool(I2);





D = zeros(M,N,3,'uint8');

for u = 1:M
    for v = 1:N
        D(u,v) = sqrt((double(I2(u,v,1)) - lab_ref(1))^2 + (double(I2(u,v,2)) - lab_ref(2))^2 + (double(I2(u,v,3)) - lab_ref(3))^2);
    end
end
%imtool(D);
D = rgb2gray(D);
L = 3;
frame_segmented = (D < L);
negative_frame_segmented = 1 - im2double(frame_segmented);

I = I_copy.*uint8(negative_frame_segmented);
I_clouds = I_clouds.*uint8(frame_segmented);

frame_saida = I + I_clouds;

%figure; imshow(I);
%figure; imshow(I_clouds);
figure; imshow(frame_saida);
figure; imshow(frame_segmented);
figure; imshow(negative_frame_segmented);