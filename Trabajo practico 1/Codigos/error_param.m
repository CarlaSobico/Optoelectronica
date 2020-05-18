function vector=error_param(haz_prom,haz300,haz305,haz310)

vector(1)= abs(((haz_prom-haz300)/haz_prom)*100);
vector(2)= abs(((haz_prom-haz305)/haz_prom)*100);
vector(3)= abs(((haz_prom-haz310)/haz_prom)*100);

end