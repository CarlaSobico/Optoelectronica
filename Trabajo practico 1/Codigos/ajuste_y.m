function parametros01=ajuste_y(N1,N2,N3,ruta_archivo,nombre_archivo)
close all;
img01 = im2double(rgb2gray(imread(ruta_archivo)));

nombre_fig1=strcat(nombre_archivo,'1');
nombre_fig2=strcat(nombre_archivo,'2');
nombre_fig3=strcat(nombre_archivo,'3');

figure(4);
imshow(img01);
axis on;
xlabel('x / px','FontName','Arial','FontSize',15);
ylabel('y / px','FontName','Arial','FontSize',15);
print(nombre_fig1,'-dpng');

img01=img01';%Transpongo la matriz;
[columns_img01,rows_img01]=size(img01);
set(gca,'XLim',[1 columns_img01],'YLim',[1 rows_img01])

%busco por filas las que estan por arriba de un umbral y les calculo el ancho, luego busco la mas ancha
for i = 1:columns_img01
    y_umbrales01 = find(img01(i,:) > N1);%%Valor para tocar N1
    if (length(y_umbrales01) >= N2) %%Valor para tocar N2
        ancho01(i,1) = y_umbrales01(end) - y_umbrales01(1);
    else
        ancho01(i,1) = 0;
    end
end
[~, x_max_ancho01] = max(ancho01);

figure(5);
hold on;
imshow(gray2ind(img01'), jet());
hold on;
%plot( (x_max_ancho01*ones(1,rows_img01))',(1:rows_img01)', '-k', 'linewidth', 2);
line((x_max_ancho01*ones(1,rows_img01))',(1:rows_img01)', 'LineWidth', 2, 'Color', 'k');
axis on;
set(gca,'XLim',[1 columns_img01],'YLim',[1 rows_img01])
xlabel('x / px','FontName','Arial','FontSize',15);
ylabel('y / px','FontName','Arial','FontSize',15);
print(nombre_fig2,'-dpng');

med_max_y01 = img01(x_max_ancho01, :);
y01 = 0:(rows_img01-1);

%busco el valor central de la medicion y corro el eje x
y_umbr01 = find(med_max_y01 > N3);%%Valor para tocar N3
y_cent01 = floor((y_umbr01(1) + y_umbr01(end))/2);
y01 = y01 - y_cent01;

parametros01 = fminsearch(@(param) err_cuad_gauss(param, [y01; med_max_y01]), [1, 1]); %primer parametro en el vector es dobleve inicial y el segundo es la intensidad inicial

figure(6);
hold on;
plot(y01, med_max_y01, 'linewidth', 2);
plot(y01, arrayfun(@(x) gaussiana(x, 0, parametros01(1), parametros01(2)), y01), 'linewidth', 2);
grid on;
xlabel('y / py');
ylabel('Intensidad');
label_ajustes = sprintf('Ajustes w = %.2f px I_0 = %.3f', parametros01(1), parametros01(2));
legend('Medición', label_ajustes, 'location', 'northwest');
legend('boxoff');
print(nombre_fig3,'-dpng');
end