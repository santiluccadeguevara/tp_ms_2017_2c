function [matriz] = ecuacionesCuadraticas(datos)
    
    s = sumatoriaCuadratica(datos);

    matriz = [
                s(1) s(2) s(4) s(3) ;
                s(2) s(4) s(5) s(7) ; 
                s(4) s(5) s(6) s(8)
             ];

end