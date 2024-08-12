% 차 그리기, 회전변환하기, 회전변환한 차 저장, 

mycar_data=stlread('vw_gti_flowalistik_v2.stl');
mycar_yaw=-270/180*pi;
% 좌회전
for i=270:5:360
    mycar_data_rot=mycar_data;
    mycar_x=mycar_data.vertices(:,1)';
    mycar_y=mycar_data.vertices(:,2)';
    mycar_z=mycar_data.vertices(:,3)';
    mycar=[mycar_x;mycar_y;mycar_z;ones(1,length(mycar_x))];

    mycar_yaw=(i/180)*pi;

R_z=[cos(mycar_yaw) -sin(mycar_yaw) 0 -3*(i-270);
     sin(mycar_yaw) cos(mycar_yaw) 0 (i-270);
     0              0          1 0;
     0              0          0 1];

mycar_rot=R_z*mycar;

mycar_data_rot.vertices = mycar_rot([1:3],:)';

figure(1); clf;
hold on; grid on; axis equal; box on;
patch(mycar_data_rot,'FaceColor','r','EdgeColor','r');
alpha(1)

xlabel('x'); ylabel('y'); zlabel('z');
axis([-1000 1000 -1000 1000 0 50]);
view(0,30);
pause(0.01);
end



