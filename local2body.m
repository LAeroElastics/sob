function [MBL] = local2body(psi,theta,phi)
[q0 q1 q2 q3]=att2quat(psi,theta,phi);
qq0=q0*q0;
qq1=q1*q1;
qq2=q2*q2;
qq3=q3*q3;
q01=q0*q1;
q02=q0*q2;
q03=q0*q3;
q12=q1*q2;
q13=q1*q3;
q23=q2*q3;

MBL=[qq0+qq1-qq2-qq3 2*(q12+q03)     2*(q13-q02);
     2*(q12-q03)     qq0-qq1+qq2-qq3 2*(q23+q01);
     2*(q13+q02)     2*(q23-q01)     qq0-qq1-qq2+qq3];

end

