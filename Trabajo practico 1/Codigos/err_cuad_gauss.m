%calcula el error cuadratico medio entre los puntos medidos y la expresion de la gaussiana para ajustar
function [err_cuad] = err_cuad_gauss(parametros, puntos)
   
   w = parametros(1);
   I_0 = parametros(2);

   x = puntos(1, :);
   y = puntos(2, :);
     
   err_cuad = sum((y - arrayfun(@(x) gaussiana(x, 0, w, I_0),x)).^2);

end
