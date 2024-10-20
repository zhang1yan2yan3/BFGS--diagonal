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
        yita=0.85;
        qk=1;
        eps=2.22e-16;
        belta=1e-3;
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
        Ck=F;
        B=zeros(n*m,n);
        BK=repmat(eye(n),m,1);
        
        %% LOOP
        %% 计算sitak,dsd
        H=zeros(n+1,n+1);
        H(2:n+1,2:n+1)=eye(n);
        ff=zeros(n+1,1);
        ff(1,1)=1;
        G=g(xk,d).*r1;
        ng=ng+1;
        A=zeros(m,n+1);
        A(1:m,2:n+1)=G;
        h=-1*ones(m,1);
        A(1:m,1)=h;
        b=zeros(m,1);
        xx=ones(n+1,1);
        [dd,thetak]= quadprog(H,ff,A,b,[],[],[],[],xx);
        nhev=nhev+1;
        dk=dd(2:n+1);
        while 1
            if abs(thetak)<=5*sqrt(eps)
                break
            end
            
            %% armijo 搜索
            [alphak,nf]=armijo31_d(xk,dk,thetak,nf,Ck,r1,r,m,d)
            x1=xk+alphak*dk;
            F1=r'.*f(x1,d);
            nf=nf+1;
            G1=g(x1,d).*r1;
            ng=ng+1;
            %% 更新qk,Ck
            qk1=yita*qk+1;
            Ck1=(yita*qk/qk1)*Ck+(1/qk1)*F1;
            %%
            for j=1:m
                gj=G(j,:)';
                gj1=G1(j,:)';
                yk=gj1-gj;
                sk=x1-xk;
                Bk=BK(n*(j-1)+1:n*j,1:n);
                BS=(Bk*sk*sk'*Bk)/(sk'*Bk*sk);
                YS=(yk*yk')/(yk'*sk);
                BK1=Bk-BS+YS;
                while 1
                    if all(eig(BK1)>0)
                        B(n*(j-1)+1:n*j,1:n)=BK1;
                        break
                    else
                        Aii=min(diag(BK1));
                        if Aii>0
                            mu=0;
                        else
                            mu=-Aii+belta;
                        end
                        while 1
                            BK1=BK1+eye(n)*mu;
                            if all(eig(BK1)>0)
                                B(n*(j-1)+1:n*j,1:n)=BK1;
                                break
                            else
                                mu=max(2*mu,belta);
                            end
                        end
                    end
                end
            end
            %%  求解dN,thetaN,lamdaN
            xx=zeros(n+1,1);
            fun = @(x)x(n+1);
            nonlcon=@(x)circlecon(x,G1,B,m,n);
            options = optimoptions('fmincon','Display','iter','Algorithm','sqp');%,'Algorithm','sqp'
            [dd,fval,exitflag,output,lambda] = fmincon(fun,xx,[],[],[],[],[],[],nonlcon,options);
            dk=dd(1:n);
            nhev=nhev+1;
            thetak=fval;
            if  k>=2000
                nhev=nan;
                k=nan;
                nf=nan;
                ng=nan;
                break
            end
            k=k+1;
            xk=x1;
            qk=qk1;
            Ck=Ck1;
            BK=B;
            G=G1;
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
