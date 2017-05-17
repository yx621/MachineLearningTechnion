% Introduction to Machine Learning 
% Ridge Regression
%
% Goal: 
%   Fit polynomial of degree 4 using Ridge Regression
%   with 5 points
%

close all, clc

%
% Ridge regression demo
%
a = [1 -18 7 -5 1];
%a = [1 1 0 0 0];

% x vector
x_plot = [-5:0.01:6]; 
x_train = [-3:2:5]; 

% y vector
y_plot = 0*x_plot + a(1); 
y_train = 0*x_train + a(1);
for cnt = 1:length(a)-1
    y_plot = y_plot + a(cnt+1)*x_plot.^cnt;
    y_train = y_train + a(cnt+1)*x_train.^cnt;
end

%y_train = y_train + 100*randn(size(y_train,1),size(y_train,2));
y_train = [400.8601  151.0838 -134.2457  -45.9790 70.3283]

%
% Plot the curve and the sampled points
%
figure(1)
plot(x_plot, y_plot, '--', x_train, y_train, '*'); 
axis([-6           6        -200        1600]);
legend('True Curve', 'Training Set');
title('True Function')

%
% Calculate ridge regression
%
e = 0.8;

pause
plotRidgeResults(2, x_plot, y_plot, x_train, y_train, 0, a, e);
pause
plotRidgeResults(3, x_plot, y_plot, x_train, y_train, 1, a, e);
pause
plotRidgeResults(4, x_plot, y_plot, x_train, y_train, 10, a, e);
pause
plotRidgeResults(5, x_plot, y_plot, x_train, y_train, 100, a, e);
pause
plotRidgeResults(6, x_plot, y_plot, x_train, y_train, 10000, a, e);
pause
plotRidgeResults(7, x_plot, y_plot, x_train, y_train, 10000000000, a,e);



