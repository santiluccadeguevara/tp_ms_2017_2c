function graficarAproximacionLineal(m, b, X)
    %Trunca la cantidad de decimales que se muestran por pantalla    
    digits(4);

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
    
    %Asigno el título del gráfico. Sólo puedo mostrar texto con formato
    %piola en los ploteos, así que cambié el título anterior por la función
    %aproximante: con los dos últimos parámetros de la función title y
    %xlabel, se asigna el formato cheto a las funciones.
    
    title(['Polinomio aproximante: ' mostrarFuncion(m, b)], 'interpreter', 'latex');
    
    xlabel(['Error: ' num2str(calcularErrorLineal([m, b], X))], 'interpreter', 'latex');

end

function [funcion] = mostrarFuncion(pendiente, ordenada)    
    %Defino la variable de la aproximación lineal para representarla
    %simbólicamente
    syms x;
    
    
    %Defino los coeficientes de la aproximación para representarlos
    %simbólicamentes, estableciendo qué tipo de número quiero porque si no,
    %sólo muestra números racionales.
    m = sym(pendiente, 'd');
    b = sym(ordenada, 'd');
    
    %Convierto la expresión formada por los símbolos definidos con sym al
    %formato LaTex para poder representarlos de forma fachera.
    funcion = latex(m*x + b);
    
end