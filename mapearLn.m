function [columnaDeValores] = mapearLn(columnaDeValores)
    for i = 1 : cantidadPuntos(columnaDeValores)
        columnaDeValores(i) = log(columnaDeValores(i));
    end
end

