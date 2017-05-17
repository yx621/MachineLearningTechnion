function [w] = ridgeRegression(x, y, C)

% get the number of training points
siz = size(x,1); 

% calculate H matrix
H  = [ones(siz,1),x, x.^2, x.^3, x.^4]; 

% calculate weights
w = inv(H'*H + C*eye(5))*H'*y;