function [result] = quatUpdate(q,v)
m=0.5*matskew2(v);
result=m*q';
result=result';
end

