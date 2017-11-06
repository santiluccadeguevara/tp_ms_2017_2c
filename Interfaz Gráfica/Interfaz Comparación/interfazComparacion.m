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

% Last Modified by GUIDE v2.5 05-Nov-2017 22:16:04

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

function miFunction = asdasd.dameLaTabla(datos[]);

% --- Executes during object creation, after setting all properties.
function uitable1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to uitable1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
set(hObject, 'Data', getTablaDePrueba);
