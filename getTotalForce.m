function [f,m] = getTotalForce(ft,fa,ma)
f=ft+fa;
af=airframe();
xcg=af.xcg;
xeng=af.xeng; %�G���W����t�ʒux
m=[ma(1),ma(2)+(xeng-xcg)*ft(3),ma(3)]; %�s�b�`���O���[�����g�̂ݑz��(����Z����)
end

