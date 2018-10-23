function [result] = quatnormalize(q)
q0=q(1);
q1=q(2);
q2=q(3);
q3=q(4);
den=sqrt(quatnorm(q));
q0=q0/den;
q1=q1/den;
q2=q2/den;
q3=q3/den;
result=[q0 q1 q2 q3];
end

