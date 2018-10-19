function [next] = getBodyVelocity(velocity,rate,fa,Tbl)
af=airframe()
m=af.m;
g0=9.8;
p=rate(1);
q=rate(2);
r=rate(3);
skwRate=[0 -r q;r 0 -p;-q p 0];
next=-skwRate*velocity'+fa/m+Tbl*g0;
end

