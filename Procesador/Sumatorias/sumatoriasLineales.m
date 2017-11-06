function [valores] = sumatoriasLineales(datos)

    n = length(datos(1,:));
    xi = datos(1,:).';
    yi = datos(2,:).';
    xi2 = xi.^2;
    xiyi = xi.*yi;
    
    valores = [ n sum([xi yi xi2 xiyi])];
    
end

