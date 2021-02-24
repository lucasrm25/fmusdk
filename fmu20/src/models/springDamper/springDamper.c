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
#define NUMBER_OF_REALS 8
#define NUMBER_OF_INTEGERS 0
#define NUMBER_OF_BOOLEANS 0
#define NUMBER_OF_STRINGS 0
#define NUMBER_OF_STATES 0
#define NUMBER_OF_EVENT_INDICATORS 0

// include fmu header files, typedefs and macros
#include "fmuTemplate.h"
#include "gsl/gsl_matrix.h"
#include "gsl/gsl_linalg.h"
#include "gsl/gsl_blas.h"

// define all model variables and their value references
// conventions used here:
// - if x is a variable, then macro x_ is its variable reference
// - the vr of a variable is its index in array  r, i, b or s
// - if k is the vr of a real state, then k+1 is the vr of its derivative
#define k_              0
#define Ri_rx_MiMj_     1
#define Ri_ry_MiMj_     2
#define Ri_rz_MiMj_     3
#define Ri_Fx_Mi_       4
#define Ri_Fy_Mi_       5
#define Ri_Fz_Mi_       6
#define Ri_F_Mi_abs_    7

// define state vector as vector of value references
// #define STATES {  }

// define global variables
gsl_vector * Ri_F_Mi;

// called by fmi2Instantiate
// Set values for all variables that define a start value
// Settings used unless changed by fmi2SetX before fmi2EnterInitializationMode
void setStartValues(ModelInstance *comp) {
    r(k_)       = 100;
    r(Ri_rx_MiMj_) = 0;
    r(Ri_ry_MiMj_) = 0;
    r(Ri_rz_MiMj_) = 0;
}

// called by fmi2GetReal, fmi2GetInteger, fmi2GetBoolean, fmi2GetString, fmi2ExitInitialization
// if setStartValues or environment set new values through fmi2SetXXX.
// Lazy set values for all variable that are computed from other variables.
void calculateValues(ModelInstance *comp) {
    if (comp->state == modelInitializationMode) {
        Ri_F_Mi = gsl_vector_alloc (3);
    }

    /****************** Spring forces ********************/
    r(Ri_Fx_Mi_) = r(k_) * r(Ri_rx_MiMj_);
    r(Ri_Fy_Mi_) = r(k_) * r(Ri_ry_MiMj_);
    r(Ri_Fz_Mi_) = r(k_) * r(Ri_rz_MiMj_);

    gsl_vector_set (Ri_F_Mi, 1, r(Ri_Fx_Mi_));
    gsl_vector_set (Ri_F_Mi, 1, r(Ri_Fx_Mi_));
    gsl_vector_set (Ri_F_Mi, 1, r(Ri_Fx_Mi_));

    r(Ri_F_Mi_abs_) = (fmi2Real) gsl_blas_dnrm2(Ri_F_Mi);

    //   gsl_vector_free (v);
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
