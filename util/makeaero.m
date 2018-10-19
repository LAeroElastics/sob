%%テスト用の空力テーブル作成スクリプト
path="./phi/"

mach=csvread(path+"mach.asc");
alp=csvread(path+"alpha.asc");
bet=csvread(path+"beta.asc");
del_a=csvread(path+"del_a.asc");
del_e=csvread(path+"del_e.asc");
del_r=csvread(path+"del_r.asc");

[i_mach,~]=size(mach);
[i_alp,~]=size(alp);
[i_bet,~]=size(bet);
[i_del_a,~]=size(del_a);
[i_del_e,~]=size(del_e);
[i_del_r,~]=size(del_r);

%ca(mach,alpha,del_e)
ca=zeros(i_alp*i_mach,i_del_e);
for i=1:i_mach
    for ii=1:i_alp
        for iii=1:i_del_e
            ca((i-1)*i_alp+ii,iii)=0.1;
        end
    end
end

%caq(mach,alpha)
caq=zeros(i_alp*i_mach,1);
for i=1:i_mach
    for ii=1:i_alp
        caq((i-1)*i_alp+ii)=0.1;
    end
end

%cyb(mach)
cyb=zeros(i_mach,1);
for i=1:i_mach
    cyb(i)=0.1;
end

%cyr(mach,alpha)
cyr=zeros(i_alp*i_mach,1);
for i=1:i_mach
    for ii=1:i_alp
        cyr((i-1)*i_alp+ii)=0.1;
    end
end

%cyp(mach,alpha)
cyp=zeros(i_alp*i_mach,1);
for i=1:i_mach
    for ii=1:i_alp
        cyp((i-1)*i_alp+ii)=0.1;
    end
end

%cyda(mach)
cyda=zeros(i_mach,1);
for i=1:i_mach
    cyda(i)=0.1;
end

%cydr(mach)
cydr=zeros(i_mach,1);
for i=1:i_mach
    cydr(i)=0.1;
end

%cz(mach,alpha,beta)
cz=zeros(i_alp*i_mach,i_bet);
for i=1:i_mach
    for ii=1:i_alp
        for iii=1:i_bet
            cz((i-1)*i_alp+ii,iii)=0.1;
        end
    end
end

%czde(mach,alpha)
czde=zeros(i_alp*i_mach,1);
for i=1:i_mach
    for ii=1:i_alp
        czde((i-1)*i_alp+ii)=0.1;
    end
end

%czq(mach,alpha)
czq=zeros(i_alp*i_mach,1);
for i=1:i_mach
    for ii=1:i_alp
        czq((i-1)*i_alp+ii)=0.1;
    end
end

%cl(mach,alpha,beta)
cl=zeros(i_alp*i_mach,i_bet);
for i=1:i_mach
    for ii=1:i_alp
        for iii=1:i_bet
            cl((i-1)*i_alp+ii,iii)=0.1;
        end
    end
end

%cldr(mach,alpha,beta)
cldr=zeros(i_alp*i_mach,i_bet);
for i=1:i_mach
    for ii=1:i_alp
        for iii=1:i_bet
            cldr((i-1)*i_alp+ii,iii)=0.1;
        end
    end
end

%clda(mach,alpha,beta)
clda=zeros(i_alp*i_mach,i_bet);
for i=1:i_mach
    for ii=1:i_alp
        for iii=1:i_bet
            clda((i-1)*i_alp+ii,iii)=0.1;
        end
    end
end

%clr(mach,alpha)
clr=zeros(i_alp*i_mach,1);
for i=1:i_mach
    for ii=1:i_alp
        clr((i-1)*i_alp+ii)=0.1;
    end
end

%clp(mach,alpha)
clp=zeros(i_alp*i_mach,1);
for i=1:i_mach
    for ii=1:i_alp
        clp((i-1)*i_alp+ii)=0.1;
    end
end

%cm(mach,alpha,del_e)
cm=zeros(i_alp*i_mach,i_del_e);
for i=1:i_mach
    for ii=1:i_alp
        for iii=1:i_del_e
            cm((i-1)*i_alp+ii,iii)=0.1;
        end
    end
end

%cmq(mach,alpha)
cmq=zeros(i_alp*i_mach,1);
for i=1:i_mach
    for ii=1:i_alp
        cmq((i-1)*i_alp+ii)=0.1;
    end
end

%cn(mach,alpha,beta)
cn=zeros(i_alp*i_mach,i_bet);
for i=1:i_mach
    for ii=1:i_alp
        for iii=1:i_bet
            cn((i-1)*i_alp+ii,iii)=0.1;
        end
    end
end

%cnda(mach,alpha,beta)
cnda=zeros(i_alp*i_mach,i_bet);
for i=1:i_mach
    for ii=1:i_alp
        for iii=1:i_bet
            cnda((i-1)*i_alp+ii,iii)=0.1;
        end
    end
end

%cndr(mach,alpha,beta)
cndr=zeros(i_alp*i_mach,i_bet);
for i=1:i_mach
    for ii=1:i_alp
        for iii=1:i_bet
            cndr((i-1)*i_alp+ii,iii)=0.1;
        end
    end
end

%cnr(mach,alpha)
cnr=zeros(i_alp*i_mach,1);
for i=1:i_mach
    for ii=1:i_alp
        cnr((i-1)*i_alp+ii)=0.1;
    end
end

%cnp(mach,alpha)
cnp=zeros(i_alp*i_mach,1);
for i=1:i_mach
    for ii=1:i_alp
        cnp((i-1)*i_alp+ii)=0.1;
    end
end

csvwrite(path+"ca.asc",ca);
csvwrite(path+"caq.asc",caq);
csvwrite(path+"cyb.asc",cyb);
csvwrite(path+"cyr.asc",cyr);
csvwrite(path+"cyp.asc",cyp);
csvwrite(path+"cyda.asc",cyda);
csvwrite(path+"cydr.asc",cydr);
csvwrite(path+"cz.asc",cz);
csvwrite(path+"czde.asc",czde);
csvwrite(path+"czq.asc",czq);
csvwrite(path+"cl.asc",cl);
csvwrite(path+"cldr.asc",cldr);
csvwrite(path+"clda.asc",clda);
csvwrite(path+"clr.asc",clr);
csvwrite(path+"clp.asc",clp);
csvwrite(path+"cm.asc",cm);
csvwrite(path+"cmq.asc",cmq);
csvwrite(path+"cn.asc",cn);
csvwrite(path+"cnda.asc",cnda);
csvwrite(path+"cndr.asc",cndr);
csvwrite(path+"cnr.asc",cnr);
csvwrite(path+"cnp.asc",cnp);