function f=f(x,d)
global m
global n
if d==1 %% BK1
    f1=x(1)^2+x(2)^2;
    f2=(x(1)-5)^2+(x(2)-5)^2;
    f=[f1;f2];    
elseif d==2%% DGO1
    f1=sin(x);
    f2=sin(x+0.7);
    f=[f1;f2];   
elseif d==3%% DGO2
    f1=x^2;
    f2=9-sqrt(81-x^2);
    f=[f1;f2];    
elseif d==4%% FF1
    f1=1-exp(-(x(1)-1)^2-(x(2)+1)^2);
    f2=1-exp(-(x(1)+1)^2-(x(2)-1)^2);
    f=[f1;f2];    
elseif d==5%%  JOS1A
    F1=0;
    for i=1:n
        a=x(i)^2/n;
        F1=F1+a;
    end
    f1=F1;
    F2=0;
    for i=1:n
        b=(x(i)-2)^2/n;
        F2=F2+b;
    end
    f2=F2;
    f=[f1;f2];   
elseif d==6%%  JOS1B
    F1=0;
    for i=1:n
        a=x(i)^2/n;
        F1=F1+a;
    end
    f1=F1;
    F2=0;
    for i=1:n
        b=(x(i)-2)^2/n;
        F2=F2+b;
    end
    f2=F2;
    f=[f1;f2];   
elseif d==7%%  JOS1c  
    F1=0;
    for i=1:n
        a=x(i)^2/n;
        F1=F1+a;
    end
    f1=F1;
    F2=0;
    for i=1:n
        b=(x(i)-2)^2/n;
        F2=F2+b;
    end
    f2=F2;
    f=[f1;f2];    
elseif d==8%%  LE1
    f1=(x(1)^2+x(2)^2)^0.125;
    f2=((x(1)-0.5)^2+(x(2)-0.5)^2)^0.25;
    f=[f1;f2];    
elseif d==9%%  MLF1
    f1=(1+x/20)*sin(x);
    f2=(1+x/20)*cos(x);
    f=[f1;f2];   
elseif d==10%%  MLF2
    f1=-(5-((x(1)^2+x(2)-11)^2+(x(1)+x(2)^2-7)^2)/200);
    f2=-(5-((4*x(1)^2+2*x(2)-11)^2+(2*x(1)+4*x(2)^2-7)^2)/200);
    f=[f1;f2];   
elseif d==11%%  T1
    f1=0.5*x(1)^2+x(2)^2-10*x(1)-100;
    f2=x(1)^2+0.5*x(2)^2-10*x(2)-100;
    f=[f1;f2];    
elseif d==12%%  T2
    f1=sin(x(2));
    f2=1-exp(-(x(1)-1/sqrt(2))^2-(x(2)-1/sqrt(2))^2);
    f=[f1;f2];  
elseif d==13 %%  T6
    f1=-log(x(1))-log(x(2));
    f2=x(1)^2+x(2);
    f=[f1;f2];   
elseif d==14%%  SP1
    f1=(x(1)-1)^2+(x(1)-x(2))^2;
    f2=(x(2)-3)^2+(x(1)-x(2))^2;
    f=[f1;f2];   
elseif d==15%%  SSFYY1
    f1=x(1)^2+x(2)^2;
    f2=(x(1)-1)^2+(x(2)-2)^2;
    f=[f1;f2];   
elseif d==16%%  SSFYY2
    f1=10+x^2-10*cos(x*pi/2);
    f2=(x-4)^2;
    f=[f1;f2];   
elseif d==17%%  SK1
    f1=-(-x^4-3*x^3+10*x^2+10*x+10);
    f2=-(-0.5*x^4+2*x^3+10*x^2-10*x+5);
    f=[f1;f2];   
elseif d==18%% SK2
    f1=(x(1)-2)^2+(x(2)+3)^2+(x(3)-5)^2+(x(4)-4)^2-5;
    b=x(1)^2+x(2)^2+x(3)^2+x(4)^2;
    f2=-((sin(x(1))+sin(x(2))+sin(x(3))+sin(x(4)))/(1+b/100));
    f=[f1;f2];  
elseif d==19 %%  VU1
    f1=1/(x(1)^2+x(2)^2+1);
    f2=x(1)^2+3*x(2)^2+1;
    f=[f1;f2];   
elseif d==20 %%  MOP1
    f1=x^2;
    f2=(x-2)^2;
    f=[f1;f2];    
elseif d==21%%  MOP2
    f1=0;
    for i=1:n
        a=(x(i)-1/sqrt(n))^2;
        f1=f1+a;
    end
    f1=1-exp(-f1);
    f2=0;
    for i=1:n
        b=(x(i)+1/sqrt(n))^2;
        f2=f2+b;
    end
    f2=1-exp(-f2);
    f=[f1;f2];   
elseif d==22%%  MOP3
    A1=0.5*sin(1)-2*cos(1)+sin(2)-1.5*cos(2);
    A2=1.5*sin(1)-cos(1)+2*sin(2)-0.5*cos(2);
    B1=0.5*sin(x(1))-2*cos(x(1))+sin(x(2))-1.5*cos(x(2));
    B2=1.5*sin(x(1))-cos(x(1))+2*sin(x(2))-0.5*cos(x(2));
    f1=-(-1-(A1-B1)^2-(A2-B2)^2);
    f2=-(-(x(1)+3)^2-(x(2)+1)^2);
    f=[f1;f2];
elseif d==23%%  DD1
    f1=x(1)^2+x(2)^2+x(3)^2+x(4)^2+x(5)^2;
    f2=3*x(1)+2*x(2)-x(3)/3+0.01*(x(4)-x(5))^3;
    f=[f1;f2];   
elseif d==24%%  KW2
    a1=3*(1-x(1))^2;b1=-x(1)^2-(x(2)+1)^2;c1=10*(x(1)/5-x(1)^3-x(2)^5);
    d1=-x(1)^2-x(2)^2;e1=-(x(1)+2)^2-x(2)^2;f1=0.5*(2*x(1)+x(2));
    f1=-(a1*exp(b1)-c1*exp(d1)-3*exp(e1)+f1);
    a2=3*(1+x(2))^2;b2=-x(2)^2-(1-x(1))^2;c2=10*(-x(2)/5+x(2)^3+x(1)^5);
    d2=-x(2)^2-x(1)^2;e2=-(2-x(2))^2-x(1)^2;
    f2=-(a2*exp(b2)-c2*exp(d2)-3*exp(e2));
    f=[f1;f2];  
elseif d==25%%  TOI4
    f1=x(1)^2+x(2)^2+1;
    f2=0.5*((x(1)-x(2))^2+(x(3)-x(4))^2)+1;
    f=[f1;f2];    
elseif d==26%%  Hil1
    a=(2*pi/360)*(45+40*sin(2*pi*x(1))+25*sin(2*pi*x(2)));
    b=1+0.5*cos(2*pi*x(1));
    f1=b*cos(a);
    a=(2*pi/360)*(45+40*sin(2*pi*x(1))+25*sin(2*pi*x(2)));
    b=1+0.5*cos(2*pi*x(1));
    f2=b*sin(a);
    f=[f1;f2];   
elseif d==27%%  PNR
    c=10;d=0.25;
    f1=x(1)^4+x(2)^4+x(1)^2+x(2)^2+c*x(1)*x(2)+d*x(1)+20;
    k=1;
    l=0;
    f2=(x(1)-k)^2+(x(2)-l)^2;
    f=[f1;f2];  
elseif d==28 %ap2 
    f1=x^2-4;
    f2=(x-1)^2;
    f=[f1;f2];    
elseif d==29  %ap3 
    f1=1/4*((x(1)-4)^4+2*(x(2)-2)^4);
    f2=(x(2)-x(1)^2)^2+(1-x(1))^2;
    f=[f1;f2];   
elseif d==30  %lov5  
    M=[-1,-0.03,0.011;-0.03,-1,0.07;0.011,0.07,-1.01];
    ff=sqrt(2*pi/0.35)*exp(([x(1);x(2)-0.15;x(3)]'*M*[x(1);x(2)-0.15;x(3)])/0.35^2)+sqrt(2*pi/3)*exp(([x(1);x(2)+1.1;0.5*x(3)]'*M*[x(1);x(2)+1.1;0.5*x(3)])/3^2);
    f1=sqrt(2)/2*x(1)+sqrt(2)/2*ff;
    M=[-1,-0.03,0.011;-0.03,-1,0.07;0.011,0.07,-1.01];
    ff=sqrt(2*pi/0.35)*exp(([x(1);x(2)-0.15;x(3)]'*M*[x(1);x(2)-0.15;x(3)])/0.35^2)+sqrt(2*pi/3)*exp(([x(1);x(2)+1.1;0.5*x(3)]'*M*[x(1);x(2)+1.1;0.5*x(3)])/3^2);
    f2=-sqrt(2)/2*x(1)+sqrt(2)/2*ff;
    f=[f1;f2];   
elseif d==31 % LRS1
    f1=x(1)^2+x(2)^2;
    f2=(x(1)+2)^2+x(2)^2;
    f=[f1;f2];    
elseif d==32  %% IKK1
    f1=x(1)^2;
    f2=(x(1)-20)^2;
    f3=x(2)^2;
    f=[f1;f2;f3];
elseif d==33   %  MHHM1
    f1=(x-0.8)^2;
    f2=(x-0.85)^2;
    f3=(x-0.9)^2;
    f=[f1;f2;f3];    
elseif d==34 %%  MHHM2
    f1=(x(1)-0.8)^2+(x(2)-0.6)^2;
    f2=(x(1)-0.85)^2+(x(2)-0.7)^2;
    f3=(x(1)-0.9)^2+(x(2)-0.6)^2;
    f=[f1;f2;f3];   
elseif d==35%%  VFM1
    f1=x(1)^2+(x(2)-1)^2;
    f2=x(1)^2+(x(2)+1)^2+1;
    f3=(x(1)-1)^2+x(2)^2+2;
    f=[f1;f2;f3];    
elseif d==36%%  ZLT1 
    f1=(x(1)-1)^2+x(2)^2+x(3)^2;
    f2=(x(2)-1)^2+x(1)^2+x(3)^2;
    f3=(x(3)-1)^2+x(1)^2+x(2)^2;
    f=[f1;f2;f3];    
elseif d==37%  T8
    f1=0;
    for i=1:n
        a=x(i)^3;
        f1=f1+a;
    end
    F2=0;
    for i=1:n-1
        b=(x(i)-4)^2;
        F2=F2+b;
    end
    f2=F2+x(n)^2;
    F3=0;
    for i=2:n
        c=5*x(i)^2;
        F3=F3+c;
    end
    f3=-log(x(1))+F3;
    f=[f1;f2;f3];    
elseif d==38%%  T8
    f1=0;
    for i=1:n
        a=x(i)^3;
        f1=f1+a;
    end
    F2=0;
    for i=1:n-1
        b=(x(i)-4)^2;
        F2=F2+b;
    end
    f2=F2+x(n)^2;
    F3=0;
    for i=2:n
        c=5*x(i)^2;
        F3=F3+c;
    end
    f3=-log(x(1))+F3;
    f=[f1;f2;f3];    
elseif d==39%%  T8
    f1=0;
    for i=1:n
        a=x(i)^3;
        f1=f1+a;
    end
    F2=0;
    for i=1:n-1
        b=(x(i)-4)^2;
        F2=F2+b;
    end
    f2=F2+x(n)^2;
    F3=0;
    for i=2:n
        c=5*x(i)^2;
        F3=F3+c;
    end
    f3=-log(x(1))+F3;
    f=[f1;f2;f3];  
elseif d==40%%  MOP5
    f1=0.5*(x(1)^2+x(2)^2)+sin(x(1)^2+x(2)^2);
    f2=(3*x(1)-2*x(2)+4)^2/8+(x(1)-x(2)+1)^2/27+15;
    f3=1/(x(1)^2+x(2)^2+1)-1.1*exp(-x(1)^2-x(2)^2);
    f=[f1;f2;f3];   
elseif d==41 %%  MOP7
    f1=(x(1)-2)^2/2+(x(2)+1)^2/13+3;
    f2=(x(1)+x(2)-3)^2/36+(-x(1)+x(2)+2)^2/8-17;
    f3=(x(1)+2*x(2)-1)^2/175+(-x(1)+2*x(2))^2/17-13;
    f=[f1;f2;f3];   
elseif d==42%%  FDS
    F1=0;
    for i=1:n
        a=i*(x(i)-i)^4;
        F1=a+F1;
    end
    f1=F1/n^2;
    F2=0;
    for i=1:n
        a=x(i)/n;
        F2=a+F2;
    end
    f2=exp(F2)+norm(x,2)^2;
    F3=0;
    for i=1:n
        a=i*(n-i+1)*exp(-x(i));
        F3=a+F3;
    end
    f3=F3/(n*(n+1));
    f=[f1;f2;f3];    
elseif d==43%%  FDS
    F1=0;
    for i=1:n
        a=i*(x(i)-i)^4;
        F1=a+F1;
    end
    f1=F1/n^2;
    F2=0;
    for i=1:n
        a=x(i)/n;
        F2=a+F2;
    end
    f2=exp(F2)+norm(x,2)^2;
    F3=0;
    for i=1:n
        a=i*(n-i+1)*exp(-x(i));
        F3=a+F3;
    end
    f3=F3/(n*(n+1));
    f=[f1;f2;f3]; 
elseif d==44 %%  FDS
    F1=0;
    for i=1:n
        a=i*(x(i)-i)^4;
        F1=a+F1;
    end
    f1=F1/n^2;
    F2=0;
    for i=1:n
        a=x(i)/n;
        F2=a+F2;
    end
    f2=exp(F2)+norm(x,2)^2;
    F3=0;
    for i=1:n
        a=i*(n-i+1)*exp(-x(i));
        F3=a+F3;
    end
    f3=F3/(n*(n+1));
    f=[f1;f2;f3];    
elseif d==45  %SLCDT2 
    f11=0;
    for i=2:10
        f12=(x(i)-1)^2;
        f11=f12+f11;
    end
    f1=f11+(x(1)-1)^4;
    f12=0;
    for i=3:10
        f13=(x(i)+1)^2;
        f12=f13+f12;
    end
    f2=f12+(x(1)+1)^2+(x(2)+1)^4;
    f3=(x(1)-1)^2+(x(2)+1)^2+(x(3)-1)^4+(x(4)+1)^2+(x(5)-1)^2+(x(6)+1)^2+(x(7)-1)^2+(x(8)+1)^2+(x(9)-1)^2+(x(10)+1)^2;
    f=[f1;f2;f3];    
elseif d==46 % toi8
    f1=(2*x(1)-1)^2;
    f2=2*(2*x(1)-x(2))^2;
    f3=3*(2*x(2)-x(3))^2;
    f=[f1;f2;f3];    
elseif d==47 %ap1 
    f1=1/4*((x(1)-1)^4+2*(x(2)-4)^4);
    f2=exp((x(1)+x(2))/2)+x(1)^2+x(2)^2;
    f3=1/6*(exp(-x(1))+2*exp(-x(2)));
    f=[f1;f2;f3];
elseif d==48   %toi9
    f=[];
    f1=(2*x(1)-1)^2+x(2)^2;
    f=[f;f1];
    for i=2:m-1
        ff=i*(2*x(i-1)-x(i))^2-(i-1)*x(i-1)^2+i*x(i)^2;
        f=[f;ff];
    end
    fm=m*(2*x(m-1)-x(m))^2-(m-1)*x(m-1)^2;
    f=[f;fm];
elseif d==49     %Toi9
    f=[];
    f1=(2*x(1)-1)^2+x(2)^2;
    f=[f;f1];
    for i=2:m-1
        ff=i*(2*x(i-1)-x(i))^2-(i-1)*x(i-1)^2+i*x(i)^2;
        f=[f;ff];
    end
    fm=m*(2*x(m-1)-x(m))^2-(m-1)*x(m-1)^2;
    f=[f;fm];
elseif d==50    % Toi9
    f=[];
    f1=(2*x(1)-1)^2+x(2)^2;
    f=[f;f1];
    for i=2:m-1
        ff=i*(2*x(i-1)-x(i))^2-(i-1)*x(i-1)^2+i*x(i)^2;
        f=[f;ff];
    end
    fm=m*(2*x(m-1)-x(m))^2-(m-1)*x(m-1)^2;
    f=[f;fm];  
elseif d==51 %mgh33 
    a=0;
    for j=1:10
        a1=j*x(j);
        a=a+a1;
    end
    f=[];
    for i=1:m
        f1=(i*a-1)^2;
        f=[f;f1];
    end  
elseif d==52%%  JOS1A
    F1=0;
    for i=1:n
        a=x(i)^2/n;
        F1=F1+a;
    end
    f1=F1;
    F2=0;
    for i=1:n
        b=(x(i)-2)^2/n;
        F2=F2+b;
    end
    f2=F2;
    f=[f1;f2];    
elseif d==53  %%  JOS1
    F1=0;
    for i=1:n
        a=x(i)^2/n;
        F1=F1+a;
    end
    f1=F1;
    F2=0;
    for i=1:n
        b=(x(i)-2)^2/n;
        F2=F2+b;
    end
    f2=F2;
    f=[f1;f2];   
elseif d==54%%  JOS1
    F1=0;
    for i=1:n
        a=x(i)^2/n;
        F1=F1+a;
    end
    f1=F1;
    F2=0;
    for i=1:n
        b=(x(i)-2)^2/n;
        F2=F2+b;
    end
    f2=F2;
    f=[f1;f2];  
elseif d==55%%  JOS1
    F1=0;
    for i=1:n
        a=x(i)^2/n;
        F1=F1+a;
    end
    f1=F1;
    F2=0;
    for i=1:n
        b=(x(i)-2)^2/n;
        F2=F2+b;
    end
    f2=F2;
    f=[f1;f2];    
elseif d==56%%  JOS1
    F1=0;
    for i=1:n
        a=x(i)^2/n;
        F1=F1+a;
    end
    f1=F1;
    F2=0;
    for i=1:n
        b=(x(i)-2)^2/n;
        F2=F2+b;
    end
    f2=F2;
    f=[f1;f2];   
elseif d==57%  JOS1
    F1=0;
    for i=1:n
        a=x(i)^2/n;
        F1=F1+a;
    end
    f1=F1;
    F2=0;
    for i=1:n
        b=(x(i)-2)^2/n;
        F2=F2+b;
    end
    f2=F2;
    f=[f1;f2];    
elseif d==58%%  JOS1
    F1=0;
    for i=1:n
        a=x(i)^2/n;
        F1=F1+a;
    end
    f1=F1;
    F2=0;
    for i=1:n
        b=(x(i)-2)^2/n;
        F2=F2+b;
    end
    f2=F2;
    f=[f1;f2]; 
elseif d==59%%  JOS1
    F1=0;
    for i=1:n
        a=x(i)^2/n;
        F1=F1+a;
    end
    f1=F1;
    F2=0;
    for i=1:n
        b=(x(i)-2)^2/n;
        F2=F2+b;
    end
    f2=F2;
    f=[f1;f2];   
elseif d==60%%  JOS1
    F1=0;
    for i=1:n
        a=x(i)^2/n;
        F1=F1+a;
    end
    f1=F1;
    F2=0;
    for i=1:n
        b=(x(i)-2)^2/n;
        F2=F2+b;
    end
    f2=F2;
    f=[f1;f2];  
elseif d==61%%  JOS1
    F1=0;
    for i=1:n
        a=x(i)^2/n;
        F1=F1+a;
    end
    f1=F1;
    F2=0;
    for i=1:n
        b=(x(i)-2)^2/n;
        F2=F2+b;
    end
    f2=F2;
    f=[f1;f2];
   elseif d==62%%  JOS1
    F1=0;
    for i=1:n
        a=x(i)^2/n;
        F1=F1+a;
    end
    f1=F1;
    F2=0;
    for i=1:n
        b=(x(i)-2)^2/n;
        F2=F2+b;
    end
    f2=F2;
    f=[f1;f2];  
elseif d==63%%  JOS1
    F1=0;
    for i=1:n
        a=x(i)^2/n;
        F1=F1+a;
    end
    f1=F1;
    F2=0;
    for i=1:n
        b=(x(i)-2)^2/n;
        F2=F2+b;
    end
    f2=F2;
    f=[f1;f2]; 
elseif d==64%%  JOS1
    F1=0;
    for i=1:n
        a=x(i)^2/n;
        F1=F1+a;
    end
    f1=F1;
    F2=0;
    for i=1:n
        b=(x(i)-2)^2/n;
        F2=F2+b;
    end
    f2=F2;
    f=[f1;f2];  
elseif d==65%%  JOS1
    F1=0;
    for i=1:n
        a=x(i)^2/n;
        F1=F1+a;
    end
    f1=F1;
    F2=0;
    for i=1:n
        b=(x(i)-2)^2/n;
        F2=F2+b;
    end
    f2=F2;
    f=[f1;f2];   
elseif d==66%%  JOS1
    F1=0;
    for i=1:n
        a=x(i)^2/n;
        F1=F1+a;
    end
    f1=F1;
    F2=0;
    for i=1:n
        b=(x(i)-2)^2/n;
        F2=F2+b;
    end
    f2=F2;
    f=[f1;f2]; 
elseif d==67%%  JOS1
    F1=0;
    for i=1:n
        a=x(i)^2/n;
        F1=F1+a;
    end
    f1=F1;
    F2=0;
    for i=1:n
        b=(x(i)-2)^2/n;
        F2=F2+b;
    end
    f2=F2;
    f=[f1;f2];   
elseif d==68%%  JOS1
    F1=0;
    for i=1:n
        a=x(i)^2/n;
        F1=F1+a;
    end
    f1=F1;
    F2=0;
    for i=1:n
        b=(x(i)-2)^2/n;
        F2=F2+b;
    end
    f2=F2;
    f=[f1;f2];  
elseif d==69%  JOS1
    F1=0;
    for i=1:n
        a=x(i)^2/n;
        F1=F1+a;
    end
    f1=F1;
    F2=0;
    for i=1:n
        b=(x(i)-2)^2/n;
        F2=F2+b;
    end
    f2=F2;
    f=[f1;f2];   
elseif d==70%%  JOS1
    F1=0;
    for i=1:n
        a=x(i)^2/n;
        F1=F1+a;
    end
    f1=F1;
    F2=0;
    for i=1:n
        b=(x(i)-2)^2/n;
        F2=F2+b;
    end
    f2=F2;
    f=[f1;f2];   
elseif d==71%%  JOS1
    F1=0;
    for i=1:n
        a=x(i)^2/n;
        F1=F1+a;
    end
    f1=F1;
    F2=0;
    for i=1:n
        b=(x(i)-2)^2/n;
        F2=F2+b;
    end
    f2=F2;
    f=[f1;f2];   
    elseif d==72 %%  JOS1
    F1=0;
    for i=1:n
        a=x(i)^2/n;
        F1=F1+a;
    end
    f1=F1;
    F2=0;
    for i=1:n
        b=(x(i)-2)^2/n;
        F2=F2+b;
    end
    f2=F2;
    f=[f1;f2];   
elseif d==73%%  JOS1
    F1=0;
    for i=1:n
        a=x(i)^2/n;
        F1=F1+a;
    end
    f1=F1;
    F2=0;
    for i=1:n
        b=(x(i)-2)^2/n;
        F2=F2+b;
    end
    f2=F2;
    f=[f1;f2];   
elseif d==74%%  JOS1
    F1=0;
    for i=1:n
        a=x(i)^2/n;
        F1=F1+a;
    end
    f1=F1;
    F2=0;
    for i=1:n
        b=(x(i)-2)^2/n;
        F2=F2+b;
    end
    f2=F2;
    f=[f1;f2];  
elseif d==75%%  JOS1
    F1=0;
    for i=1:n
        a=x(i)^2/n;
        F1=F1+a;
    end
    f1=F1;
    F2=0;
    for i=1:n
        b=(x(i)-2)^2/n;
        F2=F2+b;
    end
    f2=F2;
    f=[f1;f2]; 
elseif d==76%%  JOS1
    F1=0;
    for i=1:n
        a=x(i)^2/n;
        F1=F1+a;
    end
    f1=F1;
    F2=0;
    for i=1:n
        b=(x(i)-2)^2/n;
        F2=F2+b;
    end
    f2=F2;
    f=[f1;f2]; 
elseif d==77%%  JOS1
    F1=0;
    for i=1:n
        a=x(i)^2/n;
        F1=F1+a;
    end
    f1=F1;
    F2=0;
    for i=1:n
        b=(x(i)-2)^2/n;
        F2=F2+b;
    end
    f2=F2;
    f=[f1;f2];   
elseif d==78%%  JOS1
    F1=0;
    for i=1:n
        a=x(i)^2/n;
        F1=F1+a;
    end
    f1=F1;
    F2=0;
    for i=1:n
        b=(x(i)-2)^2/n;
        F2=F2+b;
    end
    f2=F2;
    f=[f1;f2];
elseif d==79%%  JOS1
    F1=0;
    for i=1:n
        a=x(i)^2/n;
        F1=F1+a;
    end
    f1=F1;
    F2=0;
    for i=1:n
        b=(x(i)-2)^2/n;
        F2=F2+b;
    end
    f2=F2;
    f=[f1;f2];
elseif d==80%%  JOS1
    F1=0;
    for i=1:n
        a=x(i)^2/n;
        F1=F1+a;
    end
    f1=F1;
    F2=0;
    for i=1:n
        b=(x(i)-2)^2/n;
        F2=F2+b;
    end
    f2=F2;
    f=[f1;f2];
elseif d==81%%  JOS1
    F1=0;
    for i=1:n
        a=x(i)^2/n;
        F1=F1+a;
    end
    f1=F1;
    F2=0;
    for i=1:n
        b=(x(i)-2)^2/n;
        F2=F2+b;
    end
    f2=F2;
    f=[f1;f2];   
end
