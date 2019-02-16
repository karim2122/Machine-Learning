clear all
ds = datastore('heart_DD.csv','TreatAsMissing','NA',.....
    'MissingValue',0,'ReadSize',250);
T = read(ds);
size(T);
Alpha=.5;

m=length(T{:,1});
U0=T{:,1:13}
%U=T{:,4:6};

%U1=T{:,20:21};
%U2=U.^2;
X=[ones(m,1) U0 ];

n=length(X(1,:));
for w=2:n
    if max(abs(X(:,w)))~=0
    X(:,w)=(X(:,w)-mean((X(:,w))))./std(X(:,w));
    end
end

Y=T{:,14}/mean(T{:,14});
Theta=zeros(n,1);
cost = Cost(X,Y,Theta);

[theta J_cost] = Gradient(X,Y,Theta,Alpha);


