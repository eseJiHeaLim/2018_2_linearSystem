clear;clc;
%% data in 3D M에 대해 다시 그린 좌표
top=[0 1 1 4 7 7 8 8 7 4 1 0 0;
    0 0 6 0 6 0 0 8 8 2 8 8 0;
    0 0 0 0 0 0 0 0 0 0 0 0 0;
    1 1 1 1 1 1 1 1 1 1 1 1 1 ];

buttom=[0 1 1 4 7 7 8 8 7 4 1 0 0;
    0 0 6 0 6 0 0 8 8 2 8 8 0;
    1 1 1 1 1 1 1 1 1 1 1 1 1;
    1 1 1 1 1 1 1 1 1 1 1 1 1 ];

back_v=[1 1 1 4  7 7 4 1 1 ;
    8 8 8 2  8 8 2 8 8 ;
    1 0 1 1  1 0 0 0 1;
    1 1 1 1  1 1 1 1  1];

front_v=[1 1 4  7 7 4 1;
    6 6 0  6 6 0 6;
    0 1 1  1 0 0 0;
    1 1 1  1 1 1 1 ];

back_l=[0 1 1 0 ;
    8 8 8 8 ;
    0 0 1 1;
    1 1 1 1 ];

back_r=[7  8 8 7 7;
    8 8 8 8 8;
    0 0 1 1 0;
    1 1 1 1 1];

front_l=[0 1 1 0  ;
    0 0 0 0 ;
    0 0 1 1 ;
    1 1 1 1];

front_r=[7 8 8 7 7;
    0 0 0 0 0;
    0 0 1 1 0;
     1 1 1 1 1];

insider_l=[1 1 1 1 1;
    0 6 6 0 0;
    0 0 1 1 0;
    1 1 1 1 1];

insider_r=[7 7 7 7 7 ;
    0 0 6 6 0;
    0 1 1 0 0;
    1 1 1 1 1];

side_l=[0 0 0 0 ;
    0 0 8 8 ;
    0 1 1 0 ;
    1 1 1 1];

side_r=[8 8 8 8 ;
    0 0 8 8 ;
    0 1 1 0 ;
    1 1 1 1];

%% 3축회전 운동 각각 
video_OBJ=VideoWriter('M_3D_rotation.avi');
open(video_OBJ);
for th= 0 : 01:360  % rolling
    the= th*pi/180;
    Rx=[1 0 0 0 ; 0 cos(the) -sin(the) 0 ; 0 sin(the) cos(the) 0; 0 0 0 1];
    y1=Rx*front_v;
    y2=Rx*back_l;
    y3=Rx*back_r;
    y4=Rx*front_l;
    y5=Rx*front_r;
    y6=Rx*insider_l;
    y7=Rx*insider_r;
    y8=Rx*side_l;
    y9=Rx*side_r;
    y10=Rx*back_v;
    y11=Rx*top;
    y12=Rx*buttom;
    clf;hold on;
    fill3(y1(1,:),y1(2,:),y1(3,:),'y');
    fill3(y2(1,:),y2(2,:),y2(3,:),'y');
    fill3(y3(1,:),y3(2,:),y3(3,:),'y');
    fill3(y4(1,:),y4(2,:),y4(3,:),'y');
    fill3(y5(1,:),y5(2,:),y5(3,:),'y');
    fill3(y6(1,:),y6(2,:),y6(3,:),'y');
    fill3(y7(1,:),y7(2,:),y7(3,:),'y');
    fill3(y8(1,:),y8(2,:),y8(3,:),'y');
    fill3(y9(1,:),y9(2,:),y9(3,:),'y');
    fill3(y10(1,:),y10(2,:),y10(3,:),'y');
    fill3(y11(1,:),y11(2,:),y11(3,:),'y');
    fill3(y12(1,:),y12(2,:),y12(3,:),'y');
    view([60 60 60])
    axis([-15 15 -15 15 -15 15 ]); grid
    text(10,20,45,'201701751 임지혜')
    xlabel('x1-axis'); ylabel('x2-axis'); zlabel('z3-axis');
    saveas(gcf,'test.jpg')
    writeVideo(video_OBJ ,imread('test.jpg'));
    pause(0.0001)
end

%pitch
for ph= 0 : 1:360
    clf;
    phi= ph*pi/180;
    Ry=[cos(phi) 0  sin(phi) 0 ;0 1 0 0 ;  -sin(phi) 0 cos(phi) 0; 0 0 0 1];
    y1=Ry*front_v;
    y2=Ry*back_l;
    y3=Ry*back_r;
    y4=Ry*front_l;
    y5=Ry*front_r;
    y6=Ry*insider_l;
    y7=Ry*insider_r;
    y8=Ry*side_l;
    y9=Ry*side_r;
    y10=Ry*back_v;
    y11=Ry*top;
    y12=Ry*buttom;
    hold on;
    fill3(y1(1,:),y1(2,:),y1(3,:),'y');
    fill3(y2(1,:),y2(2,:),y2(3,:),'y');
    fill3(y3(1,:),y3(2,:),y3(3,:),'y');
    fill3(y4(1,:),y4(2,:),y4(3,:),'y');
    fill3(y5(1,:),y5(2,:),y5(3,:),'y');
    fill3(y6(1,:),y6(2,:),y6(3,:),'y');
    fill3(y7(1,:),y7(2,:),y7(3,:),'y');
    fill3(y8(1,:),y8(2,:),y8(3,:),'y');
    fill3(y9(1,:),y9(2,:),y9(3,:),'y');
    fill3(y10(1,:),y10(2,:),y10(3,:),'y');
    fill3(y11(1,:),y11(2,:),y11(3,:),'y');
    fill3(y12(1,:),y12(2,:),y12(3,:),'y');
    view([60 60 60])
    axis([-15 15 -15 15 -15 15 ]); grid
    text(10,20,45,'201701751 임지혜')
    xlabel('x1-axis'); ylabel('x2-axis'); zlabel('z3-axis');
    saveas(gcf,'test.jpg')
    writeVideo(video_OBJ ,imread('test.jpg'));
    pause(0.0001)
end

% yaw
for ps= 0 : 1:360
    psi= ps*pi/180;
    Rz=[cos(psi) -sin(psi) 0 0 ;sin(psi)  cos(psi) 0 0;0 0 1  0 ;   0 0 0 1];
    y1=Rz*front_v;
    y2=Rz*back_l;
    y3=Rz*back_r;
    y4=Rz*front_l;
    y5=Rz*front_r;
    y6=Rz*insider_l;
    y7=Rz*insider_r;
    y8=Rz*side_l;
    y9=Rz*side_r;
    y10=Rz*back_v;
    y11=Rz*top;
    y12=Rz*buttom;
    clf;hold on;
    fill3(y1(1,:),y1(2,:),y1(3,:),'y');
    fill3(y2(1,:),y2(2,:),y2(3,:),'y');
    fill3(y3(1,:),y3(2,:),y3(3,:),'y');
    fill3(y4(1,:),y4(2,:),y4(3,:),'y');
    fill3(y5(1,:),y5(2,:),y5(3,:),'y');
    fill3(y6(1,:),y6(2,:),y6(3,:),'y');
    fill3(y7(1,:),y7(2,:),y7(3,:),'y');
    fill3(y8(1,:),y8(2,:),y8(3,:),'y');
    fill3(y9(1,:),y9(2,:),y9(3,:),'y');
    fill3(y10(1,:),y10(2,:),y10(3,:),'y');
    fill3(y11(1,:),y11(2,:),y11(3,:),'y');
    fill3(y12(1,:),y12(2,:),y12(3,:),'y');
    view([60 60 60])
    axis([-15 15 -15 15 -15 15 ]); grid
    text(10,20,45,'201701751 임지혜')
    xlabel('x1-axis'); ylabel('x2-axis'); zlabel('z3-axis');
    saveas(gcf,'test.jpg')
    writeVideo(video_OBJ ,imread('test.jpg'));
    pause(0.0001)
end

close(video_OBJ);
%% 3축 회전 운동 동시에

video_OBJ=VideoWriter('M_3D_all_rotation.avi');
open(video_OBJ);

for th= 0 : 01:360
    the= th*pi/180;
    
    Rx=[1 0 0 0 ; 0 cos(the) -sin(the) 0 ; 0 sin(the) cos(the) 0; 0 0 0 1];
    Ry=[cos(the) 0  sin(the) 0 ;0 1 0 0 ;  -sin(the) 0 cos(the) 0; 0 0 0 1];
    Rz=[cos(the) -sin(the) 0 0 ;sin(the)  cos(the) 0 0;0 0 1  0 ;   0 0 0 1];
    y1=Rz*Ry*Rx*front_v;
    y2=Rz*Ry*Rx*back_l;
    y3=Rz*Ry*Rx*back_r;
    y4=Rz*Ry*Rx*front_l;
    y5=Rz*Ry*Rx*front_r;
    y6=Rz*Ry*Rx*insider_l;
    y7=Rz*Ry*Rx*insider_r;
    y8=Rz*Ry*Rx*side_l;
    y9=Rz*Ry*Rx*side_r;
    y10=Rz*Ry*Rx*back_v;
    y11=Rz*Ry*Rx*top;
    y12=Rz*Ry*Rx*buttom;
    clf;hold on;
    fill3(y1(1,:),y1(2,:),y1(3,:),'y');
    fill3(y2(1,:),y2(2,:),y2(3,:),'y');
    fill3(y3(1,:),y3(2,:),y3(3,:),'y');
    fill3(y4(1,:),y4(2,:),y4(3,:),'y');
    fill3(y5(1,:),y5(2,:),y5(3,:),'y');
    fill3(y6(1,:),y6(2,:),y6(3,:),'y');
    fill3(y7(1,:),y7(2,:),y7(3,:),'y');
    fill3(y8(1,:),y8(2,:),y8(3,:),'y');
    fill3(y9(1,:),y9(2,:),y9(3,:),'y');
    fill3(y10(1,:),y10(2,:),y10(3,:),'y');
    fill3(y11(1,:),y11(2,:),y11(3,:),'y');
    fill3(y12(1,:),y12(2,:),y12(3,:),'y');
    view([60 60 60])
    axis([-15 15 -15 15 -15 15 ]); grid
    text(10,20,45,'201701751 임지혜')
    xlabel('x1-axis'); ylabel('x2-axis'); zlabel('z3-axis');
    saveas(gcf,'test.jpg')
    writeVideo(video_OBJ ,imread('test.jpg'));
    pause(0.0001)
end


close(video_OBJ);

%% 랜덤하게 6자유도 
video_OBJ=VideoWriter('M_3D_random_rotation.avi');
open(video_OBJ);
x3=0;
for th= 0 : 0.1:180
    the= th*pi/180;
    
    the_r=the+randn(1);
    the_p=the+randn(1);
    the_y=the+randn(1);
    
    x1=cos(th*pi/180)+randn(1);
    x2=sin(th*pi/180)+randn(1);
    x3=x3-0.01+randn(1);
    Rx=[1 0 0 0 ; 0 cos(the_r) -sin(the_r) 0 ; 0 sin(the_r) cos(the_r) 0; 0 0 0 1];
    Ry=[cos(the_p) 0  sin(the_p) 0 ;0 1 0 0 ;  -sin(the_p) 0 cos(the_p) 0; 0 0 0 1];
    Rz=[cos(the_y) -sin(the_y) 0 0 ;sin(the_y)  cos(the_y) 0 0;0 0 1  0 ;   0 0 0 1];
    XYZ=[1 0 0 x1; 0 1 0 x2 ; 0 0 1 x3; 0 0 0 1];
    y1=XYZ*Rz*Ry*Rx*XYZ*front_v;
    y2=XYZ*Rz*Ry*Rx*XYZ*back_l;
    y3=XYZ*Rz*Ry*Rx*XYZ*back_r;
    y4=XYZ*Rz*Ry*Rx*XYZ*front_l;
    y5=XYZ*Rz*Ry*Rx*XYZ*front_r;
    y6=XYZ*Rz*Ry*Rx*XYZ*insider_l;
    y7=XYZ*Rz*Ry*Rx*XYZ*insider_r;
    y8=XYZ*Rz*Ry*Rx*XYZ*side_l;
    y9=XYZ*Rz*Ry*Rx*XYZ*side_r;
    y10=XYZ*Rz*Ry*Rx*XYZ*back_v;
    y11=XYZ*Rz*Ry*Rx*XYZ*top;
    y12=XYZ*Rz*Ry*Rx*XYZ*buttom;
    clf;hold on;
    fill3(y1(1,:),y1(2,:),y1(3,:),'y');
    fill3(y2(1,:),y2(2,:),y2(3,:),'y');
    fill3(y3(1,:),y3(2,:),y3(3,:),'y');
    fill3(y4(1,:),y4(2,:),y4(3,:),'y');
    fill3(y5(1,:),y5(2,:),y5(3,:),'y');
    fill3(y6(1,:),y6(2,:),y6(3,:),'y');
    fill3(y7(1,:),y7(2,:),y7(3,:),'y');
    fill3(y8(1,:),y8(2,:),y8(3,:),'y');
    fill3(y9(1,:),y9(2,:),y9(3,:),'y');
    fill3(y10(1,:),y10(2,:),y10(3,:),'y');
    fill3(y11(1,:),y11(2,:),y11(3,:),'y');
    fill3(y12(1,:),y12(2,:),y12(3,:),'y');
    view([60 60 60]) ; axis([-50 50 -50 50 -50 50]); grid ; text(10,40,120,'201701751 임지혜')
    xlabel('x1-axis'); ylabel('x2-axis'); zlabel('z3-axis');
    saveas(gcf,'test.jpg')
    writeVideo(video_OBJ ,imread('test.jpg'));
    pause(0.1)
end


close(video_OBJ);
