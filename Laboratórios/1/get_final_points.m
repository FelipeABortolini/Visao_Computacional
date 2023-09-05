clc;
close all;
clear;

img_outdoor = imread('outdoor.jpg');

figure; imshow(img_outdoor);
[u1,v1] = ginput(1);

[u2,v2] = ginput(1);
u2 = fix(u2);
v2 = fix(v2);

[u3,v3] = ginput(1);
u3 = fix(u3);
v3 = fix(v3);

[u4,v4] = ginput(1);
u4 = fix(u4);
v4 = fix(v4);