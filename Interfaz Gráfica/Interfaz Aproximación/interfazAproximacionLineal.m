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

% Last Modified by GUIDE v2.5 09-Nov-2017 20:44:06

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

handles.tabla=varargin{1};

% Choose default command line output for interfazAproximacionLineal
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

set(handles.sumatoriasTable, 'Data', OptimizarParaTabla(tablaLineal(handles.tabla.matriz'),handles.tabla.decimales));
sumatoria = sumatoriaLineal(handles.tabla.matriz');
set(handles.sumatoriasResultadosTable, 'Data', OptimizarParaTabla(sumatoria(2:7),handles.tabla.decimales));
set(handles.sumatoriasResultadosTable, 'RowName', {'S'});
set(handles.ecuacionesTable, 'Data', OptimizarParaTabla(ecuacionesLineales(handles.tabla.matriz'),handles.tabla.decimales));
axes(handles.graficoLineal);
zoom on;
[m , b] = aproximacionLineal(handles.tabla.matriz');
graficarAproximacionLineal(m , b, handles.tabla.matriz', handles.tabla.decimales);
uicontrol(handles.pushbutton1);

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
function figure1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Mueve la ventana a otra parte.
movegui('center');


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close;
interfazAproximacionSeleccion(handles.tabla);


% --- Executes during object creation, after setting all properties.
function sumatoriasTable_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sumatoriasTable (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function sumatoriasResultadosTable_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sumatoriasResultadosTable (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function ecuacionesTable_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ecuacionesTable (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called



% --- Executes during object creation, after setting all properties.
function graficoLineal_CreateFcn(hObject, eventdata, handles)
% hObject    handle to graficoLineal (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate graficoLineal
title('', 'interpreter', 'latex');
xlabel('', 'interpreter', 'latex');

% --- Executes when user attempts to close figure1.
function figure1_CloseRequestFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: delete(hObject) closes the figure
delete(hObject);
interfazAproximacionSeleccion(handles.tabla);


% --- Executes during object deletion, before destroying properties.
function sumatoriasResultadosTable_DeleteFcn(hObject, eventdata, handles)
% hObject    handle to sumatoriasResultadosTable (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on key press with focus on pushbutton1 and none of its controls.
function pushbutton1_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)
key = eventdata.Key;
if(strcmp (key , 'return'))
    pushbutton1_Callback(hObject, eventdata, handles);
end