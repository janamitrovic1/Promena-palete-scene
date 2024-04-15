function varargout = simultani_kontrast(varargin)
% SIMULTANI_KONTRAST MATLAB code for simultani_kontrast.fig
%      SIMULTANI_KONTRAST, by itself, creates a new SIMULTANI_KONTRAST or raises the existing
%      singleton*.
%
%      H = SIMULTANI_KONTRAST returns the handle to a new SIMULTANI_KONTRAST or the handle to
%      the existing singleton*.
%
%      SIMULTANI_KONTRAST('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SIMULTANI_KONTRAST.M with the given input arguments.
%
%      SIMULTANI_KONTRAST('Property','Value',...) creates a new SIMULTANI_KONTRAST or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before simultani_kontrast_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to simultani_kontrast_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help simultani_kontrast

% Last Modified by GUIDE v2.5 23-Oct-2014 21:44:55

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @simultani_kontrast_OpeningFcn, ...
                   'gui_OutputFcn',  @simultani_kontrast_OutputFcn, ...
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

function osvezi_prikaz(handles)

slika1_value = handles.pozadina1_val*ones(512,512);
slika1_value(246:265, 246:265) = handles.objekat1_val*ones(20,20);

slika2_value = handles.pozadina2_val*ones(512,512);
slika2_value(246:265, 246:265) = handles.objekat2_val*ones(20,20);

set(handles.txt_pozadina1,'String',num2str(handles.pozadina1_val));
set(handles.txt_objekat1,'String',num2str(handles.objekat1_val));
set(handles.txt_pozadina2,'String',num2str(handles.pozadina2_val));
set(handles.txt_objekat2,'String',num2str(handles.objekat2_val));

axes(handles.slika1); imshow(uint8(slika1_value));
axes(handles.slika2); imshow(uint8(slika2_value));



% --- Executes just before simultani_kontrast is made visible.
function simultani_kontrast_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to simultani_kontrast (see VARARGIN)


handles.pozadina1_val = 0;
handles.objekat1_val = 128;
handles.pozadina2_val = 255;
handles.objekat2_val = 128;

set(handles.pozadina1,'Value',0);
set(handles.objekat1,'Value',128);
set(handles.pozadina2,'Value',255);
set(handles.objekat2,'Value',128);

osvezi_prikaz(handles);

% Choose default command line output for simultani_kontrast
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes simultani_kontrast wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = simultani_kontrast_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on slider movement.
function pozadina1_Callback(hObject, eventdata, handles)
% hObject    handle to pozadina1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

handles.pozadina1_val = round(get(hObject,'Value'));
set(hObject,'Value', handles.pozadina1_val);

osvezi_prikaz(handles);

guidata(hObject, handles);

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function pozadina1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pozadina1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.2 .2 .2]);
end


% --- Executes on slider movement.
function objekat1_Callback(hObject, eventdata, handles)
% hObject    handle to objekat1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

handles.objekat1_val = round(get(hObject,'Value'));
set(hObject,'Value', handles.objekat1_val);


osvezi_prikaz(handles);

guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function objekat1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to objekat1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.2 .2 .2]);
end


% --- Executes on slider movement.
function pozadina2_Callback(hObject, eventdata, handles)
% hObject    handle to pozadina2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

handles.pozadina2_val = round(get(hObject,'Value'));
set(hObject,'Value', handles.pozadina2_val);

osvezi_prikaz(handles);

guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function pozadina2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pozadina2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function objekat2_Callback(hObject, eventdata, handles)
% hObject    handle to objekat2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

handles.objekat2_val = round(get(hObject,'Value'));
set(hObject,'Value', handles.objekat2_val);


osvezi_prikaz(handles);

guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function objekat2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to objekat2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
