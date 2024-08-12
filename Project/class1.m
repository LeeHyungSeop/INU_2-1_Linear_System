% 차를 불러온다
clear all; clc;

car_data=stlread('vw_gti_flowalistik_v2.stl');

figure(2); clf;
hold on; grid on; axis equal; box on;
patch(car_data,'FaceColor','b','EdgeColor','b'); 
% EdgeColor  stl 파일에서 wireframe 
alpha(0.5); % patch했을 때 차의 투명도 조절해주는 함수
xlabel('x'); ylabel('y'); zlabel('z');
view([-60 -60 30]);