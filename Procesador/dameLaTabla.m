function [tabla,resultados] = dameLaTabla(datosParaliticos)
    
    datos = datosParaliticos';
    
    [a,b] = aproximacionLineal(datosParaliticos);
    [c,d,e] = aproximacionCuadratica(datosParaliticos);
    [f,g] = aproximacionExponencial(datosParaliticos);
    [h,i] = aproximacionPotencial(datosParaliticos);
    [j,k] = aproximacionHiperbolica(datosParaliticos);
    
    xi = datos(:,1);
    yi = datos(:,2);
    
    valorLineal = a .* xi + b; 
    valorCuadratico = c .* ( xi .^2 ) + d .* xi + e;
    valorExponencial = g .* ( exp(f .* xi ) );
    valorPotencial = i .* ( xi .^ h);
    valorHiperbolico = j /(xi + k);
    
    errorLineal = calcularColumnaDeError(valorLineal,yi);
    errorCuadratico = calcularColumnaDeError(valorCuadratico,yi);
    errorExponencial = calcularColumnaDeError(valorExponencial,yi);
    errorPotencial = calcularColumnaDeError(valorPotencial,yi);
    errorHiperbolico = calcularColumnaDeError(valorHiperbolico,yi);
    
    tabla = [xi yi valorLineal valorCuadratico valorExponencial valorPotencial valorHiperbolico errorLineal errorCuadratico errorExponencial errorPotencial errorHiperbolico]; 
    
    resultados = sum(tabla);
    
end

