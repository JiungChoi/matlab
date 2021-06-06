clc
clear all
close all


c1 = 202;
c2 = 372;
c3 = 202;

thetaA = linspace(-pi,pi,100);
thetaB = linspace(-pi,pi,100);
L = length(thetaA)

for i = 1:1:L
    for j = 1:1:L
    x(i,j) = c1*cos(thetaA) + c2*cos(thetaA - thetaB) + c3*cos(thetaA - 2*thetaB);
    y(i,j) = c1*sin(thetaA) + c2*sin(thetaA - thetaB) + c3*sin(thetaA - 2*thetaB);
    end
end
