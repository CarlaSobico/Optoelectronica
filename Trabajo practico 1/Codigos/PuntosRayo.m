function V = PuntosRayo( f2,f4,Ye,Oe)
    Lm=(f2/f4 +1)*f4;
    A1= [1 0.05; 0 1];
    A2= [1 0;-1/f2 1];
    A3= [1 Lm; 0 1];
    A4= [1 0;-1/f4 1];
    A5= [1 (0.25-Lm); 0 1];
    
    Ve=[Ye;Oe];    %Parámetros de rayo entrante
    Vs1=A1*Ve;
    Vs2=A2*Vs1;
    Vs3=A3*Vs2;
    Vs4=A4*Vs3;
    Vs5=A5*Vs4;
    
    V=[Ve(1) Vs1(1) Vs2(1) Vs3(1) Vs4(1) Vs5(1)];   
end

