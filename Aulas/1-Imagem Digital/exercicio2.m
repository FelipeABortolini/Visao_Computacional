clear;
close all;
clc;

M = 100;
N = 100;

I = zeros(M,N,'uint8');

v0 = 50;
u0 = 50;

for r = 0:0.01:30
    y = fix(-255/30*r + 255);
    for theta = 0:360
        vc = ceil(v0 + r*sind(theta));
        uc = ceil(u0 + r*cosd(theta));
        I(vc,uc) = y;
    end
end

figure;
imshow(I);