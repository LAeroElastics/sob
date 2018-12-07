close all;
clear all;
addpath('./phi')
addpath('./util')
addpath('./quaternion')

%%Initialization
initState=initialize();

sp.simTime=0.0;
sp.deltaT=1;
sp.simTerm=10;

state.attitudeVector=initState.attitudeVector;
state.attitudeMatrix=initState.attitudeMatrix;
state.attitudeQuaternion=initState.attitudeQuaternion;
state.velocityVector=initState.velocityVector;
state.positionVector=initState.positionVector;
state.bodyrateVector=initState.bodyrateVector;
state.alp=initState.alp;
state.bet=initState.bet;

%initialize out matrix
out.simtime=zeros(1,sp.simTerm/sp.deltaT);
out.attitudeVector=zeros(1,3,(sp.simTerm/sp.deltaT));
out.attitudeMatrix=zeros(3,3,(sp.simTerm/sp.deltaT));
out.attitudeQuaternion=zeros(1,4,(sp.simTerm/sp.deltaT));
out.velocityVector=zeros(1,3,(sp.simTerm/sp.deltaT));
out.positionVector=zeros(1,3,(sp.simTerm/sp.deltaT));
out.bodyrateVector=zeros(1,3,(sp.simTerm/sp.deltaT));
out.alp=zeros(1,(sp.simTerm/sp.deltaT));
out.bet=zeros(1,(sp.simTerm/sp.deltaT));

%for debug
tc=[1:sp.deltaT:sp.simTerm];
ac=tc;
ac(1:end)=3/57.3;

i_OutMatrix=1;
while(sp.simTime<sp.simTerm)
    %Control update
    cp=control();
    
    %state.alp=ac(i_OutMatrix);
    
    %Airframe update
    af=airframe();
    %Aerodynamic Table update
    ap=aeroTable();
    %Aerodynamic update
    atmos=getAtomosphare(state.positionVector(3));
    mcn=mach(state.velocityVector,atmos.speedOfSound);
    dp=dpp(state.velocityVector,atmos.density);
    %Aerodynamics Coefficients update
    coeff=getAeroParams(mcn,state,af,ap,cp);
    %Aerodynamic Forces update
    forces=getAeroForces(dp,coeff,af);
    moments=getAeroMoments(dp,coeff,af);
    %Composing Thrust Forces
    forces=forces+cp.thrust;

    %Velocity Update
    state.velocityVector=state.velocityVector+dv(state,forces,state.attitudeMatrix,af)*sp.deltaT;
    %Rate Update
    state.bodyrateVector=state.bodyrateVector+dr(state,moments,af)*sp.deltaT;
    %Position Update
    state.positionVector=state.positionVector+state.velocityVector*sp.deltaT;
    %Attitude Update
    state.attitudeQuaternion=state.attitudeQuaternion+quatUpdate(state.attitudeQuaternion,state.bodyrateVector)*sp.deltaT;
    %AOA Update
    state.alp=atan2(state.velocityVector(3),state.velocityVector(1));
    %SLIP Update
    state.bet=asin(state.velocityVector(2)/norm(state.velocityVector));
    
    sp.simTime=sp.simTime+sp.deltaT;
    %disp(sp.simTime);
    disp(state);
    
    out.simtime(:,i_OutMatrix)=sp.simTime;
    out.attitudeVector(:,:,i_OutMatrix)=state.attitudeVector;
    out.attitudeMatrix(:,:,i_OutMatrix)=state.attitudeMatrix;
    out.attitudeQuaternion(:,:,i_OutMatrix)=state.attitudeQuaternion;
    out.velocityVector(:,:,i_OutMatrix)=state.velocityVector;
    out.positionVector(:,:,i_OutMatrix)=state.positionVector;
    out.bodyrateVector(:,:,i_OutMatrix)=state.bodyrateVector;
    out.alp(i_OutMatrix)=state.alp;
    out.bet(i_OutMatrix)=state.bet;
    i_OutMatrix=i_OutMatrix+1;
end

ifig=1;
figure(ifig);
plot(out.simtime(1,:),reshape(out.attitudeVector(1,1,:),1,1001));
grid on;

figure(ifig+1);
plot(out.simtime(1,:),reshape(out.attitudeVector(1,2,:),1,1001));
grid on;

figure(ifig+2);
plot(out.simtime(1,:),reshape(out.attitudeVector(1,3,:),1,1001));
grid on;

figure(ifig+3);
plot(out.simtime(1,:),reshape(out.velocityVector(1,1,:),1,1001));
grid on;

figure(ifig+4);
plot(out.simtime(1,:),reshape(out.velocityVector(1,2,:),1,1001));
grid on;

figure(ifig+5);
plot(out.simtime(1,:),reshape(out.velocityVector(1,3,:),1,1001));
grid on;
