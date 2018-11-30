function [classes, valor] = Resultado(result)
  totalMoedas = sum(result);
  
  classes = [0, 0, 0, 0, 0, 0, 0, 0, 0];
  
  classes(1) = (result(1)/totalMoedas)*100;
  classes(2) = (result(2)/totalMoedas)*100;
  classes(3) = (result(3)/totalMoedas)*100;
  classes(4) = (result(4)/totalMoedas)*100;
  classes(5) = (result(5)/totalMoedas)*100;
  classes(6) = (result(6)/totalMoedas)*100;
  classes(7) = (result(7)/totalMoedas)*100;
  classes(8) = (result(8)/totalMoedas)*100;
  
  valor = result(9);
  
endfunction