function varargout = guitest(varargin)
% GUITEST M-file for guitest.fig
%      GUITEST, by itself, creates a new GUITEST or raises the existing
%      singleton*.
%
%      H = GUITEST returns the handle to a new GUITEST or the handle to
%      the existing singleton*.
%
%      GUITEST('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUITEST.M with the given input arguments.
%
%      GUITEST('Property','Value',...) creates a new GUITEST or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before guitest_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to guitest_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Copyright 2002-2003 The MathWorks, Inc.

% Edit the above text to modify the response to help guitest

% Last Modified by GUIDE v2.5 03-Apr-2015 08:20:11

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @guitest_OpeningFcn, ...
                   'gui_OutputFcn',  @guitest_OutputFcn, ...
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


% --- Executes just before guitest is made visible.
function guitest_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to guitest (see VARARGIN)

% Choose default command line output for guitest
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes guitest wait for user response (see UIRESUME)
% uiwait(handles.figure1);

%calles funtions to be used
global myfuns
myfuns =defineMyFunctions;%a way to call to other funcitons from .m files

% --- Outputs from this function are returned to the command line.
function varargout = guitest_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in LoadImg.
function LoadImg_Callback(hObject, eventdata, handles)
% hObject    handle to LoadImg (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global im im2 myfuns
%{
[path ,user_cancle]=imgetfile();
if user_cancle
    disp('User pressed cancel')
    return
end
%}

%path='lena2.bmp';
[filename, path]=uigetfile({'*.jpg;*.tif;*.png;*.gif','All Image Files'},'Load image to Slice','lena2.bmp');

im = myfuns.loadimage(path);
%im=im2double(im);
im2=im;%backup
axes(handles.axes1);
imshow(im);

%{
[filename, pathname] = uigetfile({'*.jpg;*.png;*.gif;*.bmp', 'All Image Files (*.jpg, *.png, *.gif, *.bmp)'; ...
                '*.*',                   'All Files (*.*)'}, ...
                'Pick an image file');

%This code checks if the user pressed cancel on the dialog.
        if isequal(filename,0) || isequal(pathname,0)
             disp('User pressed cancel')
        else
             disp(['User selected ', fullfile(pathname, filename)])

        end
%}



% --- Executes on button press in Graybtn.
function Graybtn_Callback(hObject, eventdata, handles)
% hObject    handle to Graybtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global im
gray=rgb2gray(im);
axes(handles.axes1);
im=gray;
imshow(im);



% --- Executes on selection change in slicerMenu.
function slicerMenu_Callback(hObject, eventdata, handles)
% hObject    handle to slicerMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns slicerMenu contents as cell array
%        contents{get(hObject,'Value')} returns selected item from slicerMenu


% --- Executes during object creation, after setting all properties.
function slicerMenu_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slicerMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end




% --- Executes on selection change in popupmenu2.
function popupmenu2_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns popupmenu2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu2
global im myfuns
val=get(hObject,'Value');
contents = get(hObject,'String');

%realllocated to main
% myfuns =defineMyFunctions;%a way to call to other funcitons from .m files


bit1=myfuns.slicer(val,contents,im);

axes(handles.axes1);
imshow(bit1,[]);



% --- Executes during object creation, after setting all properties.
function popupmenu2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end




% --- Executes on button press in btnView.
function btnView_Callback(hObject, eventdata, handles)
% hObject    handle to btnView (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global im myfuns
myfuns.sliceView(im);
