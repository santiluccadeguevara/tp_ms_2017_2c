function [sumatorias] = sumatoriaExponencial(datos)

    n = length(datos(1,:));
    
    tabla = tablaExponencial(datos);
    
    sumatorias = [ n sum(tabla)];
    
end