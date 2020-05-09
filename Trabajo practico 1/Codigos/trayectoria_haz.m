close all;
clear all;

f4_a=-30*1e-3;
f2_a=200*1e-3;
f4_b=200*1e-3;
f2_b=-30*1e-3;
 
lambda_0 = 632.8e-9;

%%%%%%%%%%%%%%%libre
z_a = [0.3, 0.305, 0.31];%m
w_a = [0.89e-3, 0.94e-3, 0.99e-3]; %los tres valores que me da para libre. de ahi grafico los tres casos de libre
z = 300e-3;%mm
w_0_metro = sqrt(roots([1, -(w_a(1)^2), ((z^2)*(lambda_0^2))/(pi^2)]));%Defino el polinomio y busco las raices de w0cuadrado. De esasa raices le saco la raiz para encontrar w0
w_0 = w_0_metro(1) %me quedo con el primer resultado que es le valido

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
plot(z_a, w_a, 'x', 'markersize', 9);
plot(z, ancho_libre);
grid on;
legend('Ajustes', 'Calculo ABCD', 'location', 'northwest');
legend('boxoff');

z = 305e-3;%mm
w_0_metro = sqrt(roots([1, -(w_a(2)^2), ((z^2)*(lambda_0^2))/(pi^2)]));%Defino el polinomio y busco las raices de w0cuadrado. De esasa raices le saco la raiz para encontrar w0
w_0 = w_0_metro(1) %me quedo con el primer resultado que es le valido

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
plot(z_a, w_a, 'x', 'markersize', 9);
plot(z, ancho_libre);
grid on;
legend('Ajustes', 'Calculo ABCD', 'location', 'northwest');
legend('boxoff');

z = 310e-3;%mm
w_0_metro = sqrt(roots([1, -(w_a(3)^2), ((z^2)*(lambda_0^2))/(pi^2)]));%Defino el polinomio y busco las raices de w0cuadrado. De esasa raices le saco la raiz para encontrar w0
w_0 = w_0_metro(1) %me quedo con el primer resultado que es le valido

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
plot(z_a, w_a, 'x', 'markersize', 9);
plot(z, ancho_libre);
grid on;
legend('Ajustes', 'Calculo ABCD', 'location', 'northwest');
legend('boxoff');


%%%%%%%%%%%%%%%ancho
z_a = [0.3, 0.305, 0.31];%m
w_a = [0.85e-3, 0.9e-3, 0.95e-3]; %los tres valores que me da para libre. de ahi grafico los tres casos de libre
z = 300e-3;%mm
w_0_metro = sqrt(roots([1, -(w_a(1)^2), ((z^2)*(lambda_0^2))/(pi^2)]));%Defino el polinomio y busco las raices de w0cuadrado. De esasa raices le saco la raiz para encontrar w0
w_0 = w_0_metro(1) %me quedo con el primer resultado que es le valido

z = 0:0.001:0.310; %m
q_0_inv = -1i*(lambda_0/(pi*(w_0^2)));%por que w0? porque busco 1/q0 que es lo mismo que 1/qe
q_s_inv = [];
for i = 1:length(z)
    matriz_abcd = arreglo_lentes(z(i), 0.05,f2_b,f4_b);
    q_s_inv(i,1) = (matriz_abcd(2,1) + matriz_abcd(2,2)*q_0_inv)/(matriz_abcd(1,1) + matriz_abcd(1,2)*q_0_inv);
end
radio_inv_libre = real(q_s_inv);
ancho_libre = sqrt(-lambda_0./(pi*(imag(q_s_inv))));


hold on;
%plot(z,radio_inv_libre)
plot(z_a, w_a, 'x', 'markersize', 9);
plot(z, ancho_libre);
grid on;
legend('Ajustes', 'Calculo ABCD', 'location', 'northwest');
legend('boxoff');

z = 305e-3;%mm
w_0_metro = sqrt(roots([1, -(w_a(2)^2), ((z^2)*(lambda_0^2))/(pi^2)]));%Defino el polinomio y busco las raices de w0cuadrado. De esasa raices le saco la raiz para encontrar w0
w_0 = w_0_metro(1) %me quedo con el primer resultado que es le valido

z = 0:0.001:0.310; %m
q_0_inv = -1i*(lambda_0/(pi*(w_0^2)));%por que w0? porque busco 1/q0 que es lo mismo que 1/qe
q_s_inv = [];
for i = 1:length(z)
    matriz_abcd = arreglo_lentes(z(i), 0.05,f2_b,f4_b);
    q_s_inv(i,1) = (matriz_abcd(2,1) + matriz_abcd(2,2)*q_0_inv)/(matriz_abcd(1,1) + matriz_abcd(1,2)*q_0_inv);
end
radio_inv_libre = real(q_s_inv);
ancho_libre = sqrt(-lambda_0./(pi*(imag(q_s_inv))));


hold on;
%plot(z,radio_inv_libre)
plot(z_a, w_a, 'x', 'markersize', 9);
plot(z, ancho_libre);
grid on;
legend('Ajustes', 'Calculo ABCD', 'location', 'northwest');
legend('boxoff');

z = 310e-3;%mm
w_0_metro = sqrt(roots([1, -(w_a(3)^2), ((z^2)*(lambda_0^2))/(pi^2)]));%Defino el polinomio y busco las raices de w0cuadrado. De esasa raices le saco la raiz para encontrar w0
w_0 = w_0_metro(1) %me quedo con el primer resultado que es le valido

z = 0:0.001:0.310; %m
q_0_inv = -1i*(lambda_0/(pi*(w_0^2)));%por que w0? porque busco 1/q0 que es lo mismo que 1/qe
q_s_inv = [];
for i = 1:length(z)
    matriz_abcd = arreglo_lentes(z(i), 0.05,f2_b,f4_b);
    q_s_inv(i,1) = (matriz_abcd(2,1) + matriz_abcd(2,2)*q_0_inv)/(matriz_abcd(1,1) + matriz_abcd(1,2)*q_0_inv);
end
radio_inv_libre = real(q_s_inv);
ancho_libre = sqrt(-lambda_0./(pi*(imag(q_s_inv))));


hold on;
%plot(z,radio_inv_libre)
plot(z_a, w_a, 'x', 'markersize', 9);
plot(z, ancho_libre);
grid on;
legend('Ajustes', 'Calculo ABCD', 'location', 'northwest');
legend('boxoff');

%%%%%%%%%%%%%%%angosto
z_a = [0.3, 0.305, 0.31];%m
w_a = [0.87e-3, 0.92e-3, 0.97e-3]; %los tres valores que me da para libre. de ahi grafico los tres casos de libre
z = 300e-3;%mm
w_0_metro = sqrt(roots([1, -(w_a(1)^2), ((z^2)*(lambda_0^2))/(pi^2)]));%Defino el polinomio y busco las raices de w0cuadrado. De esasa raices le saco la raiz para encontrar w0
w_0 = w_0_metro(1) %me quedo con el primer resultado que es le valido

z = 0:0.001:0.310; %m
q_0_inv = -1i*(lambda_0/(pi*(w_0^2)));%por que w0? porque busco 1/q0 que es lo mismo que 1/qe
q_s_inv = [];
for i = 1:length(z)
    matriz_abcd = arreglo_lentes(z(i), 0.05,f2_a,f4_a);
    q_s_inv(i,1) = (matriz_abcd(2,1) + matriz_abcd(2,2)*q_0_inv)/(matriz_abcd(1,1) + matriz_abcd(1,2)*q_0_inv);
end
radio_inv_libre = real(q_s_inv);
ancho_libre = sqrt(-lambda_0./(pi*(imag(q_s_inv))));


hold on;
%plot(z,radio_inv_libre)
plot(z_a, w_a, 'x', 'markersize', 9);
plot(z, ancho_libre);
grid on;
legend('Ajustes', 'Calculo ABCD', 'location', 'northwest');
legend('boxoff');

z = 305e-3;%mm
w_0_metro = sqrt(roots([1, -(w_a(2)^2), ((z^2)*(lambda_0^2))/(pi^2)]));%Defino el polinomio y busco las raices de w0cuadrado. De esasa raices le saco la raiz para encontrar w0
w_0 = w_0_metro(1) %me quedo con el primer resultado que es le valido

z = 0:0.001:0.310; %m
q_0_inv = -1i*(lambda_0/(pi*(w_0^2)));%por que w0? porque busco 1/q0 que es lo mismo que 1/qe
q_s_inv = [];
for i = 1:length(z)
    matriz_abcd = arreglo_lentes(z(i), 0.05,f2_a,f4_a);
    q_s_inv(i,1) = (matriz_abcd(2,1) + matriz_abcd(2,2)*q_0_inv)/(matriz_abcd(1,1) + matriz_abcd(1,2)*q_0_inv);
end
radio_inv_libre = real(q_s_inv);
ancho_libre = sqrt(-lambda_0./(pi*(imag(q_s_inv))));


hold on;
%plot(z,radio_inv_libre)
plot(z_a, w_a, 'x', 'markersize', 9);
plot(z, ancho_libre);
grid on;
legend('Ajustes', 'Calculo ABCD', 'location', 'northwest');
legend('boxoff');

z = 310e-3;%mm
w_0_metro = sqrt(roots([1, -(w_a(3)^2), ((z^2)*(lambda_0^2))/(pi^2)]));%Defino el polinomio y busco las raices de w0cuadrado. De esasa raices le saco la raiz para encontrar w0
w_0 = w_0_metro(1) %me quedo con el primer resultado que es le valido

z = 0:0.001:0.310; %m
q_0_inv = -1i*(lambda_0/(pi*(w_0^2)));%por que w0? porque busco 1/q0 que es lo mismo que 1/qe
q_s_inv = [];
for i = 1:length(z)
    matriz_abcd = arreglo_lentes(z(i), 0.05,f2_a,f4_a);
    q_s_inv(i,1) = (matriz_abcd(2,1) + matriz_abcd(2,2)*q_0_inv)/(matriz_abcd(1,1) + matriz_abcd(1,2)*q_0_inv);
end
radio_inv_libre = real(q_s_inv);
ancho_libre = sqrt(-lambda_0./(pi*(imag(q_s_inv))));


hold on;
%plot(z,radio_inv_libre)
plot(z_a, w_a, 'x', 'markersize', 9);
plot(z, ancho_libre);
grid on;
legend('Ajustes', 'Calculo ABCD', 'location', 'northwest');
legend('boxoff');



xlabel('z / m');
ylabel('w(z) / um');
xlim([0, 0.32]);
