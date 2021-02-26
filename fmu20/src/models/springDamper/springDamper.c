/* ---------------------------------------------------------------------------*
 * Sample implementation of an FMU.
 * This demonstrates the use of all FMU variable types.
 * Copyright QTronic GmbH. All rights reserved.
 * ---------------------------------------------------------------------------*/


// define class name and unique id
#define MODEL_IDENTIFIER springDamper
#define MODEL_GUID "{8c4e810f-3df3-4a00-8276-176fa3c9f004}"

// define model size
#define NUMBER_OF_REALS 18
#define NUMBER_OF_INTEGERS 0
#define NUMBER_OF_BOOLEANS 0
#define NUMBER_OF_STRINGS 0
#define NUMBER_OF_STATES 0
#define NUMBER_OF_EVENT_INDICATORS 0

// include fmu header files, typedefs and macros
#include "fmuTemplate.h"

#define ZIP_GSL_BINARIES_WITH_FMU 1
#include "gsl/gsl_matrix.h"
#include "gsl/gsl_linalg.h"
#include "gsl/gsl_blas.h"

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
#define c_             10
#define sigma0_        11
#define sigma1_        12
#define sigma2_        13
#define alpha_         14
#define mu_s_          15
#define mu_c_          16
#define v_s_           17

// define state vector as vector of value references
// #define STATES {  }


// called by fmi2Instantiate
// Set values for all variables that define a start value
// Settings used unless changed by fmi2SetX before fmi2EnterInitializationMode
void setStartValues(ModelInstance *comp) {
    // init outputs
    r(Ri_rx_MiMj_) = 0;
    r(Ri_ry_MiMj_) = 0;
    r(Ri_rz_MiMj_) = 0;
    r(Ri_vx_MiMj_) = 0;
    r(Ri_vy_MiMj_) = 0;
    r(Ri_vz_MiMj_) = 0;
    // init parameters
    r(k_)          = 50;
    r(c_)          = 50; 
    r(sigma0_)     = 0.01;     
    r(sigma1_)     = 0.01;     
    r(sigma2_)     = 0.1;     
    r(alpha_)      = 1.;     
    r(mu_s_)       = 0.6;     
    r(mu_c_)       = 0.43;     
    r(v_s_)        = 1.; 
}

// define help variables
gsl_vector *Ri_F_Mi, *Ri_r_MiMj, *Ri_v_MiMj;

// called by fmi2GetReal, fmi2GetInteger, fmi2GetBoolean, fmi2GetString, fmi2ExitInitialization
// if setStartValues or environment set new values through fmi2SetXXX.
// Lazy set values for all variable that are computed from other variables.
void calculateValues(ModelInstance *comp) {
    if (comp->state == modelInitializationMode) {
        Ri_F_Mi   = gsl_vector_alloc (3);
        Ri_r_MiMj = gsl_vector_alloc (3);
        Ri_v_MiMj = gsl_vector_alloc (3);
    }

    // Read inputs in array format
    gsl_vector_set (Ri_r_MiMj, 0, r(Ri_rx_MiMj_));
    gsl_vector_set (Ri_r_MiMj, 1, r(Ri_ry_MiMj_));
    gsl_vector_set (Ri_r_MiMj, 2, r(Ri_rz_MiMj_));
    gsl_vector_set (Ri_v_MiMj, 0, r(Ri_vx_MiMj_));
    gsl_vector_set (Ri_v_MiMj, 1, r(Ri_vy_MiMj_));
    gsl_vector_set (Ri_v_MiMj, 2, r(Ri_vz_MiMj_));
    

    // init output with zeros
    for(int i=0; i<=2; i++) gsl_vector_set(Ri_F_Mi, i, 0.);

    /****************** Spring forces ********************/
    gsl_blas_daxpy( r(k_), Ri_r_MiMj, Ri_F_Mi);

    /****************** Damping forces ********************/

    
    r(Ri_Fx_Mi_) = (fmi2Real) gsl_vector_get(Ri_F_Mi, 0);
    r(Ri_Fy_Mi_) = (fmi2Real) gsl_vector_get(Ri_F_Mi, 1);
    r(Ri_Fz_Mi_) = (fmi2Real) gsl_vector_get(Ri_F_Mi, 2);
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