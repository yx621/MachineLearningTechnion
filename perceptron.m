% ita = 0.1;
% N0 = 9000;
% N1 = 15;
% Y0 = 2*trainSet.Y - 1;
% Y1 = 2*testSet.Y - 1;
% wt0 = zeros(41,N1);
% yt	= 0;
% yt1	= 0;
% t22 = zeros(1,N0);
% error0 = zeros(1,N1);
% t11 = zeros(1,N0);
% 
% for j = 1:1:N1
% 	error00 = zeros(1,10);
%     error0(j) = 0;
%     
% 	for k = 1:1:10
% 	wt = zeros(41,1);
% 		for m = 1:1:j
% 			for i = 1000*(k-1)+1:1000*k
% 				yt = sign(wt'*trainSet.X(:,i));
% 				wt = wt + ita*(Y0(i) - yt)*trainSet.X(:,i);
% 			end
% 		end
% 		wt0(:,k) = wt;
% 		trainset0 = trainSet.X(:, [1:1000*(k-1),1000*k:10000]);
%         y00	=	Y0(1, [1:1000*(k-1),1000*k:10000]);
% 		for ii = 1:1:N0
% 			yt1 = sign(wt0(:,k)'*trainset0(:,ii));
% 			t11(ii) = (y00(ii) - yt1);
% 			t22(ii) = sign (abs(t11(ii)));
% 			error00(k) = error00(k) + t22(ii);
% 		end
%     end
% 	error00 = error00/N0;
% 	error0(j) = mean(error00);
% end
% m0 = 1:1:N1;
% plot(m0,error0);
% grid;
% 
% ita = 0.1;
% N0 = 5000;
% Y0 = 2*trainSet.Y - 1;
% Y1 = 2*testSet.Y - 1;
% yt	= 0;
% yt1	= 0;
% t22 = zeros(1,N0);
% error00 = 0;
% t11 = zeros(1,N0);
% 
% j = 9;
% wt = zeros(41,1);
% for m = 1:1:j
% 	for i = 1:10000
% 		yt = sign(wt'*trainSet.X(:,i));
% 		wt = wt + ita*(Y0(i) - yt)*trainSet.X(:,i);
% 	end
% end
% 
% for ii = 1:1:N0
% 	yt1 = sign(wt'*testSet.X(:,ii));
% 	t11(ii) = (Y1(ii) - yt1);
% 	t22(ii) = sign (abs(t11(ii)));
% 	error00 = error00 + t22(ii);
% end
% error00 = error00/N0

ita = 0.1;
N0 = 10000;
N1 = 20;
Y0 = 2*trainSet.Y - 1;
Y1 = 2*testSet.Y - 1;
wt = zeros(41,1);
wt0 = zeros(41,N1);
yt  = 0;
yt1 = 0;
t22 = zeros(1,5000);
t1 = zeros(1,10000);
t2 = zeros(1,10000);
error0 = zeros(1,N1);
error00 = zeros(1,N1);
 
t11 = zeros(1,5000);
 
for j = 1:1:N1
    error0(j) = 0;
      error00(j) = 0;
    for i = 1:10000
        yt = sign(wt'*trainSet.X(:,i));
        wt = wt + ita*(Y0(i) - yt)*trainSet.X(:,i);
        t1(i) = (Y0(i) - yt);
        t2(i) = sign (abs(t1(i)));
        error0(j) = error0(j) + t2(i);
    end
    wt0(:,j) = wt;
    
 
    for ii = 1:1:5000
        yt1 = sign(wt0(:,j)'*testSet.X(:,ii));

        t11(ii) = (Y1(ii) - yt1);
        t22(ii) = sign (abs(t11(ii)));
        error00(j) = error00(j) + t22(ii);
    end
    
end
 
error1 = error0/10000
error11 = error00/5000
k = 1:1:N1;
plot(k,error1,'*',k,error11,'^');
grid;
