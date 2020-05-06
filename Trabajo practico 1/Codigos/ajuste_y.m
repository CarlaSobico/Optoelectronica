close all;
clear all;

img01 = im2double(rgb2gray(imread('mediciones\haz_310mm.jpg')));

figure(1);
imshow(img01);
%axis('tic', 'label');
img01=img01'%Transpongo la matriz
[columns_img01 rows_img01]=size(img01)

%busco por filas las que estan por arriba de un umbral y les calculo el ancho, luego busco la mas ancha
for i = 1:columns_img01
    y_umbrales01 = find(img01(i,:) > 0.6);%%Valor para tocar
    if (length(y_umbrales01) >= 0.7) %%Valor para tocar
        ancho01(i,1) = y_umbrales01(end) - y_umbrales01(1);
    else
        ancho01(i,1) = 0;
    end
end
[~, x_max_ancho01] = max(ancho01);

figure(2);
hold on;
imshow(gray2ind(img01'), jet());
hold on;
plot( (x_max_ancho01*ones(1,rows_img01))',(1:rows_img01)', '-k', 'linewidth', 2);
%axis('tic', 'label');0
xlabel('x / px');
ylabel('y / px');

med_max_y01 = img01(x_max_ancho01, :);
y01 = 0:(rows_img01-1);

%busco el valor central de la medicion y corro el eje x
y_umbr01 = find(med_max_y01 > 0.15);%%Valor para tocar
y_cent01 = floor((y_umbr01(1) + y_umbr01(end))/2);
y01 = y01 - y_cent01;

parametros01 = fminsearch(@(param) err_cuad_gauss(param, [y01; med_max_y01]), [1, 1]) %primer parametro en el vector es dobleve inicial y el segundo es la intensidad inicial

figure(3);
hold on;
plot(y01, med_max_y01, 'linewidth', 2);
plot(y01, arrayfun(@(x) gaussiana(x, 0, parametros01(1), parametros01(2)), y01), 'linewidth', 2);
grid on;
xlabel('x / px');
ylabel('I');
label_ajustes = sprintf('Ajustes w = %.2f px I_0 = %.3f', parametros01(1), parametros01(2));
legend('Medición', label_ajustes, 'location', 'northwest');
legend('boxoff');
