pkg load image

clc
clear all
close all

 
%Rodar 20 imagens (consecutivas) do banco
%result = [0, 0, 0, 0, 0, 0, 0, 0, 0];
%for k=1:25
%  printf("%d vez",i);
%  nomeImg = strcat('Banco/IM (', num2str(k), ').jpg');
%  im = imread(nomeImg);
%  imNova = RemoverFundo(im); % chama a funcao remover fundo e guarda na nova imagem
%  result = classificacao(imNova, result); %chama a funcao classificacao para a imNova
%  title(strcat('Percentual de Total de moedas: ',int2str(result)));
%  [total,valor] = Resultado(result); %Porcentagem de moedas de cada valor em relacaoo a quantidade total de moedas
%end

%Carrega 1 imagem usando a interface
[fileName, pathName] = uigetfile({'*.jpg'}, 'Selecione a imagem para processar');
imagem = strcat(pathName, fileName);
im = imread(imagem);
figure, imshow(im);

imNova = RemoverFundo(im); % chama a funcao remover fundo e guarda na nova imagem
%figure, imshow(imNova);
result = [0, 0, 0, 0, 0, 0, 0, 0, 0]; %vetor para contagem da classificacao
result = classificacao(imNova, result); %chama a funcao classificacao para a imNova
title(strcat('Percentual de Total de moedas: ',int2str(result)));
[total, valor] = Resultado(result);


