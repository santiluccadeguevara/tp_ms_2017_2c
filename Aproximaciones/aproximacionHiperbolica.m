function [a,b]=aproximacionHiperbolica(X) 
%X es la matriz a utilizar%

n=length(X(1,:));
A=0;%Es la sumatoria de Xi 
B=0;%Es la sumatoria de Yi
C=0;%Es la sumatoria de Xi al cuadrado
D=0;%Es la sumatoria de Yi*Xi

for i=1:n
    A=A+inv(X(1,i));
    B=B+X(2,i);
    C=C+inv((X(1,i))^2);
    D=D+(X(2,i)/X(1,i));
end 

b=(n*D-A*B)/(n*C-A^2);
a=(C*B-D*A)/(n*C-A^2);

for i=1:n
    hold on; 
    plot (X(1,i),X(2,i),'*','MarkerEdgeColor','r','LineWidth',1); 
end 

%Extremos a considerar para el gráfico
e1=min(X(1,:))-2
e2=max(X(1,:))+2
e3=min(X(2,:))-2
e4=max(X(2,:))+2

%Grafico de la hipérbola obtenida
fplot(@(x)(b/x)+a,'b')
xlim([e1 e2]);
ylim([e3 e4]);
title('Aproximación hiperbólica por mínimos cuadrados');

end