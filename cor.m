function ResultCor = cor(im,Cj,Ci)

pkg load image

corR = 0;
%corR = uint16(corR);
corG = 0;
%corG = uint16(corG);
corB = 0;
%corB = uint16(corB);

cont =0;
 i = fix(Ci); %fixa valor
 j = fix(Cj);
  
        corR = im(i,j,1);
        corG = im(i,j,2);
        corB = im(i,j,3);
        cont = cont+1; %soma das camadas
        
%transformando em inteiro de 16 bits
R = uint16(corR);
G = uint16(corG);
B = uint16(corB);
ResultCor =(R+B+G)/3;
