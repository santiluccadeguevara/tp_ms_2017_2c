function[error] = calcularError(funcion, matriz)
    %funcion: funcion a calcular error
    %matriz: matriz de valores a ingresar
    
    error = 0;
    
    n = length(matriz(1, :));
    
    for i=1:n
        error = error + (funcion(matriz(1, i)) - matriz(1, i)) ^ 2;
    end
    
end