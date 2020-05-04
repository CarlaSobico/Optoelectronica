clear all;
close all;
f4_a=30*1e-3;
f2_a=200*1e-3;
f4_b=200*1e-3;
f2_b=-30*1e-3;
Ye=1;
Ye2=3;
Oe=30;

V1=PuntosRayo(f2_a,f4_a,Ye,Oe);
V2=PuntosRayo(f2_b,f4_b,Ye,Oe);
V3=PuntosRayo(f2_a,f4_a,Ye2,Oe);
V4=PuntosRayo(f2_b,f4_b,Ye2,Oe);
x=[0 0.05 .05 0.22 0.22 0.3];

figure (1)
plot(x,V1*1e3,'--','Color',[1, 0, 0],'LineWidth',2);
hold on
plot(x,V2*1e3,'--','Color',[0, 1, 0],'LineWidth',2);
plot(x,V3*1e3,':','Color',[1, 0, 1],'LineWidth',2);
plot(x,V4*1e3,':','Color',[0, 1, 1],'LineWidth',2);


%edito los ejes
set(gca(),'Box','on','FontName','Arial','FontSize',8,'GridLineStyle','--','LineWidth',0.4,'TickDir','in');
%yticks([-15:1:15])
%xticks([-15:.05:20])
%Los XTick, YTick son para marcar numeros en el grafico, se pueden poner
%los q queres (como hice en YTick) o el intervalo con el step (como hice en
%Xtick)

xlabel('Distancia recorrida [m]','FontName','Arial','FontSize',20); %etiquetas de los ejes
ylabel('Ancho rayo [mm]','FontName','Arial','FontSize',20);

grid on; %lineas intermedias
hold on;

Hleg=legend('Foco_{L1}:200mm - Foco_{L2}:-30mm','Foco_{L1}:-30mm - Foco_{L2}:200mm'); %Leyenda. Fijense de verificar que 
%queden bien referenciadas o cambien el orden!!!
legend('boxon');
set(Hleg,'location','northwest','FontName','Arial','FontSize',10);

%print('schmitTrigInvTranfVar.png','-dpng');