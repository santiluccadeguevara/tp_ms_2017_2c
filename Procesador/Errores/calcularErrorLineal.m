function[error] = calcularErrorLineal(funcion, matriz)
    %funcion: funcion a calcular error
    %matriz: matriz de valores a ingresar
    
    error = 0;
    
    n = length(matriz(1, :));
    
    for i=1:n
        x0 = matriz(1, i);
        y0 = matriz(2, i);
        
        valorPorAproximacion = funcion(1) * (x0) + funcion(2);
        
        error = error + (valorPorAproximacion - y0) ^ 2;
    end
    
end