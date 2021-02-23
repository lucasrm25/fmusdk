/* ---------------------------------------------------------------------------*
 * Sample implementation of an FMU.
 * This demonstrates the use of all FMU variable types.
 * Copyright QTronic GmbH. All rights reserved.
 * ---------------------------------------------------------------------------*/

// https://gist.github.com/TysonRayJones/af7bedcdb8dc59868c7966232b4da903

// define class name and unique id
#define MODEL_IDENTIFIER springDamper
#define MODEL_GUID "{8c4e810f-3df3-4a00-8276-176fa3c9f004}"

// define model size
#define NUMBER_OF_REALS 7
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
#define k_          0
#define I_rx_PS_    1
#define I_ry_PS_    2
#define I_rz_PS_    3
#define I_Fx_P_     4
#define I_Fy_P_     5
#define I_Fz_P_     6

// define state vector as vector of value references
// #define STATES {  }

// called by fmi2Instantiate
// Set values for all variables that define a start value
// Settings used unless changed by fmi2SetX before fmi2EnterInitializationMode
void setStartValues(ModelInstance *comp) {
    r(k_)       = 100;
    r(I_rx_PS_) = 0;
    r(I_ry_PS_) = 0;
    r(I_rz_PS_) = 0;
}

// called by fmi2GetReal, fmi2GetInteger, fmi2GetBoolean, fmi2GetString, fmi2ExitInitialization
// if setStartValues or environment set new values through fmi2SetXXX.
// Lazy set values for all variable that are computed from other variables.
void calculateValues(ModelInstance *comp) {
    //if (comp->state == modelInitializationMode) {
    //  initialization code here
    //  set first time event, if any, using comp->eventInfo.nextEventTime
    //}

    /****************** Spring forces ********************/
    r(I_Fx_P_) = r(k_) * r(I_rx_PS_);
    r(I_Fy_P_) = r(k_) * r(I_ry_PS_);
    r(I_Fz_P_) = r(k_) * r(I_rz_PS_);
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
