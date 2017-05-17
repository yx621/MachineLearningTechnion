% for j = 1:10	
% 	Training(j) = (trainSet.X(:,1+1000*(j-1):1000+1000*(j-1)))';
% 	Sample(j)   = ([trainSet.X(:,1:1000*(j-1)),trainSet.X(:,1001+1000*(j-1):10000)])';
% 	Group	 = (trainSet.Y(1:1000))';
% 	Class = knnclassify(Sample, Training, Group);
% 	Class2 = (Class)';
% 	N0 = length(Class3);
% 	Class3 = abs(Class2 - trainSet.Y(:,1001:10000));
% 	error1 = 0;
% 	for i = 1:N0
% 		error1 = Class3(i)+error1;
% 	end
% % 	error2 = error1/N0
% for k = 1:2:21
% 	for j = 1:10	
% 		Training = (trainSet.X(:,1+1000*(j-1):1000+1000*(j-1)))';
% 		Sample   = ([trainSet.X(:,1:1000*(j-1)),trainSet.X(:,1001+1000*(j-1):10000)])';
% 		Group	 = (trainSet.Y(1+1000*(j-1):1000+1000*(j-1)))';
% 		Class = knnclassify(Sample, Training, Group, k, 'euclidean','nearest');
% 		Class2 = (Class)';
% 		Class3 = abs(Class2 - [trainSet.Y(:,1:1000*(j-1)),trainSet.Y(:,1001+1000*(j-1):10000)]);
% 		N0 = length(Class3);
% 		error1(j) = 0;
%         error1(j) = sum(Class3);
% 		error2(j) = error1(j)/N0;
% 	end
% 	error2;
% 	M((k+1)/2) = mean(error2);
% 	V((k+1)/2) = var(error2);
% 
% end
% plot(k,M);
% plot(k,V);
% grid;

%for k = 1:2:17
% 	for j = 1:10	
% 		Training = (trainSet.X(:,1+1000*(j-1):1000+1000*(j-1)))';
% 		Sample   = ([trainSet.X(:,1:1000*(j-1)),trainSet.X(:,1001+1000*(j-1):10000)])';
% 		Group	 = (trainSet.Y(1+1000*(j-1):1000+1000*(j-1)))';
% 	% 	Class = knnclassify(Sample, Training, Group);
% 		k = 11;
% 		
% 		Class = knnclassify(Sample, Training, Group, k, 'cityblock','nearest');
% 		Class2 = (Class)';
% 		Class3 = abs(Class2 - [trainSet.Y(:,1:1000*(j-1)),trainSet.Y(:,1001+1000*(j-1):10000)]);
% 		N0 = length(Class3);
% 		error1(j) = 0;
% 		for i = 1:N0
% 			error1(j) = Class3(i) + error1(j);
% 		end
% 		error2(j) = error1(j)/N0;
% 	end
% 	error2;
% 	M((k+1)/2) = mean(error2);
% 	V((k+1)/2) = var(error2);
% 	Mi((k+1)/2) = min(error2);
%end

% a = 1:2:17
% the parameter we choose here is K = 9 and the distance is cityblock
    Training = (trainSet.X(:,1:10000))';
	Sample   = (testSet.X(:,1:5000))';
	Group	 = (trainSet.Y(1:10000))';
	Class = knnclassify(Sample, Training, Group);
	k = 9;
	Class = knnclassify(Sample, Training, Group, k, 'cityblock','nearest');
	Class2 = (Class)';
	Class3 = abs(Class2 - testSet.Y(1:5000));
	error1 = 0;
    error1 = sum(Class3);
	error2 = error1/N0

% for k = 1:2:21
% 	for j = 1:10	
% 		Training = (trainSet.X(:,1+1000*(j-1):1000+1000*(j-1)))';
% 		Sample   = ([trainSet.X(:,1:1000*(j-1)),trainSet.X(:,1001+1000*(j-1):10000)])';
% 		Group	 = (trainSet.Y(1+1000*(j-1):1000+1000*(j-1)))';
% 	% 	Class = knnclassify(Sample, Training, Group);
% 		%k = 7;
% 		
% 		Class = knnclassify(Sample, Training, Group, k, 'cityblock','nearest');
% 		Class2 = (Class)';
% 		Class3 = abs(Class2 - [trainSet.Y(:,1:1000*(j-1)),trainSet.Y(:,1001+1000*(j-1):10000)]);
% 		N0 = length(Class3);
% 		error1(j) = 0;
% % 		for i = 1:N0
% % 			error1(j) = Class3(i) + error1(j);
% % 		end
%         error1(j) = sum(Class3);
% 		error2(j) = error1(j)/N0;
% 	end
% 	error2;
% 	M((k+1)/2) = mean(error2);
% 	V((k+1)/2) = var(error2);
% % 	Mi((k+1)/2) = min(error2);
% end
