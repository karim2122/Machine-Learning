clear all
ds = datastore('house_prices_data_training_data.csv','TreatAsMissing','NA',.....
    'MissingValue',0,'ReadSize',17999);
T = read(ds);
size(T);
x=T{:,4:21};
Corr_x = corr(x);
x_cov=cov(x) ;
[U S V] = svd(x_cov);
m=size(S);
K=0;
eigenM = sum(diag(S));    
for i = 1 : m
    eigenK = 0;
    for z = 1 : K 
        eigenK = eigenK + S(z,z);
    end
    if 1-(eigenK/eigenM)<0.001
        break
    else
        K = K+1;
    end
end
R= U(:,1:K)'*x';
A= R'*U(1:K,1:K);
error = 1/size(R,2)*sum(A-R');

Alpha=.003;
%size=length(R{:,1});
%X=[ones(size,1) U0 ];
%Y=R{:,3}/mean(R{:,3});
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Alpha=.003;
m=length(T{:,1});
%U0=T{:,4:21}
X=R' ;
[m n]=size(X)
Y=T{:,3}/mean(T{:,3});
Theta=zeros(n,1);
cost = Cost(X,Y,Theta);
[theta, J_cost] = Gradient(X,Y,Theta,Alpha);

min(J_cost)
    