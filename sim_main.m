%%
%
close all;

%initial attitude
psi0=0.0;
theta0=0.0;
phi0=0.0;
TBL0=local2body(psi0,theta0,phi0);

%aero
aero=getAerodynamicCoeffs(mach,alp,bet,del_e,del_a,del_r,p,q,r);
[fa,ma]=getAerodynamicForces(dynamicPressure,aero);

%thrust
[ft,theta]=engine(ft_c,theta_c);
ft=genThrustForce(ft,theta);

%reunion
[f,m]=getTotalForce(ft,fa,ma);

%euler's
vel=getBodyVelocity(velocity,rate,f,m,TBL);

%newton's
rate=getBodyRotation(rate,m);

Vm=sqrt(u^2+v^2+w^2);
alpha=atan2(w,u);
beta=asin(v/Vm);

quat=quatUpdate(p,q,r,quat);
[tpsi,stheta,tphi]=quat2attitude(quat);
psi=atan(tpsi);
theta=asin(stheta);
phi=atan(tphi);
TBL=local2body(psi,theta,phi);