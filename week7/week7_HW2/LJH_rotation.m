%% data
% 이름 좌표값 입력
x1=[1 3 3 7 7 1 1];
y1=[11 11 4 4 2 2 11];
L=[x1;y1;zeros(1,length(x1))]

% J부분에 맞는 곡선을 찾는다
x2_curve1_x= [14 :-0.1:8];
x2_curve1_y=-0.06667*x2_curve1_x.^3+2.433*x2_curve1_x.^2-28.9*x2_curve1_x+113.6;

x2_curve2_x= [ 9 :0.1:12];
x2_curve2_y= 0.5*x2_curve2_x.^2 + -10.5*x2_curve2_x + 58;

x2=[8 17 17 14 x2_curve1_x x2_curve2_x 12 8 8]
y2=[11 11 9 9 x2_curve1_y x2_curve2_y 9 9 11];
J=[x2;y2;zeros(1,length(x2))]

x3=[18 20 20 23 23 25 25 23 23 20 20 18 18];
y3=[11 11 8 8 11 11 2 2 6 6 2 2 11];
H=[x3;y3;zeros(1,length(x3))]

patch(L(1,:),L(2,:),'y')
axis([-30 40 -30 40])
hold on;
patch(J(1,:),J(2,:),'r')
patch(H(1,:),H(2,:),'b')


%% 선형 변환
video_OBJ=VideoWriter('LJH_rotation.avi');
open(video_OBJ);
figure(1);
for k=1:3      % 3회 반복하는 영상
    s=0;
    h=2.6;
    while(1)
        s=s+1;
        th=s*pi/180;
        if th>3.15
            while(1)
                s=s-1;
                th=s*pi/180;
                if th<0
                    break
                end
                h=h+0.007;
                E=[h 0 0 ; 0 h 0 ; 0 0 1];
                F=[cos(th) sin(th) 0; -sin(th) cos(th) 0;0 0 1];
                r_L=E*F*L;
                r_J=E*F*J;
                r_H=E*F*H;
                clf;axis([-80 80 -80 80])
                box on; hold on;
                patch(r_L(1,:),r_L(2,:),'y')
                patch(r_J(1,:),r_J(2,:),'r')
                patch(r_H(1,:),r_H(2,:),'b')
                text(20,65,'201701751 임지혜')
                saveas(gcf,'test.jpg')
                writeVideo(video_OBJ ,imread('test.jpg'));
                pause(0.0000001)
            end
            break
        end
        h=h-0.007;
        E=[h 0 0 ; 0 h 0 ; 0 0 1];   % 크기 변경하는 마법 행렬
        F=[cos(th) -sin(th) 0; sin(th) cos(th) 0;0 0 1];     %회전해주는 마법 행렬
        r_L=E*F*L;
        r_J=E*F*J;
        r_H=E*F*H;
        clf;axis([-80 80 -80 80])
        box on; hold on;
        patch(r_L(1,:),r_L(2,:),'y')
        patch(r_J(1,:),r_J(2,:),'r')
        patch(r_H(1,:),r_H(2,:),'b')
        text(20,65,'201701751 임지혜')
        saveas(gcf,'test.jpg')
        writeVideo(video_OBJ ,imread('test.jpg'));
        pause(0.0000001)
    end
end

close(video_OBJ);

