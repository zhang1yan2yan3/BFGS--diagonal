clear,clc
%% Read data
global m
global n
Loop=300;
h=5;
jj=1;
j1=1;
Rloopk=zeros(Loop,h);
Rloopnf=zeros(Loop,h);
Rloopng=zeros(Loop,h);
Rloopt=zeros(Loop,h);
Rloopnhev=zeros(Loop,h);
Rloopchu=zeros(Loop,h);
for d=1
    for iLoop=1:300
        tic;
        nhev=1;
        k=1;
        nf=1;
        ng=1;
        eps=2.22e-16;
        S1=chushi1(d);
         s1 = load('ABK1.mat')
        BP1 = struct2cell(s1);
        Mymat1 = cell2mat(BP1);
        xk=Mymat1(1:n,iLoop);
       F0=f(xk,d); 
        R=g(xk,d);
        ng=ng+1;
        r=[];
        for i=1:m
            r1=1/max(1,norm(R(i,1:n),inf));
            r=[r,r1];
        end
        r1=repmat(r',1,n);
        nf=nf+1;
         G=g(xk,d).*r1;
        ng=ng+1;
        BK=eye(n);
        I=eye(n);
        while 1
            HK=inv(BK);
            H=G*HK*G';
            ff=zeros(m,1);
            Aeq=ones(1,m);
            beq=1;
            lb=zeros(m,1);
            ub=ones(m,1);
            options = optimoptions('quadprog','Display','iter');
            [lammda,fval] = quadprog(H,ff,[],[],Aeq,beq,lb,ub,[],options);
            nhev=nhev+1;
            thetak=-fval;
            dk=-HK*G'*lammda;
            if abs(thetak)<=5*sqrt(eps)
                break
            end
            F=r'.*f(xk,d);
            %% Wolfe线搜索
            [alphak,nf,ng]=qwolfe(xk,dk,F,G,nf,ng,r,r1,m,n,d)
            x1=xk+alphak*dk;
            F1=f(x1,d);
            nf=nf+1;
            G1=g(x1,d).*r1;
            ng=ng+1; 
            %% 更新Hk1
            rk=G1'-G';
            sk=x1-xk;
            nsk=norm(sk)^2;
            NG=vecnorm(G,2,2);
            tk=NG+max(-rk'*sk/nsk,0);
            yk=rk+tk'.*sk;
            uk=yk*lammda;
            us=uk'*sk;
            BS=(BK*sk*sk'*BK)/(sk'*BK*sk);
            US=(uk*uk')/us;
            bk1=BK-BS+US;
            BK1=diag(bk1).*eye(n);
            if  k>=2000
                nhev=nan;
                k=nan;
                nf=nan;
                ng=nan;
                break
            end
            k=k+1;
            xk=x1;
            G=G1;
            BK=BK1;
        end
        t=toc;
        FF1=f(xk,d)';
        Rloopk(iLoop,jj)=k;
        Rloopnf(iLoop,jj)=nf;
        Rloopng(iLoop,jj)=ng;
        Rloopt(iLoop,jj)=t;
        Rloopnhev(iLoop,jj)=nhev;
        Rloopchu(iLoop,j1:j1+m-1)=FF1;
      
        plot(F0(1,1),F0(2,1),'Ok',F1(1,1),F1(2,1),'r*','MarkerSize',4);
        plot([F0(1,1),F1(1,1)],[F0(2,1),F1(2,1)],'k');
        %axis([0 1 0 40])
        xlabel({'$f_1(x)$'},'Interpreter','latex')
        ylabel({'$f_2(x)$'},'Interpreter','latex')
        title('BK1','fontname','Times New Roman','Color','k','FontSize',18)
        pause(0.1);
        hold on;
%                 plot3(F0(1,1),F0(2,1),F0(3,1),'Ok',F1(1,1),F1(2,1),F1(3,1),'r*','MarkerSize',4);
%                 plot3([F0(1,1),F1(1,1)],[F0(2,1),F1(2,1)],[F0(3,1),F1(3,1)],'k');
%                 %axis([0 1 0 40])
%                 xlabel({'$f_1(x)$'},'Interpreter','latex')
%                 ylabel({'$f_2(x)$'},'Interpreter','latex')
%                 zlabel({'$f_3(x)$'},'Interpreter','latex')
%                 title('AP1','fontname','Times New Roman','Color','k','FontSize',18)
%                 pause(0.1);
%                 hold on;
    end
    jj=jj+1;
    j1=j1+m;
end
