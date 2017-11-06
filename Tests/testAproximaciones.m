function tests = testAproximaciones

    tests = functiontests(localfunctions);
    
end

function testAproximacionLineal(casoDePrueba)

    [m , b] = aproximacionLineal([ 1 2 3 4 ; 10 5 2 1 ]);
    
    esperado = [-3 12];
    
    verifyEqual(casoDePrueba, [m, b], esperado, 'RelTol', 0.0001);
    
end

function testAproximacionCuadratica(casoDePrueba)

    [a, b, c] = aproximacionCuadratica([ 1 2 3 4 ; 10 5 2 1 ]);
    
    esperado = [1 -8 17];
    
    verifyEqual(casoDePrueba, [a, b, c], esperado, 'RelTol', 0.0001);
    
end

function testAproximacionExponencial(casoDePrueba)

    [a , b] = aproximacionExponencial([ 1 2 3 4 ; 10 5 2 1 ]);
    
    esperado = [-0.7824 22.36];
    
    verifyEqual(casoDePrueba, [a, b], esperado, 'RelTol', 0.0001);
    
end

function testAproximacionPotencial(casoDePrueba)

    [a, b] = aproximacionPotencial([1 2 3 4 5 6 7 8 9 10 11 12 ; 20 35 45 40 55 55 58 62 60 65 72 68]);
    
    esperado = [0.46392436 23.2220286];
    
    verifyEqual(casoDePrueba, [a, b], esperado, 'RelTol', 0.0001);
    
end

function testAproximacionHiperbolica(casoDePrueba)

    [a , b] = aproximacionHiperbolica([0.1 0.7 1.2 2.4 2.9 3.5 4.1 4.4 5 5.8 6.2 6.6 ; 3.354 3.563 3.862 4.523 4.952 5.433 6.21 6.534 7.567 9.265 10.986 12.851]);
    
    esperado = [-29.5298 -8.90967];
    
    verifyEqual(casoDePrueba, [a, b], esperado, 'RelTol', 0.0001);
    
end