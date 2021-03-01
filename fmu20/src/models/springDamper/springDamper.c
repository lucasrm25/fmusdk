/* ---------------------------------------------------------------------------*
 * Author: Lucas Rath (EF-234)
 * 
 * Force element of type Spring-Damper with LuGre friction model
 * 
 * Frame Notation:
 *      (Mi) - "from" marker
 *      (Mj) - "to" marker
 *      (I)  - inertial marker
 *      (Ri) - body reference frame of "from" body
 *      (F)  - frame positioned at (Mi), whose z axis is always pointing to (Mj)
 * ---------------------------------------------------------------------------*/


// define class name and unique id
#define MODEL_IDENTIFIER springDamper
#define MODEL_GUID "{8c4e810f-3df3-4a00-8276-176fa3c9f004}"

// define model size
#define NUMBER_OF_REALS             20
#define NUMBER_OF_INTEGERS          0
#define NUMBER_OF_BOOLEANS          0
#define NUMBER_OF_STRINGS           0
#define NUMBER_OF_STATES            1
#define NUMBER_OF_EVENT_INDICATORS  0

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
#define z_             18
#define der_z_         19

// define state vector as vector of value references 
#define STATES { z_ }


// called by fmi2Instantiate
// Set values for all variables that define a start value
// Settings used unless changed by fmi2SetX before fmi2EnterInitializationMode
void setStartValues(ModelInstance *comp) {
    // init outputs
    r(Ri_Fx_Mi_)   = 0;
    r(Ri_Fy_Mi_)   = 0; 
    r(Ri_Fz_Mi_)   = 0;
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
    // init states
    r(z_)          = 0.;
}

void gsl_vector_set_3D(double x, double y, double z, gsl_vector *vec){
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
    gsl_vector_set_3D((fmi2Real) 0., (fmi2Real) 0., (fmi2Real) 0., vec);
    return vec;
}

gsl_vector *ones(int n){
    gsl_vector *vec = gsl_vector_alloc (n);
    for (int j; j<n; j++)
        gsl_vector_set(vec, j, (fmi2Real) 1.);
    return vec;
}

void print_gsl_vector_3D(gsl_vector *vec){
    printf ("v=[%f,%f,%f]\n", vec->data[0], vec->data[1], vec->data[2]);
}

// define help variables
gsl_vector *Ri_F_Mi, *Ri_r_MiMj, *Ri_v_MiMj, *Ri_r_MiMj_dir, *Ri_dr_MiMj, *F_F_Mi, *F_r_MiMj, *F_dr_MiMj;
fmi2Real F_drz_MiMj;

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
        F_F_Mi          = gsl_vector_alloc_3D();
        F_r_MiMj        = gsl_vector_alloc_3D();
        F_dr_MiMj       = gsl_vector_alloc_3D();
        F_drz_MiMj      = 0;
    }

    // init force output with zeros
    gsl_vector_set_3D (0.,0.,0., F_F_Mi);


    /******************** Read inputs ********************/
    // Read input Ri_r_MiMj in array format
    gsl_vector_set_3D (r(Ri_rx_MiMj_), r(Ri_ry_MiMj_), r(Ri_rz_MiMj_), Ri_r_MiMj);
    // Read input Ri_v_MiMj in array format
    gsl_vector_set_3D (r(Ri_vx_MiMj_), r(Ri_vy_MiMj_), r(Ri_vz_MiMj_), Ri_v_MiMj);

    if( gsl_blas_dnrm2(Ri_r_MiMj) <= 1E-14 ){
        FILTERED_LOG( comp, fmi2Warning, LOG_FMI_CALL, 
            "From and to markers are at the same position, which can lead to calculation errors. ");
        // use last calculated force //// r(Ri_Fx_Mi_) = 0; r(Ri_Fy_Mi_) = 0; r(Ri_Fz_Mi_) = 0;
        return;
    }

    /******** Calculate local frame (F) kin. *************/
    // Ri_r_MiMj_dir = Ri_r_MiMj / norm2(Ri_r_MiMj)
    gsl_vector_set_3D(0., 0., 0., Ri_r_MiMj_dir);
    gsl_blas_daxpy( 1./gsl_blas_dnrm2(Ri_r_MiMj), Ri_r_MiMj, Ri_r_MiMj_dir);
    // F_drz_MiMj = <Ri_v_MiMj,Ri_r_MiMj_dir>
    gsl_blas_ddot( Ri_v_MiMj, Ri_r_MiMj_dir, &F_drz_MiMj );

    gsl_vector_set_3D (0., 0., gsl_blas_dnrm2(Ri_r_MiMj) , F_r_MiMj);
    gsl_vector_set_3D (0., 0., F_drz_MiMj, F_dr_MiMj);


    /****************** Spring forces ********************/
    // spring forces:  F_F_Mi = k * F_r_MiMj
    gsl_blas_daxpy( r(k_), F_r_MiMj, F_F_Mi);

    /****************** Damping forces ********************/
    // damping forces:  F_F_Mi = c * F_dr_MiMj 
    gsl_blas_daxpy( r(c_), F_dr_MiMj, F_F_Mi);

    /****************** Friction forces ********************/
    // friction forces: Ri_F_Mi = sigma0* z + sigma1* dz + sigma2* F_drz_MiMj
    gsl_blas_daxpy( 
        r(sigma0_) * r(z_)        + 
        r(sigma1_) * r(der_z_)    + 
        r(sigma2_) * F_drz_MiMj,
        ones(3), F_F_Mi
    );

    /****************** Set FMU outputs ********************/
    // Ri_F_Mi = F_F_Mi(2) * Ri_r_MiMj_dir
    gsl_vector_set_3D( 0.,0.,0., Ri_F_Mi);
    gsl_blas_daxpy( gsl_vector_get(F_F_Mi,2), Ri_r_MiMj_dir, Ri_F_Mi);
    // set outputs
    gsl_vector_get_3D( Ri_F_Mi, &r(Ri_Fx_Mi_), &r(Ri_Fy_Mi_), &r(Ri_Fz_Mi_) );
}

fmi2Real Fn, Fs, Fc, g, dz;

// called by fmi2GetReal, fmi2GetContinuousStates and fmi2GetDerivatives
fmi2Real getReal(ModelInstance *comp, fmi2ValueReference vr){
    switch (vr) {
        case der_z_ :
            // normal force magnitude between friction surfaces
            Fn = 10;
            // stiction force magnitude
            Fs = - r(mu_s_) * Fn; 
            // Coulomb friction force magnitude
            Fc = - r(mu_c_) * Fn;
            // Coulomb friction and Stribeck effect
            g = Fc + (Fs - Fc) * exp( - pow( abs(F_drz_MiMj/r(v_s_)), r(alpha_) ) );
            // calculate LuGre internal stiction state derivative
            dz = F_drz_MiMj - r(sigma0_)*(abs(F_drz_MiMj)/g) * r(z_);
            return dz;
        default: 
            return r(vr);
    }
}

// used to set the next time event, if any.
void eventUpdate(ModelInstance *comp, fmi2EventInfo *eventInfo, int isTimeEvent, int isNewEventIteration) {
}

// include code that implements the FMI based on the above definitions
#include "fmuTemplate.c"