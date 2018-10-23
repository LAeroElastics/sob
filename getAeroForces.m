function [forces] = getAeroForces(dpp,coeffs,af)
qS=dpp*af.sRef;
fx=-coeffs.ca*qS;
fy=coeffs.cy*qS;
fz=coeffs.cz*qS;
forces=[fx fy fz];
end

