function graficarAproximacionLineal(m, b, X)

    for i=1:length(X(1,:))
        hold on; 
        plot (X(1,i),X(2,i),'*','MarkerEdgeColor','r','LineWidth',1); 
    end 

    %Extremos a considerar para el gráfico
    
    e1=min(X(1,:))-2;
    e2=max(X(1,:))+2;
    e3=min(X(2,:))-2;
    e4=max(X(2,:))+2;

    %Grafico de la recta obtenida
    
    fplot(@(x) m*x + b,'g')
    xlim([e1 e2]);
    ylim([e3 e4]);
    title('Aproximación lineal por mínimos cuadrados');

end
