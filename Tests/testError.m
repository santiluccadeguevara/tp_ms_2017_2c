function tests = testError
    tests = functiontests(localfunctions);
end

function testCalcularError()

    [m , b] = aproximacionLineal([ 1 2 3 4 ; 10 5 2 1 ]);
    
    matriz = [ 1 2 3 4 ; 10 5 2 1 ];
    
    calcularError([m , b], matriz);

end