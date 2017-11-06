function [error] = calcularColumnaDeError(columnaPolinomio, columnaY)

error = (columnaPolinomio - columnaY) .^2;

end

