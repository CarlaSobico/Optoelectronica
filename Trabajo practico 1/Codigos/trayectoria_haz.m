close all;
clear all;

f2_angosto=-30*1e-3;
f1_angosto=200*1e-3;
f2_ancho=200*1e-3;
f1_ancho=-30*1e-3;
 
lambda_0 = 632.8e-9;

%%%%%%%%%%%%%%%libre
z_a = [0.3, 0.305, 0.31];%m
w_a = [5.6157e-04, 5.7676e-04, 6.0699e-04]; %los tres valores que me da para libre. de ahi grafico los tres casos de libre
z =0.3;
w_0_metro = sqrt(roots([1, -(w_a(1)^2), ((z^2)*(lambda_0^2))/(pi^2)]));%Defino el polinomio y busco las raices de w0cuadrado. De esasa raices le saco la raiz para encontrar w0
w_0 = w_0_metro(1); %me quedo con el primer resultado que es le valido

z = 0:0.001:0.310; %m

%Arreglo camino libre, camara en 30cm
q_0_inv = -1i*(lambda_0/(pi*(w_0^2)));%por que w0? porque busco 1/q0 que es lo mismo que 1/qe
q_s_inv = [];
for i = 1:length(z)
    matriz_abcd = arreglo_libre(z(i));
    q_s_inv(i,1) = (matriz_abcd(2,1) + matriz_abcd(2,2)*q_0_inv)/(matriz_abcd(1,1) + matriz_abcd(1,2)*q_0_inv);
end
radio_inv_libre = real(q_s_inv);
ancho_libre = sqrt(-lambda_0./(pi*(imag(q_s_inv))));


hold on;
%plot(z,radio_inv_libre)
plot(z_a, w_a, 'xr', 'markersize', 9);
plot(z, ancho_libre);
grid on;
legend('Ajustes', 'Calculo ABCD', 'location', 'northwest');
legend('boxoff');

%Arreglo camino libre, camara en 30.5cm
% z = 305e-3;%mm
% w_0_metro = sqrt(roots([1, -(w_a(2)^2), ((z^2)*(lambda_0^2))/(pi^2)]));%Defino el polinomio y busco las raices de w0cuadrado. De esasa raices le saco la raiz para encontrar w0
% w_0 = w_0_metro(1) %me quedo con el primer resultado que es le valido

z = 0:0.001:0.310; %m
q_0_inv = -1i*(lambda_0/(pi*(w_0^2)));%por que w0? porque busco 1/q0 que es lo mismo que 1/qe
q_s_inv = [];
for i = 1:length(z)
    matriz_abcd = arreglo_libre(z(i));
    q_s_inv(i,1) = (matriz_abcd(2,1) + matriz_abcd(2,2)*q_0_inv)/(matriz_abcd(1,1) + matriz_abcd(1,2)*q_0_inv);
end
radio_inv_libre = real(q_s_inv);
ancho_libre = sqrt(-lambda_0./(pi*(imag(q_s_inv))));


hold on;
%plot(z,radio_inv_libre)
plot(z_a, w_a, 'xr', 'markersize', 9);
plot(z, ancho_libre);
grid on;
legend('Ajustes', 'Calculo ABCD', 'location', 'northwest');
legend('boxoff');

%Arreglo camino libre, camara en 31cm
% z = 310e-3;%mm
% w_0_metro = sqrt(roots([1, -(w_a(3)^2), ((z^2)*(lambda_0^2))/(pi^2)]));%Defino el polinomio y busco las raices de w0cuadrado. De esasa raices le saco la raiz para encontrar w0
% w_0 = w_0_metro(1) %me quedo con el primer resultado que es le valido

z = 0:0.001:0.310; %m
q_0_inv = -1i*(lambda_0/(pi*(w_0^2)));%por que w0? porque busco 1/q0 que es lo mismo que 1/qe
q_s_inv = [];
for i = 1:length(z)
    matriz_abcd = arreglo_libre(z(i));
    q_s_inv(i,1) = (matriz_abcd(2,1) + matriz_abcd(2,2)*q_0_inv)/(matriz_abcd(1,1) + matriz_abcd(1,2)*q_0_inv);
end
radio_inv_libre = real(q_s_inv);
ancho_libre = sqrt(-lambda_0./(pi*(imag(q_s_inv))));


hold on;
%plot(z,radio_inv_libre)
plot(z_a, w_a, 'xr', 'markersize', 9);
plot(z, ancho_libre);
grid on;
legend('Ajustes', 'Calculo ABCD', 'location', 'northwest');
legend('boxoff');


%%%%%%%%%%%%%%%ancho
% z_a = [0.3, 0.305, 0.31];%m
w_a_ancho = [7.7028e-04, 7.8685e-04, 7.3353e-04];% Valores de ajuste para haz ancho
% z = 300e-3;%mm
% w_0_metro = sqrt(roots([1, -(w_a(1)^2), ((z^2)*(lambda_0^2))/(pi^2)]));%Defino el polinomio y busco las raices de w0cuadrado. De esasa raices le saco la raiz para encontrar w0
% w_0 = w_0_metro(1) %me quedo con el primer resultado que es le valido

z = 0:0.001:0.310; %m
q_0_inv = -1i*(lambda_0/(pi*(w_0^2)));%por que w0? porque busco 1/q0 que es lo mismo que 1/qe
q_s_inv = [];
for i = 1:length(z)
    matriz_abcd = arreglo_lentes(z(i), 0.05,f1_ancho,f2_ancho);
    q_s_inv(i,1) = (matriz_abcd(2,1) + matriz_abcd(2,2)*q_0_inv)/(matriz_abcd(1,1) + matriz_abcd(1,2)*q_0_inv);
end
radio_inv_libre = real(q_s_inv);
ancho_libre = sqrt(-lambda_0./(pi*(imag(q_s_inv))));


hold on;
%plot(z,radio_inv_libre)
plot(z_a, w_a_ancho, 'xb', 'markersize', 9);
plot(z, ancho_libre);
grid on;
legend('Ajustes', 'Calculo ABCD', 'location', 'northwest');
legend('boxoff');

% z = 305e-3;%mm
% w_0_metro = sqrt(roots([1, -(w_a(2)^2), ((z^2)*(lambda_0^2))/(pi^2)]));%Defino el polinomio y busco las raices de w0cuadrado. De esasa raices le saco la raiz para encontrar w0
% w_0 = w_0_metro(1) %me quedo con el primer resultado que es le valido

z = 0:0.001:0.310; %m
q_0_inv = -1i*(lambda_0/(pi*(w_0^2)));%por que w0? porque busco 1/q0 que es lo mismo que 1/qe
q_s_inv = [];
for i = 1:length(z)
    matriz_abcd = arreglo_lentes(z(i), 0.05,f1_ancho,f2_ancho);
    q_s_inv(i,1) = (matriz_abcd(2,1) + matriz_abcd(2,2)*q_0_inv)/(matriz_abcd(1,1) + matriz_abcd(1,2)*q_0_inv);
end
radio_inv_libre = real(q_s_inv);
ancho_libre = sqrt(-lambda_0./(pi*(imag(q_s_inv))));


hold on;
%plot(z,radio_inv_libre)
plot(z_a, w_a_ancho, 'xb', 'markersize', 9);
plot(z, ancho_libre);
grid on;
legend('Ajustes', 'Calculo ABCD', 'location', 'northwest');
legend('boxoff');

% z = 310e-3;%mm
% w_0_metro = sqrt(roots([1, -(w_a(3)^2), ((z^2)*(lambda_0^2))/(pi^2)]));%Defino el polinomio y busco las raices de w0cuadrado. De esasa raices le saco la raiz para encontrar w0
% w_0 = w_0_metro(1) %me quedo con el primer resultado que es le valido

z = 0:0.001:0.310; %m
q_0_inv = -1i*(lambda_0/(pi*(w_0^2)));%por que w0? porque busco 1/q0 que es lo mismo que 1/qe
q_s_inv = [];
for i = 1:length(z)
    matriz_abcd = arreglo_lentes(z(i), 0.05,f1_ancho,f2_ancho);
    q_s_inv(i,1) = (matriz_abcd(2,1) + matriz_abcd(2,2)*q_0_inv)/(matriz_abcd(1,1) + matriz_abcd(1,2)*q_0_inv);
end
radio_inv_libre = real(q_s_inv);
ancho_libre = sqrt(-lambda_0./(pi*(imag(q_s_inv))));


hold on;
%plot(z,radio_inv_libre)
plot(z_a, w_a_ancho, 'xb', 'markersize', 9);
plot(z, ancho_libre);
grid on;
legend('Ajustes', 'Calculo ABCD', 'location', 'northwest');
legend('boxoff');

%%%%%%%%%%%%%%%angosto
% z_a = [0.3, 0.305, 0.31];%m
 w_a_ang = [5.4967e-04, 5.6815e-04, 5.4302e-04]; %los tres valores que me da para libre. de ahi grafico los tres casos de libre
% z = 300e-3;%mm
% w_0_metro = sqrt(roots([1, -(w_a(1)^2), ((z^2)*(lambda_0^2))/(pi^2)]));%Defino el polinomio y busco las raices de w0cuadrado. De esasa raices le saco la raiz para encontrar w0
% w_0 = w_0_metro(1) %me quedo con el primer resultado que es le valido

z = 0:0.001:0.310; %m
q_0_inv = -1i*(lambda_0/(pi*(w_0^2)));%por que w0? porque busco 1/q0 que es lo mismo que 1/qe
q_s_inv = [];
for i = 1:length(z)
    matriz_abcd = arreglo_lentes(z(i), 0.05,f1_angosto,f2_angosto);
    q_s_inv(i,1) = (matriz_abcd(2,1) + matriz_abcd(2,2)*q_0_inv)/(matriz_abcd(1,1) + matriz_abcd(1,2)*q_0_inv);
end
radio_inv_libre = real(q_s_inv);
ancho_libre = sqrt(-lambda_0./(pi*(imag(q_s_inv))));


hold on;
%plot(z,radio_inv_libre)
plot(z_a, w_a_ang, 'xg', 'markersize', 9);
plot(z, ancho_libre);
grid on;
legend('Ajustes', 'Calculo ABCD', 'location', 'northwest');
legend('boxoff');

% z = 305e-3;%mm
% w_0_metro = sqrt(roots([1, -(w_a(2)^2), ((z^2)*(lambda_0^2))/(pi^2)]));%Defino el polinomio y busco las raices de w0cuadrado. De esasa raices le saco la raiz para encontrar w0
% w_0 = w_0_metro(1) %me quedo con el primer resultado que es le valido

z = 0:0.001:0.310; %m
q_0_inv = -1i*(lambda_0/(pi*(w_0^2)));%por que w0? porque busco 1/q0 que es lo mismo que 1/qe
q_s_inv = [];
for i = 1:length(z)
    matriz_abcd = arreglo_lentes(z(i), 0.05,f1_angosto,f2_angosto);
    q_s_inv(i,1) = (matriz_abcd(2,1) + matriz_abcd(2,2)*q_0_inv)/(matriz_abcd(1,1) + matriz_abcd(1,2)*q_0_inv);
end
radio_inv_libre = real(q_s_inv);
ancho_libre = sqrt(-lambda_0./(pi*(imag(q_s_inv))));


hold on;
%plot(z,radio_inv_libre)
plot(z_a, w_a_ang, 'xg', 'markersize', 9);
plot(z, ancho_libre);
grid on;
legend('Ajustes', 'Calculo ABCD', 'location', 'northwest');
legend('boxoff');

% z = 310e-3;%mm
% w_0_metro = sqrt(roots([1, -(w_a(3)^2), ((z^2)*(lambda_0^2))/(pi^2)]));%Defino el polinomio y busco las raices de w0cuadrado. De esasa raices le saco la raiz para encontrar w0
% w_0 = w_0_metro(1) %me quedo con el primer resultado que es le valido

z = 0:0.001:0.310; %m
q_0_inv = -1i*(lambda_0/(pi*(w_0^2)));%por que w0? porque busco 1/q0 que es lo mismo que 1/qe
q_s_inv = [];
for i = 1:length(z)
    matriz_abcd = arreglo_lentes(z(i), 0.05,f1_angosto,f2_angosto);
    q_s_inv(i,1) = (matriz_abcd(2,1) + matriz_abcd(2,2)*q_0_inv)/(matriz_abcd(1,1) + matriz_abcd(1,2)*q_0_inv);
end
radio_inv_libre = real(q_s_inv);
ancho_libre = sqrt(-lambda_0./(pi*(imag(q_s_inv))));


hold on;
%plot(z,radio_inv_libre)
plot(z_a, w_a_ang, 'xg', 'markersize', 9);
plot(z, ancho_libre);
grid on;
legend('Ajustes', 'Calculo ABCD', 'location', 'northwest');
legend('boxoff');



xlabel('z / m');
ylabel('w(z) / um');
xlim([0, 0.32]);
