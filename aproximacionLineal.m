function [m,b]=aproximacionLineal(X) 
%X es la matriz a utilizar%
n=length(X(1,:)); 
A=0; 
B=0; 
C=0; 
D=0; 


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


x=X(1,1):1:X(1,n); 
y=m*x+b; 
plot(x,y,'b'); 
title('Aproximación lineal por mínimos cuadrados');

end

