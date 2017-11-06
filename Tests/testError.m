function tests = testError

    tests = functiontests(localfunctions);
    
end

function testErrorLineal(casoDePrueba)

    matriz = [ 1 2 3 4 ; 10 5 2 1 ];
    
    [m , b] = aproximacionLineal(matriz);
    
    asercion(casoDePrueba, calcularErrorLineal([m, b], matriz), 4);

end

function testErrorCuadratico(casoDePrueba)

    matriz = [ 1 2 3 4 ; 10 5 2 1 ];

    [a, b, c] = aproximacionCuadratica(matriz);
    
    asercion(casoDePrueba, calcularErrorCuadratico([a, b, c], matriz), 0);

end


function testErrorExponencial(casoDePrueba)
    
    matriz = [ 1 2 3 4 ; 10 5 2 1 ];
    
    [m , b] = aproximacionExponencial(matriz);
    
    asercion(casoDePrueba, calcularErrorExponencial([m, b], matriz), 0.1722);
    
end

function testErrorHiperbolica(casoDePrueba)

    matriz = [ 1 2 3 4 ; 10 5 2 1 ];
    
    [m , b] = aproximacionHiperbolica(matriz);

    asercion(casoDePrueba, calcularErrorHiperbolica([m, b], matriz), 2.366666666666667e+02);
    
end

function testErrorPotencial(casoDePrueba)

    matriz = [ 1 2 3 4 ; 10 5 2 1 ];
    
    [m , b] = aproximacionPotencial(matriz);

    asercion(casoDePrueba, calcularErrorPotencial([m, b], matriz), 50.6864);
    
end

function asercion (casoDePrueba, actual, esperado)

    verifyEqual(casoDePrueba, actual, esperado, 'RelTol', 1);

end