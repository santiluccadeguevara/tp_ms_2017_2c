function varargout = interfazComparacion(varargin)
% INTERFAZCOMPARACION MATLAB code for interfazComparacion.fig
%      INTERFAZCOMPARACION, by itself, creates a new INTERFAZCOMPARACION or raises the existing
%      singleton*.
%
%      H = INTERFAZCOMPARACION returns the handle to a new INTERFAZCOMPARACION or the handle to
%      the existing singleton*.
%
%      INTERFAZCOMPARACION('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in INTERFAZCOMPARACION.M with the given input arguments.
%
%      INTERFAZCOMPARACION('Property','Value',...) creates a new INTERFAZCOMPARACION or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before interfazComparacion_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to interfazComparacion_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help interfazComparacion

% Last Modified by GUIDE v2.5 07-Nov-2017 02:00:58

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @interfazComparacion_OpeningFcn, ...
                   'gui_OutputFcn',  @interfazComparacion_OutputFcn, ...
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


% --- Executes just before interfazComparacion is made visible.
function interfazComparacion_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to interfazComparacion (see VARARGIN)

% Choose default command line output for interfazComparacion
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes interfazComparacion wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = interfazComparacion_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close all;
interfazPrincipal(handles.tabla);

% --- Executes during object creation, after setting all properties.
function figure1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
movegui('center');

% --- Executes during object creation, after setting all properties.
function uitable1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to uitable1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
[tabla, resultados] = dameLaTabla(getCoordenadasDePrueba);

set(hObject, 'Data', tabla);


% --- Executes during object creation, after setting all properties.
function uitable3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to uitable3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
[tabla, resultados] = dameLaTabla(getCoordenadasDePrueba);

set(hObject, 'Data', resultados);


% --- Executes during object creation, after setting all properties.
function text7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
[valor, indice] = obtenerMejorAproximacion(getCoordenadasDePrueba)

switch indice
    
    case 1
        
        set(hObject, 'String', 'Aproximación lineal');
        
    case 2
        
        set(hObject, 'String', 'Aproximación parabólica');
        
    case 3
        
        set(hObject, 'String', 'Aproximación exponencial');
        
    case 4
        
        set(hObject, 'String', 'Aproximación parabólica');
        
    case 5
        
        set(hObject, 'String', 'Aproximación hiperbólica');
        
    otherwise
        
        set(hObject, 'String', 'Indeterminado');
end
    


% --- Executes during object creation, after setting all properties.
function axes1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes1
axes(hObject);

zoom on;

[valor, indice] = obtenerMejorAproximacion(getCoordenadasDePrueba)

switch indice
    
    case 1
        
        [m , b] = aproximacionLineal(getCoordenadasDePrueba);
        
        graficarAproximacionLineal(m, b, getCoordenadasDePrueba);
        
    case 2
        
        [a , b, c] = aproximacionCuadratica(getCoordenadasDePrueba);
        
        graficarAproximacionCuadratica(a, b, c, getCoordenadasDePrueba);
        
    case 3
        
        [a , b] = aproximacionExponencial(getCoordenadasDePrueba);
        
        graficarAproximacionExponencial(a, b, getCoordenadasDePrueba);
        
    case 4
        
        [a , b] = aproximacionPotencial(getCoordenadasDePrueba);
        
        graficarAproximacionPotencial(a, b, getCoordenadasDePrueba);
        
    case 5
        
        [a , b] = aproximacionHiperbolica(getCoordenadasDePrueba);
        
        graficarAproximacionHiperbolica(a, b, getCoordenadasDePrueba);
        
end
