function [next] = getBodyRotation(rate,ma)
af=airframe();
I=af.I;
%lBR=gg.lBR; %Engine/Propeller torque
p=rate(1);
q=rate(2);
r=rate(3);
skwRate=[0 -r q;r 0 -p;-q p 0];
next=(-skwRate*I*rate'+ma)/I;
%next=(-skwRate*(I*rate+lBR)+ma)/I;
end

