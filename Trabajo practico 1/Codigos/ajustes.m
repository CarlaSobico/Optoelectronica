clear all;
close all;
parametrosx=ajuste_x(.55,.7,.15,'mediciones/haz_300mm.jpg','haz_300mm_x_');
parametrosy=ajuste_y(.55,.7,.25,'mediciones/haz_300mm.jpg','haz_300mm_y_');

Ancho1= (parametrosx(1)+parametrosy(1))/2;
Intensidad1=(parametrosx(2)+parametrosy(2))/2;

parametrosx=ajuste_x(.55,.7,.15,'mediciones/haz_305mm.jpg','haz_305mm_x_');
parametrosy=ajuste_y(.55,.7,.25,'mediciones/haz_305mm.jpg','haz_305mm_y_');

Ancho2= (parametrosx(1)+parametrosy(1))/2;
Intensidad2=(parametrosx(2)+parametrosy(2))/2;

parametrosx=ajuste_x(.55,.7,.15,'mediciones/haz_310mm.jpg','haz_310mm_x_');
parametrosy=ajuste_y(.55,.7,.25,'mediciones/haz_310mm.jpg','haz_310mm_x_');

Ancho3= (parametrosx(1)+parametrosy(1))/2;
Intensidad3=(parametrosx(2)+parametrosy(2))/2;

%Ancho_haz_normal= mean(Ancho1,Ancho2,Ancho3);