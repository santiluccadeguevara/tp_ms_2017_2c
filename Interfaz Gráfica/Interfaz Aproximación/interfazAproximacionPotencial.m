function varargout = interfazAproximacionPotencial(varargin)
% INTERFAZAPROXIMACIONPOTENCIAL MATLAB code for interfazAproximacionPotencial.fig
%      INTERFAZAPROXIMACIONPOTENCIAL, by itself, creates a new INTERFAZAPROXIMACIONPOTENCIAL or raises the existing
%      singleton*.
%
%      H = INTERFAZAPROXIMACIONPOTENCIAL returns the handle to a new INTERFAZAPROXIMACIONPOTENCIAL or the handle to
%      the existing singleton*.
%
%      INTERFAZAPROXIMACIONPOTENCIAL('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in INTERFAZAPROXIMACIONPOTENCIAL.M with the given input arguments.
%
%      INTERFAZAPROXIMACIONPOTENCIAL('Property','Value',...) creates a new INTERFAZAPROXIMACIONPOTENCIAL or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before interfazAproximacionPotencial_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to interfazAproximacionPotencial_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help interfazAproximacionPotencial

% Last Modified by GUIDE v2.5 07-Nov-2017 11:06:45

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @interfazAproximacionPotencial_OpeningFcn, ...
                   'gui_OutputFcn',  @interfazAproximacionPotencial_OutputFcn, ...
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


% --- Executes just before interfazAproximacionPotencial is made visible.
function interfazAproximacionPotencial_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to interfazAproximacionPotencial (see VARARGIN)

handles.tabla=varargin{1};

% Choose default command line output for interfazAproximacionPotencial
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes interfazAproximacionPotencial wait for user response (see UIRESUME)
% uiwait(handles.figure1)

set(handles.uitable1, 'Data', tablaPotencial(handles.tabla.matriz'));
sumatoria = sumatoriaPotencial(handles.tabla.matriz');
set(handles.uitable2, 'Data', sumatoria(2:9));
set(handles.uitable2, 'RowName', {'S'});
set(handles.uitable3, 'Data', ecuacionesPotenciales(handles.tabla.matriz'));
axes(handles.axes2);
zoom on;
[m , b] = aproximacionPotencial(handles.tabla.matriz');
graficarAproximacionPotencial(m , b, handles.tabla.matriz');


% --- Outputs from this function are returned to the command line.
function varargout = interfazAproximacionPotencial_OutputFcn(hObject, eventdata, handles) 
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
close;
interfazAproximacionSeleccion(handles.tabla);

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


% --- Executes during object creation, after setting all properties.
function uitable2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to uitable2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function uitable3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to uitable3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function axes2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes2


% --- Executes when user attempts to close figure1.
function figure1_CloseRequestFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: delete(hObject) closes the figure
delete(hObject);
interfazAproximacionSeleccion(handles.tabla);
