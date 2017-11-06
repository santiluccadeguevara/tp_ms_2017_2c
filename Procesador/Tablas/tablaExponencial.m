function [tabla] = tablaExponencial(datos)

    xi = datos(1,:).';
    yi = datos(2,:).';
    lnyi = log(yi);
    xi2 = xi.^2;
    xilnyi = xi.*lnyi;
    p = polinomio(datos);
    e = errores(datos);
    
    tabla = [ xi yi lnyi xi2 xilnyi p e];
end

function [p] = polinomio(datos)

    [a , b] = aproximacionExponencial(datos);

    matriz = datos';
    
    xi = matriz(:,1);

    p = b.*(exp(xi*a));
    
end

function [e] = errores(datos)

    p = polinomio(datos);
    
    matriz = datos';
    
    yi = matriz(:,2);
    
    e = calcularColumnaDeError(p, yi);

end