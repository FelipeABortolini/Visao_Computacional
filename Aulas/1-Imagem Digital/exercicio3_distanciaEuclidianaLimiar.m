clear;
close all;
clc;

%I = imread('tomato_124.jpg');
I = imread('circulos.png');
I = im2double(I);

M = size(I,1);
N = size(I,2);

figure; imshow(I);
[u,v] = ginput(1);

u = fix(u);
v = fix(v);

pixel_r = I(v,u,1);
pixel_g = I(v,u,2);
pixel_b = I(v,u,3);

D = zeros(M,N,3,'double');

for u1 = 1:M
    for v1 = 1:N
        D(v1,u1) = sqrt((I(v1,u1)-pixel_r)^2 + (I(v1,u1)-pixel_g)^2 + (I(v1,u1)-pixel_b)^2);
    end
end

L = 0.5;

O = (I <= L);

figure; imshow(O);