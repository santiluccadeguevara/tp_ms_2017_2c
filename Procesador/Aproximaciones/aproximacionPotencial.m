function [a,b]=aproximacionPotencial(X)

    %X es la matriz a utilizar%
    
    n=length(X(1,:));

    Xi=log(X(1 , :));%Es la columna de ln(Xi) 
    Yi=log(X(2 , :));%Es la columna de ln(Yi) 

    A=sum(Xi);%Es la sumatoria de ln(Xi)
    B=sum(Yi);%Es la sumatoria de ln(Yi)
    C=sum(Xi.^2);%Es la sumatoria de ln(Xi) al cuadrado
    D=sum(Xi.*Yi);%Es la sumatoria de ln(Xi)*ln(Yi) 

    a=(n*D-A*B)/(n*C-A^2);
    b=exp((C*B-D*A)/(n*C-A^2));

end

