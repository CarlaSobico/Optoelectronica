function [abcd] = arreglo_lentes(z, pos_lente1, f1, f2)
   d=f1+f2;
    if (z <= pos_lente1)
        abcd = [1, z; 0, 1];
    elseif ((z > pos_lente1) && (z <= (pos_lente1 + d))) % Pasando lente 1, sin llegar a lente 2
        abcd = ([1, (z - pos_lente1); 0, 1]*[1, 0; (-1/f1), 1]*[1, pos_lente1; 0, 1]);
    else
        abcd = ([1, (z - pos_lente1 - d); 0, 1]*[1, 0; (-1/f2), 1]*[1, d; 0, 1]*[1, 0; (-1/f1), 1]*[1, pos_lente1; 0, 1]); %Luego de lente 2
    end

end