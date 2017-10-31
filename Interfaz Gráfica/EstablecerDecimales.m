function [DATA] = EstablecerDecimales(data,tabla)
format long;
data=str2double(data);
data=(data.*((10)^(tabla.decimales)));
data=floor(data);
DATA=(data./((10)^(tabla.decimales)));
end