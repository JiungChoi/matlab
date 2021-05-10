clear all
close all
clc

x0 = 3
xs = linspace(-pi, pi, 1000)
ys = 2*sin(xs) - xs

plot (xs, ys)
hold on
grid on


for i=0:1:100
    if i == 0
        x(1) = x0 - (2*sin(x0)-x0)/(2*cos(x0)-1)
    else
        x(i+1) = x(i) - (2*sin(x(i))-x(i))/(2*cos(x(i))-1)
    end
    plot(x(i+1),2*sin(x(i+1)) - x(i+1),'r*')
    pause(1)
end


