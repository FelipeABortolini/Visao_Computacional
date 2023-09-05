clc;
close all;
clear;

img_outdoor = imread('outdoor.jpg');
video_chromakey_clouds = VideoReader('video_saida.avi');

video_outdoor = VideoWriter('video_outdoor.avi'); 
video_outdoor.FrameRate = video_chromakey_clouds.FrameRate; 
open(video_outdoor);

frame1 = readFrame(video_chromakey_clouds,'native');

M_video = size(frame1,1);
N_video = size(frame1,2);

M_outdoor = size(img_outdoor,1);
N_outdoor = size(img_outdoor,2);

u1 = 1;
v1 = 1;
u2 = N_outdoor;
v2 = 1;
u3 = 1;
v3 = M_outdoor;
u4 = N_outdoor;
v4 = M_outdoor;

uf1 = 129;
vf1 = 64;
uf2 = 523;
vf2 = 160;
uf3 = 122;
vf3 = 328;
uf4 = 536;
vf4 = 365;
% M = 536 - 122 = 414
% N = 365 - 64 = 301

R = img_outdoor(:,:,1);
G = img_outdoor(:,:,2);
B = img_outdoor(:,:,3);
Mr = (R >= 245);
Mg = (G >= 245);
Mb = (B >= 245);
I_molde = Mr & Mg & Mb;
I_molde_negativo = 1 - I_molde;

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

while hasFrame(video_chromakey_clouds)
    
    fprintf('time: %f\n', video_chromakey_clouds.CurrentTime);
    
    frame_entrada = readFrame(video_chromakey_clouds,'native');
    
    % escalonamento
    ru = N_outdoor/N_video;
    rv = M_outdoor/M_video;
    A = [ru, 0, 0; 0 rv 0; 0 0 1];
    T_esc = affine2d(A.');
    [I2, ref] = imwarp(frame_entrada, T_esc);

    % homografia planar
    [I3, ref] = imwarp(I2, T);
    
    I4 = zeros(M_outdoor,N_outdoor,3,'uint8');
    
    inicio_x = vf1;
    inicio_y = uf3;
    
    I4(inicio_x:(inicio_x+302-1),inicio_y:(inicio_y+415-1),:) = I3;

    img_outdoor = im2double(img_outdoor) .* I_molde_negativo;
    
    frame_saida = im2uint8(img_outdoor) + I4;

    writeVideo(video_outdoor,frame_saida); 
end

close(video_outdoor);