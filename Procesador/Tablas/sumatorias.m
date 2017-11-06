function [sumatorias] = sumatorias(tabla)

    n = length(tabla(1,:));
    
    sumatorias = [ n sum(tabla)];
    
end

