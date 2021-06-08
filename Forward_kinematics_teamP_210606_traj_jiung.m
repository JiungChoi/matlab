clc
clear all
close all

c1 = 202;
c2 = 372;
c3 = 202;

x0_1 = 574;
x1_3 = 700;
x5_6 = 700;
y0_1 = 0;
y1_3 = 2;
y5_6 = 0;

L = 60;
%%
syms x y

for i = 1:1:3
    if i==1
        xi = x0_1;
        yi = y0_1;
    elseif i==2
        xi = x1_3;
        yi = y1_3;
    else
        xi = x5_6;
        yi = y5_6;
    end
    alpha = subs(atan(y/x), [x, y], [xi, yi]);
    esp = sqrt((cos(alpha)*(c1+c3))^2 + (sin(alpha)*(c1-c3))^2);
    gamma = atan(sin(alpha)*(c1-c3)/(cos(alpha)*(c1+c3)));
    thetaB(i) = subs(acos((x-c2*cos(alpha))/esp), x, xi) - gamma;
end
thetaA = (thetaB + alpha);

% mortor_zx = [linspace(0,thetaA(1),L/12) linspace(thetaA(1),thetaA(2),L/6) linspace(thetaA(2),80,2*L/3) 80*ones(1,L/6) linspace(80, thetaA(3),L/6) ];
% mortor_zx2 = [linspace(0,thetaB(1),L/12) linspace(thetaB(1),thetaB(2),L/6) linspace(thetaB(2),20,2*L/3) 20*ones(1,L/6) linspace(20, thetaB(3),L/6)];
% mortor_zx3 = [linspace(0,thetaB(1),L/12) linspace(thetaB(1),thetaB(2),L/6) linspace(thetaB(2),20,2*L/3) 20*ones(1,L/6) linspace(20, -thetaB(3),L/6)];

K = 5;
mortor_zx = [linspace(0,thetaA(1),L/K) linspace(thetaA(1),thetaA(2),L/K) linspace(thetaA(2),80*pi/180,L/K) 80*pi/180*ones(1,L/K) linspace(80*pi/180, thetaA(3),L/K)  ];
mortor_zx2 = [linspace(0,thetaB(1),L/K) linspace(thetaB(1),thetaB(2),L/K) linspace(thetaB(2),20*pi/180,L/K) 20*pi/180*ones(1,L/K) linspace(20*pi/180, thetaB(3),L/K)];
mortor_zx3 = [linspace(0,thetaB(1),L/K) linspace(thetaB(1),thetaB(2),L/K) linspace(thetaB(2),20*pi/180,L/K) 20*pi/180*ones(1,L/K) linspace(20*pi/180, -thetaB(3),L/K)];

L_zx = length(mortor_zx);
L_zx2 = length(mortor_zx2);
L_zx3 = length(mortor_zx3);

for j = 1:1:L
    a1(j) = c1*cos(mortor_zx(j)) ;
    b1(j) = c1*sin(mortor_zx(j));
    
    a2(j) = c1*cos(mortor_zx(j)) + c2*cos(mortor_zx(j) - mortor_zx2(j)) ;
    b2(j) = c1*sin(mortor_zx(j)) + c2*sin(mortor_zx(j) - mortor_zx2(j)) ;
    
    a3(j) = c1*cos(mortor_zx(j)) + c2*cos(mortor_zx(j) - mortor_zx2(j)) + c3*cos(mortor_zx(j) - mortor_zx2(j) - mortor_zx3(j));
    b3(j) = c1*sin(mortor_zx(j)) + c2*sin(mortor_zx(j) - mortor_zx2(j)) + c3*sin(mortor_zx(j) - mortor_zx2(j) - mortor_zx3(j));
end



axis equal
grid on
hold on

 plot(a3, b3,'ko','MarkerSize',2)

link_1x = [zeros(1,L) ; a1 ];
link_1y = [zeros(1,L) ; b1 ];
link_2x = [a1 ; a2 ];
link_2y = [b1 ; b2 ];
link_3x = [a2 ; a3 ];
link_3y = [b2 ; b3 ];

plot(link_1x, link_1y,'K')
plot(link_2x, link_2y,'K')
plot(link_3x, link_3y,'K')

