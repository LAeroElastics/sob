%%table load test piece
path="./phi/";

ap.tbl_mach=load("./phi/mach.asc");
ap.tbl_alp=load("./phi/alpha.asc");
ap.tbl_del_e=load("./phi/del_e.asc");

loadTable(path+'ca.asc',ap.tbl_mach,ap.tbl_del_e,ap.tbl_alp)
