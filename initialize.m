function [state] = initialize()
state.attitudeVector=[0.0 0.0 0.0];
state.attitudeQuaternion=rpy2quaternion(state.attitudeVector);
state.attitudeMatrix=makerotation(state.attitudeVector);
state.velocityVector=[300.0 0.0 0.0];
state.positionVector=[0.0 0.0 0.0];
state.bodyrateVector=[0.0 0.0 0.0];
state.alp=0.0;
state.bet=0.0;
end

