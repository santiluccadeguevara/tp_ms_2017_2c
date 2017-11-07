function [sumatorias] = sumatoriaPotencial(datos)

    n = length(datos(1,:));
    
    tabla = tablaPotencial(datos);
    
    sumatorias = [ n sum(tabla)];
    
end

