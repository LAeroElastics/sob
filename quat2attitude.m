function [tanphi,sintheta,tanpsi] = quat2attitude(quat)
q0=quat(1);
q1=quat(2);
q2=quat(3);
q3=quat(4);
qq0=q0^2;
qq1=q1^2;
qq2=q2^2;
qq3=q3^2;

tanphi=2*(q2*q3+q0*q1)/(1-2*(qq1+qq2));
sintheta=-2*(q1*q3-q0*q2);
tanpsi=2*(q1*q2+q0*q3)/(1-2*(qq2+qq3));

end

