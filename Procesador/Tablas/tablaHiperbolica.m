function [tabla] = tablaHiperbolica(datos)

    xi = datos(1,:).';
    yi = datos(2,:).';
    invyi = 1 ./ (yi);
    xi2 = xi.^2;
    xiinvyi = xi.*invyi;
    p = polinomio(datos);
    e = errores(datos, p);
    
    tabla = [ xi yi invyi xi2 xiinvyi p e];
end

function [p] = polinomio(datos)

    [a , b] = aproximacionHiperbolica(datos);

    matriz = datos';
    
    xi = matriz(:,1);

    p = a ./ (xi + b);
    
end

function [e] = errores(datos, polinomio)
    
    matriz = datos';
    
    yi = matriz(:,2);
    
    e = calcularColumnaDeError(polinomio, yi);

end