function [sumatorias] = sumatoriaHiperbolica(datos)

    n = length(datos(1,:));
    
    tabla = tablaHiperbolica(datos);
    
    sumatorias = [ n sum(tabla)];

end