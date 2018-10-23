function [dv] = dv(state,force,mat,af)
g0=[0 0 9.8];
ratemat=matskew(state.bodyrateVector);
dv=-ratemat*state.velocityVector'+force'/af.m+mat*g0';
end

