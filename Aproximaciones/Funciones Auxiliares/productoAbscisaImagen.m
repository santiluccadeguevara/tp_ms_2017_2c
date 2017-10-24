function columnaProducto = productoAbscisaImagen(tablaDeValores)
    columnaProducto = zeros(cantidadPuntos(tablaDeValores), 1);

    for i = 1:cantidadPuntos(tablaDeValores)
        columnaProducto(i) = tablaDeValores(i, 1) * tablaDeValores(i, 2);
    end
end

