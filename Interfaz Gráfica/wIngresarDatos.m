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

% Last Modified by GUIDE v2.5 30-Oct-2017 23:09:32

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
movegui('center');


% --- Executes just before wIngresarDatos is made visible.
function wIngresarDatos_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to wIngresarDatos (see VARARGIN)

handles.tabla=varargin{1};

% Choose default command line output for wIngresarDatos
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes wIngresarDatos wait for user response (see UIRESUME)
% uiwait(handles.figure3);
tabla=cell(0,2);
tabla(:,:)={''};
set(handles.tbValores,'Data',tabla);

tabla=handles.tabla;
set(handles.txtDecimales,'String',num2str(tabla.decimales));

if(~isempty(tabla.matriz))
    set(handles.tbValores,'Data',tabla.matriz);
end

% --- Outputs from this function are returned to the command line.
function varargout = wIngresarDatos_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in btnCancelar.
function btnCancelar_Callback(hObject, eventdata, handles)
% hObject    handle to btnCancelar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

close;


% --- Executes on button press in btnAproximar.
function btnAproximar_Callback(hObject, eventdata, handles)
% hObject    handle to btnAproximar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

tabla=handles.tabla;
if isempty(tabla.matriz)
    set(handles.txtEstadoIngresarDatos,'String','No hay datos para aproximar');
elseif tabla.largo==1
    set(handles.txtEstadoIngresarDatos,'String','Debe ingresar al menos dos pares ordenados para realizar una aproximación');
else
    interfazAproximacionSeleccion(tabla);
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
tabla=handles.tabla;
fila=get(handles.tbxEditar,'String');

%Acá se verifica que el valor ingresado por el usuario (para editar una fila)
%se corresponda con alguno de los números de fila para poder eliminarlo.
%Caso contrario se le informa que no puede continuar.

if(isempty(fila))
    set(handles.txtEstadoIngresarDatos,'String','No se ha ingresado ningún valor');
    set(handles.tbxEditar,'String','');
    set(handles.tbxEditar,'Style','edit');
    set(handles.tbxNuevoXi,'Style','text');
    set(handles.tbxNuevoFXi,'Style','text');
    set(handles.tbxNuevoXi,'string','');
    set(handles.tbxNuevoFXi,'string','');
    set(handles.btnActualizar,'Enable','off');
    set(handles.btnLimpiar,'Enable','off');
elseif ~isstrprop(fila,'digit')
    set(handles.txtEstadoIngresarDatos,'String','El valor ingresado no es un número');
    set(handles.tbxEditar,'String','');
    set(handles.tbxEditar,'Style','edit');
    set(handles.tbxNuevoXi,'Style','text');
    set(handles.tbxNuevoFXi,'Style','text');
    set(handles.tbxNuevoXi,'string','');
    set(handles.tbxNuevoFXi,'string','');
    set(handles.btnActualizar,'Enable','off');
    set(handles.btnLimpiar,'Enable','off');
elseif ((str2double(fila)>tabla.largo)||(str2double(fila)<0))
    set(handles.txtEstadoIngresarDatos,'String','El valor ingresado está fuera del rango de filas de la tabla de valores. Intente de nuevo.'); 
    set(handles.tbxEditar,'String','');
    set(handles.tbxEditar,'Style','edit');
    set(handles.tbxNuevoXi,'Style','text');
    set(handles.tbxNuevoFXi,'Style','text');
    set(handles.tbxNuevoXi,'string','');
    set(handles.tbxNuevoFXi,'string','');
    set(handles.btnActualizar,'Enable','off');
    set(handles.btnLimpiar,'Enable','off');
elseif ((contains(fila,','))||(contains(fila,'.')))
    set(handles.txtEstadoIngresarDatos,'String','Solo se permiten enteros. Intente de nuevo.'); 
    set(handles.tbxEditar,'String','');
    set(handles.tbxEditar,'Style','edit');
    set(handles.tbxNuevoXi,'Style','text');
    set(handles.tbxNuevoFXi,'Style','text');
    set(handles.tbxNuevoXi,'string','');
    set(handles.tbxNuevoFXi,'string','');
    set(handles.btnActualizar,'Enable','off');
    set(handles.btnLimpiar,'Enable','off');
else
    set(handles.tbxNuevoXi,'Style','edit');
    set(handles.tbxNuevoXi,'String',tabla.matriz(str2double(fila),1));
    set(handles.tbxNuevoFXi,'Style','edit');
    set(handles.tbxNuevoFXi,'String',tabla.matriz(str2double(fila),2));
    set(handles.btnActualizar,'Enable','on');
    set(handles.btnLimpiar,'Enable','on');
    set(handles.txtEstadoIngresarDatos,'String','Par ordenado encontrado');
end

% --- Executes on button press in btnEliminar.
function btnEliminar_Callback(hObject, eventdata, handles)
% hObject    handle to btnEliminar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

format long;
tabla=handles.tabla;
fila=get(handles.tbxEditar,'String');

%Acá se verifica que el valor ingresado por el usuario (para editar una fila)
%se corresponda con alguno de los números de fila para poder eliminarlo.
%Caso contrario se le informa que no puede continuar.


if(isempty(fila))
    set(handles.txtEstadoIngresarDatos,'String','No se ha ingresado ningún valor');
    set(handles.tbxEditar,'String','');
    set(handles.tbxEditar,'Style','edit');
    set(handles.tbxNuevoXi,'Style','text');
    set(handles.tbxNuevoFXi,'Style','text');
    set(handles.tbxNuevoXi,'string','');
    set(handles.tbxNuevoFXi,'string','');
    set(handles.btnActualizar,'Enable','off');
    set(handles.btnLimpiar,'Enable','off');
elseif ~isstrprop(fila,'digit')
    set(handles.txtEstadoIngresarDatos,'String','El valor ingresado no es un número');
    set(handles.tbxEditar,'String','');
elseif ((str2double(fila)>tabla.largo)||(str2double(fila)<1))
    set(handles.txtEstadoIngresarDatos,'String','El valor ingresado está fuera del rango de filas de la tabla de valores. Intente de nuevo.'); 
    set(handles.tbxEditar,'String','');
elseif ((contains(fila,','))||(contains(fila,'.')))
    set(handles.txtEstadoIngresarDatos,'String','Solo se permiten enteros. Intente de nuevo.'); 
    set(handles.tbxEditar,'String','');
else
    tabla=wConfirmacionEliminar(fila,tabla);
    set(handles.tbValores, 'data', tabla.matriz);
    set(handles.txtEstadoIngresarDatos,'String','Par ordenado eliminado correctamente.');
    set(handles.tbxEditar,'String','');
    handles.tabla=tabla;
end


% --- Executes on button press in btnResetear.
function btnResetear_Callback(hObject, eventdata, handles)
% hObject    handle to btnResetear (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

tabla=handles.tabla;
if(isempty(tabla.matriz))
    set(handles.txtEstadoIngresarDatos,'String','La tabla está vacía. Nada para eliminar')
else
    tabla=wConfirmacionResetear(tabla);
    set(handles.tbValores, 'data', tabla.matriz);
end
handles.tabla=tabla;


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



function tbxFXi_Callback(hObject, eventdata, handles)
% hObject    handle to tbxFXi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of tbxFXi as text
%        str2double(get(hObject,'String')) returns contents of tbxFXi as a double


% --- Executes during object creation, after setting all properties.
function tbxFXi_CreateFcn(hObject, eventdata, handles)
% hObject    handle to tbxFXi (see GCBO)
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
format long;

tabla=handles.tabla;
xi=get(handles.tbxXi,'String');
fXi=get(handles.tbxFXi,'String');

if strcmp(xi,"")||strcmp(fXi,"")
    set(handles.txtEstadoIngresarDatos,'String','Debe completar ambos campos.')
elseif isnan(str2double(xi))||isnan(str2double(fXi))
    set(handles.txtEstadoIngresarDatos,'String','Al menos uno de los campos contenía caracteres inválidos. Intente de nuevo por favor.')
    set(handles.tbxXi,'String','');
    set(handles.tbxFXi,'String','');
elseif contains(xi,',')||contains(fXi,',')
    set(handles.txtEstadoIngresarDatos,'String','Entrada inválida. Recuerde que la separación decimal es el punto, no la coma. Intente nuevamente.')
    set(handles.tbxXi,'String','');
    set(handles.tbxFXi,'String','');
elseif(~isempty(tabla.matriz)&&ismember(str2double(xi),tabla.matriz(:,1)))
    set(handles.txtEstadoIngresarDatos,'String','Ya hay un par ordenado en la tabla para la abscisa ingresada. Intente de nuevo por favor.');
    set(handles.tbxXi,'String','');
    set(handles.tbxFXi,'String','');
else
    xi=EstablecerDecimales(xi,tabla);
    fXi=EstablecerDecimales(fXi,tabla);
    tabla.matriz(end+1,:)=[xi fXi];
    tabla.largo=tabla.largo+1;
    handles.tabla=tabla;
    set(handles.tbValores, 'data', tabla.matriz);
    set(handles.txtEstadoIngresarDatos,'String','Par ordenado ingresado correctamente.');
    set(handles.tbxXi,'String','');
    set(handles.tbxFXi,'String','');
end

% --- Executes on button press in btnActualizar.
function btnActualizar_Callback(hObject, eventdata, handles)
% hObject    handle to btnActualizar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

tabla=handles.tabla;
fila=get(handles.tbxEditar,'String');
nuevoXi=get(handles.tbxNuevoXi,'String');
nuevoFXi=get(handles.tbxNuevoFXi,'String');

if ~isstrprop(fila,'digit')
    set(handles.txtEstadoIngresarDatos,'String','El valor ingresado no es un número');
    set(handles.tbxEditar,'String','');
    set(handles.tbxEditar,'Style','edit');
    set(handles.tbxNuevoXi,'Style','text');
    set(handles.tbxNuevoFXi,'Style','text');
    set(handles.tbxNuevoXi,'string','');
    set(handles.tbxNuevoFXi,'string','');
    set(handles.btnActualizar,'Enable','off');
    set(handles.btnLimpiar,'Enable','off');
elseif ((str2double(fila)>tabla.largo)||(str2double(fila)<1))
    set(handles.txtEstadoIngresarDatos,'String','El valor ingresado está fuera del rango de filas de la tabla de valores. Intente de nuevo.'); 
    set(handles.tbxEditar,'String','');
    set(handles.tbxEditar,'Style','edit');
    set(handles.tbxNuevoXi,'Style','text');
    set(handles.tbxNuevoFXi,'Style','text');
    set(handles.tbxNuevoXi,'string','');
    set(handles.tbxNuevoFXi,'string','');
    set(handles.btnActualizar,'Enable','off');
    set(handles.btnLimpiar,'Enable','off');
elseif ((contains(fila,','))||(contains(fila,'.')))
    set(handles.txtEstadoIngresarDatos,'String','Solo se permiten enteros. Intente de nuevo.'); 
    set(handles.tbxEditar,'String','');
    set(handles.tbxEditar,'Style','edit');
    set(handles.tbxNuevoXi,'Style','text');
    set(handles.tbxNuevoFXi,'Style','text');
    set(handles.tbxNuevoXi,'string','');
    set(handles.tbxNuevoFXi,'string','');
    set(handles.btnActualizar,'Enable','off');
    set(handles.btnLimpiar,'Enable','off');
elseif strcmp(nuevoXi,"")||strcmp(nuevoFXi,"")
    set(handles.txtEstadoIngresarDatos,'String','Debe completar ambos campos.')
elseif isnan(str2double(nuevoXi))||isnan(str2double(nuevoFXi))
    set(handles.txtEstadoIngresarDatos,'String','Al menos uno de los campos contenía caracteres inválidos. Intente de nuevo por favor.')
    set(handles.tbxNuevoXi,'String',tabla.matriz(str2double(fila),1));
    set(handles.tbxNuevoFXi,'String',tabla.matriz(str2double(fila),2));
elseif(~isempty(tabla.matriz)&&ismember(str2double(nuevoXi),tabla.matriz(:,1)))
    set(handles.txtEstadoIngresarDatos,'String','Ya hay un par ordenado en la tabla para la abscisa ingresada. Intente de nuevo por favor.');
    set(handles.tbxNuevoXi,'String',tabla.matriz(str2double(fila),1));
    set(handles.tbxNuevoFXi,'String',tabla.matriz(str2double(fila),2));
else
    nuevoXi=EstablecerDecimales(nuevoXi,tabla);
    nuevoFXi=EstablecerDecimales(nuevoFXi,tabla);
    tabla.matriz(str2double(fila),:)=[nuevoXi nuevoFXi];
    handles.tabla=tabla;
    set(handles.tbValores, 'data', tabla.matriz);
    set(handles.txtEstadoIngresarDatos,'String','Par ordenado actualizado correctamente.');
    set(handles.tbxNuevoXi,'String','');
    set(handles.tbxNuevoXi,'Style','text');
    set(handles.tbxNuevoFXi,'String','');
    set(handles.tbxNuevoFXi,'Style','text');
    set(handles.tbxEditar,'string','');
    set(handles.btnActualizar,'Enable','off');
    set(handles.btnLimpiar,'Enable','off');
end

% --- Executes on button press in btnLimpiar.
function btnLimpiar_Callback(hObject, eventdata, handles)
% hObject    handle to btnLimpiar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

set(handles.tbxEditar,'Style','edit');
set(handles.tbxNuevoXi,'Style','text');
set(handles.tbxNuevoFXi,'Style','text');
set(handles.tbxNuevoXi,'string','');
set(handles.tbxNuevoFXi,'string','');
set(handles.tbxEditar,'string','');
set(handles.btnActualizar,'Enable','off');
set(handles.btnLimpiar,'Enable','off');

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

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in btnGuardar.
function btnGuardar_Callback(hObject, eventdata, handles)
% hObject    handle to btnGuardar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

tabla=handles.tabla;
if isempty(tabla.matriz)
    set(handles.txtEstadoIngresarDatos,'String','No hay datos para guardar')
else
    close all;
    wInterfazPrincipal(tabla);
end
