function varargout = interfazAproximacionLineal(varargin)
%INTERFAZAPROXIMACIONLINEAL MATLAB code file for interfazAproximacionLineal.fig
%      INTERFAZAPROXIMACIONLINEAL, by itself, creates a new INTERFAZAPROXIMACIONLINEAL or raises the existing
%      singleton*.
%
%      H = INTERFAZAPROXIMACIONLINEAL returns the handle to a new INTERFAZAPROXIMACIONLINEAL or the handle to
%      the existing singleton*.
%
%      INTERFAZAPROXIMACIONLINEAL('Property','Value',...) creates a new INTERFAZAPROXIMACIONLINEAL using the
%      given property value pairs. Unrecognized properties are passed via
%      varargin to interfazAproximacionLineal_OpeningFcn.  This calling syntax produces a
%      warning when there is an existing singleton*.
%
%      INTERFAZAPROXIMACIONLINEAL('CALLBACK') and INTERFAZAPROXIMACIONLINEAL('CALLBACK',hObject,...) call the
%      local function named CALLBACK in INTERFAZAPROXIMACIONLINEAL.M with the given input
%      arguments.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help interfazAproximacionLineal

% Last Modified by GUIDE v2.5 06-Nov-2017 12:58:37

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @interfazAproximacionLineal_OpeningFcn, ...
                   'gui_OutputFcn',  @interfazAproximacionLineal_OutputFcn, ...
                   'gui_LayoutFcn',  [], ...
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


% --- Executes just before interfazAproximacionLineal is made visible.
function interfazAproximacionLineal_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   unrecognized PropertyName/PropertyValue pairs from the
%            command line (see VARARGIN)

% Choose default command line output for interfazAproximacionLineal
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes interfazAproximacionLineal wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = interfazAproximacionLineal_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes during object creation, after setting all properties.
function grafico_CreateFcn(hObject, eventdata, handles)
% hObject    handle to grafico (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate grafico

% Establece los ejes del objeto de la interfaz gráfica donde se van a
% renderizar los gráficos.
axes(hObject);

[m , b] = aproximacionLineal(getCoordenadasDePrueba);

% Grafico en el eje después de obtener los coeficientes.
graficarAproximacionLineal(m , b, getCoordenadasDePrueba);


% --- Executes during object creation, after setting all properties.
function figure1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Mueve la ventana a otra parte.
movegui('center');


% --- Executes during object creation, after setting all properties.
function sumatoriasTable_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sumatoriasTable (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
set(hObject, 'Data', tablaLineal(getCoordenadasDePrueba));


% --- Executes during object creation, after setting all properties.
function sumatoriasResultadosTable_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sumatoriasResultadosTable (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
sumatoria = sumatoriaLineal(getCoordenadasDePrueba);

set(hObject, 'Data', sumatoria(1:6));

set(hObject, 'RowName', {'S'});


% --- Executes during object creation, after setting all properties.
function ecuacionesTable_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ecuacionesTable (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
set(hObject, 'Data', ecuacionesLineales(getCoordenadasDePrueba));


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close;
interfazAproximacionSeleccion;
