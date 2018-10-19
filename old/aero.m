function [CD, CL, CY, Cl, Cm, Cn] = aero(mach, alpha, command)
%AERO この関数の概要をここに記述
%   詳細説明をここに記述
%%共通パラメタ
cp.delta_t=0.1;
%音速
cp.vs=340.0;
%重力加速度
cp.g=9.8;
%基準断面積
cp.S=0.1;
%飛行機効率
cp.kappa=0.3;
%モーメント基準
cp.xcm=1.0;

%質量
cp.m=1000;
%重心
cp.xcg=1.0;
%慣性モーメント
cp.Ixx=10.0;
cp.Iyy=5.0;
cp.Izz=11.0;
cp.mat_I=[cp.Ixx 0 0;0 cp.Iyy 0;0 0 cp.Izz];
%%揚力傾斜CLaから算出
%XXX 本来はバイナリのテーブルを別途持たせる予定だが、暫定的にここで計算する。
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
%%CN, CAから算出
%TBD

end

