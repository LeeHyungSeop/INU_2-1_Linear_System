clc; clear;
close all;

car_data = stlread('vw_gti_flowalistik_v2.stl');
patch(car_data, 'FaceColor', 'r', 'EdgeColor', 'r');
alpha(0.5);

hFigure = figure(2); hFigure.Position = [10 10 1000 600]; % figure의 넘버링과 위치, 크기 설정.
hPanel1 = uipanel(hFigure,'Units','Normalized','Position',[0 2/3 1 1/3],'Title','Driver View'); % Driver View의 위치. 상단 전체.
hPanel2 = uipanel(hFigure,'Units','Normalized','Position',[0 0 1/3 2/3],'Title','Drone view'); % Drone View의 위치. 좌 하단.
hPanel3 = uipanel(hFigure,'Units','Normalized','Position',[1/3 0 1 2/3],'Title','fhj FSD'); % JIsla FSD의 위치. 우 하단.
car_n=8;
for i=0:2
    if i==0
        hAxes1 = axes('Parent',hPanel1);

    elseif i==1
        hAxes2 = axes('Parent',hPanel2);
    else
        hAxes3 = axes('Parent',hPanel3);
    end
    hold on; grid on; axis equal; box on;
    image(im_road);
    xlim([0 3000]); ylim([0 1500]); zlim([0 50]);
    for n=1:car_n
        car_main_p{n+car_n*i}=patch(car_data, 'FaceColor', 'r', 'EdgeColor', 'r');
    end
end
campostion = [0 0 0];
camtarget = [0 0 0];
hAxes1.Projection = "perspective";

last_x = 259;
last_y = 414;

last_x1 = 2500;
last_y1 = 840;

last_x2 = 1318;
last_y2 = 0;

last_x3 = 413.4;
last_y3 = 114.3;

last_x4 = 263.4;
last_y4 = 114.3;

last_x5 = 113.4;
last_y5 = 114.3;

last_x6 = 2300;
last_y6 = 840;



car_data_rot=car_data;

car_x=car_data.vertices(:,1)';
car_y=car_data.vertices(:,2)';
car_z=car_data.vertices(:,3)';

car=[car_x; car_y; car_z; ones(1,length(car_x))];
care1=[car_x; car_y; car_z; ones(1,length(car_x))];
care2=[car_x; car_y; car_z; ones(1,length(car_x))];
care3=[car_x; car_y; car_z; ones(1,length(car_x))];
care4=[car_x; car_y; car_z; ones(1,length(car_x))];
care5=[car_x; car_y; car_z; ones(1,length(car_x))];
care6=[car_x; car_y; car_z; ones(1,length(car_x))];
care7=[car_x; car_y; car_z; ones(1,length(car_x))];
care8=[car_x; car_y; car_z; ones(1,length(car_x))];

car_yaw=-90/180*pi;

R_ccw=[cos(car_yaw) -sin(car_yaw) 0 0;  % 차를 ccw
    sin(car_yaw) cos(car_yaw) 0 0;
    0 0 1 0;
    0 0 0 1];

R_cw=[cos(car_yaw) sin(car_yaw) 0 0;  % 차를 cw
    -sin(car_yaw) cos(car_yaw) 0 0;
    0 0 1 0;
    0 0 0 1];

car_rot=R_ccw * car;

car_rot_e3= R_cw*R_cw*care3;
car_rot_e4= R_cw*R_cw*care4;
car_rot_e5= R_cw*R_cw*care5;

hold on; grid on;  axis equal; box on;



xlabel('x'); ylabel('y'); zlabel('z');
%view([0 0 10]);


alpha(0.5);

care2=R_cw*care2;

for mov = 0:5:5000
    %% ego
    if mov<=235
        R_y=[1 0 0 0;
            0 1 0 mov;
            0 0 1 0;
            0 0 0 1];
        y = R_y*car_rot;
    elseif mov<=235+270
        q=(mov-235)/3;
        R_r1=[cosd(q) sind(q) 0 q*1.72;  % 위,오
            -sind(q) cosd(q) 0 -q*1.019;
            0 0 1 0;
            0 0 0 1];
        y=R_r1*car_rot;
    elseif mov<=235+270+875
        mm=mov-(236+270);
        R_x=[1 0 0 mm;
            0 1 0 0;
            0 0 1 0;
            0 0 0 1];
        y=R_x*car_rot;
    elseif mov<=235+270+875+400
        R_x=[1 0 0 0;
            0 1 0 0;
            0 0 1 0;
            0 0 0 1];
       y=R_x*car_rot;   
    elseif mov<=235+270+875+400+270
        q=(mov-(235+270+875+400))/3;
        R_l1=[cosd(q) -sind(q) 0 q*1.9175;  % 오,위
            sind(q) cosd(q) 0 q*3.3235;
            0 0 1 0;
            0 0 0 1];
        y=R_l1*car_rot;
    elseif mov<=235+270+875+400+270+360
        mm=mov-(235+270+875+400+270);
        R_y1=[1 0 0 0;
            0 1 0 mm;
            0 0 1 0;
            0 0 0 1];
        y=R_y1*car_rot;
    elseif mov<=235+270+875+400+270+360+270
        q=(mov-(236+270+874+400+270+358))/3;
        R_r2=[cosd(q) sind(q) 0 q*1.72;  % 위,오
            -sind(q) cosd(q) 0 -q*1.019;
            0 0 1 0;
            0 0 0 1];
        y=R_r2*car_rot;
    elseif mov<=235+270+875+400+270+355+270+875
        mm=mov-(236+270+874+400+270+358+270);
        R_x3=[1 0 0 mm;
            0 1 0 0;
            0 0 1 0;
            0 0 0 1];
        y=R_x3*car_rot;
    end


    %% e1

    if mov<=1200
        R_s_e1=[1 0 0 -mov;
            0 1 0 0;
            0 0 1 0;
            0 0 0 1];
        ye1 = R_s_e1*care1;
    elseif mov>1200 && mov<=1470
        q_e1=(mov-1200)/3;
        R_s_e1=[cosd(q_e1) -sind(q_e1) 0 -q_e1*1.2;
            sind(q_e1) cosd(q_e1) 0 -q_e1*3;
            0 0 1 0;
            0 0 0 1];
        ye1 = R_s_e1*care1;
    elseif mov>1470
        q_e1=mov-1470;
        R_s_e1=[1 0 0 0;
            0 1 0 -q_e1;
            0 0 1 0;
            0 0 0 1];
        ye1 = R_s_e1*care1;
    end

    %% e2

ds=makehgtform('zrotate',pi);
    R_s_e2=[1 0 0 0;
        0 1 0 -mov;
        0 0 1 0;
        0 0 0 1];
    ye2 = ds*R_s_e2*care2;


    %% e3
    if mov<=875
        R_x_e3=[1 0 0 mov;
            0 1 0 0;
            0 0 1 0;
            0 0 0 1];
        ye3=R_x_e3*car_rot_e3;
    elseif mov<=1145 && mov>875
        q_e3=(mov-875)/3;
        R_l1_e3=[cosd(q_e3) -sind(q_e3) 0 q_e3*1.9175;  % 오,위
            sind(q_e3) cosd(q_e3) 0 q_e3*3.3235;
            0 0 1 0;
            0 0 0 1];
        ye3 = R_l1_e3*car_rot_e3;
    elseif mov>1145
        mm_e3=mov-(875+270);
        R_y_e3=[1 0 0 0;
            0 1 0 mm_e3;
            0 0 1 0;
            0 0 0 1];
        ye3= R_y_e3*car_rot_e3;
    end

    %% e4
    if mov<=1025
        R_x_e4=[1 0 0 mov;
            0 1 0 0;
            0 0 1 0;
            0 0 0 1];
        ye4=R_x_e4*car_rot_e4;
    elseif mov<=1295 && mov>1025
        q_e4=(mov-1025)/3;
        R_l1_e4=[cosd(q_e4) -sind(q_e4) 0 q_e4*1.9175;  % 오,위
            sind(q_e4) cosd(q_e4) 0 q_e4*3.3235;
            0 0 1 0;
            0 0 0 1];
        ye4 = R_l1_e4*car_rot_e4;
    elseif mov>1295
        mm_e4=mov-(1025+270);
        R_y_e4=[1 0 0 0;
            0 1 0 mm_e4;
            0 0 1 0;
            0 0 0 1];
        ye4= R_y_e4*car_rot_e4;
    end

    %% e5
    if mov<=1174
        R_x_e5=[1 0 0 mov;
            0 1 0 0;
            0 0 1 0;
            0 0 0 1];
        ye5=R_x_e5*car_rot_e5;
    elseif mov<=1444 && mov>1174
        q_e5=(mov-1174)/3;
        R_l1_e5=[cosd(q_e5) -sind(q_e5) 0 q_e5*1.9175;  % 오,위
            sind(q_e5) cosd(q_e5) 0 q_e5*3.3235;
            0 0 1 0;
            0 0 0 1];
        ye5 = R_l1_e5*car_rot_e5;
    elseif mov>1444
        mm_e5=mov-(1174+270);
        R_y_e5=[1 0 0 0;
            0 1 0 mm_e5;
            0 0 1 0;
            0 0 0 1];
        ye5= R_y_e5*car_rot_e5;
    end

    %% e6
    if mov<=1000
        R_s_e6=[1 0 0 -mov;
            0 1 0 0;
            0 0 1 0;
            0 0 0 1];
        ye6 = R_s_e6*care6;
    elseif mov>1000 && mov<=1270
        q_e6=(mov-1000)/3;
        R_s_e6=[cosd(q_e6) -sind(q_e6) 0 -q_e6*1.2;
            sind(q_e6) cosd(q_e6) 0 -q_e6*3;
            0 0 1 0;
            0 0 0 1];
        ye6 = R_s_e6*care6;
    elseif mov>1270
        q_e6=mov-1270;
        R_s_e6=[1 0 0 0;
            0 1 0 -q_e6;
            0 0 1 0;
            0 0 0 1];
        ye6 = R_s_e6*care6;
    end

    %% e7

    %% plot

    %plot1
    car_main_p{1}.Vertices(:,1)=y(1,:)+last_x;
    car_main_p{1}.Vertices(:,2)=y(2,:)+last_y;
    car_main_p{1 + car_n * 1}.Vertices = car_main_p{1}.Vertices; %plot2
    car_main_p{1 + car_n * 2}.Vertices = car_main_p{1}.Vertices; %plot3

    car_main_p{2}.Vertices(:,1)=ye1(1,:)+last_x1;
    car_main_p{2}.Vertices(:,2)=ye1(2,:)+last_y1;
    car_main_p{2 + car_n * 1}.Vertices = car_main_p{2}.Vertices;
    car_main_p{2 + car_n * 2}.Vertices = car_main_p{2}.Vertices;


    car_main_p{3}.Vertices(:,1)=ye2(1,:)+last_x2;
    car_main_p{3}.Vertices(:,2)=ye2(2,:)+last_y2;
    car_main_p{3 + car_n * 1}.Vertices = car_main_p{3}.Vertices;
    car_main_p{3 + car_n * 2}.Vertices = car_main_p{3}.Vertices;

    car_main_p{4}.Vertices(:,1)=ye3(1,:)+last_x3;
    car_main_p{4}.Vertices(:,2)=ye3(2,:)+last_y3;
    car_main_p{4 + car_n * 1}.Vertices = car_main_p{4}.Vertices;
    car_main_p{4 + car_n * 2}.Vertices = car_main_p{4}.Vertices;

    car_main_p{5}.Vertices(:,1)=ye4(1,:)+last_x4;
    car_main_p{5}.Vertices(:,2)=ye4(2,:)+last_y4;
    car_main_p{5 + car_n * 1}.Vertices = car_main_p{5}.Vertices;
    car_main_p{5 + car_n * 2}.Vertices = car_main_p{5}.Vertices;

    car_main_p{6}.Vertices(:,1)=ye5(1,:)+last_x5;
    car_main_p{6}.Vertices(:,2)=ye5(2,:)+last_y5;
    car_main_p{6 + car_n * 1}.Vertices = car_main_p{6}.Vertices;
    car_main_p{6 + car_n * 2}.Vertices = car_main_p{6}.Vertices;

    car_main_p{7}.Vertices(:,1)=ye6(1,:)+last_x6;
    car_main_p{7}.Vertices(:,2)=ye6(2,:)+last_y6;
    car_main_p{7 + car_n * 1}.Vertices = car_main_p{7}.Vertices;
    car_main_p{7 + car_n * 2}.Vertices = car_main_p{7}.Vertices;

    pause(0.0000000001);


    %% 차 위치를 누적 저장할 last_x,y

    % ego
    if mov==235
        last_y=last_y+mov;
    elseif mov==235+270
        last_x=last_x+q*1.72;
        last_y=last_y-q*1.019;
        car_rot=R_ccw*car_rot;
    elseif mov==235+270+875
        last_x=last_x+873;
    elseif mov==235+270+875+400+270
        last_x=last_x+q*1.9175;
        last_y=last_y+q*3.3235;
        car_rot=R_cw*car_rot;
    elseif mov==235+270+875+400+270+360
        last_y=last_y+357;
    elseif mov==235+270+875+400+270+360+270
        last_x=last_x+q*1.72;
        last_y=last_y-q*1.019;
        car_rot=R_ccw*car_rot;
    end

    if mov==1200   %e1차
        last_x1=last_x1-mov;
    elseif mov==1470
        last_x1=last_x1-q_e1*1.2;
        last_y1=last_y1-q_e1*3;
        care1=R_cw*care1;
    end

    % e3
    if mov==875
        last_x3=last_x3+mov;
    elseif mov==1145
        car_rot_e3=R_cw*car_rot_e3;
        last_x3=last_x3+q_e3*1.9175;
        last_y3=last_y3+q_e3*3.3235;
    end

    % e4
    if mov==1025
        last_x4=last_x4+mov;
    elseif mov==1295
        car_rot_e4=R_cw*car_rot_e4;
        last_x4=last_x4+q_e4*1.9175;
        last_y4=last_y4+q_e4*3.3235;

    end

    % e5
    if mov==1175
        last_x5=last_x5+mov;
    elseif mov==1445
        car_rot_e5=R_cw*car_rot_e5;
        last_x5=last_x5+q_e5*1.9175;
        last_y5=last_y5+q_e5*3.3235;

    end

    %e6
    if mov==1000   %e1차
        last_x6=last_x6-mov;
    elseif mov==1270
        last_x6=last_x6-q_e6*1.2;
        last_y6=last_y6-q_e6*3;
        care6=R_cw*care6;
    end
    % 보닛
    tempx2 = car_main_p{1 + car_n * 1}.Vertices(439,1);
    tempy2 = car_main_p{1 + car_n * 1}.Vertices(439,2);
    tempz2 = car_main_p{1 + car_n * 1}.Vertices(439,3);
    % 앞유리
    tempx1 = car_main_p{1 + car_n * 1}.Vertices(211,1);
    tempy1 = car_main_p{1 + car_n * 1}.Vertices(211,2);
    tempz1 = car_main_p{1 + car_n * 1}.Vertices(211,3);

    hAxes1.CameraViewAngle=45;
    hAxes2.CameraViewAngle=50;
    hAxes3.CameraViewAngle=50;

    camT = [tempx1 tempy1 tempz1+30]; %  439
    camP = [tempx2 tempy2 tempz2+30]; % 211
    hAxes1.CameraPosition = camP + [0 0 15.3];
    hAxes1.CameraTarget = camT ;
    hAxes2.CameraPosition = camP + [50 50 500];
    hAxes2.CameraTarget = camT;
    hAxes3.CameraPosition = camP + [0 0 2000];
    hAxes3.CameraTarget = camT;

end