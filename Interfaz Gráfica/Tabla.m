classdef Tabla<matlab.mixin.SetGet
    %Clase para la tabla de valores.
    
    properties
        matriz=0;
        largo=0;
        decimales=0;
    end
    
    methods
        function obj = Tabla()
             obj.matriz=0;
             obj.largo=0;
             obj.decimales=0;
         end
        function obj = set.matriz(obj,matriz)
            obj.matriz = matriz;
        end
        
        function matriz = get.matriz(obj)
            matriz = obj.matriz;
        end
        
        function obj = set.largo(obj,largo)
            obj.largo = largo;
        end
        
        function largo = get.largo(obj)
            largo = obj.largo;
        end
        
        function obj = set.decimales(obj,decimales)
            obj.decimales = decimales;
        end
        
        function decimales = get.decimales(obj)
            decimales = obj.decimales;
        end
    end
end