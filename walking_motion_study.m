clc
clear all
close all

%%
T=1.5;%주기 
R=4;%총 반복수 3
dt = 0.01;%나눌 값
t=[0:dt:T-dt];%dt로 나눈 시간
L=length(t);%시간의 길이

%% 엉덩이관절 궤적
Ah= 22;%진폭
Fh=1/T;%주파수
dAH=5;%y축 평행이동
 
 for i=1:L
    Hip(i)= Ah*cos(2*pi*Fh*t(i))+dAH;
    HipR(i)=-Ah*cos(2*pi*Fh*(t(i)-(T/2)))+dAH;  %반대 다리는 50% 주기/2 초동안 지연
 end

figure;
plot(t,Hip,'k','linewidth',1.5) 
figure;
plot(t,HipR,'k','linewidth',1.5)
 %% 무릎 관절 궤적
t_sc = 0.35;%사인함수와 코사인 함수가 나누어지는 지점 = 사인의 반 주기
Ak=13;%진폭
Fk1=1/(2*t_sc); 
Ak2=-25; %진폭
Fk2=1/(2-t_sc);%주기,진동수
dAk=25;%y축 평행이동

for i=1:L  % Knee = 스탠스부터, KneeR = 스윙부
    if t(i) < t_sc 
        Knee(i)=Ak*sin(2*pi*Fk1*t(i)); 
        KneeR(i)=Ak*sin(2*pi*Fk1*(t(i)-(T/2)));%반대 다리는 50% 즉 T/2초동안 지연
    else
        Knee(i)=Ak2*cos(2*pi*Fk2*(t(i)-t_sc))+dAk;
        KneeR(i)=-Ak2*cos(2*pi*Fk2*(t(i)-t_sc-(T/2)))+dAk; %반대 다리는 50% 즉 T/2초동안 지연
    end
end

figure;
plot(t,Knee,'k','linewidth',1.5)
hold on 
plot(t,KneeR,'k','linewidth',1.5)

%% 반복 3 주기
tt=[0:dt:R*T-dt];
for i=1:R 
    HHip(i,:)=Hip;
    KKnee(i,:)=Knee;
    HHipR(i,:)=HipR;
    KKneeR(i,:)=KneeR;
end

HHipT=HHip';
HHipS = HHipT(:);
HHipRT=HHipR';
HHipRS = HHipRT(:);

KKneeT=KKnee';
KKneeS=KKneeT(:);
KKneeRT=KKneeR';
KKneeRS=KKneeRT(:);


figure;
plot(tt,KKneeS)
figure;
plot(tt,KKneeRS)



%% 저장
tt = tt';
joint1=[tt,HHipS];
joint2=[tt, KKneeS];
joint3=[tt,HHipRS];
joint4=[tt, KKneeRS];
dlmwrite('joint1.txt',joint1,'precision','%.6f')
dlmwrite('joint2.txt',joint2,'precision','%.6f')
dlmwrite('joint3.txt',joint3,'precision','%.6f')
dlmwrite('joint4.txt',joint4,'precision','%.6f')

