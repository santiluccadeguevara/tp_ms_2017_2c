function [tabla] = tablaCuadratica(datos)

    xi = datos(1,:).';
    yi = datos(2,:).';
    xi2 = xi.^2;
    xi3 = xi.^3;
    xi4 = xi.^4;
    xiyi = xi.*yi;
    xi2yi = xi2.*yi;
    p = polinomio(datos);
    e = errores(datos);
    
    tabla = [ xi yi xi2 xi3 xi4 xiyi xi2yi p e];
end

function [p] = polinomio(datos)

    [a , b, c] = aproximacionCuadratica(datos);

    matriz = datos';
    
    xi = matriz(:,1);

    p = a .* (xi.^2) + b .* xi + c;
    
end

function [e] = errores(datos)

    p = polinomio(datos);
    
    matriz = datos';
    
    yi = matriz(:,2);
    
    e = calcularColumnaDeError(p, yi);

end
