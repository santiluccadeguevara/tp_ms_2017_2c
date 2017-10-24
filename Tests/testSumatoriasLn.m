function tests = testSumatoriasLn
    tests = functiontests(localfunctions);
end

function testSumatoriaLnDeUnNumero(casoDePrueba)
    actual = sumatoriaLn(4);
    esperado = 1.3863;
    verifyEqual(casoDePrueba, round(actual, 4), esperado);
end

function testSumatoriaLnCuatroValoresDeVector(casoDePrueba)
    actual = sumatoriaLn([4 5 8 15]);
    esperado = 7.7832;
    verifyEqual(casoDePrueba, round(actual, 4), esperado);
end

function testSumatoriaLnCuatroValoresDeColumna(casoDePrueba)
    actual = sumatoriaLn([4; 5; 8; 15]);
    esperado = 7.7832;
    verifyEqual(casoDePrueba, round(actual, 4), esperado);
end

function testSumatoriaLnConMatriz(casoDePrueba)
    actual = sumatoriaLn(imagenes([1 4; 2 5; 3 8; 4 15]));
    esperado = 7.7832;
    verifyEqual(casoDePrueba, round(actual, 4), esperado);
end