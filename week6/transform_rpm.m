function varargout = transform_rpm(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @transform_rpm_OpeningFcn, ...
                   'gui_OutputFcn',  @transform_rpm_OutputFcn, ...
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

function transform_rpm_OpeningFcn(hObject, eventdata, handles, varargin)


% Choose default command line output for transform_rpm
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

function varargout = transform_rpm_OutputFcn(hObject, eventdata, handles) 

varargout{1} = handles.output;

function edit1_Callback(hObject, eventdata, handles)

function edit1_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function draw(hope_rpm)
x1=[0:0.01: 1];
y1=exp(1.099*(x1));
x2=[1 :0.01:6];
y2=3*x2.^0.4315 ;
x3=[6:0.01: 7];
y3=(137.2*((x3).^(-1.702)));
x4=[7 :-0.01:1];
y4=0.1241*x4.^1.899;

x=[x1 x2 x3 x4];
y=[y1 y2 y3 y4];


z=[x;y;zeros(1,1304)];

%�����緯 3�� ->�� 120��
th=120*pi/180;
F=[cos(th) -sin(th) 0; sin(th) cos(th) 0 ; 0 0 1];

%�ι��� �ݺ��Ͽ� ���� 3�� ���� ������Ŀ� �߰�
for i=1:2
    res=F*z;
    z=[z(1,:) res(1,:) ; z(2,:) res(2,:); z(3,:) res(3,:)];
end

%�����緯�� �߽ɿ� �׸���
center=[0 0];                   	  
r=1;                          	  
N=1000;                         	 
theta=linspace(0,2*pi,N);       
x_r=r*cos(theta)+center(1);
y_r=r*sin(theta)+center(2);

%�߽ɿ��� ���� ���
z_r=[x_r ;y_r ;zeros(1,1000)];



hope_rpm=str2double(hope_rpm)
add=hope_rpm/2;   

for k=1:5
    i=1;
    s=0;
    h=2.6;
    cnt=0;
rpm=hope_rpm;
t=clock;
    while(i<=250)
        s=s+add;
        th=s*pi/180;
        % �ѹ��� �������� üũ 
        if(s>360)
            t1=etime(clock,t);
            s=0;
            cnt=cnt+1
            %�ѹ��� ���� �ð��� time
            time=t1/cnt
            rpm=60/time
        end
        h=h-0.01;
        E=[h 0 0 ; 0 h 0 ; 0 0 1];
        F=[cos(th) sin(th) 0; -sin(th) cos(th) 0;0 0 1];
        r=E*F*z;
        r_r=E*z_r;
        clf;axis([-30 30 -30 30])
        box on; hold on; axis off;
        patch(r(1,:),r(2,:),'b') ;
        patch(r_r(1,:), r_r(2,:),'w');
         str = {'current rpm is',num2str(round(rpm))};
         text(-20,25,str)
        text(12,25,'201701751 ������')
        pause(0.0000001)
        i=i+1;
    end
           
    s=0;
    h=0.1;
    clf;
    i=1;
    while(i<=250)
        s=s-add;
        th=s*pi/180;
          if(s<-360)
%             t2=toc;
            t1=etime(clock,t);
            s=0;
            cnt=cnt+1
            %�ѹ��� ���� �ð��� time
            time=t1/cnt
            rpm=60/time
        end
        h=h+0.01;
        E=[h 0 0 ; 0 h 0 ; 0 0 1];
        F=[cos(th) sin(th) 0; -sin(th) cos(th) 0;0 0 1];
        r=E*F*z;
        r_r=E*z_r;
        clf;axis([-30 30 -30 30])
        box on; hold on;axis off;
        patch(r(1,:),r(2,:),'b') ;
        patch(r_r(1,:), r_r(2,:),'w')
        text(12,25,'201701751 ������')
        str = {'current rpm is',num2str(round(rpm))};
         text(-20,25,str)
        pause(0.0000001)
        i=i+1;
    end
end
close



function pushbutton1_Callback(hObject, eventdata, handles)

hope_rpm= get(handles.edit1 , 'String');

draw(hope_rpm)
