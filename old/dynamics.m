function [alpha, phid, quat_next, psi, theta, phi, mat_T] = dynamics(u,v,w,p,q,r,quat)
%DYNAMICS この関数の概要をここに記述
%   詳細説明をここに記述
sq=sqrt(u^2+v^2+w^2);
alpha=acos(u/sq);
phid=atan2(v,w);
quat_next=quat+0.5*[0 -p -q -r;p 0 r -q;q -r 0 p;r q -p 0]*quat;

q0=quat_next(1);
q1=quat_next(2);
q2=quat_next(3);
q3=quat_next(4);
psi=atan(2*(q1*q2+q0*q3)/(q0^2+q1^2-q2^2-q3^2));
theta=asin(-2*(q1*q3-q0*q2));
phi=atan(2*(q2*q3+q0*q1)/(q0^2-q1^2-q2^2+q3^2));
mat_T=[q0^2+q1^2-q2^2-q3^2 2*(q1*q2+q0*q3) 2*(q1*q3-q0*q2);
    2*(q1*q2-q0*q3) q0^2-q1^2+q2^2-q3^2 2*(q2*q3+q0*q1);
    2*(q1*q3+q0*q2) 2*(q2*q3-q0*q1) q0^2-q1^2-q2^2+q3^2];
end

