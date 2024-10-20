clc
clear
n=2;
Loop=500;
for iLoop=1:Loop
     xk=-10+(10-(-10))*rand(n,1);
%     xk2=-2;
%        xk=rand(n,1);
    % xk = 0.1 + ( 10 - (0.1 ))*rand(n,1);
    Rloopchu(1:n,iLoop)=xk;
   
end

%分开产生变量范围
% n=6;
% Loop=200;
% for iLoop=1:Loop
%     xk1 = 0.1+(0.425-(0.1))*rand(1,1);
%     xk2 = -0.16 + (0.16- (-0.16))*rand(5,1);
% %     xk3 = -1+(1-(-1))*rand(1,1);
%     Rloopchu(1,iLoop)=xk1;
%      Rloopchu(2:n,iLoop)=xk2;
% %       Rloopchu(n,iLoop)=xk3;
% end