function [result] = quatconj(q)
%QUATCONJ Return the conjugate quaternion of orig
result=zeros(1,4);
result(1,1)=q(1,1);
result(1,2:end)=-q(1,2:end);
end

