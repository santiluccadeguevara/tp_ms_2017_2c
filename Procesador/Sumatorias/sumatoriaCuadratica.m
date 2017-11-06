function [sumatorias] = sumatoriaCuadratica(datos)

    n = length(datos(1,:));
    
    tabla = tablaCuadratica(datos);
    
    sumatorias = [ n sum(tabla)];
    
end

