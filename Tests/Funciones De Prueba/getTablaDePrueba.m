function [valores] = getTablaDePrueba

    valores = getCoordenadasDePrueba();
    
    xi = valores(1,:).';
    yi = valores(2,:).';
    xi2 = xi.^2;
    xiyi = xi.*yi;
    
    valores = [xi yi xi2 xiyi];
    
end
