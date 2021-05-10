clear all
close all
clc

%% [예제 3] 

x0 = 3;
c = 2;
xs = linspace(-4,4,1000);
ys1 = xs.^2 - c;

figure(1)
plot(xs, ys1);
hold on
grid on


for i = 0:1:10
    if i == 0 
        x(1) = x0 - ((x0.^2 - c)/(2*x0));
    else
        x(i+1) = x(i) - ((x(i)^2 - c)/(2*x(i)));
    end
    plot(x(i+1),(x(i+1)^2 - c),'*r');
    pause(0.3)
end
hold off

%% [예제 5] 

ys2 = xs.^3 + xs -1;

figure(2)
plot(xs, ys2);
hold on
grid on

for i = 0:1:10
    if i == 0
        x(1) = x0 - ((x0.^3 +x0 -1)/(3*(x0.^2) +1));
    else
        x(i+1) = x(i) - ((x(i).^3 +x(i) -1)/(3*(x(i).^2) +1));
    end
    plot(x(i+1), x(i+1).^3 + x(i+1) -1 ,'*r');
    pause(0.3)
end


