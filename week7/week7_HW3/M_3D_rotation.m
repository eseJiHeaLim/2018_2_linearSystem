% x3=[0 1 1 4 7 7 8 8 7 4 1 0 0 0 1 1 4 7 7 8 8 7 4 1 0 0 ;
%     0 0 6 0 6 0 0 8 8 2 8 8 0 0 0 6 0 6 0 0 8 8 2 8 8 0;
%     0 0 0 0 0 0 0 0 0 0 0 0 0 1 1 1 1 1 1 1 1 1 1 1 1 1 ;
%     1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 ];
% 
% x_s=[0 0 0 0 0 ; 0 0 8 8 0;0 1 1 0 0]

% plot3(x3(1,:),x3(2,:),x3(3,:));
hold on;



back_v=[4 4 1 1 4 4 7 7 4;
    2 2 8 8 2 2 8 8 2;
    0 1 1 0 0 1 1 0 0]

front_v=[1 1 4  7 7 4 1;
    6 6 0  6 6 0 6;
    0 1 1  1 0 0 0]

back_r=[0 1 1 0 ;
    8 8 8 8 ;
    0 0 1 1 ];

back_l=[7  8 8 7 7;
    8 8 8 8 8;
    0 0 1 1 0];

front_l=[0 1 1 0  ;
    0 0 0 0 ;
    0 0 1 1 ];

front_r=[7 8 8 7 7;
    0 0 0 0 0;
    0 0 1 1 0];
insider_l=[1 1 1 1 1;
    0 6 6 0 0;
    0 0 1 1 0]
insider_r=[7 7 7 7 7 ;
    0 0 6 6 0;
    0 1 1 0 0];
side_l=[0 0 0 0 ;
    0 0 8 8 ;
    0 1 1 0 ]
side_r=[8 8 8 8 ;
        0 0 8 8 ;
        0 1 1 0 ]
    
 side=[front_l side_l back_l back_v back_r side_r front_r insider_r front_v insider_l side_r ]
plot3(side(1,:),side(2,:),side(3,:),'k');
%     plot3(front_v(1,:),front_v(2,:),front_v(3,:));
%     plot3(back_l(1,:),back_l(2,:),back_l(3,:));
%     plot3(back_r(1,:),back_r(2,:),back_r(3,:));
%     plot3(front_l(1,:),front_l(2,:),front_l(3,:));
%     plot3(front_r(1,:),front_r(2,:),front_r(3,:));
%     plot3(insider_l(1,:),insider_l(2,:),insider_l(3,:));
%     plot3(insider_r(1,:),insider_r(2,:),insider_r(3,:));
%     plot3(side_l(1,:),side_l(2,:),side_l(3,:));
%     plot3(side_r(1,:),side_r(2,:),side_r(3,:));
    axis([-40 40 -40 40 -40 40]);
    