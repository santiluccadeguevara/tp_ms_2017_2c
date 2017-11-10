function graficarAproximacionExponencial(a, b, X, decimales)

    for i=1:length(X(1,:))
        hold on; 
        plot (X(1,i),X(2,i),'*','MarkerEdgeColor','r','LineWidth',1); 
    end

    %Extremos a considerar para el gráfico
    
    e1=min(X(1,:))-10;
    e2=max(X(1,:))+10;
    e3=min(X(2,:))-10;
    e4=max(X(2,:))+10;

    %Grafico de la exponencial obtenida
    
    fplot(@(x) b*exp(a*x),'b')
    xlim([e1 e2]);
    ylim([e3 e4]);
    
    title(mostrarFuncion(a, b, decimales), 'interpreter', 'latex');
    
    xlabel(mostrarError(a, b, X, decimales), 'interpreter', 'latex');
    
end

function [funcion] = mostrarFuncion(a, b, decimales) 

    funcion = ['Polinomio aproximante: $' OptimizarParaLabel(b, decimales) 'e^{' OptimizarParaLabel(a, decimales) '}$'];

end

function [error] = mostrarError(a, b, X, decimales)

    error = ['Error: ' OptimizarParaLabel(calcularErrorExponencial([a, b], X),decimales)];

end