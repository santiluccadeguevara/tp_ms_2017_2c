function varargout = wConfirmacionEliminar(varargin)
% WCONFIRMACIONELIMINAR MATLAB code for wConfirmacionEliminar.fig
%      WCONFIRMACIONELIMINAR by itself, creates a new WCONFIRMACIONELIMINAR or raises the
%      existing singleton*.
%
%      H = WCONFIRMACIONELIMINAR returns the handle to a new WCONFIRMACIONELIMINAR or the handle to
%      the existing singleton*.
%
%      WCONFIRMACIONELIMINAR('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in WCONFIRMACIONELIMINAR.M with the given input arguments.
%
%      WCONFIRMACIONELIMINAR('Property','Value',...) creates a new WCONFIRMACIONELIMINAR or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before wConfirmacionEliminar_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to wConfirmacionEliminar_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help wConfirmacionEliminar

% Last Modified by GUIDE v2.5 09-Nov-2017 20:38:27

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @wConfirmacionEliminar_OpeningFcn, ...
                   'gui_OutputFcn',  @wConfirmacionEliminar_OutputFcn, ...
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

% --- Executes just before wConfirmacionEliminar is made visible.
function wConfirmacionEliminar_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to wConfirmacionEliminar (see VARARGIN)

handles.fila=varargin{1};
handles.xi=num2str(varargin{2}.matriz(str2double(handles.fila),1));
handles.fXi=num2str(varargin{2}.matriz(str2double(handles.fila),2));
handles.tabla=varargin{2};

set(handles.txtFila,'String',strcat('Fila seleccionada:',' ',handles.fila,' - Par odenado: (',num2str(handles.xi),' ; ',num2str(handles.fXi),')'))
% Choose default command line output for wConfirmacionEliminar
handles.output = 'Yes';

% Update handles structure
guidata(hObject, handles);

% Insert custom Title and Text if specified by the user
% Hint: when choosing keywords, be sure they are not easily confused 
% with existing figure properties.  See the output of set(figure) for
% a list of figure properties.
if(nargin > 3)
    for index = 1:2:(nargin-3),
        if nargin-3==index, break, end
        switch lower(varargin{index})
         case 'title'
          set(hObject, 'Name', varargin{index+1});
         case 'string'
          set(handles.txtEliminar, 'String', varargin{index+1});
        end
    end
end

% Determine the position of the dialog - centered on the callback figure
% if available, else, centered on the screen
FigPos=get(0,'DefaultFigurePosition');
OldUnits = get(hObject, 'Units');
set(hObject, 'Units', 'pixels');
OldPos = get(hObject,'Position');
FigWidth = OldPos(3);
FigHeight = OldPos(4);
if isempty(gcbf)
    ScreenUnits=get(0,'Units');
    set(0,'Units','pixels');
    ScreenSize=get(0,'ScreenSize');
    set(0,'Units',ScreenUnits);

    FigPos(1)=1/2*(ScreenSize(3)-FigWidth);
    FigPos(2)=2/3*(ScreenSize(4)-FigHeight);
else
    GCBFOldUnits = get(gcbf,'Units');
    set(gcbf,'Units','pixels');
    GCBFPos = get(gcbf,'Position');
    set(gcbf,'Units',GCBFOldUnits);
    FigPos(1:2) = [(GCBFPos(1) + GCBFPos(3) / 2) - FigWidth / 2, ...
                   (GCBFPos(2) + GCBFPos(4) / 2) - FigHeight / 2];
end
FigPos(3:4)=[FigWidth FigHeight];
set(hObject, 'Position', FigPos);
set(hObject, 'Units', OldUnits);

% Show a question icon from dialogicons.mat - variables questIconData
% and questIconMap
load dialogicons.mat

IconData=questIconData;
questIconMap(256,:) = get(handles.figure1, 'Color');
IconCMap=questIconMap;

set(handles.figure1, 'Colormap', IconCMap);


% Make the GUI modal
set(handles.figure1,'WindowStyle','modal')

uicontrol(handles.btnCancelar);

% UIWAIT makes wConfirmacionEliminar wait for user response (see UIRESUME)
uiwait(handles.figure1);

% --- Outputs from this function are returned to the command line.
function varargout = wConfirmacionEliminar_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.tabla;

% The figure can be deleted now
delete(handles.figure1);

% --- Executes on button press in btnEliminar.
function btnEliminar_Callback(hObject, eventdata, handles)
% hObject    handle to btnEliminar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

handles.output = get(hObject,'String');

% Update handles structure
guidata(hObject, handles);

tabla=handles.tabla;
tabla.matriz(str2double(handles.fila),:)=[];
tabla.largo=tabla.largo-1;
handles.tabla=tabla;

% Use UIRESUME instead of delete because the OutputFcn needs
% to get the updated handles structure.
uiresume(handles.figure1);


% --- Executes on button press in btnCancelar.
function btnCancelar_Callback(hObject, eventdata, handles)
% hObject    handle to btnCancelar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

handles.output = get(hObject,'String');

% Update handles structure
guidata(hObject, handles);

% Use UIRESUME instead of delete because the OutputFcn needs
% to get the updated handles structure.
uiresume(handles.figure1);


% --- Executes when user attempts to close figure1.
function figure1_CloseRequestFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

if isequal(get(hObject, 'waitstatus'), 'waiting')
    % The GUI is still in UIWAIT, us UIRESUME
    uiresume(hObject);
else
    % The GUI is no longer waiting, just close it
    delete(hObject);
end


% --- Executes on key press over figure1 with no controls selected.
function figure1_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Check for "enter" or "escape"
if isequal(get(hObject,'CurrentKey'),'escape')
    % User said no by hitting escape
    handles.output = 'No';
    
    % Update handles structure
    guidata(hObject, handles);
    
    uiresume(handles.figure1);
end    
    
if isequal(get(hObject,'CurrentKey'),'return')
    uiresume(handles.figure1);
end    


% --- Executes on key press with focus on btnEliminar and none of its controls.
function btnEliminar_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to btnEliminar (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)
key = eventdata.Key;
if(strcmp (key , 'return'))
    btnEliminar_Callback(hObject, eventdata, handles);
end


% --- Executes on key press with focus on btnCancelar and none of its controls.
function btnCancelar_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to btnCancelar (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)
key = eventdata.Key;
if(strcmp (key , 'return'))
    btnCancelar_Callback(hObject, eventdata, handles);
end
