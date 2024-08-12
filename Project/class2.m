% 차 그리기, 회전변환하기, 회전변환한 차 저장, 
clear all; clc;
hold on; axis equal;
hold on; axis equal;

mycar_data=stlread('vw_gti_flowalistik_v2.stl');

mycar_data_rot=mycar_data;

mycar_x=mycar_data.vertices(:,1)';
mycar_y=mycar_data.vertices(:,2)';
mycar_z=mycar_data.vertices(:,3)';

mycar=[mycar_x;mycar_y;mycar_z;ones(1,length(mycar_x))];

mycar_yaw=270/180*pi;

R_z=[cos(mycar_yaw) sin(mycar_yaw) 0 50;
     -sin(mycar_yaw) cos(mycar_yaw) 0 50;
     0              0          1 0;
     0              0          0 1];

mycar_rot=R_z*mycar;
mycar_data_rot.vertices = mycar_rot([1:3],:)';
hold on; axis equal;

figure(1); clf; grid on;
xlabel('x'); ylabel('y'); zlabel('z');
hold on; axis equal;
patch(mycar_data,'FaceColor','b','EdgeColor','b');
patch(mycar_data_rot,'FaceColor','r','EdgeColor','r');
view([-60 -60 30])
alpha(0.5);
%camva(100);

