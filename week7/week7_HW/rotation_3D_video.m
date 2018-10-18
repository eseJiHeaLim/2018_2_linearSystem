
% video_OBJ=VideoWriter('orignView.avi');
% video_OBJ=VideoWriter('x1View.avi');
% video_OBJ=VideoWriter('x2View.avi');
video_OBJ=VideoWriter('x3View.avi');

open(video_OBJ);

% rotation되는 대상 좌표
x=[3;2;7];

% 순서대로 x1축 CCW 60도 , x2축 CCW 45도 , x3 축 CCW 30도 회전한 후의 좌표 구하기
the = 60;
phi = 45;
psi=30;

% x1축 60도 회전
for x_1=[0:2:60]
    clf;
    the=x_1 * pi /180;
    
    Rx=[1 0 0 ; 0 cos(the) -sin(the);0 sin(the) cos(the)];
    y1 = Rx * x;
    
    plot3(x(1) ,x(2),x(3),'o');grid
    hold on;
    plot3(y1(1),y1(2),y1(3),'*');
    
    %     view([90,0,0])
    %         view([0,-90,0])
    view([0,0,90])
    
    xlabel('x1 axis');ylabel('x2 axis');zlabel('x3 axis')
    title('201701751 임지혜')
    axis([-10 10 -10 10 -10 10]);
    line([0 x(1)], [0 x(2)],[0 x(3)]);
    line([0 y1(1)], [0 y1(2)],[0 y1(3)]);
    
    % plot 한 figure 창의 이미지로 저장
    saveas(gcf,'test.jpg')
    % 저장한 figure창 이미지를 동영상의 프레임으로 저장
    writeVideo(video_OBJ ,imread('test.jpg'));
   
    pause(0.01)
    
end

% x2축 45도 회전
for x_2=[0:2:46]
    clf;
    
    phi=x_2 * pi /180;
    
    Ry=[cos(phi) 0 sin(phi); 0 1 0 ;-sin(phi) 0 cos(phi)];
    y2= Ry*y1;
    
    plot3(x(1),x(2),x(3),'o');grid
    hold on;
    plot3(y2(1),y2(2),y2(3),'*');
    
    %     view([90,0,0])
    %         view([0,-90,0])
    view([0,0,90])
    
    xlabel('x1 axis');ylabel('x2 axis');zlabel('x3 axis')
    title('201701751 임지혜')
    axis([-10 10 -10 10 -10 10]);
    line([0 x(1)], [0 x(2)],[0 x(3)]);
    line([0 y2(1)], [0 y2(2)],[0 y2(3)]);
    
    saveas(gcf,'test.jpg')
    writeVideo(video_OBJ ,imread('test.jpg'));
    
    pause(0.01)
    
end

% x3  30도 회전
for x_3=[0:2:31]
    clf;
    psi=x_3 * pi /180;
    
    Rz=[cos(psi) -sin(psi) 0 ; sin(psi) cos(psi) 0;0 0 1];
    y3= Rz*y2;
    
    plot3(x(1),x(2),x(3),'o'); grid
    hold on;
    plot3(y3(1),y3(2),y3(3),'*');
    
    %     view([90,0,0])
    %         view([0,-90,0])
    view([0,0,90])
    
    xlabel('x1 axis');ylabel('x2 axis');zlabel('x3 axis')
    title('201701751 임지혜')
    axis([-10 10 -10 10 -10 10]);
    line([0 x(1)],[0 x(2)],[0 x(3)])
    line([0 y3(1)],[0 y3(2)],[0 y3(3)])
    
    saveas(gcf,'test.jpg')
    writeVideo(video_OBJ ,imread('test.jpg'));
    
    pause(0.01)
    
end

close(video_OBJ);
