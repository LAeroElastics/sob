%%Sim main
x0=0.0;
y0=0.0;
z0=100.0;
alpha0=0.0;
u0=100.0;
v0=0.0;
w0=0.0;
p0=0.0;
q0=0.0;
r0=0.0;

CD=0;CL=0;CY=0;Cl=0;Cm=0;Cn=0;
u=u0; v=v0; w=w0;
x=x0; y=y0; z=z0;
p=p0; q=q0; r=r0;
alpha=alpha0;
mat_T=[0 0 0;0 0 0;0 0 0];
quat=[0;0;0;0];
t=0.0
while(t<10)
    th=proplusion(10.0);
    rho=1.2;
    command.dr=0.0;
    command.dp=0.0;
    command.dy=0.0;
    vm=sqrt(u^2+v^2+w^2);
    mach=vm/cp.vs;
    [CD,CL,CY,Cl,Cm,Cn]=aero(mach,alpha,command);
    ap.CD=CD;
    ap.CL=CL;
    ap.CY=CY;
    ap.Cl=Cl;
    ap.Cm=Cm;
    ap.Cn=Cn;
    ap.dpress=0.5*1.2*vm^2;
    fth=proplusion(th);
    [fap,map]=forces(alpha,fth,ap);
    [p,q,r]=euler(p,q,r,map(1),map(2),map(3));
    [u,v,w]=newton(u,v,w,p,q,r,fap,mat_T);
    [alpha, phid, quat_next, psi, theta, phi, mat_T]=dynamics(u,v,w,p,q,r,quat);
    t=t+cp.delta_t
end