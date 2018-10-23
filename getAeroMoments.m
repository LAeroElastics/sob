function [moments] = getAeroMoments(dpp,coeffs,af)
qS=dpp*af.sRef;
mx=coeffs.cl*qS*af.refb;
my=coeffs.cm*qS*af.refc;
mz=coeffs.cn*qS*af.refb;
moments=[mx my mz];
end

