clear all
close all
clc

%% [예제 2번] y=exp(x) -x -1


%% h

x1=0;
x2=1;

n=5;
h=(x2-x1)/n;

x0=0;
y0=0;
for i=1:n
    x(1)=x0;
    x(i+1)=x(i)+h;
end

%% standard
Y=exp(x)-x-1;

plot(x,Y,'g','LineWidth',5)
hold on
grid on

%% Euler method

for i=1:n
    y(1)=y0;
    k1=h*(x(i)+y(i));
    y(i+1)=y(i)+k1;
end
plot(x,y)

%% Euler upgrade- v

for i=1:n
    y(1)=y0;
    k1=h*(x(i)+y(i));
    k2=h*((x(i)+h)+(y(i)+k1));
    y(i+1)=y(i)+(k1+k2)/2;
end
plot(x,y)

%% Runge-Kutta method

for i=1:n
    y(1)=y0;
    k1=h*(x(i)+y(i));
    k2=h*((x(i)+h/2)+(y(i)+k1/2));
    k3=h*((x(i)+h/2)+(y(i)+k2/2));
    k4=h*((x(i)+h)+(y(i)+k3));
    y(i+1)=y(i)+(k1+2*k2+2*k3+k4)/6;
end
plot(x,y,'r--')

legend('Standrad','Euler','Euler upgrade- v','Runge-Kutta')