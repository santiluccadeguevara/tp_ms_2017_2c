function testGraficos()
    testGraficoLineal();
    testGraficoCuadratica();
    testGraficoExponencial();
    testGraficoPotencial();
    testGraficoHiperbolica();
end

function testGraficoLineal()
    A = [ 1 2 3 4 ; 10 5 2 1 ];
    
    [m , b] = aproximacionLineal(A);

    graficarAproximacionLineal(m, b, A);
end

function testGraficoCuadratica()
    A = [ 1 2 3 4 ; 10 5 2 1 ];

    [a, b, c] = aproximacionCuadratica(A);

    graficarAproximacionCuadratica(a, b, c, A);
end

function testGraficoExponencial()
    A = [ 1 2 3 4 ; 10 5 2 1 ];

    [a , b] = aproximacionExponencial(A);
    
    graficarAproximacionExponencial(a, b, A);
end

function testGraficoPotencial()
    A = [1 2 3 4 5 6 7 8 9 10 11 12 ; 20 35 45 40 55 55 58 62 60 65 72 68];
    
    [a, b] = aproximacionPotencial(A);
    
    graficarAproximacionPotencial(a, b, A);
end

function testGraficoHiperbolica()
    A = [0.1 0.7 1.2 2.4 2.9 3.5 4.1 4.4 5 5.8 6.2 6.6 ; 3.354 3.563 3.862 4.523 4.952 5.433 6.21 6.534 7.567 9.265 10.986 12.851];
    
    [a , b] = aproximacionHiperbolica(A);
    
    graficarAproximacionHiperbolica(a, b, A);
end
