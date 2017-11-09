function varargout = wDefinirDecimales(varargin)
% WDEFINIRDECIMALES MATLAB code for wDefinirDecimales.fig
%      WDEFINIRDECIMALES, by itself, creates a new WDEFINIRDECIMALES or raises the existing
%      singleton*.
%
%      H = WDEFINIRDECIMALES returns the handle to a new WDEFINIRDECIMALES or the handle to
%      the existing singleton*.
%
%      WDEFINIRDECIMALES('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in WDEFINIRDECIMALES.M with the given input arguments.
%
%      WDEFINIRDECIMALES('Property','Value',...) creates a new WDEFINIRDECIMALES or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before wDefinirDecimales_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to wDefinirDecimales_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help wDefinirDecimales

% Last Modified by GUIDE v2.5 09-Nov-2017 20:20:00

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @wDefinirDecimales_OpeningFcn, ...
                   'gui_OutputFcn',  @wDefinirDecimales_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    warning('off','all')
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT
movegui('center');

% --- Executes just before wDefinirDecimales is made visible.
function wDefinirDecimales_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to wDefinirDecimales (see VARARGIN)

handles.tabla=varargin{1};
% Choose default command line output for wDefinirDecimales
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
% movegui('center');

% UIWAIT makes wDefinirDecimales wait for user response (see UIRESUME)
% uiwait(handles.figure2);

uicontrol(handles.tbxDecimales);

% --- Outputs from this function are returned to the command line.
function varargout = wDefinirDecimales_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

function tbxDecimales_Callback(hObject, eventdata, handles)
% hObject    handle to tbxDecimales (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of tbxDecimales as text
%        str2double(get(hObject,'String')) returns contents of tbxDecimales as a double


% --- Executes during object creation, after setting all properties.
function tbxDecimales_CreateFcn(hObject, eventdata, handles)
% hObject    handle to tbxDecimales (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in btnEstablecer.
function btnEstablecer_Callback(hObject, eventdata, handles)
% hObject    handle to btnEstablecer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

tabla=handles.tabla;
decimales=get(handles.tbxDecimales,'String');

%Acá se verifica que el valor ingresado por el usuario (para editar una fila)
%se corresponda con alguno de los números de fila para poder eliminarlo.
%Caso contrario se le informa que no puede continuar.

if (isnan(str2double(decimales)))
    set(handles.txtEstadoDecimales,'String','El valor ingresado no es un número');
    set(handles.tbxDecimales,'String','');
elseif(contains(decimales,',')||contains(decimales,'.'))
    set(handles.txtEstadoDecimales,'String','Solo se permiten enteros. Intente de nuevo.'); 
    set(handles.tbxDecimales,'String','');
elseif(str2double(decimales)>14||str2double(decimales)<0)
    set(handles.txtEstadoDecimales,'String','El valor ingresado está fuera del rango que maneja este programa. Intente de nuevo.'); 
    set(handles.tbxDecimales,'String','');
else
    tabla.decimales=str2double(decimales);
    tabla.decimalesDefinidos=true;
    close;
    wIngresarDatos(tabla);
end

% --- Executes when user attempts to close figure2.
function figure2_CloseRequestFcn(hObject, eventdata, handles)
% hObject    handle to figure2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: delete(hObject) closes the figure
delete(hObject);
tabla=handles.tabla;
wInterfazPrincipal(tabla);


% --- Executes on key press with focus on tbxDecimales and none of its controls.
function tbxDecimales_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to tbxDecimales (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)
key = eventdata.Key;
if(strcmp (key , 'return'))
    uicontrol(handles.btnEstablecer);
    btnEstablecer_Callback(hObject, eventdata, handles);
end


% --- Executes on key press with focus on btnEstablecer and none of its controls.
function btnEstablecer_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to btnEstablecer (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)
key = eventdata.Key;
if(strcmp (key , 'return'))
    btnEstablecer_Callback(hObject, eventdata, handles);
end
