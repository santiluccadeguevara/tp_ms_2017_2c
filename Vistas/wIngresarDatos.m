function varargout = wIngresarDatos(varargin)
% WINGRESARDATOS MATLAB code for wIngresarDatos.fig
%      WINGRESARDATOS, by itself, creates a new WINGRESARDATOS or raises the existing
%      singleton*.
%
%      H = WINGRESARDATOS returns the handle to a new WINGRESARDATOS or the handle to
%      the existing singleton*.
%
%      WINGRESARDATOS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in WINGRESARDATOS.M with the given input arguments.
%
%      WINGRESARDATOS('Property','Value',...) creates a new WINGRESARDATOS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before wIngresarDatos_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to wIngresarDatos_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help wIngresarDatos

% Last Modified by GUIDE v2.5 25-Oct-2017 15:42:01

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @wIngresarDatos_OpeningFcn, ...
                   'gui_OutputFcn',  @wIngresarDatos_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before wIngresarDatos is made visible.
function wIngresarDatos_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to wIngresarDatos (see VARARGIN)

% Choose default command line output for wIngresarDatos
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes wIngresarDatos wait for user response (see UIRESUME)
% uiwait(handles.wIngresarDatos);

%elimino las filas predeterminadas de la tabla de valores.
tabla=cell(0,2);
tabla(:,:)={''};
set(handles.uitable1,'Data',tabla);

%Muestro en la ventana de Ingreso de Datos la cantidad de decimales
%seleccionada.

global decimales;
set(handles.tbxMostrarDecimales,'Style','text');
set(handles.tbxMostrarDecimales,'String',decimales);


% --- Outputs from this function are returned to the command line.
function varargout = wIngresarDatos_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function tbxXi_Callback(hObject, eventdata, handles)
% hObject    handle to tbxXi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of tbxXi as text
%        str2double(get(hObject,'String')) returns contents of tbxXi as a double


% --- Executes during object creation, after setting all properties.
function tbxXi_CreateFcn(hObject, eventdata, handles)
% hObject    handle to tbxXi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in btnRegistrar.
function btnRegistrar_Callback(hObject, eventdata, handles)
% hObject    handle to btnRegistrar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%global decimales;
format long;
xi=get(handles.tbxXi,'String');
fXi=get(handles.tbxfXi,'String');
duplicado=0;

%Verifico que se hayan ingresado los datos de la forma correcta. En caso afirmativo, los inserto en la tabla.
if strcmp(xi,"")||strcmp(fXi,"")
    set(handles.txtEstado,'String','Debe completar ambos campos.')
elseif isnan(str2double(xi))||isnan(str2double(fXi))
    set(handles.txtEstado,'String','Al menos uno de los campos contenía caracteres inválidos. Intente de nuevo por favor.')
    set(handles.tbxXi,'String','');
    set(handles.tbxfXi,'String','');
elseif find(xi==',')~=0
    set(handles.txtEstado,'String','Entrada inválida. Recuerde que la separación decimal es el punto, no la coma. Intente nuevamente.')
    set(handles.tbxXi,'String','');
    set(handles.tbxfXi,'String','');
elseif find(fXi==',')~=0
    set(handles.txtEstado,'String','Entrada inválida. Recuerde que la separación decimal es el punto, no la coma. Intente nuevamente.')
    set(handles.tbxXi,'String','');
    set(handles.tbxfXi,'String','');
else
    data=get(handles.uitable1, 'data');
    l=length(data(:,1));
    if l==0
        data(end+1,:)={xi,fXi};
        %data=EstablecerDecimales(data); %Acá debería almacenar en la tabla
        %la matriz con la cantidad de decimales que corresponde.
        set(handles.uitable1, 'data', data);
        set(handles.txtEstado,'String','Par ordenado ingresado correctamente.');
        set(handles.tbxXi,'String','');
        set(handles.tbxfXi,'String','');
    else
        for n=1:l
            if strcmp(data(n,1),xi)
                if strcmp(data(n,2),fXi)
                    set(handles.txtEstado,'String','El par ordenado ingresado ya estaba en la lista.');
                    set(handles.tbxXi,'String','');
                    set(handles.tbxfXi,'String','');
                    duplicado=1;
                    break;
                else
                    set(handles.txtEstado,'String','Ya hay un par ordenado en la tabla para la abscisa ingresada. Intente de nuevo por favor.');
                    set(handles.tbxXi,'String','');
                    set(handles.tbxfXi,'String','');
                    duplicado=1;
                    break;
                end
            end
        end
        if(duplicado==0)
            data(end+1,:)={xi,fXi};
            %data=EstablecerDecimales(data); %Acá debería almacenar en la tabla
            %la matriz con la cantidad de decimales que corresponde
            set(handles.uitable1, 'data', data);
            set(handles.txtEstado,'String','Par ordenado ingresado correctamente.');
            set(handles.tbxXi,'String','');
            set(handles.tbxfXi,'String','');
        end
    end
end

% --- Executes when entered data in editable cell(s) in uitable1.
function uitable1_CellEditCallback(hObject, eventdata, handles)
% hObject    handle to uitable1 (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.TABLE)
%	Indices: row and column indices of the cell(s) edited
%	PreviousData: previous data for the cell(s) edited
%	EditData: string(s) entered by the user
%	NewData: EditData or its converted form set on the Data property. Empty if Data was not changed
%	Error: error string when failed to convert EditData to appropriate value for Data
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object creation, after setting all properties.
function uitable1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to uitable1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function wIngresarDatos_CreateFcn(hObject, eventdata, handles)
% hObject    handle to wIngresarDatos (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
movegui('center')

function tbxfXi_Callback(hObject, eventdata, handles)
% hObject    handle to tbxfXi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of tbxfXi as text
%        str2double(get(hObject,'String')) returns contents of tbxfXi as a double


% --- Executes during object creation, after setting all properties.
function tbxfXi_CreateFcn(hObject, eventdata, handles)
% hObject    handle to tbxfXi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function tbxEditar_Callback(hObject, eventdata, handles)
% hObject    handle to tbxEditar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of tbxEditar as text
%        str2double(get(hObject,'String')) returns contents of tbxEditar as a double


% --- Executes during object creation, after setting all properties.
function tbxEditar_CreateFcn(hObject, eventdata, handles)
% hObject    handle to tbxEditar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in btnEditar.
function btnEditar_Callback(hObject, eventdata, handles)
% hObject    handle to btnEditar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

format long;
set(handles.tbxEditar,'Style','text');
fila=get(handles.tbxEditar,'String');
data=get(handles.uitable1, 'data');
l=length(data(:,1));

%Acá se verifica que el valor ingresado por el usuario (para editar una fila)
%se corresponda con alguno de los números de fila para poder eliminarlo.
%Caso contrario se le informa que no puede continuar.

if isstrprop(fila,'digit')
    fila=str2double(fila);
    if fila<l&&fila>0
        set(handles.tbxNuevoXi,'Style','edit');
        set(handles.tbxNuevoXi,'String',data(fila,1));
        set(handles.tbxNuevoFXi,'Style','edit');
        set(handles.tbxNuevoFXi,'String',data(fila,2));
        set(handles.btnGuardarEditar,'Enable','on');
        set(handles.btnCancelar,'Enable','on');
    else
       set(handles.txtEstado,'String','El valor ingresado está fuera del rango de filas de la tabla de valores. Intente de nuevo.'); 
       set(handles.tbxEditar,'String','');
    end
else
    set(handles.txtEstado,'String','El valor ingresado no es un número');
    set(handles.tbxEditar,'String','');
end

% --- Executes on button press in btnEliminarFila.
function btnEliminarFila_Callback(hObject, eventdata, handles)
% hObject    handle to btnEliminarFila (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

format long;
fila=get(handles.tbxEditar,'String');
data=get(handles.uitable1, 'data');
l=length(data(:,1));

%Acá se verifica que el valor ingresado por el usuario se corresponda con
%alguno de los números de fila para poder eliminarlo.

if isstrprop(fila,'digit')
    fila=str2double(fila);
    if fila<l&&fila>0
       data(fila,:)=[];
       set(handles.uitable1, 'data', data);
       set(handles.tbxEditar,'String','')
    else
       set(handles.txtEstado,'String','El valor ingresado está fuera del rango de filas de la tabla de valores. Intente de nuevo.'); 
       set(handles.tbxEditar,'String','');
    end
else
    set(handles.txtEstado,'String','El valor ingresado no es un número');
    set(handles.tbxEditar,'String','');
end


% --- Executes during object creation, after setting all properties.
function tbxNuevoXi_CreateFcn(hObject, eventdata, handles)
% hObject    handle to tbxNuevoXi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function tbxNuevoFXi_CreateFcn(hObject, eventdata, handles)
% hObject    handle to tbxNuevoFXi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on button press in btnGuardarEditar.
function btnGuardarEditar_Callback(hObject, eventdata, handles)
% hObject    handle to btnGuardarEditar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%global decimales;
format long;
fila=get(handles.tbxEditar,'String');
fila=str2double(fila);
nuevoXi=get(handles.tbxNuevoXi,'String');
nuevoFXi=get(handles.tbxNuevoFXi,'String');
duplicado=0;

%Verifico que se hayan ingresado los datos de la forma correcta. En caso afirmativo, se actualiza la fila correspondiente en la tabla.
data=get(handles.uitable1, 'data');
if strcmp(nuevoXi,"")||strcmp(nuevoFXi,"")
    set(handles.txtEstado,'String','Debe completar ambos campos.')
elseif isnan(str2double(nuevoXi))||isnan(str2double(nuevoFXi))
    set(handles.txtEstado,'String','Al menos uno de los campos contenía caracteres inválidos. Intente de nuevo por favor.')
    set(handles.tbxNuevoXi,'String',data(fila,1));
    set(handles.tbxNuevoFXi,'String',data(fila,2));
elseif find(nuevoXi==",")~=0
    set(handles.txtEstado,'String','Entrada inválida. Recuerde que la separación decimal es el punto, no la coma. Intente nuevamente.')
    set(handles.tbxNuevoXi,'String',data(fila,1));
    set(handles.tbxNuevoFXi,'String',data(fila,2));
elseif find(nuevoFXi==",")~=0
    set(handles.txtEstado,'String','Entrada inválida. Recuerde que la separación decimal es el punto, no la coma. Intente nuevamente.')
    set(handles.tbxNuevoXi,'String',data(fila,1));
    set(handles.tbxNuevoFXi,'String',data(fila,2));
else
    l=length(data(:,1));
    for n=1:l
        if strcmp(data(n,1),nuevoXi)
            if strcmp(data(n,2),nuevoFXi)
                set(handles.txtEstado,'String','El par ordenado ingresado ya estaba en la lista.');
                set(handles.tbxNuevoXi,'String',data(fila,1));
                set(handles.tbxNuevoFXi,'String',data(fila,2));;
                duplicado=1;
                break;
            else
                set(handles.txtEstado,'String','Ya hay un par ordenado en la tabla para la abscisa ingresada. Intente de nuevo por favor.');
                set(handles.tbxNuevoXi,'String',data(fila,1));
                set(handles.tbxNuevoFXi,'String',data(fila,2));
                duplicado=1;
                break;
            end
        end
    end
    if(duplicado==0)
        data(str2double(fila),:)=[nuevoXi nuevoFXi];
        %data=EstablecerDecimales(data);
        set(handles.uitable1, 'data', data);
        set(handles.txtEstado,'String','Par ordenado modificado correctamente.');
        set(handles.tbxEditar,'Style','edit');
        set(handles.tbxNuevoXi,'string','');
        set(handles.tbxNuevoFXi,'string','');
        set(handles.tbxEditar,'string','');
        set(handles.btnGuardarEditar,'Enable','off');
        set(handles.btnCancelar,'Enable','off');
    end
end

% --- Executes on button press in btnCancelar.
function btnCancelar_Callback(hObject, eventdata, handles)
% hObject    handle to btnCancelar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
format long;
set(handles.tbxEditar,'Style','edit');
set(handles.tbxNuevoXi,'Style','text');
set(handles.tbxNuevoFXi,'Style','text');
set(handles.tbxNuevoXi,'string','');
set(handles.tbxNuevoFXi,'string','');
set(handles.tbxEditar,'string','');
set(handles.btnGuardarEditar,'Enable','off');
set(handles.btnCancelar,'Enable','off');


% --- Executes on button press in btnResetear.
function btnResetear_Callback(hObject, eventdata, handles)
% hObject    handle to btnResetear (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

data=get(handles.uitable1, 'data');
data(:,:)=[];
set(handles.uitable1, 'data', data);



function tbxMostrarDecimales_Callback(hObject, eventdata, handles)
% hObject    handle to tbxMostrarDecimales (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of tbxMostrarDecimales as text
%        str2double(get(hObject,'String')) returns contents of tbxMostrarDecimales as a double


% --- Executes during object creation, after setting all properties.
function tbxMostrarDecimales_CreateFcn(hObject, eventdata, handles)
% hObject    handle to tbxMostrarDecimales (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in lbxAproximaciones.
function lbxAproximaciones_Callback(hObject, eventdata, handles)
% hObject    handle to lbxAproximaciones (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns lbxAproximaciones contents as cell array
%        contents{get(hObject,'Value')} returns selected item from lbxAproximaciones


% --- Executes during object creation, after setting all properties.
function lbxAproximaciones_CreateFcn(hObject, eventdata, handles)
% hObject    handle to lbxAproximaciones (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in CbxAproximaciones.
function CbxAproximaciones_Callback(hObject, eventdata, handles)
% hObject    handle to CbxAproximaciones (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns CbxAproximaciones contents as cell array
%        contents{get(hObject,'Value')} returns selected item from CbxAproximaciones


% --- Executes during object creation, after setting all properties.
function CbxAproximaciones_CreateFcn(hObject, eventdata, handles)
% hObject    handle to CbxAproximaciones (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in btnVerificar.
function btnVerificar_Callback(hObject, eventdata, handles)
% hObject    handle to btnVerificar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


%La idea es que acá hagamos lo necesario para verificar que la cantidad de
%pares ordenados ingresado son suficientes para la aproximación
%seleccionada.
data=get(handles.uitable1, 'data');
l=length(data(:,1));

switch get(handles.cbxAproximaciones,'Value')
    case 1 %Lineal
        if l<2
            set(handles.tbxVerificar,'String','La cantidad de pares ordenados ingresados son insuficientes para realizar esta aproximación');
        else
            set(handles.tbxVerificar,'String','La aproximación puede realizarse correctamente');



        end
end

function edit11_Callback(hObject, eventdata, handles)
% hObject    handle to tbxVerificar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of tbxVerificar as text
%        str2double(get(hObject,'String')) returns contents of tbxVerificar as a double


% --- Executes during object creation, after setting all properties.
function tbxVerificar_CreateFcn(hObject, eventdata, handles)
% hObject    handle to tbxVerificar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton10.
function pushbutton10_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in btnMostrarFuncion.
function btnMostrarFuncion_Callback(hObject, eventdata, handles)
% hObject    handle to btnMostrarFuncion (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton12.
function pushbutton12_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in btnMostrarTabla.
function btnMostrarTabla_Callback(hObject, eventdata, handles)
% hObject    handle to btnMostrarTabla (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in btnMostrarGrafica.
function btnMostrarGrafica_Callback(hObject, eventdata, handles)
% hObject    handle to btnMostrarGrafica (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object creation, after setting all properties.
function tbxFuncionAproximante_CreateFcn(hObject, eventdata, handles)
% hObject    handle to tbxFuncionAproximante (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on button press in btnCancelarDatos.
function btnCancelarDatos_Callback(hObject, eventdata, handles)
% hObject    handle to btnCancelarDatos (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in btnVolverMenu.
function btnVolverMenu_Callback(hObject, eventdata, handles)
% hObject    handle to btnVolverMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
