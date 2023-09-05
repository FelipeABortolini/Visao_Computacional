clear;
close all;
clc;

%I = imread('tomato_124.jpg');
I = imread('circulos.png');

M = size(I,1);
N = size(I,2);

figure; imshow(I);
[u,v] = ginput(1);

u = fix(u);
v = fix(v);

pixel_r = I(v,u,1);
pixel_g = I(v,u,2);
pixel_b = I(v,u,3);

R = I(:,:,1);
G = I(:,:,2);
B = I(:,:,3);

delta = 0.55;

% Mr = zeros(M,N,'double');
% Mg = zeros(M,N,'double');
% Mb = zeros(M,N,'double');

% for i = 1:M
%     for j = 1:N
%         if(R(i,j) >= pixel_r*(1-var) && R(i,j) <= pixel_r*(1+var))
%             Mr(i,j) = 1;
%         end
%         if(G(i,j) >= pixel_g*(1-var) && G(i,j) <= pixel_g*(1+var))
%             Mg(i,j) = 1;
%         end
%         if(B(i,j) >= pixel_b*(1-var) && B(i,j) <= pixel_b*(1+var))
%             Mb(i,j) = 1;
%         end
%     end
% end

Mr = (R >= pixel_r*(1-delta)) & (R <= pixel_r*(1+delta));
Mg = (G >= pixel_g*(1-delta)) & (G <= pixel_g*(1+delta));
Mb = (B >= pixel_b*(1-delta)) & (B <= pixel_b*(1+delta));

%figure; imshow(Mr);
%figure; imshow(Mg);
%figure; imshow(Mb);

M = Mr & Mg & Mb;

figure; imshow(M);