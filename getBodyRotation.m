function [next] = getBodyRotation(rate,ma)
af=airframe();
I=af.I;
skwRate=matskew(rate);
next=inv(I)*(-skwRate*I*rate'+ma');
end

