function [result] = ypr2quaternion(y,p,r)
y=0.5*y;
p=0.5*p;
r=0.5*r;
sy=sin(y);
cy=cos(y);
sp=sin(p);
cp=cos(p);
sr=sin(r);
cr=cos(r);
q0=cy*cp*cr+sy*sp*sr;
q1=cy*cp*sr-sy*sp*cr;
q2=cy*sp*cr+sy*cp*sr;
q3=sy*cp*cr-cy*sp*sr;
result=[q0 q1 q2 q3];
end

