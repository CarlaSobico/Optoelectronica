clear all;
close all;
%Focos primer setup
f4_a=-30*1e-3;
f2_a=200*1e-3;
%Foco segundo setup
f4_b=200*1e-3;
f2_b=-30*1e-3;
%Punto inicial rayo
Ye=0.001;
Ye2=0.003;
Oe=0;
L0=0.05; %lente inicial
d=(f2_a/f4_a +1)*f4_a; %dist entre lents
h0=0; %altura graf
h1=25;

V1=PuntosRayo(f2_a,f4_a,Ye,Oe);
V2=PuntosRayo(f2_b,f4_b,Ye,Oe);
V3=PuntosRayo(f2_a,f4_a,Ye2,Oe);
V4=PuntosRayo(f2_b,f4_b,Ye2,Oe);
x=[0 0.05 .05 0.22 0.22 0.3];

figure (1)
plot(x,V1*1e3,'Color',[1, 0, 0],'LineWidth',2);
hold on
plot(x,V2*1e3,'Color',[0, 1, 0],'LineWidth',2);
plot(x,V3*1e3,'Color',[0, 0, 1],'LineWidth',2);
plot(x,V4*1e3,'Color',[1, 0, 1],'LineWidth',2);
plot([L0 L0],[h0 h1],'--k');
plot([L0+d L0+d],[h0 h1],'-.k');
set(gca(),'Box','on','FontName','Arial','FontSize',8,'GridLineStyle','--','LineWidth',0.4,'TickDir','in');
xlabel('Distancia recorrida [m]','FontName','Arial','FontSize',20); %etiquetas de los ejes
ylabel('Ancho rayo [mm]','FontName','Arial','FontSize',20);
grid on; 
hold on;

Hleg=legend('H=1mm - Foco_{L1}:200mm - Foco_{L2}:-30mm','H=1mm - Foco_{L1}:-30mm - Foco_{L2}:200mm','H=3mm - Foco_{L1}:200mm - Foco_{L2}:-30mm','H=3mm - Foco_{L1}:-30mm - Foco_{L2}:200mm','Lente 1','Lente 2'); %Leyenda. Fijense de verificar que 
legend('boxon');
set(Hleg,'location','northwest','FontName','Arial','FontSize',7.5);

%print('caminoRayos.png','-dpng');
