function [q0,q1,q2,q3] = att2quat(psi,theta,phi) %yaw,pitch,roll
q0=cos(0.5*psi)*cos(0.5*theta)*cos(0.5*phi)+sin(0.5*psi)*sin(0.5*theta)*sin(0.5*phi);
q1=cos(0.5*psi)*cos(0.5*theta)*sin(0.5*phi)-sin(0.5*psi)*sin(0.5*theta)*cos(0.5*phi);
q2=cos(0.5*psi)*sin(0.5*theta)*cos(0.5*phi)+sin(0.5*psi)*cos(0.5*theta)*sin(0.5*phi);
q3=sin(0.5*psi)*cos(0.5*theta)*cos(0.5*phi)-cos(0.5*psi)*sin(0.5*theta)*sin(0.5*phi);
end

