% Tesla FSD 영상

%---------------- 차를 불러온다---------------------
alpha(1); % patch했을 때 차의 투명도 조절해주는 함수
mycar_data=stlread('vw_gti_flowalistik_v2.stl'); % k
car1_data=stlread('vw_gti_flowalistik_v2.stl'); % r
car2_data=stlread('vw_gti_flowalistik_v2.stl'); % #FF5E00
car3_data=stlread('vw_gti_flowalistik_v2.stl'); % y
car4_data=stlread('vw_gti_flowalistik_v2.stl'); % g
car5_data=stlread('vw_gti_flowalistik_v2.stl'); % b
car6_data=stlread('vw_gti_flowalistik_v2.stl'); % #002266
car7_data=stlread('vw_gti_flowalistik_v2.stl'); % #6600FF
car8_data=stlread('vw_gti_flowalistik_v2.stl'); % #D4F4FA
car9_data=stlread('vw_gti_flowalistik_v2.stl'); % #FFB2F5

%---------------------------------------------------
%--------------------차들의 처음 위치 -------------------

mycar_yaw=270/180*pi;
mycar_Rz=[2*cos(mycar_yaw) 2*-sin(mycar_yaw) 0 250;
          2*sin(mycar_yaw) 2*cos(mycar_yaw) 0 -1400;
               0              0             1 0;
               0              0             0 1];
car1_yaw=180/180*pi;
car1_Rz=[2*cos(car1_yaw) 2*-sin(car1_yaw) 0 -600;
          2*sin(car1_yaw) 2*cos(car1_yaw) 0 -250;
               0              0             1 0;
               0              0             0 1];
car2_yaw=180/180*pi;
car2_Rz=[2*cos(car2_yaw) 2*-sin(car2_yaw) 0 -900;
          2*sin(car2_yaw) 2*cos(car2_yaw) 0 -250;
               0              0             1 0;
               0              0             0 1];
car3_yaw=180/180*pi;
car3_Rz=[2*cos(car3_yaw) 2*-sin(car3_yaw) 0 -1200;
          2*sin(car3_yaw) 2*cos(car3_yaw) 0 -250;
               0              0             1 0;
               0              0             0 1];
car4_yaw=360/180*pi;
car4_Rz=[2*cos(car4_yaw) 2*-sin(car4_yaw) 0 800;
          2*sin(car4_yaw) 2*cos(car4_yaw) 0 250;
               0              0             1 0;
               0              0             0 1];
car5_yaw=360/180*pi;
car5_Rz=[2*cos(car5_yaw) 2*-sin(car5_yaw) 0 1100;
          2*sin(car5_yaw) 2*cos(car5_yaw) 0 250;
               0              0             1 0;
               0              0             0 1];
car6_yaw=360/180*pi;
car6_Rz=[2*cos(car6_yaw) 2*-sin(car6_yaw) 0 1400;
          2*sin(car6_yaw) 2*cos(car6_yaw) 0 250;
               0              0             1 0;
               0              0             0 1];
car7_yaw=90/180*pi;
car7_Rz=[2*cos(car7_yaw) 2*-sin(car7_yaw) 0 -250;
          2*sin(car7_yaw) 2*cos(car7_yaw) 0 900;
               0              0             1 0;
               0              0             0 1];
car8_yaw=90/180*pi;
car8_Rz=[2*cos(car8_yaw) 2*-sin(car8_yaw) 0 -250;
          2*sin(car8_yaw) 2*cos(car8_yaw) 0 1200;
               0              0             1 0;
               0              0             0 1];
car9_yaw=90/180*pi;
car9_Rz=[2*cos(car9_yaw) 2*-sin(car9_yaw) 0 -250;
          2*sin(car9_yaw) 2*cos(car9_yaw) 0 1500;
               0              0             1 0;
               0              0             0 1];
%-------------------------------------------------------

% mycar가 (0,-1400)에서 출발하여 (0,-500에서 멈춘다)
% 차 앞뒤 폭이 100인데 2배를 해줘서 200이 되니까
% 이 점을 고려해야 한다
% 그래서 i가 900까지가 아니라 900-200=700 까지
for i=0:8:4000
    clf;
    % ---------------------도로 그리기--------------------
    % 아스팔트 그리기
    set(gca,'color','#4C4C4C'); 
    % 1,2,3,4분면 각각 인도그리기
    patch([-1000 -200 -200 -1000],[200 200 1000 1000],'g','EdgeColor','#BDBDBD','LineWidth',5); % 2사분면
    patch([200 1000 1000 200],[200 200 1000 1000],'g','EdgeColor','#BDBDBD','LineWidth',5); % 1사분면
    patch([-1000 -200 -200 -1000],[-200 -200 -1000 -1000],'g','EdgeColor','#BDBDBD','LineWidth',5); % 3사분면
    patch([200 1000 1000 200],[-200 -200 -1000 -1000],'g','EdgeColor','#BDBDBD','LineWidth',5); % 4사분면
    % 중앙선
    line([0 0],[400 1000],'Color','#FFBB00','LineWidth',3); 
    line([-1000 -400],[0 0],'Color','#FFBB00','LineWidth',3);
    line([0 0],[-400 -1000],'Color','#FFBB00','LineWidth',3); 
    line([1000 400],[0 0],'Color','#FFBB00','LineWidth',3);
    % 횡단보도
    line([-100 -100],[200 350],'Color','w','LineWidth',5); 
    line([0 0],[200 350],'Color','w','LineWidth',5);       
    line([100 100],[200 350],'Color','w','LineWidth',5);
    line([-100 -100],[-200 -350],'Color','w','LineWidth',5); 
    line([0 0],[-200 -350],'Color','w','LineWidth',5);       
    line([100 100],[-200 -350],'Color','w','LineWidth',5);
    line([-350 -200],[100 100],'Color','w','LineWidth',5); 
    line([-350 -200],[0 0],'Color','w','LineWidth',5);
    line([-350 -200],[-100 -100],'Color','w','LineWidth',5); 
    line([350 200],[100 100],'Color','w','LineWidth',5); 
    line([350 200],[0 0],'Color','w','LineWidth',5);
    line([350 200],[-100 -100],'Color','w','LineWidth',5); 
    % ---------------------------------------------------

    % --------------------차들 회전변환--------------------
    % mycar
    if i<1200
        mycar_data_rot=mycar_data;
        mycar_x=mycar_data.vertices(:,1)';
        mycar_y=mycar_data.vertices(:,2)';
        mycar_z=mycar_data.vertices(:,3)';
        mycar=[mycar_x;mycar_y;mycar_z;ones(1,length(mycar_x))];
        mycar_move=[0 0 0 0;0 0 0 i;0 0 0 0;0 0 0 0];
        mycar_rot=(mycar_Rz+mycar_move)*mycar;
        mycar_index=(mycar_Rz+mycar_move);
        mycar_data_rot.vertices = mycar_rot([1:3],:)';
    end

    % car1
    car1_data_rot=car1_data;
    car1_x=car1_data.vertices(:,1)';
    car1_y=car1_data.vertices(:,2)';
    car1_z=car1_data.vertices(:,3)';
    car1=[car1_x;car1_y;car1_z;ones(1,length(car1_x))];
    car1_move=[0 0 0 i;0 0 0 0;0 0 0 0;0 0 0 0];
    car1_rot=(car1_Rz+car1_move)*car1;
    car1_data_rot.vertices = car1_rot([1:3],:)';
    % car2
    car2_data_rot=car2_data;
    car2_x=car2_data.vertices(:,1)';
    car2_y=car2_data.vertices(:,2)';
    car2_z=car2_data.vertices(:,3)';
    car2=[car2_x;car2_y;car2_z;ones(1,length(car2_x))];
    car2_move=[0 0 0 i;0 0 0 0;0 0 0 0;0 0 0 0];
    car2_rot=(car2_Rz+car2_move)*car2;
    car2_data_rot.vertices = car2_rot([1:3],:)';
    % car3
    car3_data_rot=car3_data;
    car3_x=car3_data.vertices(:,1)';
    car3_y=car3_data.vertices(:,2)';
    car3_z=car3_data.vertices(:,3)';
    car3=[car3_x;car3_y;car2_z;ones(1,length(car3_x))];
    car3_move=[0 0 0 i;0 0 0 0;0 0 0 0;0 0 0 0];
    car3_rot=(car3_Rz+car3_move)*car3;
    car3_data_rot.vertices = car3_rot([1:3],:)';
    % car4
    car4_data_rot=car4_data;
    car4_x=car4_data.vertices(:,1)';
    car4_y=car4_data.vertices(:,2)';
    car4_z=car4_data.vertices(:,3)';
    car4=[car4_x;car4_y;car4_z;ones(1,length(car4_x))];
    car4_move=[0 0 0 -i;0 0 0 0;0 0 0 0;0 0 0 0];
    car4_rot=(car4_Rz+car4_move)*car4;
    car4_data_rot.vertices = car4_rot([1:3],:)';
    % car5
    car5_data_rot=car5_data;
    car5_x=car5_data.vertices(:,1)';
    car5_y=car5_data.vertices(:,2)';
    car5_z=car5_data.vertices(:,3)';
    car5=[car5_x;car5_y;car5_z;ones(1,length(car5_x))];
    car5_move=[0 0 0 -i;0 0 0 0;0 0 0 0;0 0 0 0];
    car5_rot=(car5_Rz+car5_move)*car5;
    car5_data_rot.vertices = car5_rot([1:3],:)';
    % car6
    car6_data_rot=car6_data;
    car6_x=car6_data.vertices(:,1)';
    car6_y=car6_data.vertices(:,2)';
    car6_z=car6_data.vertices(:,3)';
    car6=[car6_x;car6_y;car6_z;ones(1,length(car6_x))];
    car6_move=[0 0 0 -i;0 0 0 0;0 0 0 0;0 0 0 0];
    car6_rot=(car6_Rz+car6_move)*car6;
    car6_data_rot.vertices = car6_rot([1:3],:)';
    if i<700
        % car7
        car7_data_rot=car7_data;
        car7_x=car7_data.vertices(:,1)';
        car7_y=car7_data.vertices(:,2)';
        car7_z=car7_data.vertices(:,3)';
        car7=[car7_x;car7_y;car7_z;ones(1,length(car7_x))];
        car7_move=[0 0 0 0;0 0 0 -i;0 0 0 0;0 0 0 0];
        car7_rot=(car7_Rz+car7_move)*car7;
        car7_index=(car7_Rz+car7_move);
        car7_data_rot.vertices = car7_rot([1:3],:)';
        % car8
        car8_data_rot=car8_data;
        car8_x=car8_data.vertices(:,1)';
        car8_y=car8_data.vertices(:,2)';
        car8_z=car8_data.vertices(:,3)';
        car8=[car8_x;car8_y;car8_z;ones(1,length(car8_x))];
        car8_move=[0 0 0 0;0 0 0 -i;0 0 0 0;0 0 0 0];
        car8_rot=(car8_Rz+car8_move)*car8;
        car8_index=(car8_Rz+car8_move);
        car8_data_rot.vertices = car8_rot([1:3],:)';
        % car9
        car9_data_rot=car9_data;
        car9_x=car9_data.vertices(:,1)';
        car9_y=car9_data.vertices(:,2)';
        car9_z=car9_data.vertices(:,3)';
        car9=[car9_x;car9_y;car9_z;ones(1,length(car9_x))];
        car9_move=[0 0 0 0;0 0 0 -i;0 0 0 0;0 0 0 0];
        car9_rot=(car9_Rz+car9_move)*car9;
        car9_index=(car9_Rz+car9_move);
        car9_data_rot.vertices = car9_rot([1:3],:)';
    end
    if i>=2000 && i<=2360
        % car7 우회전
        index=-(2360-i)/4+360; % 270도 ~ 360도로 yaw운동 CW
        car7_data_rot=car7_data;
        car7_x=car7_data.vertices(:,1)';
        car7_y=car7_data.vertices(:,2)';
        car7_z=car7_data.vertices(:,3)';
        car7=[car7_x;car7_y;car7_z;ones(1,length(car7_x))];
        car7_yaw=(index)/180*pi;
        car7_Rz=[2*cos(car7_yaw) 2*sin(car7_yaw) 0 car7_index(1,4)-4;
                 -2*sin(car7_yaw) 2*cos(car7_yaw) 0 car7_index(2,4)+1;
                0              0          1 0;
                0              0          0 1]
        car7_index=car7_Rz;
        car7_rot=(car7_Rz)*car7;
        car7_data_rot.vertices = car7_rot([1:3],:)';
        % car8 우회전 전 직진
        car8_data_rot=car8_data;
        car8_x=car8_data.vertices(:,1)';
        car8_y=car8_data.vertices(:,2)';
        car8_z=car8_data.vertices(:,3)';
        car8=[car8_x;car8_y;car8_z;ones(1,length(car8_x))];
        car8_move=[0 0 0 0;0 0 0 -i+1300;0 0 0 0;0 0 0 0];
        car8_rot=(car8_Rz+car8_move)*car8;
        car8_index=car8_Rz+car8_move;
        car8_data_rot.vertices = car8_rot([1:3],:)';
        % car9 우회전 전 직진 전 직진
        car9_data_rot=car9_data;
        car9_x=car9_data.vertices(:,1)';
        car9_y=car9_data.vertices(:,2)';
        car9_z=car9_data.vertices(:,3)';
        car9=[car9_x;car9_y;car9_z;ones(1,length(car9_x))];
        car9_move=[0 0 0 0;0 0 0 -i+1300;0 0 0 0;0 0 0 0];
        car9_rot=(car9_Rz+car9_move)*car9;
        car9_index=(car9_Rz+car9_move);
        car9_data_rot.vertices = car9_rot([1:3],:)';
    elseif i>2360 && i<=2720
        % car7 우회전 후 직진
        car7_data_rot=car7_data;
        car7_x=car7_data.vertices(:,1)';
        car7_y=car7_data.vertices(:,2)';
        car7_z=car7_data.vertices(:,3)';
        car7=[car7_x;car7_y;car7_z;ones(1,length(car7_x))];
        car7_Rz=[2*cos(car7_yaw) 2*-sin(car7_yaw) 0 car7_index(1,4)-(i-2360);
                2*sin(car7_yaw) 2*cos(car7_yaw) 0 car7_index(2,4);
                0              0          1 0;
                0              0          0 1];
        car7_rot=(car7_Rz)*car7;
        car7_data_rot.vertices = car7_rot([1:3],:)';
        % car8 우회전
        index=-(2720-i)/4+360; % 270도 ~ 360도로 yaw운동
        car8_data_rot=car8_data;
        car8_x=car8_data.vertices(:,1)';
        car8_y=car8_data.vertices(:,2)';
        car8_z=car8_data.vertices(:,3)';
        car8=[car8_x;car8_y;car8_z;ones(1,length(car8_x))];
        car8_yaw=(index)/180*pi;
        car8_Rz=[2*cos(car8_yaw) 2*sin(car8_yaw) 0 car8_index(1,4)-6;
                -2*sin(car8_yaw) 2*cos(car8_yaw) 0 car8_index(2,4)+2;
                0              0          1 0;
                0              0          0 1];
        car8_index=car8_Rz;
        car8_rot=(car8_Rz)*car8;
        car8_data_rot.vertices = car8_rot([1:3],:)';
        % car9 우회전 전 직진
        car9_data_rot=car9_data;
        car9_x=car9_data.vertices(:,1)';
        car9_y=car9_data.vertices(:,2)';
        car9_z=car9_data.vertices(:,3)';
        car9=[car9_x;car9_y;car9_z;ones(1,length(car9_x))];
        car9_move=[0 0 0 0;0 0 0 -i+1300;0 0 0 0;0 0 0 0];
        car9_rot=(car9_Rz+car9_move)*car9;
        car9_index=(car9_Rz+car9_move);
        car9_data_rot.vertices = car9_rot([1:3],:)';
    elseif i>2720 && i<=3080    
        % car7 이제 쭉 직진
        car7_data_rot=car7_data;
        car7_x=car7_data.vertices(:,1)';
        car7_y=car7_data.vertices(:,2)';
        car7_z=car7_data.vertices(:,3)';
        car7=[car7_x;car7_y;car7_z;ones(1,length(car7_x))];
        car7_Rz=[2*cos(car7_yaw) 2*-sin(car7_yaw) 0 car7_index(1,4)-(i-2360);
                2*sin(car7_yaw) 2*cos(car7_yaw) 0 car7_index(2,4);
                0              0          1 0;
                0              0          0 1];
        car7_rot=(car7_Rz)*car7;
        car7_data_rot.vertices = car7_rot([1:3],:)';
        % car8 우회전 후 직진
        car8_data_rot=car8_data;
        car8_x=car8_data.vertices(:,1)';
        car8_y=car8_data.vertices(:,2)';
        car8_z=car8_data.vertices(:,3)';
        car8=[car8_x;car8_y;car8_z;ones(1,length(car8_x))];
        car8_Rz=[2*cos(car8_yaw) 2*-sin(car8_yaw) 0 car8_index(1,4)-(i-2720);
                2*sin(car8_yaw) 2*cos(car8_yaw) 0 car8_index(2,4);
                0              0          1 0;
                0              0          0 1];
        car8_rot=(car8_Rz)*car8;
        car8_data_rot.vertices = car8_rot([1:3],:)';
        % car9 우회전
        index=-(3080-i)/4+360; % 270도 ~ 360도로 yaw운동 cW
        car9_data_rot=car9_data;
        car9_x=car9_data.vertices(:,1)';
        car9_y=car9_data.vertices(:,2)';
        car9_z=car9_data.vertices(:,3)';
        car9=[car9_x;car9_y;car9_z;ones(1,length(car9_x))];
        car9_yaw=(index)/180*pi;
        car9_Rz=[2*cos(car9_yaw) 2*sin(car9_yaw) 0 car9_index(1,4)-7;
                 -2*sin(car9_yaw) 2*cos(car9_yaw) 0 car9_index(2,4)+3;
                0              0          1 0;
                0              0          0 1];
        car9_index=car9_Rz;
        car9_rot=(car9_Rz)*car9;
        car9_data_rot.vertices = car9_rot([1:3],:)';
        if i>=2720 && i<=3080
        % 검은차 좌회전
        index=(i-2720)/4+270; % 270도 ~ 360도로 yaw운동
        mycar_data_rot=mycar_data;
        mycar_x=mycar_data.vertices(:,1)';
        mycar_y=mycar_data.vertices(:,2)';
        mycar_z=mycar_data.vertices(:,3)';
        mycar=[mycar_x;mycar_y;mycar_z;ones(1,length(mycar_x))];
        mycar_yaw=(index)/180*pi;
        mycar_Rz=[2*cos(mycar_yaw) 2*-sin(mycar_yaw) 0 mycar_index(1,4)-12;
                2*sin(mycar_yaw) 2*cos(mycar_yaw) 0 mycar_index(2,4)+10;
                0              0          1 0;
                0              0          0 1];
        mycar_index=mycar_Rz;
        mycar_rot=(mycar_Rz)*mycar;
        mycar_data_rot.vertices = mycar_rot([1:3],:)';
        end
    elseif i>=3080
        % 모두 직진
         % car7
        car7_data_rot=car7_data;
        car7_x=car7_data.vertices(:,1)';
        car7_y=car7_data.vertices(:,2)';
        car7_z=car7_data.vertices(:,3)';
        car7=[car7_x;car7_y;car7_z;ones(1,length(car7_x))];
        car7_Rz=[2*cos(car7_yaw) 2*-sin(car7_yaw) 0 car7_index(1,4)-(i-2360);
                2*sin(car7_yaw) 2*cos(car7_yaw) 0 car7_index(2,4);
                0              0          1 0;
                0              0          0 1];
        car7_rot=(car7_Rz)*car7;
        car7_data_rot.vertices = car7_rot([1:3],:)';
        % car8 이제 쭉 직진
        car8_data_rot=car8_data;
        car8_x=car8_data.vertices(:,1)';
        car8_y=car8_data.vertices(:,2)';
        car8_z=car8_data.vertices(:,3)';
        car8=[car8_x;car8_y;car8_z;ones(1,length(car8_x))];
        car8_Rz=[2*cos(car8_yaw) 2*-sin(car8_yaw) 0 car8_index(1,4)-(i-2720);
                2*sin(car8_yaw) 2*cos(car8_yaw) 0 car8_index(2,4);
                0              0          1 0;
                0              0          0 1];
        car8_rot=(car8_Rz)*car8;
        car8_data_rot.vertices = car8_rot([1:3],:)';
        % car9 우회전 후 직진
        car9_data_rot=car9_data;
        car9_x=car9_data.vertices(:,1)';
        car9_y=car9_data.vertices(:,2)';
        car9_z=car9_data.vertices(:,3)';
        car9=[car9_x;car9_y;car9_z;ones(1,length(car9_x))];
        car9_Rz=[2*cos(car9_yaw) 2*-sin(car9_yaw) 0 car9_index(1,4)-(i-3080);
                2*sin(car9_yaw) 2*cos(car9_yaw) 0 car9_index(2,4);
                0              0          1 0;
                0              0          0 1];
        car9_rot=(car9_Rz)*car9;
        car9_data_rot.vertices = car9_rot([1:3],:)';
        % mycar 좌회전 후 직진
        mycar_data_rot=mycar_data;
        mycar_x=mycar_data.vertices(:,1)';
        mycar_y=mycar_data.vertices(:,2)';
        mycar_z=mycar_data.vertices(:,3)';
        mycar=[mycar_x;mycar_y;mycar_z;ones(1,length(mycar_x))];
        mycar_Rz=[2*cos(mycar_yaw) 2*-sin(mycar_yaw) 0 mycar_index(1,4)-(i-3080);
                2*sin(mycar_yaw) 2*cos(mycar_yaw) 0 mycar_index(2,4);
                0              0          1 0;
                0              0          0 1];
        mycar_rot=(mycar_Rz)*mycar;
        mycar_data_rot.vertices = mycar_rot([1:3],:)';
    end
    
    %-----------------회전 변환된 차 그리기----------------
    
    patch(mycar_data_rot,'FaceColor','k','EdgeColor','k'); % 검은색
    patch(car1_data_rot,'FaceColor','r','EdgeColor','r'); % 빨간색
    patch(car2_data_rot,'FaceColor','#FF5E00','EdgeColor','#FF5E00'); % 주황색
    patch(car3_data_rot,'FaceColor','y','EdgeColor','y'); % 노란색
    patch(car4_data_rot,'FaceColor','g','EdgeColor','g'); % 초록색
    patch(car5_data_rot,'FaceColor','b','EdgeColor','b'); % 파란색
    patch(car6_data_rot,'FaceColor','#002266','EdgeColor','#002266'); % 남색
    patch(car7_data_rot,'FaceColor','#6600FF','EdgeColor','#6600FF'); % 보라색
    patch(car8_data_rot,'FaceColor','#D4F4FA','EdgeColor','#D4F4FA'); % 하늘색
    patch(car9_data_rot,'FaceColor','#FFB2F5','EdgeColor','#FFB2F5'); % 분홍색
    %------------------그래프 설정---------------
    if i<=1200 % 검은차가 사거리 직전까지 직진하는 구간
    axis([-400 600 -1800+i -800+i 0 300]);
    view(0,90); 
    elseif i>1200 && i<2920 % 검은차가 신호를 기다리는 구간
        axis([-400 600 -600 400 0 300]);
        view(0,90); 
    elseif i>=2920 % 검은차가 좌회전을 하는 구간
        axis([-400-(i-2920) 800 -600 400 0 300]);
        if i<=3280
        view((i-2920)/4,90); % 360을 갈 동안 0~90도로 뷰포인트를 바꿔야 하기 때문에
        axis([-300 500 -300 500 0 300]);
        end
        if i>3280 % 좌회전 끝내고 직진하는 구간
            view(90,90);
            axis([-600-(i-3100) 200-(i-3100) -300 500 0 300]);
        end
    end
    pause(0.000001);hold on;
end
%------------------------------------------------------------
