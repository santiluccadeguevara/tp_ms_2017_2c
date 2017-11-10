function [tablaOptimizada] = OptimizarParaTabla(tabla,decimales)
    aux=strcat('%.',num2str(decimales),'f');
    nFilas=length(tabla(:,1));
    mColumnas=length(tabla(1,:));
    table={};
    
    for i=1:nFilas
        for j=1:mColumnas
            table{i,j}=sprintf(aux,tabla(i,j));
        end
    end
    
    tablaOptimizada=table;    
end

