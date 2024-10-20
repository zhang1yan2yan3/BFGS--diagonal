clc
clear
S11=load('GAMMA.mat');BP11 = struct2cell(S11);data1 = cell2mat(BP11);
S12=load('DELTA.mat');BP12 = struct2cell(S12);data2 = cell2mat(BP12);

for ddd=1:2
    if ddd==1
        data1(find(isnan(data1)))=100;
        iter=data1;
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
        %subplot(1,2,1) ;
        figure(1);
        plot(tx(1,:),ty(1,:),'O:','Color',[0.79,0.18,0.56],'linewidth',1.5) %zi
        hold on
        plot(tx(2,:),ty(2,:),'s:','Color',[0.93,0.69,0.13],'linewidth',1.5)%huang
        hold on
        plot(tx(3,:),ty(3,:),'h:','Color',[0.45,0.33,0.10],'linewidth',1.5)
        hold on
        plot(tx(4,:),ty(4,:),'*-','Color',[0,0.4470,0.7410],'linewidth',1.5)%lan
        hold on
        axis([1 12 0.15 1])
        xlabel('\tau');
        ylabel('\rho(\tau)');
        title('\Gamma')
        legend('BFGS-nonmonotone','BFGS-type','NEWTON','BFGS-diagonal','location','southeast')
        
    elseif ddd==2
        data2(find(isnan(data2)))=100;
        iter=data2;
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
        %subplot(1,2,2) ;
        figure(2);
        plot(tx(1,:),ty(1,:),'o:','Color',[0.79,0.18,0.56],'linewidth',1.5) %zi
        hold on
        plot(tx(2,:),ty(2,:),'s:','Color',[0.93,0.69,0.13],'linewidth',1.5)%huang
        hold on
        plot(tx(3,:),ty(3,:),'h:','Color',[0.45,0.33,0.10],'linewidth',1.5)
        hold on
        plot(tx(4,:),ty(4,:),'*-','Color',[0,0.4470,0.7410],'linewidth',1.5)%lan
        hold on
        axis([1 1.6 0.15 1])
        xlabel('\tau');
        ylabel('\rho(\tau)');
        title('\Delta')
        legend('BFGS-nonmonotone','BFGS-type','NEWTON','BFGS-diagonal','location','southeast')
    end
end
