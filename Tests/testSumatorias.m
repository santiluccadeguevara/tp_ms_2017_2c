function tests = testSumatorias
    tests = functiontests(localfunctions);
end

function testSumatoriaProductoAbscisaImagen(casoDePrueba)
    actual = sum(productoAbscisaImagen([1 4; 2 5; 3 8; 4 15]));
    esperado = 98;
    verifyEqual(casoDePrueba, actual, esperado);
end