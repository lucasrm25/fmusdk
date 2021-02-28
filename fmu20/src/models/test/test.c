/* ---------------------------------------------------------------------------*
 * Sample implementation of an FMU.
 * This demonstrates the use of all FMU variable types.
 * Copyright QTronic GmbH. All rights reserved.
 * ---------------------------------------------------------------------------*/


// define class name and unique id
#define MODEL_IDENTIFIER test
#define MODEL_GUID "{8c4e810f-3df3-4a00-8276-176fa3c9f004}"

// define model size
#define NUMBER_OF_REALS 10
#define NUMBER_OF_INTEGERS 0
#define NUMBER_OF_BOOLEANS 0
#define NUMBER_OF_STRINGS 0
#define NUMBER_OF_STATES 0
#define NUMBER_OF_EVENT_INDICATORS 0

// include fmu header files, typedefs and macros
#include "fmuTemplate.h"

// define all model variables and their value references
// conventions used here:
// - if x is a variable, then macro x_ is its variable reference
// - the vr of a variable is its index in array  r, i, b or s
// - if k is the vr of a real state, then k+1 is the vr of its derivative

// outputs
#define Ri_Fx_Mi_       0
#define Ri_Fy_Mi_       1
#define Ri_Fz_Mi_       2
// inputs
#define Ri_rx_MiMj_     3
#define Ri_ry_MiMj_     4
#define Ri_rz_MiMj_     5
#define Ri_vx_MiMj_     6
#define Ri_vy_MiMj_     7
#define Ri_vz_MiMj_     8
// parameters
#define k_              9

// define state vector as vector of value references 
// #define STATES {  }


// called by fmi2Instantiate
// Set values for all variables that define a start value
// Settings used unless changed by fmi2SetX before fmi2EnterInitializationMode
void setStartValues(ModelInstance *comp) {
    // init outputs
    r(Ri_Fx_Mi_) = 0.;
    r(Ri_Fy_Mi_) = 0.;
    r(Ri_Fz_Mi_) = 0.;
    // init inputs
    r(Ri_rx_MiMj_) = 0.;
    r(Ri_ry_MiMj_) = 0.;
    r(Ri_rz_MiMj_) = 0.;
    r(Ri_vx_MiMj_) = 0.;
    r(Ri_vy_MiMj_) = 0.;
    r(Ri_vz_MiMj_) = 0.;
    // init parameters
    r(k_)          = 50.;
}

// called by fmi2GetReal, fmi2GetInteger, fmi2GetBoolean, fmi2GetString, fmi2ExitInitialization
// if setStartValues or environment set new values through fmi2SetXXX.
// Lazy set values for all variable that are computed from other variables.
void calculateValues(ModelInstance *comp) {
    // if (comp->state == modelInitializationMode) {
    // }

    r(Ri_Fx_Mi_) = r(k_) * r(Ri_rx_MiMj_);
    r(Ri_Fy_Mi_) = r(k_) * r(Ri_ry_MiMj_);
    r(Ri_Fz_Mi_) = r(k_) * r(Ri_rz_MiMj_);
}

// called by fmi2GetReal, fmi2GetContinuousStates and fmi2GetDerivatives
fmi2Real getReal(ModelInstance *comp, fmi2ValueReference vr){
    // all values are real at the moment
    return r(vr);
}

// used to set the next time event, if any.
void eventUpdate(ModelInstance *comp, fmi2EventInfo *eventInfo, int isTimeEvent, int isNewEventIteration) {
}

// include code that implements the FMI based on the above definitions
#include "fmuTemplate.c"