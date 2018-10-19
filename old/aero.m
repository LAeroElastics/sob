function [CD, CL, CY, Cl, Cm, Cn] = aero(mach, alpha, command)
%AERO ���̊֐��̊T�v�������ɋL�q
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
cp.xcm=1.0;

%����
cp.m=1000;
%�d�S
cp.xcg=1.0;
%�������[�����g
cp.Ixx=10.0;
cp.Iyy=5.0;
cp.Izz=11.0;
cp.mat_I=[cp.Ixx 0 0;0 cp.Iyy 0;0 0 cp.Izz];
%%�g�͌X��CLa����Z�o
%XXX �{���̓o�C�i���̃e�[�u����ʓr��������\�肾���A�b��I�ɂ����Ōv�Z����B
mach_tbl=[0.0 0.3 0.5 0.7 0.9 1.2 1.5 2.0 2.5 3.0 3.5 4.0 4.5 5.0 5.5 6.0 6.5];
CLa_tbl= [0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1]; 
CD0_tbl= [0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1];
CLa=interp1(mach_tbl, CLa_tbl, mach);
CD0=interp1(mach_tbl, CD0_tbl, mach);
CL=CLa*alpha;
CD=CD0+cp.kappa*CL^2;
CY=0.0;
Cma=0.1;
Cldr=0.1;
Cndy=0.1;

Cm=Cma*alpha;
Cl=command.dr*Cldr;
Cn=command.dy*Cndy;
%%CN, CA����Z�o
%TBD

end

