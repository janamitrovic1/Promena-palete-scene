function varargout = simultani_kontrast_2(varargin)
% SIMULTANI_KONTRAST_2 MATLAB code for simultani_kontrast_2.fig
%      SIMULTANI_KONTRAST_2, by itself, creates a new SIMULTANI_KONTRAST_2 or raises the existing
%      singleton*.
%
%      H = SIMULTANI_KONTRAST_2 returns the handle to a new SIMULTANI_KONTRAST_2 or the handle to
%      the existing singleton*.
%
%      SIMULTANI_KONTRAST_2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SIMULTANI_KONTRAST_2.M with the given input arguments.
%
%      SIMULTANI_KONTRAST_2('Property','Value',...) creates a new SIMULTANI_KONTRAST_2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before simultani_kontrast_2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to simultani_kontrast_2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help simultani_kontrast_2

% Last Modified by GUIDE v2.5 23-Oct-2014 23:03:29

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @simultani_kontrast_2_OpeningFcn, ...
                   'gui_OutputFcn',  @simultani_kontrast_2_OutputFcn, ...
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

slika_value = handles.pozadina_val*ones(512,512);
slika_value(236:275, 236:255) = handles.levi_objekat_val*ones(40,20);
slika_value(236:275, 256:275) = handles.desni_objekat_val*ones(40,20);


set(handles.txt_pozadina,'String',num2str(handles.pozadina_val));
set(handles.txt_levi_objekat,'String',num2str(handles.levi_objekat_val));
set(handles.txt_desni_objekat,'String',num2str(handles.desni_objekat_val));

osvetljenost_pozadine = (double(handles.pozadina_val)./255).*ones(1,3);
set(handles.figure1,'Color',osvetljenost_pozadine);
set(handles.pozadina,'BackgroundColor',osvetljenost_pozadine);
set(handles.levi_objekat,'BackgroundColor',osvetljenost_pozadine);
set(handles.desni_objekat,'BackgroundColor',osvetljenost_pozadine);
set(handles.txt_pozadina,'BackgroundColor',osvetljenost_pozadine);
set(handles.txt_levi_objekat,'BackgroundColor',osvetljenost_pozadine);
set(handles.txt_desni_objekat,'BackgroundColor',osvetljenost_pozadine);
set(handles.text2,'BackgroundColor',osvetljenost_pozadine);
set(handles.text3,'BackgroundColor',osvetljenost_pozadine);
set(handles.text5,'BackgroundColor',osvetljenost_pozadine);

if osvetljenost_pozadine(1) < 0.5
    osveltjenost_slova = [1 1 1];
else
    osveltjenost_slova = [0 0 0];
end
set(handles.txt_pozadina,'ForegroundColor',osveltjenost_slova);
set(handles.txt_levi_objekat,'ForegroundColor',osveltjenost_slova);
set(handles.txt_desni_objekat,'ForegroundColor',osveltjenost_slova);
set(handles.text2,'ForegroundColor',osveltjenost_slova);
set(handles.text3,'ForegroundColor',osveltjenost_slova);
set(handles.text5,'ForegroundColor',osveltjenost_slova);

imshow(uint8(slika_value));




% --- Executes just before simultani_kontrast_2 is made visible.
function simultani_kontrast_2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to simultani_kontrast_2 (see VARARGIN)


handles.pozadina_val = 0;
handles.levi_objekat_val = 255;
handles.desni_objekat_val = 255;

set(handles.pozadina,'Value',0);
set(handles.levi_objekat,'Value',255);
set(handles.desni_objekat,'Value',255);

osvezi_prikaz(handles);

% Choose default command line output for simultani_kontrast_2
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes simultani_kontrast_2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = simultani_kontrast_2_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on slider movement.
function pozadina_Callback(hObject, eventdata, handles)
% hObject    handle to pozadina (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

handles.pozadina_val = round(get(hObject,'Value'));
set(hObject,'Value', handles.pozadina_val);

osvezi_prikaz(handles);

guidata(hObject, handles);

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function pozadina_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pozadina (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.2 .2 .2]);
end


% --- Executes on slider movement.
function levi_objekat_Callback(hObject, eventdata, handles)
% hObject    handle to levi_objekat (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

handles.levi_objekat_val = round(get(hObject,'Value'));
set(hObject,'Value', handles.levi_objekat_val);


osvezi_prikaz(handles);

guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function levi_objekat_CreateFcn(hObject, eventdata, handles)
% hObject    handle to levi_objekat (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.2 .2 .2]);
end




% --- Executes on slider movement.
function desni_objekat_Callback(hObject, eventdata, handles)
% hObject    handle to desni_objekat (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

handles.desni_objekat_val = round(get(hObject,'Value'));
set(hObject,'Value', handles.desni_objekat_val);


osvezi_prikaz(handles);

guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function desni_objekat_CreateFcn(hObject, eventdata, handles)
% hObject    handle to desni_objekat (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
