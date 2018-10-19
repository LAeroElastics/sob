function [out1,out2] = forces(alpha,thrust_force,aero)
%FORCES この関数の概要をここに記述
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
cp.b=1.0;

%質量
cp.m=1000;
%重心
cp.xcg=1.0;
%慣性モーメント
cp.Ixx=10.0;
cp.Iyy=5.0;
cp.Izz=11.0;
cp.mat_I=[cp.Ixx 0 0;0 cp.Iyy 0;0 0 cp.Izz];


ca=cos(alpha);
sa=sin(alpha);

%並進力
fap1=-aero.dpress*cp.S*(aero.CD*ca-aero.CL*sa)+thrust_force;
fap2=-aero.dpress*cp.S*aero.CY;
fap3=-aero.dpress*cp.S*(aero.CD*sa+aero.CL*ca);
fap=[fap1;fap2;fap3];

%モーメント
map1=aero.dpress*cp.S*cp.b*aero.Cl;
map2=aero.dpress*cp.S*cp.b*aero.Cm;
map3=aero.dpress*cp.S*cp.b*aero.Cn;
map=[map1;map2;map3];

out1 = fap;
out2 = map;
end

