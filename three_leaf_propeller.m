%% propeller sketch
% propeller ���̴� �� ��ǥ
x1=[0 1];
y1=[1 3];
x2=[1 6];
y2=[3 6.5];
x3=[6 7];
y3=[6.5 5];
x4=[7 1];
y4=[5 0];

x_p=[x1 x2 x3 x4];
y_p=[y1 y2 y3 y4];

plot(x_p,y_p)
grid on;
axis([0 10 0 10])

%% curve fitting one propeller
% cftool �� �̿��Ͽ� ��������� ���Ѵ�
%y�� ������ ������ �������� �״�� �����Ѱ�
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
plot(x,y)

z=[x;y;zeros(1,1304)];

%% 1�� ��ȯ ȸ���� �̿��Ͽ� �����緯 3��

%�����緯 3�� ->�� 120��
th=120*pi/180;
F=[cos(th) -sin(th) 0; sin(th) cos(th) 0 ; 0 0 1];

%�ι��� �ݺ��Ͽ� ���� 3�� ���� ������Ŀ� �߰�
for i=1:2
    res=F*z;
    z=[z(1,:) res(1,:) ; z(2,:) res(2,:); z(3,:) res(3,:)];
end
% �����緯�� ���� ��� z
patch(z(1,:),z(2,:),'b')

%�����緯�� �߽ɿ� �׸���
center=[0 0];                   	  
r=1;                          	  
N=1000;                         	 
theta=linspace(0,2*pi,N);       
x_r=r*cos(theta)+center(1);
y_r=r*sin(theta)+center(2);

%�߽ɿ��� ���� ���
z_r=[x_r ;y_r ;zeros(1,1000)];

patch(x_r,y_r,'w')
axis([-10 10 -10 10])

%% save as Propeller_rotation.avi
% ������ ������ ���� ��ü ����
video_OBJ=VideoWriter('Propeller_rotation.avi');
open(video_OBJ);
figure(1);
for k=1:3      % 3ȸ �ݺ��ϴ� ����
    i=1;
    s=0;
    h=2.6;
    % CW ���� ���
    while(i<=250)
        s=s+7;
        th=s*pi/180;
        h=h-0.01;
        E=[h 0 0 ; 0 h 0 ; 0 0 1];   % ũ�� �����ϴ� ���� ���
        F=[cos(th) sin(th) 0; -sin(th) cos(th) 0;0 0 1];     %ȸ�����ִ� ���� ���
        r=E*F*z;
        r_r=E*z_r;
        clf;axis([-30 30 -30 30])
        box on; hold on;
        patch(r(1,:),r(2,:),'b') ;
        patch(r_r(1,:), r_r(2,:),'w');
        text(12,25,'201701751 ������')
        % plot �� figure â�� �̹����� ����
        saveas(gcf,'test.jpg')
        % ������ figureâ �̹����� �������� ���������� ����
        writeVideo(video_OBJ ,imread('test.jpg'));
        pause(0.0000001)
        i=i+1;
    end
    
    clf; i=1;
    % ȸ�� �� ũ�� ���� �� �ʱ�ȭ 
    s=0;
    h=0.1;
    
    %CCW ���� Ȯ��
    while(i<=250)
        s=s-7;
        th=s*pi/180;
        h=h+0.01;
        E=[h 0 0 ; 0 h 0 ; 0 0 1];
        F=[cos(th) sin(th) 0; -sin(th) cos(th) 0;0 0 1];
        r=E*F*z;
        r_r=E*z_r;
        clf;axis([-30 30 -30 30])
        box on; hold on;
        patch(r(1,:),r(2,:),'b') ;
        patch(r_r(1,:), r_r(2,:),'w')
        text(12,25,'201701751 ������')
         saveas(gcf,'test.jpg')
        writeVideo(video_OBJ ,imread('test.jpg'));
        pause(0.0000001)
        i=i+1;
    end
end

close(video_OBJ);


%%  just play - ���� ����
figure(1);

for k=1:3
    i=1;
    s=0;
    h=2.6;
    while(i<=250)
        s=s+7;
        th=s*pi/180;
        h=h-0.01;
        E=[h 0 0 ; 0 h 0 ; 0 0 1];
        F=[cos(th) sin(th) 0; -sin(th) cos(th) 0;0 0 1];
        r=E*F*z;
        r_r=E*z_r;
        clf;axis([-30 30 -30 30])
        box on; hold on;
        patch(r(1,:),r(2,:),'b') ;
        patch(r_r(1,:), r_r(2,:),'w');
        text(12,25,'201701751 ������')
        pause(0.0000001)
        i=i+1;
    end
    s=0;
    h=0.1;
    clf;
    i=1;
    while(i<=250)
        s=s-7;
        th=s*pi/180;
        h=h+0.01;
        E=[h 0 0 ; 0 h 0 ; 0 0 1];
        F=[cos(th) sin(th) 0; -sin(th) cos(th) 0;0 0 1];
        r=E*F*z;
        r_r=E*z_r;
        clf;axis([-30 30 -30 30])
        box on; hold on;
        patch(r(1,:),r(2,:),'b') ;
        patch(r_r(1,:), r_r(2,:),'w')
        text(12,25,'201701751 ������')
        pause(0.0000001)
        i=i+1;
    end
end
