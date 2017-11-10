function [var] = OptimizarParaLabel(n,decimales)
    aux=strcat('%.',num2str(decimales),'f');
    var=sprintf(aux,n); 
end

