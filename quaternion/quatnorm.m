function [result] = quatnorm(q)
q0=q(1);
q1=q(2);
q2=q(3);
q3=q(4);
qq0=q0^2;
qq1=q1^2;
qq2=q2^2;
qq3=q3^2;
result=qq0+qq1+qq2+qq3;
end

