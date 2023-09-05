% carrega arquivo do video de entrada 
video_entrada = VideoReader('Clouds.mp4');

% cria arquivo do video de saida
video_saida = VideoWriter('video_saida.avi'); 
video_saida.FrameRate = video_entrada.FrameRate; 
open(video_saida);

% Processamento
while hasFrame(video_entrada)
    % apresenta na tela a informacao do instante de tempo 
    % do quadro atual
    fprintf('time: %f\n', video_entrada.CurrentTime);

    % Obtem quadro (imagem) atual do video de entrada
    frame_entrada = readFrame(video_entrada,'native');

    % Processa a imagem (conversao RGB para nivel de cinza) 
    frame_saida = rgb2gray(frame_entrada);

    % Escreve imagem processada no video de saida
    writeVideo(video_saida,frame_saida); 
end

% Finaliza e salva o video de saida 
close(video_saida);
