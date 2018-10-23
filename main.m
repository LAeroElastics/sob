close all;
clear all;
addpath('./phi')
addpath('./util')
addpath('./quaternion')

%%Initialization
initState=initialize();

sp.simTime=0.0;
sp.deltaT=0.1;
sp.simTerm=10;

state.attitudeVector=initState.attitudeVector;
state.attitudeMatrix=initState.attitudeMatrix;
state.attitudeQuaternion=initState.attitudeQuaternion;
state.velocityVector=initState.velocityVector;
state.positionVector=initState.positionVector;
state.bodyrateVector=initState.bodyrateVector;
state.alp=initState.alp;
state.bet=initState.bet;

while(sp.simTime<sp.simTerm)
    %Control update
    cp=control();
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
    state.bodyratevector=state.bodyrateVector+dr(state,moments,af)*sp.deltaT;
    %Position Update
    state.positionVector=state.positionVector+state.velocityVector*sp.deltaT;
    %Attitude Update
    state.attitudeQuaternion=state.attitudeQuaternion+quatUpdate(state.attitudeQuaternion,state.bodyrateVector)*sp.deltaT;
    %AOA Update
    state.alp=atan2(state.velocityVector(3),state.velocityVector(1));
    %SLIP Update
    state.bet=asin(state.velocityVector(2)/norm(state.velocityVector));
    
    sp.simTime=sp.simTime+sp.deltaT;
    disp(sp.simTime);
end