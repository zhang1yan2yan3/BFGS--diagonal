function S1=chushi1(d)
global m
global n
if d==1
    S1 = load('BK1.mat');
    m=2;
    n=2;
elseif d==2
    m=2;
    S1 = load('DG01.mat');
    n=1;
elseif d==3
    m=2;
    S1 = load('DG02.mat');
    n=1;
elseif d==4
    m=2;
    S1 = load('FF12.mat');
    n=2;
elseif d==5
    m=2;
    S1 = load('JOS1A2.mat');
elseif d==6
    m=2;
    S1 = load('JOS1B2.mat');
    n=2;
elseif d==7
    m=2;
    S1 = load('JOS1C2.mat');
    n=2;
elseif d==8
    m=2;
    S1 = load('LE1.mat');
    n=2;
elseif d==9
    m=2;
    S1 = load('MLF1.mat');
    n=1;
elseif d==10
    m=2;
    S1 = load('MLF2.mat');
    n=2;
elseif d==11
    m=2;
    S1 = load('T1.mat');
    n=2;
elseif d==12
    m=2;
    S1 = load('T27.mat');
    n=2;
elseif d==13
    m=2;
    S1 = load('T6.mat');
    n=2;
elseif d==14
    m=2;
    S1 = load('SP1.mat');
    n=2;
elseif d==15
    m=2;
    S1 = load('SSFYY1.mat');
    n=2;
elseif d==16
    m=2;
    S1 = load('SSFYY2.mat');
    n=1;
elseif d==17
    m=2;
    S1 = load('SK1.mat');
    n=1;
elseif d==18
    m=2;
    S1 = load('SK2.mat');
    n=4;
elseif d==19
    m=2;
    S1 = load('VU1.mat');
    n=2;
elseif d==20
    m=2;
    S1 = load('MOP1.mat');
    n=1;
elseif d==21
    m=2;
    S1 = load('MOP2.mat');
    n=2;
elseif d==22
    m=2;
    S1 = load('MOP37.mat');
    n=2;
elseif d==23
    m=2;
    S1 = load('DD1.mat');
    n=5;
elseif d==24
    m=2;
    S1 = load('KW2.mat');
    n=2;
elseif d==25
    m=2;
    S1 = load('TOI4.mat');
    n=4;
elseif d==26
    m=2;
    S1 = load('Hil1.mat');
    n=2;
elseif d==27
    m=2;
    S1 = load('PNR.mat');
    n=2;
elseif d==28
    m=2;
    S1 = load('AP2.mat');
    n=1;
elseif d==29
    m=2;
    S1 = load('AP3.mat');
    n=2;
elseif d==30
    m=2;
    S1 = load('LOV5.mat');
    n=3;
elseif d==31
    m=2;
    S1 = load('LRS1.mat');
    n=2;
elseif d==32
    m=3;
    S1 = load('IKK1.mat');
    n=2;
elseif d==33
    m=3;
    S1 = load('MHHM1.mat');
    n=1;
elseif d==34
    m=3;
    S1 = load('MHHM2.mat');
    n=2;
elseif d==35
    m=3;
    S1 = load('VFM1.mat');
    n=2;
elseif d==36
    m=3;
    S1 = load('ZLT1.mat');
    n=3;
elseif d==37
    m=3;
    S1 = load('T8157.mat');
    n=15;
elseif d==38
    m=3;
    S1 = load('T830.mat');
    n=30;
elseif d==39
    m=3;
    S1 = load('T850.mat');
    n=50;
elseif d==40
    m=3;
    S1 = load('MOP5.mat');
    n=2;
elseif d==41
    m=3;
    S1 = load('MOP7.mat');
    n=2;
elseif d==42
    m=3;
    S1 = load('FDS.mat');
    n=10;
elseif d==43
    m=3;
    S1 = load('FDS1007.mat');  
    n=20;
elseif d==44
    m=3;
    S1 = load('FDS2000.mat');
    n=50;
elseif d==45
    m=3;
    S1 = load('SLCDT27.mat');
    n=10;
elseif d==46
    m=3;
    S1 = load('TRI.mat');
    n=3;
elseif d==47
    m=3;
    S1 = load('AP1.mat');
    n=2;
elseif d==48   
    m=4;
    n=4;
    S1 = load('TRIDIA4.mat');
elseif d==49
    m=24;
    n=24;
    S1 = load('TRIDIA24.mat');
elseif d==50
    m=13;
    n=13;
    S1 = load('TRIDIA2.mat');
elseif d==51
    m=10;
    n=10;
    S1 = load('MGH33.mat');
    elseif d==52
    m=2;
    S1 = load('JOS1A5.mat');
    n=5;
    elseif d==53
    m=2;
    S1 = load('JOS1A10.mat');
    n=10;
    elseif d==54
    m=2;
    S1 = load('JOS1A20.mat');
    n=20;
    elseif d==55
    m=2;
    S1 = load('JOS1A30.mat');
    n=30;
    elseif d==56
    m=2;
    S1 = load('JOS1A40.mat');
    n=40;
    elseif d==57
    m=2;
    S1 = load('JOS1A50.mat');
    n=50;
    elseif d==58
    m=2;
    S1 = load('JOS1A100.mat');
    n=100;
    elseif d==59
    m=2;
    S1 = load('JOS1A200.mat');
    n=200;
    elseif d==60
    m=2;
    S1 = load('JOS1A500.mat');
    n=500;
    elseif d==61
    m=2;
    S1 = load('JOS1A1000.mat');
    n=1000;
     elseif d==62
    m=2;
    S1 = load('JOS1B5.mat');
    n=5;
    elseif d==63
    m=2;
    S1 = load('JOS1B10.mat');
    n=10;
    elseif d==64
    m=2;
    S1 = load('JOS1B20.mat');
    n=20;
    elseif d==65
    m=2;
    S1 = load('JOS1B30.mat');
    n=30;
    elseif d==66
    m=2;
    S1 = load('JOS1B40.mat');
    n=40;
    elseif d==67
    m=2;
    S1 = load('JOS1B50.mat');
    n=50;
    elseif d==68
    m=2;
    S1 = load('JOS1B100.mat');
    n=100;
    elseif d==69
    m=2;
    S1 = load('JOS1B200.mat');
    n=200;
    elseif d==70
    m=2;
    S1 = load('JOS1B500.mat');
    n=500;
    elseif d==71
    m=2;
    S1 = load('JOS1B1000.mat');
    n=1000;
    elseif d==72
    m=2;
    S1 = load('JOS1C5.mat');
    n=5;
    elseif d==73
    m=2;
    S1 = load('JOS1C10.mat');
    n=10;
    elseif d==74
    m=2;
    S1 = load('JOS1C20.mat');
    n=20;
    elseif d==75
    m=2;
    S1 = load('JOS1C30.mat');
    n=30;%(n=10)
    elseif d==76
    m=2;
    S1 = load('JOS1C40.mat');
    n=40;
    elseif d==77
    m=2;
    S1 = load('JOS1C50.mat');
    n=50;
    elseif d==78
    m=2;
    S1 = load('JOS1C100.mat');
    n=100;
    elseif d==79
    m=2;
    S1 = load('JOS1C200.mat');
    n=200;
    elseif d==80
    m=2;
    S1 = load('JOS1C500.mat');
    n=500;
    elseif d==81
    m=2;
    S1 = load('JOS1C1000.mat');
    n=1000;
end
