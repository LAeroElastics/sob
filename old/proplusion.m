function [out] = propulsion(com_th)
%propulsion.m
%�ȈՐ��̓��f��

%�X���b�g���e�[�u��
tbl_throttle = 0:8.4:100;
%���̓e�[�u��
tbl_thrust_nt = [0.0 2.0 4.0 6.0 8.0 10.0 12.0 14.0 15.0 16.0 18.0 20.0]*1000; 

if max(tbl_throttle) < com_th
    com=max(tbl_throttle);
else
    com=com_th;
end
result=interp1(tbl_throttle, tbl_thrust_nt, com);

out=result;
end

