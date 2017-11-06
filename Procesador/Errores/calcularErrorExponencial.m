function[error] = calcularErrorExponencial(funcion, matriz)
    %funcion: funcion a calcular error
    %matriz: matriz de valores a ingresar
    
    datos = matriz';
    xi = datos(:,1);
    yi = datos(:,2);
    a = funcion(1,1);
    b = funcion(1,2);
    
    valorExponencial = b .* ( exp(a .* xi ) );
    
    error = sum(calcularColumnaDeError(valorExponencial,yi));
    
end