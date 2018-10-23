function [result] = matskew(v)
vx=v(1);
vy=v(2);
vz=v(3);
result=[0 -vx -vy -vz;vx 0 vz -vy;vy -vz 0 vx;vz vy -vx 0];
end

