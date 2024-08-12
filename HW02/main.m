A=[0.7 0.1 0;0.2 0.9 0.2;0.1 0 0.8];
CIR=[25;20;55];
CIR_2004_index=CIR;
x=2004:5:2019;
y=zeros(1,length(x));

for i=1 : 3 % 년도별 C, I, R값을 구하기 위해 3번
    for j=1:length(x)
        y(j)=CIR(i);
        CIR=A*CIR;
    end
    CIR=CIR_2004_index;
    if i==1
        plot(x,y,'k-o','markerfacecolor','black'); hold on;
    elseif i==2
        plot(x,y,'r--o');
    else
        plot(x,y,'b-.^'); 
    end
end
legend('C','I','R');
axis([x(1) x(length(x)) 0 100]); hold off;