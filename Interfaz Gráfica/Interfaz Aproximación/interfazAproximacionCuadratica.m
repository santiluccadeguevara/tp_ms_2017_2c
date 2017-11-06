function varargout = interfazAproximacionCuadratica(varargin)
% INTERFAZAPROXIMACIONCUADRATICA MATLAB code for interfazAproximacionCuadratica.fig
%      INTERFAZAPROXIMACIONCUADRATICA, by itself, creates a new INTERFAZAPROXIMACIONCUADRATICA or raises the existing
%      singleton*.
%
%      H = INTERFAZAPROXIMACIONCUADRATICA returns the handle to a new INTERFAZAPROXIMACIONCUADRATICA or the handle to
%      the existing singleton*.
%
%      INTERFAZAPROXIMACIONCUADRATICA('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in INTERFAZAPROXIMACIONCUADRATICA.M with the given input arguments.
%
%      INTERFAZAPROXIMACIONCUADRATICA('Property','Value',...) creates a new INTERFAZAPROXIMACIONCUADRATICA or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before interfazAproximacionCuadratica_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to interfazAproximacionCuadratica_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help interfazAproximacionCuadratica

% Last Modified by GUIDE v2.5 06-Nov-2017 18:07:03

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @interfazAproximacionCuadratica_OpeningFcn, ...
                   'gui_OutputFcn',  @interfazAproximacionCuadratica_OutputFcn, ...
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


% --- Executes just before interfazAproximacionCuadratica is made visible.
function interfazAproximacionCuadratica_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to interfazAproximacionCuadratica (see VARARGIN)

% Choose default command line output for interfazAproximacionCuadratica
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes interfazAproximacionCuadratica wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = interfazAproximacionCuadratica_OutputFcn(hObject, eventdata, handles) 
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


% --- Executes during object creation, after setting all properties.
function uitable1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to uitable1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
set(hObject, 'Data', tablaCuadratica(getCoordenadasDePrueba));


% --- Executes during object creation, after setting all properties.
function uitable2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to uitable2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
sumatoria = sumatoriaCuadratica(getCoordenadasDePrueba);

set(hObject, 'Data', sumatoria(2:10));

set(hObject, 'RowName', {'S'});


% --- Executes during object creation, after setting all properties.
function uitable3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to uitable3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
set(hObject, 'Data', ecuacionesCuadraticas(getCoordenadasDePrueba));


% --- Executes during object creation, after setting all properties.
function axes2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes2
axes(hObject);

[a , b, c] = aproximacionCuadratica(getCoordenadasDePrueba);

% Grafico en el eje después de obtener los coeficientes.
graficarAproximacionCuadratica(a, b, c, getCoordenadasDePrueba);