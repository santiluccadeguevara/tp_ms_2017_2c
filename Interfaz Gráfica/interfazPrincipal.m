function varargout = interfazPrincipal(varargin)
% INTERFAZPRINCIPAL MATLAB code for interfazPrincipal.fig
%      INTERFAZPRINCIPAL, by itself, creates a new INTERFAZPRINCIPAL or raises the existing
%      singleton*.
%
%      H = INTERFAZPRINCIPAL returns the handle to a new INTERFAZPRINCIPAL or the handle to
%      the existing singleton*.
%
%      INTERFAZPRINCIPAL('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in INTERFAZPRINCIPAL.M with the given input arguments.
%
%      INTERFAZPRINCIPAL('Property','Value',...) creates a new INTERFAZPRINCIPAL or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before interfazPrincipal_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to interfazPrincipal_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help interfazPrincipal

% Last Modified by GUIDE v2.5 25-Oct-2017 20:50:05

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @interfazPrincipal_OpeningFcn, ...
                   'gui_OutputFcn',  @interfazPrincipal_OutputFcn, ...
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


% --- Executes just before interfazPrincipal is made visible.
function interfazPrincipal_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to interfazPrincipal (see VARARGIN)

% Choose default command line output for interfazPrincipal
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
movegui('center');

% UIWAIT makes interfazPrincipal wait for user response (see UIRESUME)
% uiwait(handles.interfazPrincipal);


% --- Outputs from this function are returned to the command line.
function varargout = interfazPrincipal_OutputFcn(hObject, eventdata, handles) 
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

%Acá empieza todo
wDefinirDecimales;
uiwait
global decimales;
wIngresarDatos;

% --- Executes on button press in btnComparar.
function btnComparar_Callback(hObject, eventdata, handles)
% hObject    handle to btnComparar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in btnFin.
function btnFin_Callback(hObject, eventdata, handles)
% hObject    handle to btnFin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close;
