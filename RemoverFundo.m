
function nova = RemoverFundo(im)
  pkg load image
  
  R = im(:,:,1);
  B = im(:,:,3);
  
  %Transformando a imagem em tons de cinza através da subtração das camadas azul e vermelha.
  im2 = B-R;
  
  %Histograma da imagem em escala de cinza.
  h = imhist(im2);
  
  %Apos a transformacao em escala de cinza, o maior pico da imagem 
  %torna-se o indice 1, por isso eh salvo apenas o indice do segundo pico
  %Acha o segundo maior pico do histograma
  max2 = 0;
  index1 = 0;
  for i=2:256
    if(h(i)>max2)
      max2 = h(i);
      index1 = i;
    end
  end

  %Acha o vale entre os dois picos do histograma
  min1 = max(h);
  index2 = 0;
  for i=2:index1
    if(h(i) < min1)
      min1 = h(i);
      index2 = i;
    end
  end

  %Limiariza a imagem a partir do indice do vale do histograma
  im3 = ~(im2>index2);

  %Gera a nova imagem colorida sem o fundo azul
  nova = zeros(size(im,1),size(im,2),3, 'uint8');
  nova = im.*im3;
%  imwrite(nova, 'teste2.jpg');
end

