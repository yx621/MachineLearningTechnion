ita = 0.2;
N0 = 1000;
N1 = 20;
N2 = 9000;
Y0 = 2*trainSet.Y - 1;
Y1 = 2*testSet.Y - 1;
wt = zeros(41,1);
wt0 = zeros(41,10);
wt1 = zeros(41,N1);
yt	= 0;
yt1	= zeros(1,N2);
t11 = zeros(1,N2);
t22 = zeros(1,N2);
t1 = zeros(1,N0);
t2 = zeros(1,N0);
error0 = zeros(1,N1);
errorc = zeros(N1,10);
errorave = zeros(1,N1);
error00 = zeros(1,10);

for k = 1:1:N1

%	wt = zeros(41,1);
	for j = 1:1:10
		error0(j) = 0;
		error00(j) = 0;
		
		for p=1:1:k
			for i = 1:1:N0
				yt = sign(wt'*trainSet.X(:,i+1000*(j-1)));
				wt = wt + ita*(Y0(i+1000*(j-1)) - yt)*(trainSet.X(:,i+1000*(j-1)));
				t1(i) = (Y0(i+1000*(j-1)) - yt);
				t2(i) = sign (abs(t1(i)));
				%error0(j) = error0(j) + t2(i);
			end
		end
		
		wt0(:,j) = wt;
		
			yt1 = sign(wt0(:,j)'*[trainSet.X(:,1:1000*(j-1)),trainSet.X(:,1000*(j):10000)]);
			t11 = ([Y0(:,1:1000*(j-1)),Y0(:,1000*(j):10000)] - yt1);
			t22 = sign (abs(t11));
			error00(j) = sum(t22);
		%end
        
	end	
	errorc(k,:) = error00;
	
end
% errorc2 = errorc';
for t = 1:1:N1
	errorave(t) = mean((errorc(t,:)));
end

%error1 = error0/N0
errorave = errorave/N2
n0 = 1:1:N1;
%plot(k,error1,'*',k,error11,'^');
plot(n0,errorave,'*');
grid;
