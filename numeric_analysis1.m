

 clear all
 close all
 clc
 
 %% 대상함수의 그림표현
 xs = linspace( 0,4,100);
 ys = 1/3*(xs.^2+1)
 
 
 plot(xs, ys)
grid 
hold 
plot(xs, xs)

%%해석해의 표현
x1=1.5 + sqrt(5/4);
x2=1.5-sqrt(5/4);

%% 반복법을 통한 수치해석
x0 = 1;

for i = 0:1:5
    if i == 0 
        x(1) = (x0^2+1)/3
    else
        x(i+1)= (x(i)^2+1)/3
    end
    plot(x(i+1),(x(i+1)^2+1)/3,'g*')
    pause(1)
end

