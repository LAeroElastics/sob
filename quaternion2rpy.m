function [result] = quaternion2rpy(q)
q0=q(1);
q1=q(2);
q2=q(3);
q3=q(4);
qq0=q0^2;
qq1=q1^2;
qq2=q2^2;
qq3=q3^2;

r=atan2(2*(q2*q3+q0*q1),(qq0-qq1-qq2+qq3));
p=asin(2*(q0*q2-q1*q3));
y=atan2(2*(q1*q2+q0*q3),(qq0+qq1-qq2-qq3));
result=[r p y];
end

