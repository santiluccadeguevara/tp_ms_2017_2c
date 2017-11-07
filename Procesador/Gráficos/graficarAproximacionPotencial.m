function graficarAproximacionPotencial(a, b, X)

    for i=1:length(X(1,:))
        hold on; 
        plot (X(1,i),X(2,i),'*','MarkerEdgeColor','r','LineWidth',1); 
    end 

    %Extremos a considerar para el gráfico
    
    e1=min(X(1,:))-10;
    e2=max(X(1,:))+10;
    e3=min(X(2,:))-10;
    e4=max(X(2,:))+10;

    %Grafico de la curva potencial obtenida
    
    fplot(@(x) b*(x).^a ,'m')
    xlim([e1 e2]);
    ylim([e3 e4]);
    title(mostrarFuncion(a, b));
    
    xlabel(['Error: ' num2str(calcularErrorPotencial([a, b], X))]);

end

function [funcion] = mostrarFuncion(a, b)    
    
    funcion = ['Polinomio aproximante: ' num2str(b) 'x^{' num2str(a) '}'];
    
end