clear;
close all;
clc;

M = 100;
N = 100;

I = zeros(M,N,'uint8');

v0 = 50;
u0 = 50;
R = 30;

for r = 0:R
    for theta = 0:360
        vc = ceil(v0 + r*sind(theta));
        uc = ceil(u0 + r*cosd(theta));
        I(vc,uc) = 255;
    end
end

figure;
imshow(I);