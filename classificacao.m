function result = classificacao(im, result);
pkg load image
%funcao para identificao dos objetos  
%close all
%clear all 
%lendo uma imagem

%im = imread('Muitas2.jpg');
%figure(1),imshow(im);
%transformando em tons de cinza 
%teste =1;
cinza = rgb2gray(im);
%figure(2),imshow(cinza);
%criando uma nova imagem chamada de mascara sao com zeros 
mascara = (zeros (size(cinza,1),size(cinza,2)));
%binarizando a imagem Obs essa parte do codigo eh um pouco lenta pq a imagem
%eh grande
for i = 1:size(im,1)
  for j = 1:size(im,2)
    if(cinza(i,j) > 1)
      mascara(i,j) = 255;
    
    end
  end
 end
% figure(3),imshow(mascara);
%erodindo e dilatando a imagem com o imopen para tirar os pequenos pontos
%ao redor das imagens
%N = 4;
se = strel('disk',6,0);
mascara = imopen(mascara,se);
#figure(4),imshow(mascara)
%agora vamos rotular os objetos da imagem
%imRotulo eh a imagem que possui os rotulos 
%Total eh o numero de objetos da imagem


[imRotulo, Total] = bwlabel(mascara);
%teste = 4;
%separando por regioes 
im4 = regionprops(imRotulo,'Area','perimeter','Centroid');
Total
%variaveis dos resultados 
cont5bronze= 0;
cont5Prata= 0;
cont10Prata= 0;
cont10Ouro= 0;
cont25Prata= 0;
cont25Ouro= 0;
cont50Prata = 0;
cont1real = 0;
contTotal = 0;
totalMoedas = 0;
%descritores que podem e serão utilizados 
%Area
%Diametro
%Perimetro
%Cor o mais temido 
for i=1:Total
    area = im4(i).Area;
    peri = im4(i).Perimeter;
    cent = im4(i).Centroid;
    Cores  = cor(im,cent(1),cent(2));

%    i 
%    area
%    peri
%    cent
%    Cores
%    i
    
    %Resultados(area);
    %colocar tudo como funcao 
    %moedas de 5 centavos prata
    if ((area > 26000 && area < 28000) && (peri > 590 && peri <610)&&(Cores > 135 && Cores <190))
        cont5Prata = cont5Prata + 1;
        totalMoedas = totalMoedas + 1;
        contTotal = contTotal + 0.05;
%    end
        %moedas de 5 bronze
    elseif ((area >29000  && area <30000)&&(peri >630 && peri<670 ) &&(Cores > 090 && Cores <120))
			cont5bronze = cont5bronze + 1;
			totalMoedas = totalMoedas +1;
			contTotal = contTotal + 0.05;
%    end
        %moedas de 10 ouro
    elseif ((area > 23000 && area < 24000)&&(peri > 560 && peri < 600) &&(Cores > 100 && Cores <190))
			cont10Ouro = cont10Ouro + 1;
			totalMoedas = totalMoedas +1;
			contTotal = contTotal + 0.10;
%    end
      %moedas de 10 cents prata 
	  elseif ((area > 27000 && area < 28300)&&(peri > 615 && peri < 650)&&(Cores > 130 && Cores < 200))
			cont10Prata = cont10Prata + 1;
			totalMoedas = totalMoedas +1;
			contTotal = contTotal + 0.10;
%    end
      %moedas de 25 ouro
	  elseif ((area > 38000 && area < 39000)&&(peri > 715 && peri < 745)&&(Cores > 140 && Cores < 160))
			cont25Ouro = cont25Ouro + 1;
			totalMoedas = totalMoedas +1;
			contTotal = contTotal + 0.25;
%    end
      %moedas de 25 prata
    elseif ((area > 33000 && area < 34000)&&(peri > 680 && peri < 700)&&(Cores > 160 && Cores <190))
			cont25Prata = cont25Prata + 1;
			totalMoedas = totalMoedas +1;
			contTotal = contTotal + 0.25;
%    end 
      %moedas de 50 prata e grande 
	  elseif ((area > 28000 && area < 29000)&&(peri > 600 && peri < 640)&&( Cores > 160 && Cores < 180))
			cont50Prata = cont50Prata + 1;
			totalMoedas = totalMoedas +1;
			contTotal = contTotal + 0.50;
%    end
      %50 grande
     % moedas de 1 real
    elseif((area >40000 && area < 50000)&&(peri > 700 && peri < 800))
        cont1real = cont1real + 1;
        totalMoedas = totalMoedas + 1;
        contTotal = contTotal+ 1.00;
    end
    
end

result(1) = result(1) + cont5bronze;
result(2) = result(2) + cont5Prata;
result(3) = result(3) + cont10Prata;
result(4) = result(4) + cont10Ouro;
result(5) = result(5) + cont25Prata;
result(6) = result(6) + cont25Ouro;
result(7) = result(7) + cont50Prata;
result(8) = result(8) + cont1real;
result(9) = result(9) + contTotal;

%if para printar a quatidade de moedas individuais 
%if(cont5Prata > 0)
    fprintf('Quantidade de moedas de 5 centavos de prata %d\n', cont5Prata);
%    end
%if(cont5bronze > 0)
    fprintf('Quantidade de moedas de 5 centavos de Bronze %d\n', cont5bronze);
%    end
%if(cont10Prata > 0)
    fprintf('Quantidade de moedas de 10 centavos de prata %d\n', cont10Prata);
%    end
%if(cont10Ouro > 0)
    fprintf('Quantidade de moedas de 10 centavos de ouro %d\n', cont10Ouro);
%    end
%if(cont25Prata > 0)
    fprintf('Quantidade de moedas de 25 centavos de prata %d\n', cont25Prata);
%    end
%if(cont25Ouro > 0)   
    fprintf('Quantidade de moedas de 25 centavos de ouro %d\n', cont25Ouro);
%    end
%if(cont50Prata > 0)
    fprintf('Quantidade de moedas de 50 centavos de prata %d\n', cont50Prata);
%    end
%if(cont1real > 0)    
    fprintf('Quantidade de moedas de 1 Real %d\n', cont1real);
%end


%fprintf('Quantidade total de moedas %d\n', totalMoedas);
fprintf('Total em dinheiro %.2f\n',contTotal);

