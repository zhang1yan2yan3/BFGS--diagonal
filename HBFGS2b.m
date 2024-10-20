clear,clc
%% Read data
global m
global n
Loop=200;
h=1;
jj=1;
j1=1;
Rloopk=zeros(Loop,h);
Rloopnf=zeros(Loop,h);
Rloopng=zeros(Loop,h);
Rloopt=zeros(Loop,h);
Rloopnhev=zeros(Loop,h);
Rloopchu=zeros(Loop,h);
for d=1:81
    for iLoop=1:200
        tic;
        nhev=1;
        k=1;
        nf=1;
        ng=1;
        eps=2.22e-16;
        S1=chushi1(d);
        BP1 = struct2cell(S1);
        Mymat1 = cell2mat(BP1);
        xk=Mymat1(1:n,iLoop);
        R=g(xk,d);
        ng=ng+1;
        r=[];
        for i=1:m
            r1=1/max(1,norm(R(i,1:n),inf));
            r=[r,r1];
        end
        r1=repmat(r',1,n);
        F=r'.*f(xk,d);
        nf=nf+1;
        G=g(xk,d).*r1;
        ng=ng+1;
        BK=eye(n);
        I=eye(n);
        while 1
            HK=inv(BK);
            H=G*HK*G';
            H1=(H+H')/2;
            ff=zeros(m,1);
            Aeq=ones(1,m);
            beq=1;
            lb=zeros(m,1);
            ub=ones(m,1);
            options = optimoptions('quadprog','Display','iter');
            [lammda,fval] = quadprog(H1,ff,[],[],Aeq,beq,lb,ub,[],options);
            nhev=nhev+1;
            thetak=-fval;
            dk=-HK*G'*lammda;
            if abs(thetak)<=5*sqrt(eps)
                break
            end
            %% Wolfe线搜索
            [alphak,nf,ng]=qwolfe(xk,dk,F,G,nf,ng,r,r1,m,n,d);
            x1=xk+alphak*dk;
            F1=r'.*f(x1,d);
            nf=nf+1;
            G1=g(x1,d).*r1;
            ng=ng+1;             
            %% 更新
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
            F=F1;
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
    end
    jj=jj+1;
    j1=j1+m;
end
