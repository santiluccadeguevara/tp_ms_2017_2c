function graficarAproximacionLineal(m, b, X, decimales)

    for i=1:length(X(1,:))
        hold on; 
        plot (X(1,i),X(2,i),'*','MarkerEdgeColor','r','LineWidth',1); 
    end 

    %Extremos a considerar para el gráfico
    
    e1=min(X(1,:))-10;
    e2=max(X(1,:))+10;
    e3=min(X(2,:))-10;
    e4=max(X(2,:))+10;

    %Grafico de la recta obtenida
    
    fplot(@(x) m*x + b,'g')
    xlim([e1 e2]);
    ylim([e3 e4]);
    
    %Asigno el título del gráfico. Sólo puedo mostrar texto con formato
    %piola en los ploteos, así que cambié el título anterior por la función
    %aproximante: con los dos últimos parámetros de la función title y
    %xlabel, se asigna el formato cheto a las funciones.
    
    title(mostrarFuncion(m, b, decimales), 'interpreter', 'latex');
    
    xlabel(mostrarError(m, b, X, decimales), 'interpreter', 'latex');
    
end

function [funcion] = mostrarFuncion(m, b, decimales) 

    funcion = ['Polinomio aproximante: $' OptimizarParaLabel(m, decimales) 'x + ' OptimizarParaLabel(b,decimales) '$'];

end

function [error] = mostrarError(m, b, X, decimales)

    error = ['Error: ' OptimizarParaLabel(calcularErrorLineal([m, b], X),decimales)];

end