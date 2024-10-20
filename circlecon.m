function [c,ceq] = circlecon(x,G,B,m,n)
c=[];
 for i=1:m
     BB=G(i,1:n)*x(1:n)+(1/2)*x(1:n)'*(B(n*(i-1)+1:n*i,1:n))*x(1:n)-x(n+1);
     c=[c;BB];
 end
ceq = [];