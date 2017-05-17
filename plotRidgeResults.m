function [] = plotRidgeResults(fig, x_plot, y_plot, x_train, y_train, C, a, e)

[w] = ridgeRegression(x_train', y_train', C);
w_trunc = w; w_trunc(abs(w_trunc)<e) = 0;
y_fit =  0*x_plot + w(1); 
y_trunc =  0*x_plot + w_trunc(1); 
for cnt = 1:length(w)-1
    y_fit = y_fit + w(cnt+1)*x_plot.^cnt;
    y_trunc = y_trunc + w_trunc(cnt+1)*x_plot.^cnt;
end

figure(fig)

subplot(2,1,1)
% plot(x_plot, y_plot, '--', x_train, y_train, '*', x_plot, y_fit, 'r-', x_plot, y_trunc, 'k'); 
% legend('True Curve', 'Training Set', 'Fitted Curve', 'Fitted Truncated Curve')
plot(x_plot, y_plot, '--', x_train, y_train, '*', x_plot, y_fit, 'r-'); 
legend('True Curve', 'Training Set', 'Fitted Curve')
axis([-6           6        -200        1600]);
str = sprintf('Ridge regression for C = %d', C);
title(str)


subplot(2,1,2)
% plot([0:1:4], a, 'r*', [0:1:4], w, 'bo', [0:1:4], w_trunc, 'bx')
% legend('True weights', 'Ridge weights', 'Ridge truncated weights')
plot([0:1:4], a, 'r*', [0:1:4], w, 'bo')
legend('True weights', 'Ridge weights')

