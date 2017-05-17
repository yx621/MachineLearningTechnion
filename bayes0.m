% for k = 1:1:5
%     image(k);
%     hist(trainSet.X(10*(k-1)+1,:),300);
%     grid;
%     pause;
% end


% grid;
% training = (trainSet.X(1:14,:))';
% class	 = (trainSet.Y)';
% test0	 = (testSet.X(1:14,:))';
% nb = NaiveBayes.fit(training, class, 'Distribution', 'normal', 'Prior', 'empirical', 'KSWidth', 10000, 'KSSupport', 'unbounded', 'KSType', 'normal');
% cpre = predict(nb,test0);
% cpre0 = cpre';
% cpre1 = abs(cpre0-testSet.Y);
% error0 = 0;
% N0 = length(cpre1);
% for i = 1:N0
% 	error0 = cpre1(i) + error0;
% end
% error1 = error0/N0	

% for i = 1:41
%     figure(i);
%     hist(trainSet.X(i,:),300);
%     grid;
%     pause
% end
% 
% error1 = zeros(1,41)
% N0 = 9000;
% for j = 1:41
% 	for k = 1:1:10	
% 		training = (trainSet.X(1:j,1000*(k-1)+1:1000*k))';
% 		class	 = (trainSet.Y(1,1000*(k-1)+1:1000*k))';
% 	 	test0	 = (trainSet.X(1:j,[1:1000*(k-1),1000*k+1:10000]))';
% 		nb = NaiveBayes.fit(training, class, 'Distribution', 'normal', 'Prior', 'empirical', 'KSWidth', 10000, 'KSSupport', 'unbounded', 'KSType', 'normal');
% 		cpre = predict(nb,test0);
% 		cpre0 = cpre';
% 		temp0 = trainSet.Y(1,[1:1000*(k-1),1000*k+1:10000]);
% 		cpre1 = abs(cpre0-temp0);
% 		error0(k) = 0;
% 		error0(k) = sum(cpre1);
% 	end
% 		error1(j) = mean((error0(k)))/N0;
% end
% a = 1:1:41;
% plot(a,error1);
% grid;

for j = 1:41

	training = (trainSet.X(1:j,:))';
	class	 = (trainSet.Y)';
    test0	 = (testSet.X(1:j,:))';
	nb = NaiveBayes.fit(training, class, 'Distribution', 'normal', 'Prior', 'empirical', 'KSWidth', 10000, 'KSSupport', 'unbounded', 'KSType', 'normal');
	cpre = predict(nb,test0);
	cpre0 = cpre';
	cpre1 = abs(cpre0-testSet.Y);
	error0 = 0;
	N0 = length(cpre1);
	for i = 1:N0
		error0 = cpre1(i) + error0;
	end
	error1(j) = error0/N0;
end
error1;
a = 1:1:41;
plot(a,error1);
grid;
%