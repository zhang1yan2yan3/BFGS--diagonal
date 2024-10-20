clear,clc
%% 璇诲彇鏁版嵁
global m
global n
Loop=200;
h=5;
j=1;
j1=1;
Rloopk=zeros(Loop,h);
Rloopnf=zeros(Loop,h);
Rloopng=zeros(Loop,h);
Rloopt=zeros(Loop,h);
Rloopnhev=zeros(Loop,h);
for d=1:81
    for iLoop=1:200
        tic;
        nhev=1;
        k=1;
        nf=1;
        ng=1;
        epsilon = 2.22e-16;
        S1=chushi1(d);
        BP1 = struct2cell(S1);
        Mymat1 = cell2mat(BP1);
        xk=Mymat1(1:n,iLoop);
        R=g(xk,d);
        r=[];
        for i=1:m
            r1=1/max(1,norm(R(i,1:n),inf));
            r=[r,r1];
        end
        r1=repmat(r',1,n);
        r2=zeros(n*m,1);
        for i=1:m
            r2(n*(i-1)+1:n*i,1)=r(i);
        end
        while 1
            F=r'.*f(xk,d);
            nf=nf+1;
            G=g(xk,d).*r1;
            ng=ng+1;
            B=r2.*hf(xk,d);
            xx=ones(n+1,1);
            fun = @(x)x(n+1);
            nonlcon=@(x)circlecon(x,G,B,m,n);
            options = optimoptions('fmincon','Display','iter','Algorithm','sqp');%,'Algorithm','sqp'
            [dd,fval,exitflag,output,lambda] = fmincon(fun,xx,[],[],[],[],[],[],nonlcon,options);
            nhev=nhev+1;
            thetak=fval;
            dk=dd(1:n);
            if abs(thetak)<=5*sqrt(epsilon)
                break
            end
            %% armijo 
            [alphak,nf]=armijo311_d(xk,dk,thetak,nf,F,r1,r,m,d)
            x1=xk+alphak*dk;
            if  k>=2000
                nhev=nan;
                k=nan;
                nf=nan;
                ng=nan;
                break
            end
            k=k+1;
            xk=x1;
        end
        t=toc;
        FF1=f(xk,d)';
        Rloopk(iLoop,j)=k;
        Rloopnf(iLoop,j)=nf;
        Rloopng(iLoop,j)=ng;
        Rloopt(iLoop,j)=t;
        Rloopnhev(iLoop,j)=nhev;
        Rloopchu(iLoop,j1:j1+m-1)=FF1;
    end
    j=j+1;
    j1=j1+m;
end
