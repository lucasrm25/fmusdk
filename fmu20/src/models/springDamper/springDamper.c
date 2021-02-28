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
    r(c_)          = 50.; 
    r(sigma0_)     = 0.01;     
    r(sigma1_)     = 0.01;     
    r(sigma2_)     = 0.1;     
    r(alpha_)      = 1.;     
    r(mu_s_)       = 0.6;     
    r(mu_c_)       = 0.43;     
    r(v_s_)        = 1.; 
}

void gsl_vector_set_3D(gsl_vector *vec, double x, double y, double z){
    gsl_vector_set (vec, 0, (fmi2Real) x);
    gsl_vector_set (vec, 1, (fmi2Real) y);
    gsl_vector_set (vec, 2, (fmi2Real) z);
}

void gsl_vector_get_3D(gsl_vector *vec, fmi2Real *x, fmi2Real *y, fmi2Real *z){
    *x = gsl_vector_get (vec, 0);
    *y = gsl_vector_get (vec, 1);
    *z = gsl_vector_get (vec, 2);
}

gsl_vector *gsl_vector_alloc_3D(){
    gsl_vector *vec = gsl_vector_alloc (3);
    gsl_vector_set_3D(vec, (fmi2Real) 0., (fmi2Real) 0., (fmi2Real) 0.);
    return vec;
}

void print_gsl_vector_3D(gsl_vector *vec){
    printf ("v=[%f,%f,%f]\n", vec->data[0], vec->data[1], vec->data[2]);
}

// define help variables
gsl_vector *Ri_F_Mi, *Ri_r_MiMj, *Ri_v_MiMj, *Ri_r_MiMj_dir, *Ri_dr_MiMj;

// called by fmi2GetReal, fmi2GetInteger, fmi2GetBoolean, fmi2GetString, fmi2ExitInitialization
// if setStartValues or environment set new values through fmi2SetXXX.
// Lazy set values for all variable that are computed from other variables.
void calculateValues(ModelInstance *comp) {
    if (comp->state == modelInitializationMode) {
        Ri_F_Mi         = gsl_vector_alloc_3D();
        Ri_r_MiMj       = gsl_vector_alloc_3D();
        Ri_v_MiMj       = gsl_vector_alloc_3D();
        Ri_r_MiMj_dir   = gsl_vector_alloc_3D();
        Ri_dr_MiMj      = gsl_vector_alloc_3D();
    }
    else{
        // init force output with zeros
        gsl_vector_set_3D (Ri_F_Mi, 0.,0.,0.);

        // Read input Ri_r_MiMj in array format
        gsl_vector_set_3D (Ri_r_MiMj, r(Ri_rx_MiMj_), r(Ri_ry_MiMj_), r(Ri_rz_MiMj_));
        // Read input Ri_v_MiMj in array format
        gsl_vector_set_3D (Ri_v_MiMj, r(Ri_vx_MiMj_), r(Ri_vy_MiMj_), r(Ri_vz_MiMj_));

        /****************** Spring forces ********************/
        // spring forces:  Ri_F_Mi= k * Ri_r_MiMj
        gsl_blas_daxpy( r(k_), Ri_r_MiMj, Ri_F_Mi);

        /****************** Damping forces ********************/

        if ( gsl_blas_dnrm2(Ri_r_MiMj) > 1e-10 ){
            // Ri_r_MiMj_dir = Ri_r_MiMj / norm2(Ri_r_MiMj)
            gsl_vector_set_3D(Ri_r_MiMj_dir, 0., 0., 0.);
            gsl_blas_daxpy( 1./gsl_blas_dnrm2(Ri_r_MiMj), Ri_r_MiMj, Ri_r_MiMj_dir);

            // Ri_dr_MiMj = proj( Ri_v_MiMj -> F_r_MiMj ) = Ri_r_MiMj_dir * dot( Ri_r_MiMj_dir, Ri_v_MiMj )
            double aux;
            gsl_blas_ddot( Ri_v_MiMj, Ri_r_MiMj_dir, &aux );
            gsl_vector_set_3D( Ri_dr_MiMj, 0., 0., 0.);
            gsl_blas_daxpy( aux, Ri_r_MiMj_dir, Ri_dr_MiMj );
        }
        else{
            gsl_vector_memcpy(Ri_dr_MiMj, Ri_v_MiMj);
        }
        // spring forces:  Ri_F_Mi = c * Ri_dr_MiMj 
        gsl_blas_daxpy( r(c_), Ri_dr_MiMj, Ri_F_Mi);

        // set FMU outputs
        gsl_vector_get_3D( Ri_F_Mi, &r(Ri_Fx_Mi_), &r(Ri_Fy_Mi_), &r(Ri_Fz_Mi_) );
    }
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