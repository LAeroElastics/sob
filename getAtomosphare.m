function [atmos] = getAtomosphare(altitude)

%consts
GAS_CONST_STD62=8.31432e3;          %[Nm/mol/K]
GAS_MOLLER_WEIGHT=28.996;           %[g/mol]
GAMMA_AIR=1.4;                      %[-]
TEMP_SEALEVEL=288.15;               %[K]
PRES_SEALEVEL=101325;               %[Pa]

atmos.statPressure=0.0;             %[Pa]
atmos.temperature=0.0;              %[K]
atmos.speedOfSound=0.0;             %[m/s]
atmos.density=0.0;                  %[kg/m^3]

r_moler=GAS_CONST_STD62/GAS_MOLLER_WEIGHT;
if altitude < 11000.0
    atmos.temperature=TEMP_SEALEVEL-0.0065*altitude;
    atmos.statPressure=PRES_SEALEVEL*(atmos.temperature/TEMP_SEALEVEL)^5.2559;
    atmos.density=atmos.statPressure/atmos.temperature/r_moler;
    atmos.speedOfSound=sqrt(GAMMA_AIR*r_moler*atmos.temperature);
    
elseif altitude < 80000.0
    atmos.temperature=216.0;
    atmos.statPressure=22630*exp(-0.00015769*(altitude-11000));
    atmos.density=atmos.statPressure/atmos.temperature/r_moler;
    atmos.speedOfSound=sqrt(GAMMA_AIR*r_moler*atmos.temperature); 
    
end

