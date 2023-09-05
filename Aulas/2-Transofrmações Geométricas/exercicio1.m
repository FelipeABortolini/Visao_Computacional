clear;
clc;

I = imread('monalisa2.png');
figure; imshow(I);

num_linhas = 200;
num_colunas = 300;

I2 = escala_imagem(I, num_linhas, num_colunas);

figure; imshow(I2);


%% Função de escalamento de imagem
function I2 = escala_imagem(I, num_linhas, num_colunas)

I = im2double(I);
I2 = zeros(num_linhas,num_colunas,'double');

num_linhas_original = size(I,1);
num_colunas_original = size(I,2);

su = num_colunas/num_colunas_original;
sv = num_linhas/num_linhas_original;

A = [su, 0; 0, sv];
Ai = inv(A);

for ip = 1:num_linhas
    for jp = 1:num_colunas
        
        x = Ai * [jp; ip];
        u = x(1);
        v = x(2);
        
        [u1, u2, v1, v2] = vizinhos_proximos(u, v, size(I,1), size(I,2));
        
        X = (u2-u)/(u2-u1) * I(v1,u1) + (u-u1)/(u2-u1) * I(v1,u2);
        
        Y = (u2-u)/(u2-u1) * I(v2,u1) + (u-u1)/(u2-u1) * I(v2,u2);
        
        Z = (v2-v)/(v2-v1) * X + (v-v1)/(v2-v1) * Y;
        
        I2(ip,jp) = Z;
        
    end
end

end

function [u1, u2, v1, v2] = vizinhos_proximos(u, v, Mmax, Nmax)
u1 = floor(u);
u2 = ceil(u);
v1 = floor(v);
v2 = ceil(v);

u1 = verifica_intervalo(u1,1,Nmax);
u2 = verifica_intervalo(u2,1,Nmax);
v1 = verifica_intervalo(v1,1,Mmax);
v2 = verifica_intervalo(v2,1,Mmax);

if u1 == u2
    if u1 == 1
        u2 = u2 + 1;
    else
        u1 = u1 - 1;
    end
end

if v1 == v2
    if v1 == 1
        v2 = v2 + 1;
    else
        v1 = v1 - 1;
    end
end

end

function x = verifica_intervalo(x, vmin, vmax)

if x < vmin
    x = vmin;
elseif x > vmax
    x = vmax;
end

end