clear,clc
S15=load('BFGST2.mat');BP15 = struct2cell(S15);Mymat15 = cell2mat(BP15);
S25=load('BFGSTT2.mat');BP25 = struct2cell(S25);Mymat25 = cell2mat(BP25);
S35=load('NEWTONT.mat');BP35 = struct2cell(S35);Mymat35 = cell2mat(BP35);
S45=load('HBFGS2BT.mat');BP45 = struct2cell(S45);Mymat45 = cell2mat(BP45);
K15=[];K25=[];K35=[];K45=[];
for d=1:81
    if d==29||d==18||d==25||d==46||...
       d==51||d==53||d==54||d==55||d==56||d==57||d==58||...
       d==60||d==61||d==62||d==68||d==69||d==70||...
       d==71||d==72||d==73||d==74||d==75||...
       d==76||d==77||d==78||d==79
        continue;
    end
    K15=[K15 Mymat15(:,d)];
    K25=[K25 Mymat25(:,d)];
    K35=[K35 Mymat35(:,d)];
    K45=[K45 Mymat45(:,d)];
end
K15(find(isnan(K15)))=2000;
K25(find(isnan(K25)))=2000;
K35(find(isnan(K35)))=2000;
K45(find(isnan(K45)))=2000;

BFGST=median(K15)';
BFGSTT=median(K25)';
NEWTONT=median(K35)';
HBFGS2BT=median(K45)';

ABFGST=mean(K15)';
ABFGSTT=mean(K25)';
ANEWTONT=mean(K35)';
AHBFGS2BT=mean(K45)';





