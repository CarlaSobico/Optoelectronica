clear all;
close all;
parametrosx=ajuste_x(.55,.7,.15,'mediciones/haz_300mm.jpg');
parametrosy=ajuste_y(.55,.7,.25,'mediciones/haz_300mm.jpg');

Ancho= (parametrosx(1)+parametrosy(1))/2
Intensidad=(parametrosx(2)+parametrosy(2))/2

