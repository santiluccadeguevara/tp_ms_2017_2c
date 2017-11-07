function [matriz] = ecuacionesPotenciales(datos)
    
    s = sumatoriaPotencial(datos);
     %1 -> n 2 -> xi 3 -> yi 4 -> lnxi 5 -> lnyi 6 -> lnxilnyi 7 -> lnxi2
    matriz = [ s(1) s(4) s(5) ; s(4) s(7) s(6) ];

end

