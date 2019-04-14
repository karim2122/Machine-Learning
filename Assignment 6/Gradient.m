function [ Theta , E ] = Gradient( X , Y , Theta,Alpha )

R=1;
k = 1;
E(k) = Cost(X,Y,Theta);
[m n ] = size(X);


while R==1
Alpha=Alpha*1;
h = X*Theta;
Theta=Theta-(Alpha/m)*X'*(h-Y);
k=k+1
E(k)=Cost(X,Y,Theta);

if E(k-1)-E(k)<0
    break
end 
q=(E(k-1)-E(k))./E(k-1);
if q <.000001;
    R=0;
end
end
end
 
