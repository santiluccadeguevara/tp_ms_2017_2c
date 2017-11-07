function [tabla] = tablaLineal(datos)

    xi = datos(1,:).';
    yi = datos(2,:).';
    xi2 = xi.^2;
    xiyi = xi.*yi;
    p = polinomio(datos);
    e = errores(datos, p);
    
    tabla = [ xi yi xi2 xiyi p e];
end

function [p] = polinomio(datos)

    [m , b] = aproximacionLineal(datos);

    matriz = datos';
    
    xi = matriz(:,1);

    p = (m .* xi) + b;
    
end

function [e] = errores(datos, polinomio)
    
    matriz = datos';
    
    yi = matriz(:,2);
    
    e = calcularColumnaDeError(polinomio, yi);

end



