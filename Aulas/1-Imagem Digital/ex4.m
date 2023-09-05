clear;
close all;
clc;

M = 200;
N = 400;

I = zeros(M,N,'uint8');

for u = 1:N
    y = fix(255*(u-1)/399);
    
    I(:,u) = y;
end

figure;
imshow(I);


