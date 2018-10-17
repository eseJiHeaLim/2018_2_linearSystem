
% rotation�Ǵ� ��� ��ǥ
x=[3;2;7];

% ������� x1�� CCW 60�� , x2�� CCW 45�� , x3 �� CCW 30�� ȸ���� ���� ��ǥ ���ϱ�
the = 60; 
phi = 45;
psi=30;

% x1�� ȸ�� 
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
