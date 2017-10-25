function tests = testError
    tests = functiontests(localfunctions);
end

function testCalcularError(casoDePrueba)

    [m , b] = aproximacionLineal([ 1 2 3 4 ; 10 5 2 1 ]);
    
    matriz = [ 1 2 3 4 ; 10 5 2 1 ];
    
    actual = calcularError([m , b], matriz);
    
    esperado = 4;
    
    verifyEqual(casoDePrueba, actual, esperado, 'RelTol', 0.0001);

end