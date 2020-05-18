clear all;
close all;
[par_300A,par_300I]=ajuste_xy(.55,.7,.15,.55,.7,.25,'mediciones/haz_300mm.jpg','haz_300mm_');
[par_305A,par_305I]=ajuste_xy(.55,.7,.15,.55,.7,.25,'mediciones/haz_305mm.jpg','haz_305mm_');
[par_310A,par_310I]=ajuste_xy(.55,.7,.15,.55,.7,.25,'mediciones/haz_310mm.jpg','haz_310mm_');

[par_ancho_300A,par_ancho_300I]=ajuste_xy(.9,1,.5,.55,.7,.25,'mediciones/haz_ancho_300mm.jpg','haz_300mm_ancho_');
[par_ancho_305A,par_ancho_305I]=ajuste_xy(.7,.7,.5,.55,.7,.25,'mediciones/haz_ancho_305mm.jpg','haz_305mm_ancho_');
[par_ancho_310A,par_ancho_310I]=ajuste_xy(.7,.7,.5,.55,.7,.25,'mediciones/haz_ancho_310mm.jpg','haz_310mm_ancho_');
 
[par_ang_300A,par_ang_300I]=ajuste_xy(.7,.7,.5,.55,.7,.25,'mediciones/haz_angosto_300mm.jpg','haz_300mm_angosto_');
[par_ang_305A,par_ang_305I]=ajuste_xy(.7,.7,.5,.55,.7,.25,'mediciones/haz_angosto_305mm.jpg','haz_305mm_angosto_');
[par_ang_310A,par_ang_310I]=ajuste_xy(.7,.7,.5,.55,.7,.25,'mediciones/haz_angosto_310mm.jpg','haz_310mm_angosto_');

Ancho_haz=(par_300A + par_305A + par_310A)/3
Intensidad_haz=(par_300I + par_305I + par_310I)/3

Ancho_haz_ancho=(par_ancho_300A + par_ancho_305A + par_ancho_310A)/3
Intensidad_haz_ancho=(par_ancho_300I + par_ancho_305I + par_ancho_310I)/3

Ancho_haz_ang=(par_ang_300A + par_ang_305A + par_ang_310A)/3
Intensidad_haz_ang=(par_ang_300I + par_ang_305I + par_ang_310I)/3

error_w_haz_libre=error_param(Ancho_haz,par_300A,par_305A,par_310A)
error_w_haz_ancho=error_param(Ancho_haz_ancho,par_ancho_300A,par_ancho_305A,par_ancho_310A)
error_w_haz_angosto=error_param(Ancho_haz_ang,par_ang_300A,par_ang_305A,par_ang_310A)

error_I_haz_libre=error_param(Intensidad_haz,par_300I,par_305I,par_310I)
error_I_haz_ancho=error_param(Intensidad_haz_ancho,par_ancho_300I,par_ancho_305I,par_ancho_310I)
error_I_haz_angosto=error_param(Intensidad_haz_ang,par_ang_300I,par_ang_305I,par_ang_310I)

