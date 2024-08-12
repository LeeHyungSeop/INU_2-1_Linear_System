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