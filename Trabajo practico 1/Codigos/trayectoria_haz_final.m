close all;
clear all;

f4_a=-50*1e-3;%angosto
f2_a=60*1e-3;
f4_b=50*1e-3;%ancho
f2_b=-40*1e-3;
 
 
lambda_0 = 632.8e-9;

%%%%%%%%%%%%%%%libre
z_a = [0.3, 0.305, 0.31];%m
w_a = [5.6157e-04, 5.7676e-04, 6.0699e-04]; %los tres valores que me da para libre. de ahi grafico los tres casos de libre
z = 310e-3;%mm
w_0_metro = sqrt(roots([1, -(w_a(3)^2), ((z^2)*(lambda_0^2))/(pi^2)]));%Defino el polinomio y busco las raices de w0cuadrado. De esasa raices le saco la raiz para encontrar w0
w_0 = w_0_metro(1) %me quedo con el primer resultado que es le valido


z = 0:0.001:0.310; %m
q_0_inv = -1i*(lambda_0/(pi*(w_0^2)));%por que w0? porque busco 1/q0 que es lo mismo que 1/qe
q_s_inv = [];

for i = 1:length(z)
    matriz_abcd = arreglo_libre(z(i));%libre
    q_s_inv(i,1) = (matriz_abcd(2,1) + matriz_abcd(2,2)*q_0_inv)/(matriz_abcd(1,1) + matriz_abcd(1,2)*q_0_inv);
end
radio_inv_libre = real(q_s_inv);
ancho_libre = sqrt(-lambda_0./(pi*(imag(q_s_inv))));


for i = 1:length(z)
    matriz_abcd = arreglo_lentes(z(i), 0.05,f2_b,f4_b);%ancho
    q_s_inv(i,1) = (matriz_abcd(2,1) + matriz_abcd(2,2)*q_0_inv)/(matriz_abcd(1,1) + matriz_abcd(1,2)*q_0_inv);
end
radio_inv_libre_ancho = real(q_s_inv);
ancho_ancho_wa3 = sqrt(-lambda_0./(pi*(imag(q_s_inv))));

for i = 1:length(z)
    matriz_abcd = arreglo_lentes(z(i), 0.05,f2_a,f4_a);%angosto
    q_s_inv(i,1) = (matriz_abcd(2,1) + matriz_abcd(2,2)*q_0_inv)/(matriz_abcd(1,1) + matriz_abcd(1,2)*q_0_inv);
end
radio_inv_libre_angosto = real(q_s_inv);
ancho_angosto_wa3 = sqrt(-lambda_0./(pi*(imag(q_s_inv))));

w_a_ancho = [7.7028e-04, 7.8685e-04, 7.3353e-04];
w_a_angosto = [5.4967e-04, 5.6815e-04, 5.4302e-04];

%%%%%%%%%%%%%%%%%%%%%%%% HAZ ANCHO %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(1);
plot(z, ancho_ancho_wa3*1e6,'r','Linewidth',2);
hold on;
plot(z_a, w_a_ancho*1e6, 'xr', 'markersize', 9);
grid on;
xlabel('z/m','FontName','Arial','FontSize',20);
ylabel('w(z)/\mum','FontName','Arial','FontSize',20);
legend( 'Calculo ABCD ancho','Ajuste ancho','location', 'southeast');
legend('boxon');
print('haz_ancho.png','-dpng');


%%%%%%%%%%%%%%%%%%%%%%%% HAZ ANGOSTO %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(2);
plot(z, ancho_angosto_wa3*1e6,'b','Linewidth',2)
hold on;
plot(z_a, w_a_angosto*1e6, 'xb', 'markersize', 9);
grid on;
xlabel('z/m','FontName','Arial','FontSize',20);
ylabel('w(z)/\mum','FontName','Arial','FontSize',20);
legend( 'Calculo ABCD angosto','Ajuste angosto','location', 'southeast');
legend('boxon');
print('haz_angosto.png','-dpng');

%%%%%%%%%%%%%%%%%%%%%%%% HAZ LIBRE %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(3);
plot(z, ancho_libre*1e6,'m','Linewidth',2)
hold on;
plot(z_a, w_a*1e6, 'xm', 'markersize', 9);
grid on;
xlabel('z/m','FontName','Arial','FontSize',20);
ylabel('w(z)/\mum','FontName','Arial','FontSize',20);
legend( 'Calculo ABCD libre','Ajuste libre','location', 'southeast');
legend('boxon');
print('haz_libre.png','-dpng');

%%%%%%%%%%%%%%%%%%%%%%%% 3 HACES %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(4);
plot(z, ancho_libre*1e6,'m','Linewidth',2)
hold on;
plot(z, ancho_angosto_wa3*1e6,'b','Linewidth',2)
plot(z, ancho_ancho_wa3*1e6,'r','Linewidth',2)
plot(z_a, w_a*1e6, 'xm', 'markersize', 9);
plot(z_a, w_a_angosto*1e6, 'xb', 'markersize', 9);
plot(z_a, w_a_ancho*1e6, 'xr', 'markersize', 9);
grid on;
xlabel('z/m','FontName','Arial','FontSize',20);
ylabel('w(z)/\mum','FontName','Arial','FontSize',20);
%set(gca(),'YLim',[300 800]);
set(gca(),'Box','on','FontName','Arial','FontSize',8,'GridLineStyle','-','LineWidth',0.4,'TickDir','in');
legend('Calculo ABCD libre','Calculo ABCD angosto','Calculo ABCD ancho','Ajuste libre','Ajuste angosto','Ajuste ancho','location', 'northwest');
legend('boxoff');
print('3haces_gauss.png','-dpng');

%%%%%%%%%%%%%%%%%%%%%%%% INVERSA RADIO ANG %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(5);
hold on;
plot(z, radio_inv_libre,'m','Linewidth',2)
plot(z, radio_inv_libre_angosto,'b','Linewidth',2) %tope en -20
grid on;
xlabel('z/m','FontName','Arial','FontSize',20);
ylabel('1/R(z) m','FontName','Arial','FontSize',20);
set(gca(),'YLim',[-.1 1]);
legend('Inversa radio de curvatura haz libre','Inversa radio de curvatura haz angosto','location', 'northeast');
legend('boxon');
print('inv_rcurv_angosto.png','-dpng');

%%%%%%%%%%%%%%%%%%%%%%%% INVERSA RADIO ANCHO %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(6);
hold on;
plot(z, radio_inv_libre,'m','Linewidth',2)
plot(z, radio_inv_libre_ancho,'r','Linewidth',2) %tope en 25
grid on;
xlabel('z/m','FontName','Arial','FontSize',20);
ylabel('1/R(z) m','FontName','Arial','FontSize',20);
set(gca(),'YLim',[0 1]);
legend('Inversa radio de curvatura haz libre','Inversa radio de curvatura haz ancho','location', 'northeast');
legend('boxon');
print('inv_rcurv_ancho.png','-dpng');



%Errores
error1_ancho=abs((ancho_ancho_wa3(z_a(1)*1000)-w_a_ancho(1))/ancho_ancho_wa3(z_a(1)*1000));
error1_ancho_porcentual=error1_ancho*100;
error2_ancho=abs((ancho_ancho_wa3(z_a(2)*1000)-w_a_ancho(2))/ancho_ancho_wa3(z_a(2)*1000));
error2_ancho_porcentual=error2_ancho*100;
error3_ancho=abs((ancho_ancho_wa3(z_a(3)*1000)-w_a_ancho(3))/ancho_ancho_wa3(z_a(3)*1000));
error3_ancho_porcentual=error3_ancho*100;

errores_ancho=[error1_ancho, error2_ancho, error3_ancho];
errores_ancho_porcentual=[error1_ancho_porcentual, error2_ancho_porcentual, error3_ancho_porcentual]


error1_angosto=abs((ancho_angosto_wa3(z_a(1)*1000)-w_a_angosto(1))/ancho_angosto_wa3(z_a(1)*1000));
error1_angosto_porcentual=error1_angosto*100;
error2_angosto=abs((ancho_angosto_wa3(z_a(2)*1000)-w_a_angosto(2))/ancho_angosto_wa3(z_a(2)*1000));
error2_angosto_porcentual=error2_angosto*100;
error3_angosto=abs((ancho_angosto_wa3(z_a(3)*1000)-w_a_angosto(3))/ancho_angosto_wa3(z_a(3)*1000));
error3_angosto_porcentual=error3_angosto*100;

errores_angosto=[error1_angosto, error2_angosto, error3_angosto];
errores_angosto_porcentual=[error1_angosto_porcentual, error2_angosto_porcentual, error3_angosto_porcentual]
