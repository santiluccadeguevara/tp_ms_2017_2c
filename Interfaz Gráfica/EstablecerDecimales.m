function [DATA] = EstablecerDecimales(data,tabla)
format long;
data=str2double(data);
DATA=round(data,tabla.decimales);
end