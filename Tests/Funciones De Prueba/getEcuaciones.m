function [ecuacion1, ecuacion2] = getEcuaciones

    tabla = getCoordenadasDePrueba;

    sumatorias = getSumatoriasDePrueba;
    
    n = length(tabla(:,1));
    sxi = num2str(sumatorias(1));
    syi = num2str(sumatorias(2));
    sxi2 = num2str(sumatorias(3));
    sxiyi = num2str(sumatorias(4));
    
    ecuacion1 = [sxi2 'a + ' sxi 'b = ' sxiyi];
    ecuacion2 = [sxi 'a + ' n 'b = ' syi];

end

