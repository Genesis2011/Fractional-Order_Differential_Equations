%����ķ����׷�����ʽΪ��Dy(t)=2y(t-2)/(1+y(t-2)^9.65)-y(t);
%x(t)=phi(t),t\in[-tau,0]
%Example 4.1
clear all
clc
close all

h=0.01; %����
N=5000; %��0��ʼ��ʱ���ĸ�����0֮ǰ����k����-k,-k+1....-1 0,�ܵĸ�����N+1+k��
q1=0.97; %the order of modified logistic model
tau=2; %time delay
Ndelay=tau/h;  %Ҳ���� k�� ��Ҫ�������ʱ��ĸ���

x1(Ndelay+N+1)=[0];%��¼Ԥ����y^p(t)��ֵ

x(Ndelay+N+1)=[0];%��¼y(t)�Ľ���ֵ

for i=1:Ndelay
   x(i)=0.5;  %��ʱ���ʼֵ y(t)=phi(t)
end

x0=x(Ndelay); %t0ʱ�̵�ֵ����Ӧ�㷨�е�g(0)������ֵ

%��Ӧ�㷨��ʽ�е�n=0�����,t1ʱ�̵�y�Ľ���ֵ(��������j=0,n=0ʱ�Ľ��)
x1(Ndelay+1)=x0+h^q1*(2*x(1)/(1+x(1)^9.65)-x0)/(gamma(q1)*q1); %��ֵt1ʱ��Ԥ����yp�Ľ���ֵ��j=0,n=0ʱ

x(Ndelay+1)=x0+h^q1*(2*x(2)/(1+x(2)^9.65)-x1(Ndelay+1)+q1*(2*x(1)/(1+x(1)^9.65)-x0))/gamma(q1+2);  %y(t)�Ľ���ֵ

for n=1:N 
    M1=(n^(q1+1)-(n-q1)*(n+1)^q1)*(2*x(1)/(1+x(1)^9.65)-x0);%����ֵy������j=0ʱ������
    
    N1=((n+1)^q1-n^q1)*(2*x(1)/(1+x(1)^9.65)-x0); %Ԥ����yp�е������,������ǰ���h^q1/h��,j=0ʱ������
    for j=1:n    %���������������Ͳ��֣�j��1��ʼ��1<=j<=nʱ������
        M1=M1+((n-j+2)^(q1+1)+(n-j)^(q1+1)-2*(n-j+1)^(q1+1))*(2*x(j)/(1+x(j)^9.65)-x(Ndelay+j));
        
        N1=N1+((n-j+1)^q1-(n-j)^q1)*(2*x(j)/(1+x(j)^9.65)-x(Ndelay+j));  
    end
    %�ֱ����Ԥ�����ͽ���ֵ�Ľ����
    x1(Ndelay+n+1)=x0+h^q1*N1/(gamma(q1)*q1);  %Ԥ�����Ľ��
    
    x(Ndelay+n+1)=x0+h^q1*(2*x(j+1)/(1+x(j+1)^9.65)-x1(Ndelay+n+1)+M1)/gamma(q1+2);%����ֵy�Ľ��
end

xresult(N-Ndelay+1)=[0]; %��¼x(t)
yresult(N-Ndelay+1)=[0]; %��¼x(t-tau)

for n=2*Ndelay+1:N+Ndelay+1  
   xresult(n-2*Ndelay)=x(n); %����Ľ���ֵxresult�Ǵ�1��N-Ndelay+1
   yresult(n-2*Ndelay)=x(n-Ndelay);%�����yresult�Ǵ�Ndelay+1��N+1�ܹ�Ҳ��N-delay+1����
end

plot(xresult(500:end),yresult(500:end)) %ֻȡ��һ���ֽ��
axis square
xlabel('x(t)')
ylabel('x(t-0.5)')