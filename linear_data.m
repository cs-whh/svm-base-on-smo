%% inital
clc,clear
close all


%% data generate
N = 100;
A = randn(N,2) - 3;
B = randn(N,2) + 3;
plot(A(:,1),A(:,2),'g*',B(:,1),B(:,2),'b+');
hold on
X = [A;B];
y = [-ones(N,1);ones(N,1)];
C = 1;
kernel_type = 'linear';



%% smo and plot
alpha = smo(X,y,C,kernel_type);

w = sum(y.*alpha.*X);
b = mean(y - X*w');

x  = linspace(-6,6,100);
y = (1/w(2))*(-b - w(1)*x);
plot(x,y,'-')

