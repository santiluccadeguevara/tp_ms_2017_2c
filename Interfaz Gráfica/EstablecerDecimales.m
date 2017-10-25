function [DATA] = EstablecerDecimales(data)
format long;
global decimales;
l=length(data(:,1));
data=str2double(data);
decimales=str2double(decimales);
data=(data.*((10)^decimales));
data=floor(data);
DATA=(data./((10)^decimales));
decimales=num2str(decimales);
end