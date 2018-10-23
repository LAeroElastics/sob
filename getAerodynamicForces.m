function [fa,ma] = getAerodynamicForces(dynamicPressure,aero)
af=airframe();
refb=af.refb;
refc=af.refc;
sRef=af.sRef;
qS=dynamicPressure*sRef;
fa=qS*[aero.ca;aero.cy;aero.cz];
ma=qS*[aero.cl*refb;aero.cm*refc;aero.cn*refb];
end

