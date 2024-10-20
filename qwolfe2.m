%%  鍚戦噺浼樺寲鐨刉olfe绾挎悳绱?
function [alphak,nf,ng]=qwolfe(xk,dk,F,G,nf,ng,r,r1,m,n,d)
rho=1e-4;
sigma=0.1;
delta=1.1;
epsiki=0.7;
alphakmin=1e-15;
rhoba=min(1.1*rho,0.75*rho+0.25*sigma);
sigmaba=max(0.9*sigma,0.25*rho+0.75*sigma);
s=0;
smax=100;
alphakmin=1e-15;
alphamax=10^10;
alphak=1;
while (s<smax)   %alphak<alphamax 
    F1=r'.*f(xk,d);
    G1=g(xk,d).*r1;
    F2=r'.*f(xk+alphak*dk,d);
    G2=g(xk+alphak*dk,d).*r1;
    nf=nf+1;
    ng=ng+1;
    z1=0;
    for cc=1:m
    if  F2(cc)<=F1(cc)+(alphak*rho*max(G1*dk)) && sigma*max(G1*dk)<=(max(G2*dk)) && (max(G2*dk))<=epsiki       %   (max(G2*dk)>=sigma*max(G1*dk) && max(G2*dk)<=epsiki)
       z1=z1+1;
    end
    end
    if z1==m
        break
    end
    F3=r'.*f(xk+alphamax*dk,d);
    G3=g(xk+alphamax*dk,d).*r1;
    nf=nf+1;
    ng=ng+1;
    z2=0;
    for cc=1:m
        g3dk=G3*dk;
    if  F3(cc)<=F1(cc)+(alphamax*rho*max(G1*dk)) && g3dk(cc)<(sigma*max(G1*dk))
        z2=z2+1;
    end
    end
    if z2==m
       alphak=alphamax; 
        break
    end
    for i=1:m+1
        if i<=m
        if F2(i)>F1(i)+alphak*rho*max(G1*dk) || G2(i,1:n)*dk>epsiki
            alphamax=alphak;
            [alphak,nf,ng]=dwolfe2(xk,dk,alphamax,epsiki,sigmaba,rhoba,nf,ng,i,r,r1,n,d);
            break
        end
        else
            alphak=(min(delta*alphak,alphamax)+alphamax)/2;
        end
    end
    s=s+1;
    if alphak<=alphakmin
            alphak=alphakmin;
            break
    end
end