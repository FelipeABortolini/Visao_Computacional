clear;
close all;
clc;

I = imread('castle.jpg');

L = 170;

O = (I >= L);

% M = size(I,1);
% N = size(I,2);

% O = zeros(M,N,'uint8');
%O = zeros(size(I),'uint8');

% for v = 1:M
%     for u = 1:N
%         if(I(v,u) > L)
%             O(v,u) = 255;
%         end
%     end
% end

imtool(I);
figure; imshow(I);
figure; imshow(O);