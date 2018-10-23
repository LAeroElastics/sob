function [dr] = dr(state,moment,af)
ratemat=matskew(state.bodyrateVector);
dr=inv(af.I)*(-ratemat*af.I*state.bodyrateVector'+moment');
end

