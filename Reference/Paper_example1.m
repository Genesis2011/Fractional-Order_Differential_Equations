%仿真的分数阶方程形式为：Dy(t)=2y(t-2)/(1+y(t-2)^9.65)-y(t);
%x(t)=phi(t),t\in[-tau,0]
%Example 4.1
clear all
clc
close all

h=0.01; %步长
N=5000; %从0开始的时间点的个数，0之前还有k个，-k,-k+1....-1 0,总的个数是N+1+k个
q1=0.97; %the order of modified logistic model
tau=2; %time delay
Ndelay=tau/h;  %也就是 k个 需要计算的延时项的个数

x1(Ndelay+N+1)=[0];%记录预测器y^p(t)的值

x(Ndelay+N+1)=[0];%记录y(t)的近似值

for i=1:Ndelay
   x(i)=0.5;  %延时项赋初始值 y(t)=phi(t)
end

x0=x(Ndelay); %t0时刻的值，对应算法中的g(0)，即初值

%对应算法公式中的n=0的情况,t1时刻的y的近似值(单独计算j=0,n=0时的结果)
x1(Ndelay+1)=x0+h^q1*(2*x(1)/(1+x(1)^9.65)-x0)/(gamma(q1)*q1); %初值t1时刻预测器yp的近似值，j=0,n=0时

x(Ndelay+1)=x0+h^q1*(2*x(2)/(1+x(2)^9.65)-x1(Ndelay+1)+q1*(2*x(1)/(1+x(1)^9.65)-x0))/gamma(q1+2);  %y(t)的近似值

for n=1:N 
    M1=(n^(q1+1)-(n-q1)*(n+1)^q1)*(2*x(1)/(1+x(1)^9.65)-x0);%近似值y的求和项，j=0时的情形
    
    N1=((n+1)^q1-n^q1)*(2*x(1)/(1+x(1)^9.65)-x0); %预测器yp中的求和项,不包含前面的h^q1/h项,j=0时的情形
    for j=1:n    %计算卷积和项，两个求和部分，j从1开始，1<=j<=n时的情形
        M1=M1+((n-j+2)^(q1+1)+(n-j)^(q1+1)-2*(n-j+1)^(q1+1))*(2*x(j)/(1+x(j)^9.65)-x(Ndelay+j));
        
        N1=N1+((n-j+1)^q1-(n-j)^q1)*(2*x(j)/(1+x(j)^9.65)-x(Ndelay+j));  
    end
    %分别计算预测器和近似值的结果，
    x1(Ndelay+n+1)=x0+h^q1*N1/(gamma(q1)*q1);  %预测器的结果
    
    x(Ndelay+n+1)=x0+h^q1*(2*x(j+1)/(1+x(j+1)^9.65)-x1(Ndelay+n+1)+M1)/gamma(q1+2);%近似值y的结果
end

xresult(N-Ndelay+1)=[0]; %记录x(t)
yresult(N-Ndelay+1)=[0]; %记录x(t-tau)

for n=2*Ndelay+1:N+Ndelay+1  
   xresult(n-2*Ndelay)=x(n); %计算的近似值xresult是从1到N-Ndelay+1
   yresult(n-2*Ndelay)=x(n-Ndelay);%计算的yresult是从Ndelay+1到N+1总共也是N-delay+1个，
end

plot(xresult(500:end),yresult(500:end)) %只取了一部分结果
axis square
xlabel('x(t)')
ylabel('x(t-0.5)')