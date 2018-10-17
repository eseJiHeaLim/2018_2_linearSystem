clear all; close all;

% rotation되는 대상 좌표
x=[3;2;7];

% 순서대로 x1축 CCW 60도 , x2축 CCW 45도 , x3 축 CCW 30도 회전한 후의 좌표 구하기
the = 60; 
phi = 45;
psi=30;

%% x1축을 CCW 60도 하였을 때 

the = the * pi /180;
Rx=[1 0 0 ; 0 cos(the) -sin(the);0 sin(the) cos(the)];

y1 = Rx * x;

f=figure;

plot3(x(1) ,x(2),x(3),'o');grid
hold on;
plot3(y1(1),y1(2),y1(3),'*');

xlabel('x1 axis');ylabel('x2 axis');zlabel('x3 axis')

axis([-10 10 -10 10 -10 10]);
line([0 x(1)], [0 x(2)],[0 x(3)]);
line([0 y1(1)], [0 y1(2)],[0 y1(3)]);

view([0,-90,0])
saveas(f,'rotationx1_x2.jpg');
%% x2 축을 CCW 45도 회전 
phi = phi * pi /180;
Ry=[cos(phi) 0 sin(phi); 0 1 0 ;-sin(phi) 0 cos(phi)];

y2= Ry*y1;

f=figure;

plot3(x(1) ,x(2),x(3),'o');grid
hold on;
plot3(y2(1),y2(2),y2(3),'*');

xlabel('x1 axis');ylabel('x2 axis');zlabel('x3 axis')

axis([-10 10 -10 10 -10 10]);
line([0 x(1)], [0 x(2)],[0 x(3)]);
line([0 y2(1)], [0 y2(2)],[0 y2(3)]);

% view([90,0,0])
% saveas(f,'rotationx2_x1.jpg');
%% x3 축을 CCW 30도 회전 

psi = psi * pi /180;

Rz=[cos(psi) -sin(psi) 0 ; sin(psi) cos(psi) 0;0 0 1];

y3= Rz*y2;
f=figure; 
plot3(x(1),x(2),x(3),'o'); grid
hold on;
plot3(y3(1),y3(2),y3(3),'*');

xlabel('x1 axis');ylabel('x2 axis');zlabel('x3 axis')

axis([-10 10 -10 10 -10 10]);
line([0 x(1)],[0 x(2)],[0 x(3)])
line([0 y3(1)],[0 y3(2)],[0 y3(3)])


view([0,0,90])
saveas(f,'rotationx3_x3.jpg');
