% 팔각형의 3차원에서의 좌표
d= [0 5 5 0 -5 5 0 -5 -5 0 5 -5 0;
    0 -5 5  0 5 5 0 5 -5 0 -5 -5 0;
    20 0 0 20 0 0 -20 0 0 -20 0 0 20;
    1 1 1 1 1 1 1 1 1 1 1 1 1];

% 면을 지정하기 위해 --> 팔면체
p=[1 2 3 ; 4 5 6 ;5 6 7;8 9 10; 9 10 11;11 12 13 ;1 8 9 ; 2 3  7];

c=['b';'r';'g';'w';'k';'c';'m';'y';];

for psi=0:0.04:2*pi
    Rz=[cos(psi) -sin(psi) 0 0 ; sin(psi) cos(psi) 0 0 ; 0 0 1 0 ; 0 0 0 1];
    y=Rz*d;
    line(y(1,:),y(2,:),y(3,:));
    
    for i = 1:1:8   
         patch([y(1,p(i,1)) y(1,p(i,2)) y(1,p(i,3))], [y(2,p(i,1)) y(2,p(i,2)) y(2,p(i,3))], ...
            [y(3,p(i,1)) y(3,p(i,2)) y(3,p(i,3))], c(i));
    end
 
    % 축을 명확하게 하기 위해 
    line([60 0 0 ], [0 0 0],[0 0 0 ],'color','r');
    line([0 0 0 ], [0 60 0],[0 0 0 ],'color','g');
    line([0 0 0 ], [0 0 0],[0 0 60 ],'color','k');
    
    xlabel('x1-axis'); ylabel('x2-axis'); zlabel('z3-axis');
    axis([-60 60 -60 60 -60 60]);
    view([60 60 60]); grid
    pause(0.000001);clf
end

%% x1축 +20 이동하면서 x3축으로 CCW 두바퀴 

x3= 0;
orbit=[0,0,20];

% 몇바퀴를 돌지를 지정
noRot1=2;
noRot=2;

for x1=[0:0.15:20]
    clf;
    psi=noRot1*2*pi*x1/20;
    Rz_u=[cos(psi) -sin(psi) 0 x1 ; sin(psi) cos(psi) 0 0 ; 0 0 1 0 ; 0 0 0 1];
    y=Rz_u*d;
    
    line([y(1,:) y(1,1)],[y(2,:) y(2,1)], [y(3,:) y(3,1)]);
    line([40 0 0 ], [0 0 0 ], [0 0 0 ],'Color' ,'r');
    line([0 0 0 ], [0 40 0 ], [0 0 0 ],'Color' ,'r');
    line([0 0 0 ], [0 0 0 ], [0 0 40 ],'Color' ,'k');
    
    orbit = [orbit ; y(1,1) y(2,1),y(3,1)];
    line(orbit(:,1) , orbit(:,2), orbit(:,3));
    
    for i = 1:1:8
           patch([y(1,p(i,1)) y(1,p(i,2)) y(1,p(i,3))], [y(2,p(i,1)) y(2,p(i,2)) y(2,p(i,3))], ...
            [y(3,p(i,1)) y(3,p(i,2)) y(3,p(i,3))], c(i));
    end
    
     xlabel('x1-axis'); ylabel('x2-axis'); zlabel('z3-axis');
    axis([-60 60 -60 60 -60 60]);
    view([60 60 60]); grid
    pause(0.000001);
end


%% x3 축을 기준으로 반지름이 20인 CCW 2바퀴를 등속도로 돌면서 하강하는 나성형 회전 - 하강 거리 20

for deg =[0:2: 720]
    x1=20*cos(deg*pi/180);
    x2=20*sin(deg*pi/180);
    x3=x3-0.1;
    psi = deg* 8* pi/180;
    
    Rz_round =[ cos(psi) -sin(psi) 0 x1 ; sin(psi)  cos(psi) 0 x2;0 0 1  x3;0 0 0 1];
    y= Rz_round*d;
    
    line([y(1,:) y(1,1)],[y(2,:) y(2,1)], [y(3,:) y(3,1)]);
    line([40 0 0 ], [0 0 0 ], [0 0 0 ],'Color' ,'r');
    line([0 0 0 ], [0 40 0 ], [0 0 0 ],'Color' ,'r');
    line([0 0 0 ], [0 0 0 ], [0 0 40 ],'Color' ,'k');
    
     orbit = [orbit ; y(1,1) y(2,1),y(3,1)];
    line(orbit(:,1) , orbit(:,2), orbit(:,3));
    
    for i = 1:1:8
                 patch([y(1,p(i,1)) y(1,p(i,2)) y(1,p(i,3))], [y(2,p(i,1)) y(2,p(i,2)) y(2,p(i,3))], ...
            [y(3,p(i,1)) y(3,p(i,2)) y(3,p(i,3))], c(i));
    end
    
     xlabel('x1-axis'); ylabel('x2-axis'); zlabel('z3-axis');
    axis([-60 60 -60 60 -60 60]);
    view([60 60 60]); grid
    pause(0.000001);clf;
end


%% 위아 같이 회전 하되 도형이 랜덤하게 떨리면서 운동

x3= 0 ;
orbit=[0,0,20];

for x1=[0:0.15: 20]
    clf;
    psi=4*pi*x1/20;
    Rz_u=[ cos(psi) -sin(psi) 0 x1 ; sin(psi)  cos(psi) 0 0;0 0 1  0;0 0 0 1];
    y=Rz_u*d;
    
     line([y(1,:) y(1,1)],[y(2,:) y(2,1)], [y(3,:) y(3,1)]);
    line([40 0 0 ], [0 0 0 ], [0 0 0 ],'Color' ,'r');
    line([0 0 0 ], [0 40 0 ], [0 0 0 ],'Color' ,'r');
    line([0 0 0 ], [0 0 0 ], [0 0 40 ],'Color' ,'k');
    
    orbit = [orbit ; y(1,1) y(2,1),y(3,1)];
    line(orbit(:,1) , orbit(:,2), orbit(:,3));
    
    for i = 1:1:8
                 patch([y(1,p(i,1)) y(1,p(i,2)) y(1,p(i,3))], [y(2,p(i,1)) y(2,p(i,2)) y(2,p(i,3))], ...
            [y(3,p(i,1)) y(3,p(i,2)) y(3,p(i,3))], c(i));
    end
    
     xlabel('x1-axis'); ylabel('x2-axis'); zlabel('z3-axis');
    axis([-60 60 -60 60 -60 60]);
    view([60 60 60]); grid
    pause(0.000001);clf;
end
%% 

x3=0
for deg=[0:2:720]
    clf;
     x1=20*cos(deg*pi/180)+randn(1);
    x2=20*sin(deg*pi/180)+randn(1);
    x3=x3-0.01+randn(1);
    
     psi = deg* 4* pi/180;
    
    Rz_round =[ cos(psi) -sin(psi) 0 x1 ; sin(psi)  cos(psi) 0 x2;0 0 1  x3;0 0 0 1];
    y= Rz_round*d;
    
    line([y(1,:) y(1,1)],[y(2,:) y(2,1)], [y(3,:) y(3,1)]);
    line([40 0 0 ], [0 0 0 ], [0 0 0 ],'Color' ,'r');
    line([0 0 0 ], [0 40 0 ], [0 0 0 ],'Color' ,'r');
    line([0 0 0 ], [0 0 0 ], [0 0 40 ],'Color' ,'k');
    
     orbit = [orbit ; y(1,1) y(2,1),y(3,1)];
    line(orbit(:,1) , orbit(:,2), orbit(:,3));
    
    for i = 1:1:8
                 patch([y(1,p(i,1)) y(1,p(i,2)) y(1,p(i,3))], [y(2,p(i,1)) y(2,p(i,2)) y(2,p(i,3))], ...
            [y(3,p(i,1)) y(3,p(i,2)) y(3,p(i,3))], c(i));
    end
    
     xlabel('x1-axis'); ylabel('x2-axis'); zlabel('z3-axis');
    axis([-60 60 -60 60 -60 60]);
    view([60 60 60]); grid
    pause(0.000001);
end

%% 원근을 고려하여 도형의 크기를 변형시켜라 - 가까울수록 크고 , 멀수록 작아진다
x3=0;
orbit=[0,0,20];
vpoint=[60,60,60]; % 내가 이렇게 보고 있다는 가정임
vgain=10000; % 원근감을 조절하는 사용자 설정 계수

for x1=[0:0.3:20]
    clf;
    psi=4*pi*x1/20;
     Rz_u=[ cos(psi) -sin(psi) 0 x1 ; sin(psi)  cos(psi) 0 0;0 0 1  0;0 0 0 1];
    y_before=Rz_u*d;
    disp_vpoint=sqrt((y_before(1,1)-vpoint(1))^2 + (y_before(2,1)-vpoint(2))^2 + (y_before(3,1)-vpoint(3))^2);
    
    y=y_before./(disp_vpoint.^2).*vgain;
     line([y(1,:) y(1,1)],[y(2,:) y(2,1)], [y(3,:) y(3,1)]);
    line([40 0 0 ], [0 0 0 ], [0 0 0 ],'Color' ,'r');
    line([0 0 0 ], [0 40 0 ], [0 0 0 ],'Color' ,'g');
    line([0 0 0 ], [0 0 0 ], [0 0 40 ],'Color' ,'k');
    
     orbit = [orbit ; y(1,1) y(2,1),y(3,1)];
    line(orbit(:,1) , orbit(:,2), orbit(:,3));
    
    for i = 1:1:8
                 patch([y(1,p(i,1)) y(1,p(i,2)) y(1,p(i,3))], [y(2,p(i,1)) y(2,p(i,2)) y(2,p(i,3))], ...
            [y(3,p(i,1)) y(3,p(i,2)) y(3,p(i,3))], c(i));
    end
    
     xlabel('x1-axis'); ylabel('x2-axis'); zlabel('z3-axis');
    axis([-60 60 -60 60 -60 60]);
    view([60 60 60]); grid
    pause(0.000001);
    
end
for deg= [0:2:720]
    clf;
    x1=20*cos(deg*pi/180);
    x2=20*sin(deg*pi/180);
    x3=x3-0.1;
    psi=deg*4*pi/180;
    
    Rz_round=[ cos(psi) -sin(psi) 0 x1 ; sin(psi)  cos(psi) 0 x2;0 0 1  x3;0 0 0 1];
    y_before=Rz_round*d;
    disp_vpoint=sqrt((y_before(1,1)-vpoint(1))^2 + (y_before(2,1)-vpoint(2))^2 + (y_before(3,1)-vpoint(3))^2);
    
    y=y_before./(disp_vpoint.^2).*vgain;
    
    line([y(1,:) y(1,1)],[y(2,:) y(2,1)], [y(3,:) y(3,1)]);
    line([40 0 0 ], [0 0 0 ], [0 0 0 ],'Color' ,'r');
    line([0 0 0 ], [0 40 0 ], [0 0 0 ],'Color' ,'g');
    line([0 0 0 ], [0 0 0 ], [0 0 40 ],'Color' ,'k');
    
     orbit = [orbit ; y(1,1) y(2,1),y(3,1)];
    line(orbit(:,1) , orbit(:,2), orbit(:,3));
    
    for i = 1:1:8
                 patch([y(1,p(i,1)) y(1,p(i,2)) y(1,p(i,3))], [y(2,p(i,1)) y(2,p(i,2)) y(2,p(i,3))], ...
            [y(3,p(i,1)) y(3,p(i,2)) y(3,p(i,3))], c(i));
    end
    
     xlabel('x1-axis'); ylabel('x2-axis'); zlabel('z3-axis');
    axis([-60 60 -60 60 -60 60]);
    view([60 60 60]); grid
    pause(0.000001);
    
    
end
%% 원든근고려한 회전을 하되 vpoint를 변결 시킨다

% 괒 ㅔㅇㅁ
