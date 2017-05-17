clear all;
close all;
clc;

% Consider a sample application that uses nine different indices of the
% quality of life in 329 U.S. cities. These are climate, housing, health,
% crime, transportation, education, arts, recreation, and economics. For
% each index, higher is better. For example, a higher index for crime means
% a lower crime rate.
load cities;

% To get a quick impression of the ratings data, make a box plot.
boxplot(ratings,'orientation','horizontal','labels',categories);

% normalize
figure
ratings1 = ratings - repmat(mean(ratings), size(ratings, 1), 1);
ratings2 = ratings1./repmat(std(ratings1), size(ratings1, 1), 1);
imagesc(ratings2)
colorbar

% plot data using some axis

ca1 = 1;
ca2 = 2;
clf
plot(ratings2(:,ca1),-ratings2(:,ca2),'+')
xlabel(categories(ca1,:));
ylabel(categories(ca2,:));
gname(names)
disp('hit any key');
pause
clc


ca1 = 6;
ca2 = 7;
clf
plot(ratings2(:,ca1),-ratings2(:,ca2),'+')
xlabel(categories(ca1,:));
ylabel(categories(ca2,:));
gname(names)
disp('hit any key');
pause
clc



% first we show the 10 best and worst cities in each category
done = 0;
while (~done)
    
    fprintf('==============================================\n');
    for ii=1:size(categories,1)
        fprintf('%d %-20s\n', ii, categories(ii,:));
    end
    
    ca = input('Pick a category (0 to end):');
    if (ca == 0)
        done =1;
    else
        [dummy,j]=sort(ratings(:,ca));
        fprintf('--------------------------------------------\n');
        fprintf('top 10 cities in %s\n', categories(ca,:));
        fprintf('--------------------------------------------\n');
        for t=j(end:-1:end-10)',
            fprintf('  %s\n',names(t, :));
        end
        
        fprintf('--------------------------------------------\n');
        fprintf('bottom 10 cities in %s\n', categories(ca,:));
        fprintf('--------------------------------------------\n');
        
        for t=j(1:10)',
            fprintf('  %s\n',names(t, :));
        end
        
    end
    disp('hit any key');
    pause
    clc
end

clc


% Ordinarily you might also graph pairs of the original variables, but
% there are 36 two-variable plots. Perhaps principal components analysis
% can reduce the number of variables you need to consider.

% Standardizing the data is often preferable when the variables are in
% different units or when the variance of the different columns is
% substantial (as in this case).
% You can standardize the data by dividing each column by its standard deviation.
stdr = std(ratings);
sr = ratings./repmat(stdr,329,1);

% Now you are ready to find the principal components.
[coefs,scores,variances,t2] = princomp(sr);

% The second output, scores, contains the coordinates of the original data
% in the new coordinate system defined by the principal components. This
% output is the same size as the input data matrix.
% A plot of the first two columns of scores shows the ratings data
% projected onto the first two principal components. princomp computes the
% scores to have mean zero.
figure;

% we use negative of the second componenet to fit the biplot below
plot(scores(:,1),-scores(:,2),'+')
xlabel('1st Principal Component')
ylabel('2nd Principal Component')
% Note the outlying points in the right half of the plot.

% The function gname is useful for graphically identifying a few points in
% a plot like this. You can call gname with a string matrix containing as
% many case labels as points in the plot. The string matrix names works for
% labeling points with the city names.
gname(names)
% Move your cursor over the plot and click once near each point in the
% right half. As you click each point, it is labeled with the proper row
% from the names string matrix. When you are finished labeling points,
% press the Return key.

% The outliers are some of the biggest population centers in the
% United States. They are definitely different from the remainder of the
% data, so perhaps they should be considered separately. To remove the
% labeled cities from the data, first identify their corresponding row
% numbers as follows:
metro = [43 65 179 213 234 270 314];
rsubset = ratings;
nsubset = names;
nsubset(metro,:) = [];
rsubset(metro,:) = [];
stdr1 = std(rsubset);
sr1 = rsubset./repmat(stdr,322,1);
[coefs1,scores1,variances1,t21] = princomp(sr1);

figure;
plot(scores1(:,1),-scores1(:,2),'+')
xlabel('1st Principal Component')
ylabel('2nd Principal Component')
gname(nsubset)

pause;
% To help visualize both the principal component
% coefficients for each variable and the principal component scores for
% each observation in a single plot we use the biplot function.  For example, the following command
% plots the results from the principal components analysis on the cities
% and labels each of the variables.
figure;

% replace coefs1 with coefs to use original axes!!
biplot(coefs1(:,1:2), 'scores',scores(:,1:2),...
    'varlabels',categories);
axis tight
%axis([-.26 0.6 -.51 .51]);
%Each of the nine variables is represented in this plot by a vector, and
%the direction and length of the vector indicates how each variable
%contributes to the two principal components in the plot. For example, you
%have seen that the first principal component, represented in this biplot
%by the horizontal axis, has positive coefficients for all nine variables.
%That corresponds to the nine vectors directed into the right half of the
%plot. You have also seen that the second principal component, represented
%by the vertical axis, has positive coefficients for the variables
%education, health, arts, and transportation, and negative coefficients for
%the remaining five variables. That corresponds to vectors directed into
%the top and bottom halves of the plot, respectively. This indicates that
%this component distinguishes between cities that have high values for the
%first set of variables and low for the second, and cities that have the
%opposite.



