function ap = loadAeroTable()
%%loadAeroTable.m
path="./phi/";

ap.tbl_mach=load(path+'mach.asc');
ap.tbl_alp=load(path+'alpha.asc');
ap.tbl_bet=load(path+'beta.asc');
ap.tbl_del_a=load(path+'del_a.asc');
ap.tbl_del_e=load(path+'del_e.asc');
ap.tbl_del_r=load(path+'del_r.asc');

DUMMY=zeros(1);
%%@todo loadTable�Œu��
%%@todo mach*alpha�����̏ꍇ�̏��u��loadTable�ɒǉ�
ap.tbl_ca=loadTable(path+'ca.asc',ap.tbl_mach,ap.tbl_del_e,ap.tbl_alp);
ap.tbl_caq=loadTable(path+'caq.asc',ap.tbl_mach,DUMMY,ap.tbl_alp);
ap.tbl_cyb=loadTable(path+'cyb.asc',ap.tbl_mach,DUMMY,DUMMY);
ap.tbl_cyr=loadTable(path+'cyr.asc',ap.tbl_mach,DUMMY,ap.tbl_alp);
ap.tbl_cyp=loadTable(path+'cyp.asc',ap.tbl_mach,DUMMY,ap.tbl_alp);
ap.tbl_cyda=loadTable(path+'cyda.asc',ap.tbl_mach,DUMMY,DUMMY);
ap.tbl_cydr=loadTable(path+'cydr.asc',ap.tbl_mach,DUMMY,DUMMY);
%ap.tbl_cz=loadTable(path+'cz.asc',ap.tbl_mach,ap.tbl_alp,ap.tbl_bet);
ap.tbl_cz=loadTable(path+'cz.asc',ap.tbl_mach,ap.tbl_bet,ap.tbl_alp);
ap.tbl_czde=loadTable(path+'czde.asc',ap.tbl_mach,DUMMY,ap.tbl_alp);
ap.tbl_czq=loadTable(path+'czq.asc',ap.tbl_mach,DUMMY,ap.tbl_alp);
%ap.tbl_cl=loadTable(path+'cl.asc',ap.tbl_mach,ap.tbl_alp,ap.tbl_bet);
ap.tbl_cl=loadTable(path+'cl.asc',ap.tbl_mach,ap.tbl_bet,ap.tbl_alp);
%ap.tbl_cldr=loadTable(path+'cldr.asc',ap.tbl_mach,ap.tbl_alp,ap.tbl_bet);
ap.tbl_cldr=loadTable(path+'cldr.asc',ap.tbl_mach,ap.tbl_bet,ap.tbl_alp);
%ap.tbl_clda=loadTable(path+'clda.asc',ap.tbl_mach,ap.tbl_alp,ap.tbl_bet);
ap.tbl_clda=loadTable(path+'clda.asc',ap.tbl_mach,ap.tbl_bet,ap.tbl_alp);
ap.tbl_clr=loadTable(path+'clr.asc',ap.tbl_mach,DUMMY,ap.tbl_alp);
ap.tbl_clp=loadTable(path+'clp.asc',ap.tbl_mach,DUMMY,ap.tbl_alp);
ap.tbl_cm=loadTable(path+'cm.asc',ap.tbl_mach,ap.tbl_del_e,ap.tbl_alp);
ap.tbl_cmq=loadTable(path+'cmq.asc',ap.tbl_mach,DUMMY,ap.tbl_alp);
%ap.tbl_cn=loadTable(path+'cn.asc',ap.tbl_mach,ap.tbl_alp,ap.tbl_bet);
ap.tbl_cn=loadTable(path+'cn.asc',ap.tbl_mach,ap.tbl_bet,ap.tbl_alp);
%ap.tbl_cnda=loadTable(path+'cnda.asc',ap.tbl_mach,ap.tbl_alp,ap.tbl_bet);
ap.tbl_cnda=loadTable(path+'cnda.asc',ap.tbl_mach,ap.tbl_bet,ap.tbl_alp);
%ap.tbl_cndr=loadTable(path+'cndr.asc',ap.tbl_mach,ap.tbl_alp,ap.tbl_bet);
ap.tbl_cndr=loadTable(path+'cndr.asc',ap.tbl_mach,ap.tbl_bet,ap.tbl_alp);
ap.tbl_cnr=loadTable(path+'cnr.asc',ap.tbl_mach,DUMMY,ap.tbl_alp);
ap.tbl_cnp=loadTable(path+'cnp.asc',ap.tbl_mach,DUMMY,ap.tbl_alp);

end

