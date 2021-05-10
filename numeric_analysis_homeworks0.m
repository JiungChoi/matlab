clear all
close all
clc

%% [예제 2]  1번 해 : x^3 +x -1 ==>> x = g(x) = 1/(x^2 + 1)

x0 = 1;

xs = linspace(-2, 2, 1000);
ys = 1 ./ (xs.^2 +1);

plot(xs, ys)
hold on
grid on
plot(xs, xs)

for i= 0:1:100
    if i == 0
        x(1) = 1/(x0^2 +1);
    else        
        x(i+1) = 1/(x(i)^2 +1);
    end
    plot(x(i+1), 1/(x(i+1)^2 +1),'o')
    pause(0.3)
end
