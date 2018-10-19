function [aero] = getAerodynamicCoeffs(mach,alp,bet,del_e,del_a,del_r,p,q,r)
af=airframe();
xcg=af.xcg;
xcg_ref=af.xcg_ref; %moment center of aerodynamic table
refa=af.refa;
refb=af.refb;
refc=af.refc;
trcode=af.trcode;
trload=af.trload;
vmass=af.vmass;

c_2v=af.refc/(2*af.dvda);
b_2v=af.refb/(2*af.dvda);

ap=loadAeroTable();
%axial force
ca=interp3(ap.tbl_del_e,ap.tbl_alp,ap.tbl_mach,ap.tbl_ca,del_e,alp,mach);
caq=interp2(ap.tbl_mach,ap.tbl_alp,reshape(ap.tbl_caq,6,3),mach,alp);
aero.ca=ca+c_2v*caq*q;

%side force
cyr=interp2(ap.tbl_mach,ap.tbl_alp,reshape(ap.tbl_cyr,6,3),mach,alp);
cyp=interp2(ap.tbl_mach,ap.tbl_alp,reshape(ap.tbl_cyp,6,3),mach,alp);
cyb=interp1(ap.tbl_mach,reshape(ap.tbl_cyb,3,1),mach);
cyda=interp1(ap.tbl_mach,reshape(ap.tbl_cyda,3,1),mach);
cydr=interp1(ap.tbl_mach,reshape(ap.tbl_cydr,3,1),mach);
aero.cy=cyb*bet+cyda*del_a+cydr*del_r+b_2v*(cyr*r+cyp*p);

%normal force
cz=interp3(ap.tbl_bet,ap.tbl_alp,ap.tbl_mach,ap.tbl_cz,alp,bet,mach);
czde=interp2(ap.tbl_mach,ap.tbl_alp,reshape(ap.tbl_czde,6,3),mach,alp);
czq=interp2(ap.tbl_mach,ap.tbl_alp,reshape(ap.tbl_czq,6,3),mach,alp);
aero.cz=cz+czde*del_e+c_2v*czq*q;

%rolling moment
cl=interp3(ap.tbl_bet,ap.tbl_alp,ap.tbl_mach,ap.tbl_cl,bet,alp,mach);
clda=interp3(ap.tbl_bet,ap.tbl_alp,ap.tbl_mach,ap.tbl_clda,bet,alp,mach);
cldr=interp3(ap.tbl_bet,ap.tbl_alp,ap.tbl_mach,ap.tbl_cldr,bet,alp,mach);
clr=interp2(ap.tbl_mach,ap.tbl_alp,reshape(ap.tbl_clr,6,3),mach,alp);
clp=interp2(ap.tbl_mach,ap.tbl_alp,reshape(ap.tbl_clp,6,3),mach,alp);
aero.cl=cl+clda*del_a+cldr*del_r+b_2v*(clr*r+clp*p);

%pitching moment
cm=interp3(ap.tbl_del_e,ap.tbl_alp,ap.tbl_mach,ap.tbl_cm,del_e,alp,mach);
cmq=interp2(ap.tbl_mach,ap.tbl_alp,reshape(ap.tbl_cmq,6,3),mach,alp);
aero.cm=cm+c_2v*cmq*q+cz/refc*(xcg_ref-xcg);

%yawing moment
cn=interp3(ap.tbl_bet,ap.tbl_alp,ap.tbl_mach,ap.tbl_cn,bet,alp,mach);
cnda=interp3(ap.tbl_bet,ap.tbl_alp,ap.tbl_mach,ap.tbl_cnda,bet,alp,mach);
cndr=interp3(ap.tbl_bet,ap.tbl_alp,ap.tbl_mach,ap.tbl_cndr,bet,alp,mach);
cnr=interp2(ap.tbl_mach,ap.tbl_alp,reshape(ap.tbl_cnr,6,3),mach,alp);
cnp=interp2(ap.tbl_mach,ap.tbl_alp,reshape(ap.tbl_cnp,6,3),mach,alp);
aero.cn=cn+cnda*del_a+cndr*del_r-aero.cy/refb*(xcg_ref-xcg)+b_2v*(cnr*r+cnp*p);

%velocity axis
mca=cos(alp);
msa=sin(alp);
aero.cdrag=ca*mca-cz*msa;
aero.clift=ca*msa-cz*mca;
aero.ldratio=aero.clift/aero.cdrag;

end

