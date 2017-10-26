function cadena = getStringAproximacionLinealDePrueba

    [m, b] = getAproximacionLinealDePrueba;
    
    cadena = [num2str(m) 'x + ' num2str(b)];
    
end

