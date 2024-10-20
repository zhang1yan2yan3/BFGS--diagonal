function [c,ceq] = circlecon2(x,G1,BK1,m,n)
c=[];
 for i=1:m
     BB=G1(i,1:n)*x(1:n)+(1/2)*x(1:n)'*BK1*x(1:n)-x(n+1);
     c=[c;BB];
 end
ceq = [];