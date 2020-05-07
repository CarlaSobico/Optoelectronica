close all;
clear all;


img01 = im2double(rgb2gray(imread('mediciones\haz_300mm.jpg')));

figure(1);
imshow(img01);
axis on;
[rows_img01 columns_img01]=size(img01)

%busco por filas las que estan por arriba de un umbral y les calculo el ancho, luego busco la mas ancha
for i = 1:rows_img01
    x_umbrales01 = find(img01(i,:) > 0.55);%%Valor para tocar N1
    if (length(x_umbrales01) >= 0.7) %%Valor para tocar N2
        ancho01(i,1) = x_umbrales01(end) - x_umbrales01(1);
    else
        ancho01(i,1) = 0;
    end
end
[~, y_max_ancho01] = max(ancho01);

Hf = figure(2);
set(Hf,'PaperPosition',[0 0 30 8]); %Defino el tama?o del grafico que va
imshow(gray2ind(img01), jet());
line(1:columns_img01, y_max_ancho01*ones(1,columns_img01), 'LineWidth', 2, 'Color', 'k');
%edito los ejes
axis on;
set(gca(),'XLim',[1 columns_img01],'YLim',[1 rows_img01],'Box','on','FontName','Arial','FontSize',8,'GridLineStyle','--','LineWidth',0.4,'TickDir','in');
xlabel('x / px','FontName','Arial','FontSize',20);
ylabel('y / px','FontName','Arial','FontSize',20)

med_max_x01 = img01(y_max_ancho01, :);
x01 = 0:(columns_img01-1);

%busco el valor central de la medicion y corro el eje x
x_umbr01 = find(med_max_x01 > 0.15);%%Valor para tocar N3
x_cent01 = floor((x_umbr01(1) + x_umbr01(end))/2);
x01 = x01 - x_cent01;

parametros01 = fminsearch(@(param) err_cuad_gauss(param, [x01; med_max_x01]), [1, 1]) %primer parametro en el vector es dobleve inicial y el segundo es la intensidad inicial

figure(3);
hold on;
plot(x01, med_max_x01, 'linewidth', 2);
plot(x01, arrayfun(@(x) gaussiana(x, 0, parametros01(1), parametros01(2)), x01), 'linewidth', 2);
grid on;
xlabel('x / px');
ylabel('I');
label_ajustes = sprintf('Ajustes w = %.2f px I_0 = %.3f', parametros01(1), parametros01(2));
legend('Medición', label_ajustes, 'location', 'northwest');
legend('boxoff');
