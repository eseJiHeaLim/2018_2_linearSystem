%% propeller sketch
% propeller 꺽이는 곳 좌표
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
% cftool 을 이용하여 곡석방정식을 구한다
%y는 각각의 구해진 방정식을 그대로 대입한것
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

%% 1차 변환 회전을 이용하여 프로펠러 3개

%프로펠러 3개 ->각 120도
th=120*pi/180;
F=[cos(th) -sin(th) 0; sin(th) cos(th) 0 ; 0 0 1];

%두번을 반복하여 날개 3개 만들어서 최종행렬에 추가
for i=1:2
    res=F*z;
    z=[z(1,:) res(1,:) ; z(2,:) res(2,:); z(3,:) res(3,:)];
end
% 프로펠러의 최종 행렬 z
patch(z(1,:),z(2,:),'b')

%프로펠러의 중심원 그리기
center=[0 0];                   	  
r=1;                          	  
N=1000;                         	 
theta=linspace(0,2*pi,N);       
x_r=r*cos(theta)+center(1);
y_r=r*sin(theta)+center(2);

%중심원의 최종 행렬
z_r=[x_r ;y_r ;zeros(1,1000)];

patch(x_r,y_r,'w')
axis([-10 10 -10 10])

%% save as Propeller_rotation.avi
% 영상을 저장할 비디오 객체 생성
video_OBJ=VideoWriter('Propeller_rotation.avi');
open(video_OBJ);
figure(1);
for k=1:3      % 3회 반복하는 영상
    i=1;
    s=0;
    h=2.6;
    % CW 후진 축소
    while(i<=250)
        s=s+7;
        th=s*pi/180;
        h=h-0.01;
        E=[h 0 0 ; 0 h 0 ; 0 0 1];   % 크기 변경하는 마법 행렬
        F=[cos(th) sin(th) 0; -sin(th) cos(th) 0;0 0 1];     %회전해주는 마법 행렬
        r=E*F*z;
        r_r=E*z_r;
        clf;axis([-30 30 -30 30])
        box on; hold on;
        patch(r(1,:),r(2,:),'b') ;
        patch(r_r(1,:), r_r(2,:),'w');
        text(12,25,'201701751 임지혜')
        % plot 한 figure 창의 이미지로 저장
        saveas(gcf,'test.jpg')
        % 저장한 figure창 이미지를 동영상의 프레임으로 저장
        writeVideo(video_OBJ ,imread('test.jpg'));
        pause(0.0000001)
        i=i+1;
    end
    
    clf; i=1;
    % 회전 및 크기 변경 값 초기화 
    s=0;
    h=0.1;
    
    %CCW 전진 확대
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
        text(12,25,'201701751 임지혜')
         saveas(gcf,'test.jpg')
        writeVideo(video_OBJ ,imread('test.jpg'));
        pause(0.0000001)
        i=i+1;
    end
end

close(video_OBJ);


%%  just play - 위와 동일
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
        text(12,25,'201701751 임지혜')
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
        text(12,25,'201701751 임지혜')
        pause(0.0000001)
        i=i+1;
    end
end
