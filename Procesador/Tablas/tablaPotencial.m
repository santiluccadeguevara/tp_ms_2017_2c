function [tabla] = tablaPotencial(datos)

    xi = datos(1,:).';
    yi = datos(2,:).';
    lnxi = log(xi);
    lnyi = log(yi);
    lnxilnyi = lnxi.*lnyi;
    lnxi2 = lnxi.^2;
    p = polinomio(datos);
    e = errores(datos, p);
    
    tabla = [ xi yi lnxi lnyi lnxilnyi lnxi2 p e];
end

function [p] = polinomio(datos)

    [a , b] = aproximacionPotencial(datos);

    matriz = datos';
    
    xi = matriz(:,1);

    p = b .* xi.^a;
    
end

function [e] = errores(datos, polinomio)
    
    matriz = datos';
    
    yi = matriz(:,2);
    
    e = calcularColumnaDeError(polinomio, yi);

end