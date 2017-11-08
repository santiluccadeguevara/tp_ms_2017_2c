function varargout = interfazAproximacionSeleccion(varargin)
%INTERFAZAPROXIMACIONSELECCION MATLAB code file for interfazAproximacionSeleccion.fig
%      INTERFAZAPROXIMACIONSELECCION, by itself, creates a new INTERFAZAPROXIMACIONSELECCION or raises the existing
%      singleton*.
%
%      H = INTERFAZAPROXIMACIONSELECCION returns the handle to a new INTERFAZAPROXIMACIONSELECCION or the handle to
%      the existing singleton*.
%
%      INTERFAZAPROXIMACIONSELECCION('Property','Value',...) creates a new INTERFAZAPROXIMACIONSELECCION using the
%      given property value pairs. Unrecognized properties are passed via
%      varargin to interfazAproximacionSeleccion_OpeningFcn.  This calling syntax produces a
%      warning when there is an existing singleton*.
%
%      INTERFAZAPROXIMACIONSELECCION('CALLBACK') and INTERFAZAPROXIMACIONSELECCION('CALLBACK',hObject,...) call the
%      local function named CALLBACK in INTERFAZAPROXIMACIONSELECCION.M with the given input
%      arguments.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help interfazAproximacionSeleccion

% Last Modified by GUIDE v2.5 26-Oct-2017 00:40:10

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @interfazAproximacionSeleccion_OpeningFcn, ...
                   'gui_OutputFcn',  @interfazAproximacionSeleccion_OutputFcn, ...
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


% --- Executes just before interfazAproximacionSeleccion is made visible.
function interfazAproximacionSeleccion_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   unrecognized PropertyName/PropertyValue pairs from the
%            command line (see VARARGIN)

handles.tabla=varargin{1};

% Choose default command line output for interfazAproximacionSeleccion
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes interfazAproximacionSeleccion wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = interfazAproximacionSeleccion_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in volverAInicioButton.
function volverAInicioButton_Callback(hObject, eventdata, handles)
% hObject    handle to volverAInicioButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close all;
wInterfazPrincipal(handles.tabla);


% --- Executes on button press in linealButton.
function linealButton_Callback(hObject, eventdata, handles)
% hObject    handle to linealButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close;
interfazAproximacionLineal(handles.tabla);


% --- Executes on button press in parabolicaButton.
function parabolicaButton_Callback(hObject, eventdata, handles)
% hObject    handle to parabolicaButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close;
interfazAproximacionCuadratica(handles.tabla);


% --- Executes on button press in exponencialButton.
function exponencialButton_Callback(hObject, eventdata, handles)
% hObject    handle to exponencialButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close;
interfazAproximacionExponencial(handles.tabla);

% --- Executes on button press in potencialButton.
function potencialButton_Callback(hObject, eventdata, handles)
% hObject    handle to potencialButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close;
interfazAproximacionPotencial(handles.tabla);


% --- Executes on button press in hiperbolicaButton.
function hiperbolicaButton_Callback(hObject, eventdata, handles)
% hObject    handle to hiperbolicaButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close;
interfazAproximacionHiperbolica(handles.tabla);


% --- Executes during object creation, after setting all properties.
function aproximacionFigure_CreateFcn(hObject, eventdata, handles)
% hObject    handle to aproximacionFigure (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
movegui('center');
