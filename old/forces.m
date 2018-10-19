function [out1,out2] = forces(alpha,thrust_force,aero)
%FORCES ���̊֐��̊T�v�������ɋL�q
%   �ڍא����������ɋL�q
%%���ʃp�����^
cp.delta_t=0.1;
%����
cp.vs=340.0;
%�d�͉����x
cp.g=9.8;
%��f�ʐ�
cp.S=0.1;
%��s�@����
cp.kappa=0.3;
%���[�����g�
cp.b=1.0;

%����
cp.m=1000;
%�d�S
cp.xcg=1.0;
%�������[�����g
cp.Ixx=10.0;
cp.Iyy=5.0;
cp.Izz=11.0;
cp.mat_I=[cp.Ixx 0 0;0 cp.Iyy 0;0 0 cp.Izz];


ca=cos(alpha);
sa=sin(alpha);

%���i��
fap1=-aero.dpress*cp.S*(aero.CD*ca-aero.CL*sa)+thrust_force;
fap2=-aero.dpress*cp.S*aero.CY;
fap3=-aero.dpress*cp.S*(aero.CD*sa+aero.CL*ca);
fap=[fap1;fap2;fap3];

%���[�����g
map1=aero.dpress*cp.S*cp.b*aero.Cl;
map2=aero.dpress*cp.S*cp.b*aero.Cm;
map3=aero.dpress*cp.S*cp.b*aero.Cn;
map=[map1;map2;map3];

out1 = fap;
out2 = map;
end

