%% solve1
clc
clear
h=1;
s=1;
s1=1;
j1=1;
TT1=zeros(200,h);
TT2=zeros(200,h);
T3=zeros(400,h);
Rloop=zeros(h,s);
Rloopps=zeros(h,s);
for d=1:81
    m=mubiao2(d);
         if d==18||d==25||d==29||d==46||...
            d==51||d==53||d==54||d==55||d==56||d==57||d==58||...
            d==60||d==61||d==62||d==68||d==69||d==70||...
            d==71||d==72||d==73||d==74||d==75||...
            d==76||d==77||d==78||d==79
                j1=j1+m;
                 continue;
             end
    S11=load('NEWTONF.mat');BP11 = struct2cell(S11);F1= cell2mat(BP11);
    %front = 1;
    %FF1(front).f1 = [];
    T1=zeros(200,1);
    P1=[];
    individual1 = [];
    for i = 1:200
        individual1(i).n1 = 0; 
        individual1(i).p1 = [];
        for j = 1:200
            less1 = 0;  
            equal1 = 0; 
            more1 = 0;  
            for k = j1:j1+m-1 
                if F1(i,k) < F1(j,k)
                    less1 = less1+1;
                elseif F1(i,k) == F1(j,k)
                    equal1= equal1+1;
                else
                    more1 = more1 + 1;
                end
            end
            if less1 == 0 && equal1 ~= m
                individual1(i).n1 = individual1(i).n1 + 1;
            elseif more1 == 0 && equal1 ~= m
                individual1(i).p1 = [individual1(i).p1 j];
            end
        end
        if individual1(i).n1 == 0  
            %pop_eva(i,target+dimension+1) = 1;
            % FF1(front).f1 = [FF1(front).f1 i];
            T1(i)=1;
            %TT1(i,d)=i;
            P1=[P1;F1(i,j1:j1+m-1)]; 
            %FH1(i,j1:j1+m-1)=F1(i,j1:j1+m-1);
        end
    end
    SS1=sum(T1); %compute PF_ps,s=1
    
    %% solve2
    S12=load('HBFGS2BF.mat');BP12 = struct2cell(S12);F2=cell2mat(BP12);
    %front = 1;
    %FF2(front).f2 = [];
    P2=[];
    T2=zeros(200,1);
    individual2 = [];
    for i = 1:200
        individual2(i).n2 = 0;
        individual2(i).p2 = [];
        for j = 1:200
            less2 = 0;
            equal2 = 0;
            more2 = 0;
            for k = j1:j1+m-1
                if F2(i,k) < F2(j,k)
                    less2 = less2+1;
                elseif F2(i,k) == F2(j,k)
                    equal2 = equal2+1;
                else
                    more2 = more2 + 1;
                end
            end
            if less2 == 0 && equal2 ~= m
                individual2(i).n2 = individual2(i).n2 + 1;
            elseif more2 == 0 && equal2 ~= m
                individual2(i).p2 = [individual2(i).p2 j];
            end
        end
        if individual2(i).n2 == 0
            %pop_eva(i,target+dimension+1) = 1;
            %FF2(front).f2 = [FF2(front).f2 i];
            T2(i)=1;
            % TT2(i,d)=i;
            P2=[P2;F2(i,j1:j1+m-1)];
            %FH2(i,j1:j1+m-1)=F2(i,j1:j1+m-1);
        end
    end
    SS2=sum(T2); %compute PF_ps,s=2
    
    %% compute PF_p
    HH=union(P1,P2,'rows');  
    hh=size(HH,1);
    F3(1:hh,j1:j1+m-1)=HH;
    front = 1;
    P3=[];
    TT3=zeros(hh,1);
    %FF2(front).f3 = [];
    individual3 = [];
    for i = 1:hh
        individual3(i).n3 = 0;
        individual3(i).p3 = [];
        for j = 1:hh
            less3 = 0;
            equal3 = 0;
            more3 = 0;
            for k =j1:j1+m-1
                if F3(i,k) < F3(j,k)
                    less3 = less3+1;
                elseif F3(i,k) == F3(j,k)
                    equal3 = equal3+1;
                else
                    more3 = more3 + 1;
                end
            end
            if less3 == 0 && equal3 ~= m
                individual3(i).n3 = individual3(i).n3 + 1;
            elseif more3 == 0 && equal3 ~= m
                individual3(i).p3 = [individual3(i).p3 j];
            end
        end
        if individual3(i).n3 == 0
            %pop_eva(i,target+dimension+1) = 1;
            % FF2(front).f2 = [FF(front).f2 i];
            T3(i,d)=1;
            TT3(i)=1;
            P3=[P3;F3(i,j1:j1+m-1)];
        end
    end
    SS3=sum(TT3);
    Z1=intersect(P1,P3,'rows'); 
    a=size(Z1,1);
    Z2=intersect(P2,P3,'rows');
    b=size(Z2,1);
    tps1=a/SS3;
    tps2=b/SS3;
    Rloop(s1,1:s)=[tps1,tps2];
    tp1_=1/tps1;
    tp2_=1/tps2;
    Rloopps(s1,1:s)=[tp1_,tp2_];
    s1=s1+1;
    j1=j1+m;
end
Rloopps(find(isinf(Rloopps)))=100;
iter=Rloopps;
[m,n]=size(iter);
ndd=m;
for i=1:ndd
    mi=inf;
    for j=1:n
        if iter(i,j)~=0 && iter(i,j)<mi
            mi=iter(i,j);
        end
    end
    for j=1:n
        iter(i,j)=iter(i,j)/mi;
    end
end
iterinum=[];
for i=1:n
    a=unique(iter(:,i));
    na=length(a);
    iterinum=[iterinum,na];
end
tmax=max(iterinum);
tx=ones(n,tmax);
ty=ones(n,tmax);
for i=1:n
    a=unique(iter(:,i));
    na=length(a);
    e=zeros(1,na-1);
    for k=2:na
        for j=1:ndd
            if iter(j,i) <= a(k)
                e(k-1)=e(k-1)+1;
            end
        end
    end
    e=e./ndd;
    [me,ne]=size(e);
    tx(i,:)=max(a(2:na))*tx(i,:);
    ty(i,:)=max(e)*ty(i,:);
    tx(i,1:na-1)=a(2:na);
    ty(i,1:ne)=e;
end
%  plot(tx(1,:),ty(1,:),'--','Color',[0.79,0.18,0.56],'LineWidth',3)
%  plot(tx(1,:),ty(1,:),'--','Color',[0.93,0.69,0.13],'LineWidth',3)
plot(tx(1,:),ty(1,:),'--','Color',[0.45,0.33,0.10],'LineWidth',3)
hold on
plot(tx(2,:),ty(2,:),'-','Color',[0,0.4470,0.7410],'LineWidth',3) %LAN
hold on
axis([1 11 0 1.1])
xlabel('\tau');
ylabel('\rho(\tau)');
title('Purity','fontname','Times New Roman','Color','k','FontSize',20);
% title('Hypervolume metric','fontname','Times New Roman','Color','k','FontSize',13)
% legend('BFGS-nonmonotone','BFGS-diagonal','location','southeast');
% legend('BFGS-type','BFGS-diagonal','location','southeast');
 legend('NEWTON','BFGS-diagonal','location','southeast');
