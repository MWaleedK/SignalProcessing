function varargout = Fig1(varargin)
% FIG1 MATLAB code for Fig1.fig
%      FIG1, by itself, creates a new FIG1 or raises the existing
%      singleton*.
%
%      H = FIG1 returns the handle to a new FIG1 or the handle to
%      the existing singleton*.
%
%      FIG1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FIG1.M with the given input arguments.
%
%      FIG1('Property','Value',...) creates a new FIG1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Fig1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Fig1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Fig1

% Last Modified by GUIDE v2.5 12-Jul-2021 16:21:01

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Fig1_OpeningFcn, ...
                   'gui_OutputFcn',  @Fig1_OutputFcn, ...
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


% --- Executes just before Fig1 is made visible.
function Fig1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Fig1 (see VARARGIN)

% Choose default command line output for Fig1
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Fig1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Fig1_OutputFcn(hObject, eventdata, handles) 
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
disp('Audio1Loaded');
[myAudioD,FsD]=audioread('Drums.flac');
setappdata(0,'DrumsAudio',myAudioD);
setappdata(0,'DrumsFs',FsD);

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
disp('Audio2Loaded');
[myAudioT,FsT]=audioread('Trumpet.flac');
setappdata(0,'TrumpetAudio',myAudioT);
setappdata(0,'TrumpetFs',FsT);

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
disp('Audio3Loaded');
[myAudioV,FsV]=audioread('Violin.flac');
setappdata(0,'ViolinAudio',myAudioV);
setappdata(0,'ViolinFs',FsV);
% --- Executes on button press in pushbutton4.

function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% --- Executes on button press in pushbutton5.
disp('Processing Start');
myAudioV=getappdata(0,'ViolinAudio');
FsV=getappdata(0,'ViolinFs');
myAudioT=getappdata(0,'TrumpetAudio');
FsT=getappdata(0,'TrumpetFs');
myAudioD=getappdata(0,'DrumsAudio');
FsD=getappdata(0,'DrumsFs');

%acquiring Parameters
TimeD=length(myAudioD)./FsD;
tD=0:1/FsD:TimeD-(1/FsD);
TimeT=length(myAudioT)./FsT;
tT=0:1/FsT:TimeT-(1/FsT);
TimeV=length(myAudioV)./FsV;
tV=0:1/FsV:TimeV-(1/FsV);

%Removing frequencies above 4KHz
[filteredAudioD,lengthMyAudioD,totalTimeD]=Preprocessing(myAudioD,FsD);
[filteredAudioT,lengthMyAudioT,totalTimeT]=Preprocessing(myAudioT,FsT);
[filteredAudioV,lengthMyAudioV,totalTimeV]=Preprocessing(myAudioV,FsV);

%getting max Fs
FsMax=max([FsD FsT, FsV]);


%resampling all to FsMax
[newDrums,FsD_]=resamplingFunc(FsD,FsMax,filteredAudioD);
[newViolin,FsV_]=resamplingFunc(FsV,FsMax,filteredAudioV);
[newTrumpet,FsT_]=resamplingFunc(FsT,FsMax,filteredAudioT);


%cosines in MHz
tEnd=max([tD,tV,tT]);
f2MHz=2000000;
f6MHz=6000000;
f8MHz=8000000;
nyquistConst=2;
Fs2MHz=f2MHz*nyquistConst;
Fs6MHz=f6MHz*nyquistConst;
Fs8MHz=f8MHz*nyquistConst;

%tEnd seems to have problems, idk what
%also, following nyquist theorem here

t2MHz=0:1/(Fs2MHz):10-(1/(Fs2MHz));
t6MHz=0:1/(Fs6MHz):10-(1/(Fs6MHz));
t8MHz=0:1/(Fs8MHz):10-(1/(Fs8MHz));
cosine_2MHz=cos(2*pi*f2MHz*t2MHz);
cosine_6MHz=cos(2*pi*f6MHz*t6MHz);
cosine_8MHz=cos(2*pi*f8MHz*t8MHz);


%resampling all again. Resampling uses polyphase filering. Instead of
%upsample, use resample instead... upsample by 3
[newDrums_C,FsD_C]=resamplingFunc(Fs2MHz,FsD_,newDrums);
[newViolin_C,FsV_C]=resamplingFunc(Fs6MHz,FsV_,newViolin);
[newTrumpet_C,FsT_C]=resamplingFunc(Fs8MHz,FsT_,newTrumpet);


%merging Cosines with the signals
newDrums_C=newDrums_C.*cosine_2MHz';
newViolin_C=newViolin_C.*cosine_6MHz';
newTrumpet_C=newTrumpet_C.*cosine_8MHz';
aDvalue=max(newDrums_C);

%DFs=length(newDrums_C)./10;
%VFs=length(newViolin_C)./10;
%TFs=length(newTrumpet_C)./10;
%rangeD=-DFs/2:DFs/length(newDrums_C):(DFs/2)-(DFs/length(newDrums_C));
%rangeV=-VFs/2:VFs/length(newViolin_C):(VFs/2)-(VFs/length(newViolin_C));
%rangeT=-TFs/2:TFs/length(newTrumpet_C):(TFs/2)-(TFs/length(newTrumpet_C));
%figure(1)
%plot(rangeD,fft(newDrums_C));
%figure(2)
%plot(rangeV,newViolin_C);
%figure(3)
%plot(rangeT,newTrumpet_C);

%To time doamin
%newDrums=abs(ifft(newDrums));
%newViolin=abs(ifft(newViolin));
%newTrumpet=abs(ifft(newTrumpet));

%setting sampling frequency straights... setting it equal for all
[newDrums_C,FsD_C]=resamplingFunc(Fs8MHz,Fs2MHz,newDrums_C);
[newViolin_C,FsV_C]=resamplingFunc(Fs8MHz,Fs6MHz,newViolin_C);
[newTrumpet_C,FsT_C]=resamplingFunc(Fs8MHz,Fs8MHz,newTrumpet_C);

disp('Adding em all')
%combining outputs
combinedSignal=newTrumpet_C+newViolin_C+newDrums_C;

disp('BandSeparation');
%bandPass filter: triband separator
reconvertedDrums=bandpass(combinedSignal,[1999500 2000500],Fs8MHz);
reconvertedViolin=bandpass(combinedSignal,[5999500 6000500],Fs8MHz);
reconvertedTrumpet=bandpass(combinedSignal,[7999500 8000500],nyquistConst*Fs8MHz);


%downasmple
[downSampledDrums,FsD_DOWN]=resamplingFunc_2(FsD,FsD_C,reconvertedDrums);
[downSampledViolin,FsV_DOWN]=resamplingFunc_2(FsV,FsV_C,reconvertedViolin);
[downSampledTrumpet,FsT_DOWN]=resamplingFunc_2(FsT,nyquistConst*FsT_C,reconvertedTrumpet);

disp('Almost there');
%heathens banished to the time domain

downSampledDrums=downSampledDrums/max(downSampledDrums);
downSampledViolin=downSampledViolin/max(downSampledViolin);
downSampledTrumpet=downSampledTrumpet/max(downSampledTrumpet);

setappdata(0,'downSampledDrums',downSampledDrums);
setappdata(0,'FsD_DOWN',FsD_DOWN);
setappdata(0,'downSampledViolin',downSampledViolin);
setappdata(0,'FsV_DOWN',FsV_DOWN);
setappdata(0,'downSampledTrumpet',downSampledTrumpet);
setappdata(0,'FsT_DOWN',FsT_DOWN);
disp('ProcessingEnd');


function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
downSampledDrums=getappdata(0,'downSampledDrums');
FsD_DOWN=getappdata(0,'FsD_DOWN');
sound((downSampledDrums),FsD_DOWN);

% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
downSampledViolin=getappdata(0,'downSampledViolin');
FsV_DOWN=getappdata(0,'FsV_DOWN');
sound((downSampledViolin),FsV_DOWN);

% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
downSampledTrumpet=getappdata(0,'downSampledTrumpet');
FsT_DOWN=getappdata(0,'FsT_DOWN');
sound((downSampledTrumpet),FsT_DOWN);