%%
close all;

%init condition
%attitude[rad]
psi0=0.0;
theta0=0.0;
phi0=0.0;
TBL0=local2body(psi0,theta0,phi0);
%velocity[m/s]
u0=100.0;
v0=0.0;
w0=0.0;
%position[m]
x0=0.0;
y0=0.0;
z0=100.0;
%AOA,SLIP[rad]
alp0=atan2(w0,u0);
bet0=asin(v0/sqrt(u0^2+v0^2+w0^2));
%rate[rad/s]
p0=0.0;
q0=0.0;
r0=0.0;

delta_t=1;
sim_time=0.0;
sim_term=100;

psi=psi0;theta=theta0;phi=phi0;
u=u0;v=v0;w=w0;
x=x0;y=y0;z=z0;
p=p0;q=q0;r=r0;
alp=alp0;bet=bet0;
TBL=TBL0;
while(sim_time<sim_term)
    %����p�����^�̎Z�o TBD
    del_e=0.0;
    del_a=0.0;
    del_r=0.0;
    ft_c=0.0;
    theta_c=0.0;
    %��C�p�����[�^�����߂�
    atmos=getAtomosphare(z);
    %�}�b�n�������߂�
    mach=sqrt(u^2+v^2+w^2)/atmos.speedOfSound;
    %���������߂�
    dp=0.5*atmos.density*(u^2+v^2+w^2);
    %��͌W�������߂�
    aero=getAerodynamicCoeffs(mach,alp,bet,del_e,del_a,del_r,p,q,r);
    [fa,ma]=getAerodynamicForces(dp,aero);
    %���͂����߂�
    [ft,theta]=engine(ft_c,theta_c);
    ft=getThrustForce(ft,theta);
    %�@�̂̍��͂����߂�
    [f,m]=getTotalForce(ft,fa,ma);
    %�@�̉^��
    velocity=[u,v,w];
    rate=[p,q,r];
    vel=getBodyVelocity(velocity,rate,f,TBL);
    rate=getBodyRotation(rate,m);
    
    %%Update
    %rate
    p=p+rate(1)*delta_t;
    q=q+rate(2)*delta_t;
    r=r+rate(3)*delta_t;
    %velocity
    u=u+vel(1)*delta_t;
    v=v+vel(2)*delta_t;
    w=w+vel(3)*delta_t;
    %position
    x=x+u*delta_t;
    y=y+v*delta_t;
    z=z+w*delta_t;
    %attitude
    qq=ypr2quaternion(psi,theta,phi);
    qq=qq+quatUpdate(qq,rate)*delta_t;
    euler=quaternion2rpy(qq);
    psi=euler(3); %����Ȃ�
    theta=euler(2); %����Ȃ�
    phi=euler(1); %����Ȃ�
    TBL=quatrotate(qq,eye(3)); %@todo quat�������ɂ���
    %misc
    Vm=sqrt(u^2+v^2+w^2);
    alpha=atan2(w,u);
    beta=asin(v/Vm);
    
    sim_time=sim_time+delta_t
end