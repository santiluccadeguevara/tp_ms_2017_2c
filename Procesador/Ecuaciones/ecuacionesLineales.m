function [matriz] = ecuacionesLineales(datos)
    
    s = sum(tablaLineal(datos));
    
    matriz = [ s(1) s(2) s(3) ; s(2) s(4) s(5) ];

end

