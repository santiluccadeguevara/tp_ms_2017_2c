function graficarAproximacionCuadratica(a, b, c, X)

    for i=1:length(X(1,:)) 
        hold on; 
        plot (X(1,i),X(2,i),'*','MarkerEdgeColor','r','LineWidth',1); 
    end 

    %Extremos a considerar para el gráfico
    
    e1=min(X(1,:))-2;
    e2=max(X(1,:))+2;
    e3=min(X(2,:))-2;
    e4=max(X(2,:))+2;

    %Grafico de la parábola obtenida
    
    fplot(@(x) a*x.^2 + b*x + c,'k')
    xlim([e1 e2]);
    ylim([e3 e4]);
    title('Aproximación cuadrática por mínimos cuadrados');
    
end