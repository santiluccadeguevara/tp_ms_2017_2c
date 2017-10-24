function [sumatoria] = sumatoriaLn(columnaValores)
    sumatoria = 0;
    
    for i = 1:cantidadPuntos(columnaValores)
        sumatoria = sumatoria + log(columnaValores(i));
    end
    
end

