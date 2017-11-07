function [matriz] = ecuacionesHiperbolicas(datos)
    
    s = sumatoriaHiperbolica(datos);
    
    matriz = [ s(1) s(2) s(4) ; s(2) s(5) s(6) ];

end
