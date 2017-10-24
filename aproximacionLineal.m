function [m,b]=aproximacionLineal(X) 
%X es la matriz a utilizar%

n=length(X(1,:)); 
A=0;%Es la sumatoria de Xi 
B=0;%Es la sumatoria de Yi
C=0;%Es la sumatoria de Xi al cuadrado
D=0;%Es la sumatoria de Yi*Xi

for i=1:n; 
    A=A+X(1,i); 
    B=B+X(2,i); 
    C=C+(X(1,i))^2; 
    D=D+X(1,i)*X(2,i); 
end 

m=(n*D-A*B)/(n*C-A^2);
b=(C*B-D*A)/(n*C-A^2);
 

for i=1:n; 
    hold on; 
    plot (X(1,i),X(2,i),'*','MarkerEdgeColor','r','LineWidth',1); 
end 

%Extremos a considerar para el gráfico
e1 =-X(1,1);
e2=X(1,n);

%Grafico de la recta obtenida
fplot(@(x) m*x + b,[e1 e2],'b')
title('Aproximación lineal por mínimos cuadrados');

end
