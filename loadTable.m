function [table] = loadTable(fileName,tblMach,tbl1,tbl2)
%%loadAeroTable3d

tbl_aero=load(fileName);
%memory allocation
[dimMach,~]=size(tblMach);
[dim1,~]=size(tbl1);
[dim2,~]=size(tbl2);
table=zeros(dim2,dim1,dimMach);

i_next_x=1;
for i_mach=1:dimMach
    %�}�b�n�����Ƃɐ؂�o���Ċi�[����
    table(:,:,i_mach)=tbl_aero(i_next_x:i_next_x+dim2-1,:);
    i_next_x=i_mach*dim2;
end
end