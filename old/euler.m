function [p_next,q_next,r_next] = euler(p,q,r,l,m,n)
%EULER この関数の概要をここに記述
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

p_next=p+((cp.Iyy-cp.Izz)*q*r+l)/cp.Ixx*cp.delta_t;
q_next=q+((cp.Izz-cp.Ixx)*p*r+m)/cp.Iyy*cp.delta_t;
r_next=r+((cp.Ixx-cp.Iyy)*p*q+n)/cp.Izz*cp.delta_t;
end

