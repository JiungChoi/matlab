clc
clear all
close all

%% 
c1 = 202;
c2 = 372;
c3 = 202;

alpha = atan(y/x);

esp = sqrt((cos(alpha)*(c1+c3))^2 + (sin(alpha)*(c1-c3))^2);

gamma = atan(sin(alpha)*(c1-c3)/(cos(alpha)*(c1+c3)));

thetaB = acos((x1-c2*cos(alpha))/esp) - gamma;

thetaB = thetaB * 180 / pi;
thetaA = thetaB + alpha; 



