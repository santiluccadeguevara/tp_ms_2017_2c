function [sumatorias] = sumatoriaLineal(datos)

    n = length(datos(1,:));
    
    tabla = tablaLineal(datos);
    
    sumatorias = [ n sum(tabla)];
    
end

