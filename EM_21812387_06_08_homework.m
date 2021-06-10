clear all
close all
clc
%% Standard (yr =  2*exp(-0.5*t(i)) + exp(-1.5*t(i)))

dh = 0.1;
t = [0:dh:1];
L = length(t);
t(1) = 0;
y(1) = 3;
dy(1) = -2.5;

y_origin = 2*exp(-0.5*t) + exp(-1.5*t)

%% Euler method
%ddy = -2*dy  -0.75*y 
dy1(1) = dy(1);
y1(1) = y(1);
for i = 1:1:L-1
    ddy1(i) = -2*dy1(i) -0.75*y1(i);
    dy1(i+1) = dy1(i) + dh*(ddy1(i));
    y1(i+1) = y1(i) + dh*dy1(i);
end

%% Improved Euler method
%ddy = -2*dy + -0.75*y
dy2(1) = dy(1);
y2(1) = y(1);
for i = 1:1:L-1
   ddy2(i+1) = -2*dy2(i) -0.75*y2(i);
   dy2_star(i) = dy2(i) + dh*ddy2(i);
   y2_star(i) = y2(i) + dh*dy2(i);
   
   ddy2_star(i) = -2*dy2_star(i) -0.75*y2_star(i);
   dy2(i+1) = dy2(i) + dh/2*(ddy2(i) + ddy2_star(i));
   y2(i+1) = y2(i) + dh/2*(dy2(i) + dy2_star(i));
end 

%% Runge-Kutta method
%ddy = -2*dy + -0.75*y
dy3(1) = dy(1);
y3(1) = y(1);
for i = 1:1:L-1
    k1 = dh*dy3(i);
    k2 = dh*(dy3(i) + k1/2);
    k3 = dh*(dy3(i) + k2/2);
    k4 = dh*(dy3(i) + k3);
    y3(i+1)  = y3(i) + (k1+2*k2+2*k3+k4)/6;
    
    kd1 = dh*(-2*dy3(i) -0.75*y3(i));
    kd2 = dh*(-2*(dy3(i)+kd1/2) -0.75*(y3(i)+k1/2));
    kd3 = dh*(-2*(dy3(i)+kd2/2) -0.75*(y3(i)+k2/2));
    kd4 = dh*(-2*(dy3(i)+kd3) -0.75*(y3(i)+k3));
    dy3(i+1) = dy3(i) + (kd1+2*kd2+2*kd3+kd4)/6;
end
%% plotting
figure
plot(t,y_origin,'r');
hold on
plot(t,y1,'k');
plot(t,y2,'g');
plot(t,y3,'m');
plot(t,dy1,'k');
plot(t,dy2,'g');
plot(t,dy3,'m');
