
% rotation되는 대상 좌표
x=[3;2;7];

% 순서대로 x1축 CCW 60도 , x2축 CCW 45도 , x3 축 CCW 30도 회전한 후의 좌표 구하기
the = 60; 
phi = 45;
psi=30;

% x1축 회전 
for x_1=[0:2:60]
    clf;
    the=x_1 * pi /180;
    Rx=[1 0 0 ; 0 cos(the) -sin(the);0 sin(the) cos(the)];
    y1 = Rx * x;
    plot3(x(1) ,x(2),x(3),'o');grid
    hold on;
    plot3(y1(1),y1(2),y1(3),'*');
    view([0,0,90])
    xlabel('x1 axis');ylabel('x2 axis');zlabel('x3 axis')

    axis([-10 10 -10 10 -10 10]);
    line([0 x(1)], [0 x(2)],[0 x(3)]);
    line([0 y1(1)], [0 y1(2)],[0 y1(3)]);
    pause(0.00000001)
    
end
