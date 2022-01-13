%% inital
clc,clear
close all


%% data generate
N = 50;
X = rand(2*N,2);
y = double(vecnorm(X-[0.5,0.5],2,2)>0.3);
y(y==0)=-1;
idx1 = find(y == 1);
idx0 = find(y == -1);
plot(X(idx1,1),X(idx1,2),'r+');
hold on
plot(X(idx0,1),X(idx0,2),'b+');
C = 1;
kernel_type = 'gauss';
tolerate = 1e-5;

%% smo and plot
alpha = smo(X,y,C,kernel_type);


idx = find(alpha > tolerate & alpha < C);
b = y(idx(1)) - sum(y.*alpha.*K(X,X(idx(1),:),'gauss'));

a=axis; XX=a(1):(a(2)-a(1))/100:a(2); YY=a(3):(a(4)-a(3))/100:a(4);
[XX,YY] = meshgrid(XX,YY);
for i=1:101
    for j=1:101, 
        Z(i,j) = sum(alpha.*y.*K(X,[XX(i,j) YY(i,j)],'gauss'));
    end
end
Z=Z+b; hold on;
contour(XX,YY,Z,[+0 +0],'r');





