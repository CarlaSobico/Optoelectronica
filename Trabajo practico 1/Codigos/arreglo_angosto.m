function [abcd] = arreglo_angosto(z, pos)

    if (z <= pos)
        abcd = [1, z; 0, 1];
    elseif ((z > pos) && (z <= (pos + 0.05)))
        abcd = [1, (z - pos); 0, 1]*[1, 0; (-1/0.1), 1]*[1, pos; 0, 1];
    else
        abcd = [1, (z - pos - 0.05); 0, 1]*[1, 0; (-1/-0.05), 1]*[1, 0.05; 0, 1]*[1, 0; (-1/0.1), 1]*[1, pos; 0, 1];
    endif

endfunction
