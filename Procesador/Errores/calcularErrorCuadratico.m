function [error] = calcularErrorCuadratico(funcion, matriz)
    %funcion: funcion a calcular error
    %matriz: matriz de valores a ingresar
    
    datos = matriz';
    xi = datos(:,1);
    yi = datos(:,2);
    a = funcion(1,1);
    b = funcion(1,2);
    c = funcion(1,3);
    
    valorCuadratico = a .* ( xi .^2 ) + b .* xi + c; 
    
    error = sum(calcularColumnaDeError(valorCuadratico,yi));
end

