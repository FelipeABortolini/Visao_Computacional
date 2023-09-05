clc;
close all;
clear;

video_chromakey = VideoReader('Chromakey.mp4');
video_clouds = VideoReader('Clouds.mp4');

video_saida = VideoWriter('video_saida.avi'); 
video_saida.FrameRate = video_chromakey.FrameRate; 
open(video_saida);

frame1 = readFrame(video_chromakey,'native');

M = size(frame1,1);
N = size(frame1,2);

lab_ref = [77 0 0];

beta = 10;

while hasFrame(video_chromakey)
    
    fprintf('time: %f\n', video_chromakey.CurrentTime);
    
    frame_entrada = readFrame(video_chromakey,'native');
    frame_clouds = readFrame(video_clouds,'native');
    
    frame_entrada_copy = frame_entrada;

    R = frame_entrada(:,:,1);
    G = frame_entrada(:,:,2);
    B = frame_entrada(:,:,3);

    Mr = (R >= 60) & (R <= 100);
    Mg = (G >= 190) & (G <= 230);
    Mb = (B >= 165) & (B <= 220);

    I = Mr & Mg & Mb;
    frame_entrada(I == 0) = frame_entrada(I == 0) * beta;

    frame_lab = rgb2lab(frame_entrada);
    frame_lab = uint8(frame_lab);

    D = zeros(M,N,3,'uint8');

    for u = 1:M
        for v = 1:N
            D(u,v) = sqrt(double((frame_lab(u,v,1) - lab_ref(1))^2 + (frame_lab(u,v,2) - lab_ref(2))^2 + (frame_lab(u,v,3) - lab_ref(3))^2));
        end
    end

    D = rgb2gray(D);
    L = 3;
    frame_segmented = (D < L);
    negative_frame_segmented = 1 - im2double(frame_segmented);

    I_chromakey = frame_entrada_copy.*uint8(negative_frame_segmented);
    I_clouds = frame_clouds.*uint8(frame_segmented);

    frame_saida = I_chromakey + I_clouds;

    writeVideo(video_saida,frame_saida); 
    
end

close(video_saida);