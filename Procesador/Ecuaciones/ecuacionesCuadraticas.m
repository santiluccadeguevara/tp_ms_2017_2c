function [matriz] = ecuacionesCuadraticas(datos)
    
    s = sumatorias(tablaCuadratica(datos));
    
    matriz = [ s(1) s(2) s(3) ; s(2) s(4) s(5) ];

end