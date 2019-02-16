function [ J ] = Cost( x , y , theta )
m = size(x,1);
h = x*theta;
J = (1/2.*m) .* sum((h-y).^2);
end

