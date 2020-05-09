function [abcd] = arreglo_angosto(z, pos, f1, f2)
   d=f1+f2;
    if (z <= pos)
        abcd = [1, z; 0, 1]/100;
    elseif ((z > pos) && (z <= (pos + d)))
        abcd = ([1, (z - pos); 0, 1]*[1, 0; (-1/f1), 1]*[1, pos; 0, 1])/100;
    else
        abcd = ([1, (z - pos - d); 0, 1]*[1, 0; (-1/f2), 1]*[1, d; 0, 1]*[1, 0; (-1/f1), 1]*[1, pos; 0, 1])/100;
    end

end
