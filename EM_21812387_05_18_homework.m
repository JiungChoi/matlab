clear all
close all
clc

%% 스플라인 보간 ( x^4 )

x = [-1 0 1];
y = x.^4;

x_ary = [-1 : 0.01 : 1];
x_ary_l = [-1 : 0.01 : 0];
x_ary_r = [0.01 : 0.01 : 1];
y_ary = x_ary.^4;
%% 
syms xx ;
xs = [1 xx xx^2 xx^3]; 
xd1 = [0 1 2*xx 3*xx^2];
xd2 = [0 0 2 6*xx];

%% A1 = 예제 스플라인, A2 = 양 끝점에서 2차 미분계수가 0일 때
 A1 = [subs(xs, xx, x(1)) zeros(1,4); subs(xs, xx, x(2)) zeros(1,4); subs(xd1, xx, x(2)) -subs(xd1, xx, x(2)); subs(xd2, xx, x(2)) -subs(xd2, xx, x(2)); zeros(1,4) subs(xs, xx, x(2)); zeros(1,4) subs(xs, xx, x(3)); subs(xd1, xx, -1) zeros(1,4); zeros(1,4) subs(xd1, xx, 1)];
 A2 = [subs(xs, xx, x(1)) zeros(1,4); subs(xs, xx, x(2)) zeros(1,4); subs(xd1, xx, x(2)) -subs(xd1, xx, x(2)); subs(xd2, xx, x(2)) -subs(xd2, xx, x(2)); zeros(1,4) subs(xs, xx, x(2)); zeros(1,4) subs(xs, xx, x(3)); subs(xd2, xx, x(1)) zeros(1,4); zeros(1,4) subs(xd2, xx, x(3))];
 
 %% B
 B1 = [y(1) y(2) 0 0 y(2) y(3) -4 4]';
 B2 = [y(1) y(2) 0 0 y(2) y(3) 0 0]';
 %% a
 a1 = inv(A1) * B1;
 a2 = inv(A2) * B2;

 %% result
 % 예제 
 R1_l = xs * [a1(1) a1(2) a1(3) a1(4)]';
 R1_l = subs(R1_l, xx, x_ary_l);
 R1_r = xs * [a1(5) a1(6) a1(7) a1(8)]';
 R1_r = subs(R1_r, xx, x_ary_r);
 
 %nutral spline
 R2_l = xs * [a2(1) a2(2) a2(3) a2(4)]';
 R2_l = subs(R2_l, xx, x_ary_l);
 R2_r = xs * [a2(5) a2(6) a2(7) a2(8)]';
 R2_r = subs(R2_r, xx, x_ary_r);
 %% plot 
 plot (x_ary, y_ary)
 hold on
 
 plot(x_ary_l, R1_l,'g')
 plot(x_ary_r, R1_r,'r')
 
 plot(x_ary_l, R2_l,'y--')
 plot(x_ary_r, R2_r,'m--')
 
 

 
 
 

