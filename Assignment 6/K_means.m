clear all
ds = xlsread('house_prices_data_training_data.csv');
%T = read(ds);
X=ds(:,4:21);
[m n] = size(X);
for K = 1 : 15
Corr_x = corr(X);
x_cov=cov(X) ;
[U S V] = svd(x_cov);
R= U(:,1:K)'*X';

randidx = randperm(size(X, 1));
centroids = X(randidx(1:K), :);
previous_centroids = centroids;
idx = findCentroids(X,centroids);
centroids = calculateCentroids(X, idx, K);

for itr=1:10
    idx = findCentroids(X, centroids);
    %previous_centroids = centroids;
    centroids = calculateCentroids(X, idx, K)
    
    for i = 1:1:m
        J_cost(1,i) = sum(X(i,:) - centroids(idx(i,1),:))^2;
    end
    J = (1/m) * sum(J_cost);
     if(itr == 1 )
            J_min = J;
            centroids_min = centroids;
           % indices_min = indices;
            itr_min = itr;
        else
            if(J_min > J)
                J_min = J;
                centroids_min = centroids;
            %    indices_min = indices;
                itr_min = itr;
            end
        end
end
JJ(1,K) = J_min;
end
