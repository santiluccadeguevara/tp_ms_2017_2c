function [matriz] = ecuacionesPotenciales(datos)
    
    s = sumatoriaPotencial(datos);
    
    matriz = [ s(1) s(4) s(5) ; s(4) s(7) s(6) ];

end
