clear;
clc;
close all;

I = imread('capa.jpg');

figure; imshow(I);
[u1,v1] = ginput(1);
u1 = fix(u1);
v1 = fix(v1);

[u2,v2] = ginput(1);
u2 = fix(u2);
v2 = fix(v2);

[u3,v3] = ginput(1);
u3 = fix(u3);
v3 = fix(v3);

[u4,v4] = ginput(1);
u4 = fix(u4);
v4 = fix(v4);

[uf1,vf1] = ginput(1);
uf1 = fix(uf1);
vf1 = fix(vf1);

[uf2,vf2] = ginput(1);
uf2 = fix(uf2);
vf2 = fix(vf2);

points = [uf1, vf1; uf2, vf2];
line(points(:, 1), points(:, 2), 'Color', 'red', 'LineWidth', 2);

[uf3,vf3] = ginput(1);
uf3 = fix(uf3);
vf3 = fix(vf3);

points = [uf2, vf2; uf3, vf3];
line(points(:, 1), points(:, 2), 'Color', 'red', 'LineWidth', 2);

[uf4,vf4] = ginput(1);
uf4 = fix(uf4);
vf4 = fix(vf4);

points = [uf3, vf3; uf4, vf4];
line(points(:, 1), points(:, 2), 'Color', 'red', 'LineWidth', 2);

points = [uf4, vf4; uf1, vf1];
line(points(:, 1), points(:, 2), 'Color', 'red', 'LineWidth', 2);

A = [u1 v1 1 0 0 0 -uf1*u1 -uf1*v1;...
    0 0 0 u1 v1 1 -vf1*u1 -vf1*v1;...
    u2 v2 1 0 0 0 -uf2*u2 -uf2*v2;...
    0 0 0 u2 v2 1 -vf2*u2 -vf2*v2;...
    u3 v3 1 0 0 0 -uf3*u3 -uf3*v3;...
    0 0 0 u3 v3 1 -vf3*u3 -vf3*v3;...
    u4 v4 1 0 0 0 -uf4*u4 -uf4*v4;...
    0 0 0 u4 v4 1 -vf4*u4 -vf4*v4;];

b = [uf1; vf1; uf2; vf2; uf3; vf3; uf4; vf4];

h = inv(A)*b;

H = [h(1,1) h(2,1) h(3,1); h(4,1) h(5,1) h(6,1); h(7,1) h(8,1) 1];

T = projective2d(H.');
[I2, ref] = imwarp(I, T);

figure; imshow(I2, ref);
axis on;