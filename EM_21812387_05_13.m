clear all
close all
clc

%% 함수 생성
x0 = [-2 :0.1: 5];
y0 = x0.^2 -7*x0 +15*sin(x0);

plot(x0, y0)
grid on
hold on

%% 데이터 취득 (5개)
xs = [x0(17) x0(27) x0(35) x0(44) x0(51)];
ys = [y0(17) y0(27) y0(35) y0(44) y0(51)];
plot(xs, ys, 'r*')

%% 데이터 개수 받기
[r c] = size(xs);

%%lk 구하기
syms x1
lk = 1
for i = 1:1:c
      lk = lk * (x1 - xs(i));
end

%%LK 구하기
for i = 1:1:c
    ll = lk / (x1 - xs(i));
    LK(i) = ll / subs (ll, x1, xs(i));
end

%% 라그랑지 다항식 구하기
p1 = 0;
for i = 1:1:c
    p1 = p1 + LK(i) * ys(i);
end

%%일반 다항식 보간법
syms x2

%% AA구하기
AA = 1;
for i = 1:1:(c-1)
    AA = [AA (x2)^i];
end

%% BB구하기
BB = [subs(AA, x2, xs(1))];
for i = 2:1:c
    BB = [BB ; [subs(AA, x2, xs(i))]];
end

%%CC구하기
CC = ys';

%% 일반 다항식 보간법 구하기
p2 =  AA*inv(BB)*CC;

%% 뉴턴 보간법
syms x3;

%% AA2 구하기
AA2 = 1;
AB2 = 1;
for i= 1:1:c-1
    AB2 = AB2*(x3 - xs(i));
    AA2 = [AA2 AB2];
end

%% BB2
BB2 = zeros(c, c)

for i = 1:1:c
    for j = 1:1:c
        if j == 1
            BB2(i,j) = 1;
        elseif j<=i
            BB2(i,j) = subs(AA2(j), x3, xs(i));
        end
    end
end

%% P3

p3 = AA2*inv(BB2)*CC;

%%결과 비교하기
ye1 = subs(p1, x1, x0); %라그랑지 보간법
ye2 = subs(p2, x2, x0); %일반다항식 보간법
ye3 = subs(p3, x3, x0); %뉴턴 보간법
plot(x0, ye1,'b')
plot(x0, ye2, 'g.--')
plot(x0, ye3, 'm--')
legend('원 함수','데이터 점','라그랑지','일반 다항식','뉴턴')