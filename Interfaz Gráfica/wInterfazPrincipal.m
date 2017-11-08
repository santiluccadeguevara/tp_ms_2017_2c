function varargout = wInterfazPrincipal(varargin)
% WINTERFAZPRINCIPAL MATLAB code for wInterfazPrincipal.fig
%      WINTERFAZPRINCIPAL, by itself, creates a new WINTERFAZPRINCIPAL or raises the existing
%      singleton*.
%
%      H = WINTERFAZPRINCIPAL returns the handle to a new WINTERFAZPRINCIPAL or the handle to
%      the existing singleton*.
%
%      WINTERFAZPRINCIPAL('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in WINTERFAZPRINCIPAL.M with the given input arguments.
%
%      WINTERFAZPRINCIPAL('Property','Value',...) creates a new WINTERFAZPRINCIPAL or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before wInterfazPrincipal_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to wInterfazPrincipal_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help wInterfazPrincipal

% Last Modified by GUIDE v2.5 30-Oct-2017 11:38:36

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @wInterfazPrincipal_OpeningFcn, ...
                   'gui_OutputFcn',  @wInterfazPrincipal_OutputFcn, ...
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


% --- Executes just before wInterfazPrincipal is made visible.
function wInterfazPrincipal_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to wInterfazPrincipal (see VARARGIN)

if(isempty(varargin))
    handles.tabla=Tabla();
    set(handles.txtEstadoPrincipal,'String','Nueva sesión iniciada - Tabla de valores vacía.');
    set(handles.btnComparar,'Enable','off');
    set(handles.btnIngresarDatos,'String','Ingresar datos');
elseif isempty(varargin{1}.matriz)
    handles.tabla=varargin{1};
    set(handles.txtEstadoPrincipal,'String','Nueva sesión iniciada - Tabla de valores vacía.');
    set(handles.btnComparar,'Enable','off');
    set(handles.btnIngresarDatos,'String','Ingresar datos');
elseif varargin{1}.largo==1
    handles.tabla=varargin{1};
    set(handles.txtEstadoPrincipal,'String',strcat(num2str(handles.tabla.largo),' par ordenado en la tabla de valores. Para poder comparar aproximaciones, debe ingresar al menos 2 pares ordenados.'));
    set(handles.btnComparar,'Enable','off');
    set(handles.btnIngresarDatos,'String','Editar tabla');
else
    handles.tabla=varargin{1};
    set(handles.txtEstadoPrincipal,'String',strcat(num2str(handles.tabla.largo),' pares ordenados en la tabla de valores.'));
    set(handles.btnComparar,'Enable','on');
    set(handles.btnIngresarDatos,'String','Editar tabla');
end

format long;

% Choose default command line output for wInterfazPrincipal
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes wInterfazPrincipal wait for user response (see UIRESUME)
% uiwait(handles.figure1);

movegui('center');


% --- Outputs from this function are returned to the command line.
function varargout = wInterfazPrincipal_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in btnIngresarDatos.
function btnIngresarDatos_Callback(hObject, eventdata, handles)
% hObject    handle to btnIngresarDatos (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
tabla=handles.tabla;

if tabla.decimalesDefinidos==false
    wDefinirDecimales(tabla);
else
    wIngresarDatos(tabla);
end


% --- Executes on button press in btnComparar.
function btnComparar_Callback(hObject, eventdata, handles)
% hObject    handle to btnComparar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

interfazComparacion(handles.tabla);

% --- Executes on button press in btnFinalizar.
function btnFinalizar_Callback(hObject, eventdata, handles)
% hObject    handle to btnFinalizar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

wConfirmacionSalir();


% --- Executes when user attempts to close figure1.
function figure1_CloseRequestFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: delete(hObject) closes the figure
delete(hObject);
