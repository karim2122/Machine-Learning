clear all
ds = datastore('house_prices_data_training_data.csv','TreatAsMissing','NA',.....
    'MissingValue',0,'ReadSize',18000);
T = read(ds);
X=T{:,4:21};
[m, n] = size(X);
%mu = zeros(n, 1);
%sigma2 = zeros(n, 1);
%mu = 1/m * sum(X);
%sigma2 = 1/m * sum((X - repmat(mu, m, 1)).^2);
%p = multivariateGaussian(X, mu, sigma2);
%[epsilon F1] = selectThreshold(yval, p);
%%%%

%for loop kol l houses

mean = mean(X);
STD=std(X);
counter = 0;
for z= 1:17999
prod=1;
%for loop kol l houses
for i = 1:18
    CDF=normpdf(X(z,i),mean(i),STD(i));
    prod=prod*CDF;
end
if (prod>10^-30) || (prod<= 10^-50)
    counter = counter + 1;
end

end
