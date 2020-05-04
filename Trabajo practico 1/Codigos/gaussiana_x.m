%funcion gaussiana para el ajuste de la intensidad
function [I] = gaussiana(x, y, w, I_0)
   
   I = I_0*exp((-2*(x.^2 + y.^2))/(w.^2));

end
