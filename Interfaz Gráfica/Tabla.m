classdef Tabla<matlab.mixin.SetGet
    %Clase para la tabla de valores.
    
    properties
        matriz;
        decimales=0;
        largo=0;
        decimalesDefinidos=false;
    end
    
    methods
        
        function obj = Tabla()
            matriz=[];
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
        
        function obj = set.decimalesDefinidos(obj,decimalesDefinidos)
            obj.decimalesDefinidos = decimalesDefinidos;
        end
        
        function decimalesDefinidos = get.decimalesDefinidos(obj)
            decimalesDefinidos = obj.decimalesDefinidos;
        end
    end
end