function [next] = getBodyVelocity(velocity,rate,fa,Tbl)
af=airframe();
m=af.m;
g0=[0;0;9.8];
skwRate=matskew(rate);
next=-skwRate*velocity'+fa'/m+Tbl*g0;
end

