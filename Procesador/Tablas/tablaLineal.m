function [tabla] = tablaLineal(datos)

    xi = datos(1,:).';
    yi = datos(2,:).';
    xi2 = xi.^2;
    xiyi = xi.*yi;
    e = errores(datos);
    
    tabla = [ xi yi xi2 xiyi e];
end

function [error] = errores(datos)

    [a , b] = aproximacionLineal(datos);

    matriz = datos';
    
    xi = matriz(:,1);
    yi = matriz(:,2);

    valorLineal = a .* xi + b;
    
    error = calcularColumnaDeError(valorLineal, yi);

end



