function af = airframe()
%%airframe
af.sRef=0.1;
af.xcg=0.5;
af.xcg_ref=0.5;
af.m=100.0;
af.I=[100 0 0;0 100 0;0 0 100];
af.refa=1.0;
af.refb=0.5;
af.refc=0.5;
af.xeng=0.1;
af.trcode=0.1;
af.trload=0.1;
af.vmass=10.0;
af.dvda=1.0;
end

