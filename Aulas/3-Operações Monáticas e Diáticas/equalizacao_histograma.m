% EQUALIZAÇÃO DE HISTOGRAMA
clear;
clc;
close all;

I = imread('church2.png');
figure; imshow(I);

%histograma
[counts, x] = imhist(I);
figure; bar(x, counts);
xlabel('valor do pixel');
ylabel('contagem');
title('histograma');

%pdf - função densidade de probabilidade
pdf = counts/sum(counts);
figure; bar(x, pdf);
xlabel('valor do pixel');
title('função densidade de probabilidade');

%pdf - função de distribuição acumulada
cdf = cumsum(pdf);
figure; bar(x, cdf);
xlabel('valor do pixel');
title('função de distribuição acumulada');

%função de processamento
T = 255*cdf;
figure; bar(x, T);
xlabel('valor do pixel');
title('função de processamento');
xlim([0,255]);
ylim([0,255]);

% equalização
I2 = zeros(size(I), 'uint8');

for v = 1:size(I,1)
    for u = 1:size(I,2)
        indice = I(v,u)+1;
        I2(v,u) = floor(T(indice));
    end
end
figure; imshow(I2);