function [valor, indiceMejorAproximacion] = obtenerMejorAproximacion(datosParaliticos)

    [tabla, resultados] = dameLaTabla(datosParaliticos);
    
    errores(1,1) = resultados(1,8);
    errores(1,2) = resultados(1,9);
    errores(1,3) = resultados(1,10);
    errores(1,4) = resultados(1,11);
    errores(1,5) = resultados(1,12);

    [valor, indiceMejorAproximacion] = min(errores);
    
end

