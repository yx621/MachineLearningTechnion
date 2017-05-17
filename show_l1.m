% Introduction to Machine Learning
% L1 regularization
%
% solving 0.5*(v-w) + a|w|
% for v and where v,w are fixed
% optimal solution x = sign(v) * max( |v|-a, 0 ) 
%

a = 3;
x = [-10:.1:10];
tmp = repmat(x,length(x),1);
vals = 0.5*(tmp-tmp').^2 + a * abs(tmp);
min_x = sign(x).*(max(abs(x)-a,0));
val_min_x = 0.5*(min_x-x).^2 + a * abs(min_x);

clf
title('0.5 (x-v)^2 + a | w |');
hold on;
mesh(x,x,vals);
plot3(min_x, x, val_min_x,'w','LineWidth',2);
grid
set(gca,'FontSize',16);
xlabel('w');
ylabel('v');
zlabel('objective');
colorbar
