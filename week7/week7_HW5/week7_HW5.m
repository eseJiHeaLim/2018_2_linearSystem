clc;
clear;
% 팔각형의 3차원에서의 좌표
d= [0 5 5 0 -5 5 0 -5 -5 0 5 -5 0;
    0 -5 5  0 5 5 0 5 -5 0 -5 -5 0;
    20 0 0 20 0 0 -20 0 0 -20 0 0 20;
    1 1 1 1 1 1 1 1 1 1 1 1 1];

% 면을 지정하기 위해 --> 팔면체
p=[1 2 3 ; 4 5 6 ;5 6 7;8 9 10; 9 10 11;11 12 13 ;1 8 9 ; 2 3  7];

c=['b';'r';'g';'w';'k';'c';'m';'y';];
    
%% 램덤으로 원근을 고려하여 도형의 크기를 변형시켜라 - 가까울수록 크고 , 멀수록 작아진다
video_OBJ=VideoWriter('Diamond_trans.avi');
open(video_OBJ);

x3=0;
orbit=[0,0,20];
vpoint=[60,60,60]; % 내가 이렇게 보고 있다는 가정임
vgain=10000; % 원근감을 조절하는 사용자 설정 계수

for deg= [0:2:720]
    clf;
    
    x_1=20*cos(deg*pi/180);
    x_2=20*sin(deg*pi/180);
    x_3=x3-0.1;
    x1=x_1+randn(1);
    x2=x_2+randn(1);
    x3=x_3+randn(1);
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
    view([60+x_1*4 60+x_2*3 60+x_3]); grid;
    pause(0.000001);
    
    saveas(gcf,'test.jpg')
    writeVideo(video_OBJ ,imread('test.jpg'));
    
end

close(video_OBJ);