clc;
clear;
x=[0 1 1 4 7 7 8 8 7 4 1 0 0;
   0 0 6 0 6 0 0 8 8 2 8 8 0;
   1 1 1 1 1 1 1 1 1 1 1 1 1];
% plot3(x(1,:),x(2,:),x(3,:))
figure(1);line(x(1,:),x(2,:),'Marker','o')
axis([0 14 0 11])

%% "M" x_1축으로 대칭하기

A1=[1 0 0 ; 0 -1 0 ; 0 0 1]

y=A1*x;
grid on;
figure(2);line(x(1,:),x(2,:))
line(y(1,:),y(2,:))
axis([-10 10 -10 10])

%% "M" x_2축으로 대칭하기

A2=[-1 0 0 ; 0 1 0 ; 0 0 1]
x=[0 1 1 4 7 7 8 8 7 4 1 0 0;
   0 0 6 0 6 0 0 8 8 2 8 8 0;
   1 1 1 1 1 1 1 1 1 1 1 1 1];
y=A2*x;
grid on;
figure(3);
line(x(1,:),x(2,:))
line(y(1,:),y(2,:))
axis([-10 10 -10 10])
%% "M" 원점으로 대칭하기

A3=[-1 0 0 ; 0 -1 0 ; 0 0 1]
x=[0 1 1 4 7 7 8 8 7 4 1 0 0;
   0 0 6 0 6 0 0 8 8 2 8 8 0;
   1 1 1 1 1 1 1 1 1 1 1 1 1];
y=A3*x;

figure(4);
grid on;
line(x(1,:),x(2,:))
line(y(1,:),y(2,:))
axis([-10 10 -10 10])

%% "M" x_1=x_2 축으로 대칭하기

A4=[0 1 0 ; 1 0 0 ; 0 0 1]
x=[0 1 1 4 7 7 8 8 7 4 1 0 0;
   0 0 6 0 6 0 0 8 8 2 8 8 0;
   1 1 1 1 1 1 1 1 1 1 1 1 1];
y=A4*x;

figure(5);
grid on;
line(x(1,:),x(2,:))
line(y(1,:),y(2,:))

axis([-10 10 -10 10])

%% "M"기울림체로 그리기

A5=[1 0.6 0 ; 0 1 0 ; 0 0 1]

y=A5*x;

figure(6);
grid on;

line(y(1,:),y(2,:))

axis([0 14 0 11])

%% "M" 이동하여 그리기

B=[1 0 2 ; 0 1 3 ; 0 0 1]

y=B*x;

figure(7);
grid on;

line(y(1,:),y(2,:))

axis([0 14 0 11])

%% "M" 이동+ 기울림체로 그리기
A5=[1 0.5 0 ; 0 1 0 ; 0 0 1]
B=[1 0 2 ; 0 1 3 ; 0 0 1]

w=A5*B*x;

figure(7);
grid on;

line(w(1,:),w(2,:))

axis([0 14 0 11])

%% "M" 확대 + 축소하여 그리기
k1= 0.3; k2=1.3;
C=[k1 0 0 ; 0 k1 0 ; 0 0 1];
D=[k2 0 0 ; 0 k2 0 ; 0 0 1]

v=C*x;

figure(8);
grid on;

line(v(1,:),v(2,:))

axis([0 14 0 11])

hold on;
u=D*x;
line(u(1,:),u(2,:));
%원본 m자 그리기
line(x(1,:),x(2,:),'Marker','o')
axis([0 14 0 11])

%% motion
figure;
for h=0.1:0.01:3
    E=[h 0 0 ; 0 h 0 ; 0 0 1];
    t=E*x;
    clf;
    axis([0 30 0 30]);
    line(t(1,:),t(2,:));
    pause(0.001)
end
for h=3:-0.01:3.1
    E=[h 0 0 ; 0 h 0 ; 0 0 1];
    t=E*x;
    clf;
    axis([0 30 0 30]);
    line(t(1,:),t(2,:));
    pause(0.001)
end

%% motion : rotation
figure ;
for s = 0 :0.05:360
    th=s*pi/180;
    F=[cos(th) sin(th) 0; -sin(th) cos(th) 0; 0 0 1];
    r=F*x;
    clf;axis([-20 20 -20 20]);
    line(r(1,:),r(2,:));pause(0.00001);
end

for s = 0 :-0.05:-360
    th=s*pi/180;
    F=[cos(th) sin(th) 0; -sin(th) cos(th) 0; 0 0 1];
    r=F*x;
    clf;axis([-20 20 -20 20]);
    line(r(1,:),r(2,:));pause(0.00001);
end