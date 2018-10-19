function [u_next,v_next,w_next] = newton(u,v,w,p,q,r,fap,mat_T)
%NEWTON ���̊֐��̊T�v�������ɋL�q
%   �ڍא����������ɋL�q
%%���ʃp�����^
cp.delta_t=0.1;
%����
cp.vs=340.0;
%�d�͉����x
cp.g=9.8;
%��f�ʐ�
cp.S=0.1;
%��s�@����
cp.kappa=0.3;
%���[�����g�
cp.xcm=1.0;

%����
cp.m=1000;
%�d�S
cp.xcg=1.0;
%�������[�����g
cp.Ixx=10.0;
cp.Iyy=5.0;
cp.Izz=11.0;
cp.mat_I=[cp.Ixx 0 0;0 cp.Iyy 0;0 0 cp.Izz];

u_next=u+(r*v-q*w+fap(1)/cp.m+mat_T(1,3)*cp.g)*cp.delta_t;
v_next=v+(p*w-r*u+fap(2)/cp.m+mat_T(2,3)*cp.g)*cp.delta_t;
w_next=w+(q*u-p*v+fap(3)/cp.m+mat_T(3,3)*cp.g)*cp.delta_t;
end

