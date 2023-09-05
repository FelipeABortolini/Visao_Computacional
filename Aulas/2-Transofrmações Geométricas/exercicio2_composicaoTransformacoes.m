clear;
clc;

I = imread('monalisa2.png');
figure; imshow(I);

%%
% Escalamento
ru = 0.5;
rv = 0.5;

A1 = [ru 0 0; 0 rv 0; 0 0 1];
tform = affine2d(A1.');
[I2, ~] = imwarp(I,tform);

% Rotação
alfa = 45;
A2 = [cosd(alfa), -sind(alfa), 0;...
     sind(alfa), cosd(alfa), 0;...
     0, 0, 1];

tform = affine2d(A2.');
[I3, ref] = imwarp(I2,tform);

figure; imshow(I3, ref); axis on;

%%
A = A1*A2;

tform = affine2d(A.');
[I4, ref] = imwarp(I,tform);

figure; imshow(I4, ref); axis on;