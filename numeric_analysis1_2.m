clear all
close all
clc

%% 대상함수의 그림표현
xs=linspace(-10,10,100);
ys=xs.^2-3*xs+1;
plot(xs,ys)
hold on
grid

%% 해석해의 표현 
X1=1.5+sqrt(5/4)
X2=1.5-sqrt(5/4)
plot(X1,0,'r*')
plot(X2,0,'b*')

%% 반복법을 통한 수치해석
x0=1

for i=0:1:10
    if i==0
    x(1)=(x0^2+1)/3
    else
    x(i+1)=(x(i)^2+1)/3        
    end
plot(x(i+1),x(i+1)^2-3*x(i+1)+1,'r*')
pause(1)
end

%% 반복법의 또다른 해를 구하는방법
x0=1

for i=0:1:10
    if i==0
    x(1)=3-1/x0
    else
    x(i+1)=3-1/x(i)    
    end
plot(x(i+1),x(i+1)^2-3*x(i+1)+1,'g*')
pause(1)
end

