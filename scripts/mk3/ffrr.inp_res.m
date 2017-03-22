
% Increase counter:

if (exist('idx', 'var'));
  idx = idx + 1;
else;
  idx = 1;
end;

% Version, title and date:

VERSION                   (idx, [1: 14])  = 'Serpent 2.1.28' ;
COMPILE_DATE              (idx, [1: 20])  = 'Feb  6 2017 16:48:33' ;
DEBUG                     (idx, 1)        = 0 ;
TITLE                     (idx, [1: 68])  = 'Fast Flux Research Reactor, N 35, rfuel 1.17, reflector thickness 50' ;
CONFIDENTIAL_DATA         (idx, 1)        = 0 ;
INPUT_FILE_NAME           (idx, [1:  8])  = 'ffrr.inp' ;
WORKING_DIRECTORY         (idx, [1: 37])  = '/home/wcureton/FSM-master/scripts/mk1' ;
HOSTNAME                  (idx, [1:  6])  = 'node28' ;
CPU_TYPE                  (idx, [1: 47])  = 'Intel(R) Core(TM)2 Quad  CPU   Q8200  @ 2.33GHz' ;
CPU_MHZ                   (idx, 1)        = 1795.0 ;
START_DATE                (idx, [1: 24])  = 'Wed Feb 22 13:59:13 2017' ;
COMPLETE_DATE             (idx, [1: 24])  = 'Wed Feb 22 14:25:49 2017' ;

% Run parameters:

POP                       (idx, 1)        = 10000 ;
CYCLES                    (idx, 1)        = 200 ;
SKIP                      (idx, 1)        = 40 ;
BATCH_INTERVAL            (idx, 1)        = 1 ;
SRC_NORM_MODE             (idx, 1)        = 2 ;
SEED                      (idx, 1)        = 1487789953 ;
UFS_MODE                  (idx, 1)        = 0 ;
UFS_ORDER                 (idx, 1)        = 1.00000;
NEUTRON_TRANSPORT_MODE    (idx, 1)        = 1 ;
PHOTON_TRANSPORT_MODE     (idx, 1)        = 0 ;
GROUP_CONSTANT_GENERATION (idx, 1)        = 1 ;
B1_CALCULATION            (idx, [1:  3])  = [ 0 0 0 ];
B1_BURNUP_CORRECTION      (idx, 1)        = 0 ;
IMPLICIT_REACTION_RATES   (idx, 1)        = 1 ;

% Optimization:

OPTIMIZATION_MODE         (idx, 1)        = 4 ;
RECONSTRUCT_MICROXS       (idx, 1)        = 1 ;
RECONSTRUCT_MACROXS       (idx, 1)        = 1 ;
MG_MAJORANT_MODE          (idx, 1)        = 0 ;

% Parallelization:

MPI_TASKS                 (idx, 1)        = 1 ;
OMP_THREADS               (idx, 1)        = 1 ;
MPI_REPRODUCIBILITY       (idx, 1)        = 0 ;
OMP_REPRODUCIBILITY       (idx, 1)        = 1 ;
SHARE_BUF_ARRAY           (idx, 1)        = 1 ;
SHARE_RES2_ARRAY          (idx, 1)        = 1 ;

% File paths:

XS_DATA_FILE_PATH         (idx, [1: 38])  = '/opt/serpent/xsdata/sss_endfb7u.sssdir' ;
DECAY_DATA_FILE_PATH      (idx, [1: 34])  = '/opt/serpent/xsdata/sss_endfb7.dec' ;
SFY_DATA_FILE_PATH        (idx, [1: 34])  = '/opt/serpent/xsdata/sss_endfb7.nfy' ;
NFY_DATA_FILE_PATH        (idx, [1: 34])  = '/opt/serpent/xsdata/sss_endfb7.nfy' ;
BRA_DATA_FILE_PATH        (idx, [1:  3])  = 'N/A' ;

% Collision and reaction sampling (neutrons/photons):

MIN_MACROXS               (idx, [1:   4]) = [  5.00000E-02 0.0E+00  0.00000E+00 0.0E+00 ];
DT_THRESH                 (idx, [1:  2])  = [  9.00000E-01  9.00000E-01 ];
ST_FRAC                   (idx, [1:   4]) = [  1.92137E-01 0.00085  0.00000E+00 0.0E+00 ];
DT_FRAC                   (idx, [1:   4]) = [  8.07863E-01 0.00020  0.00000E+00 0.0E+00 ];
DT_EFF                    (idx, [1:   4]) = [  1.51480E-01 0.00036  0.00000E+00 0.0E+00 ];
REA_SAMPLING_EFF          (idx, [1:   4]) = [  1.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
REA_SAMPLING_FAIL         (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
TOT_COL_EFF               (idx, [1:   4]) = [  2.51835E-01 0.00047  0.00000E+00 0.0E+00 ];
AVG_TRACKING_LOOPS        (idx, [1:   8]) = [  5.81676E+00 0.00061  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
AVG_TRACKS                (idx, [1:   4]) = [  6.22877E+01 0.00092  0.00000E+00 0.0E+00 ];
AVG_REAL_COL              (idx, [1:   4]) = [  6.22510E+01 0.00092  0.00000E+00 0.0E+00 ];
AVG_VIRT_COL              (idx, [1:   4]) = [  1.84964E+02 0.00142  0.00000E+00 0.0E+00 ];
AVG_SURF_CROSS            (idx, [1:   4]) = [  2.25913E+01 0.00058  0.00000E+00 0.0E+00 ];
LOST_PARTICLES            (idx, 1)        = 0 ;

% Run statistics:

CYCLE_IDX                 (idx, 1)        = 200 ;
SOURCE_POPULATION         (idx, 1)        = 2000197 ;
MEAN_POP_SIZE             (idx, [1:  2])  = [  1.00010E+04 0.00094 ];
MEAN_POP_WGT              (idx, [1:  2])  = [  1.00010E+04 0.00094 ];
SIMULATION_COMPLETED      (idx, 1)        = 1 ;

% Running times:

TOT_CPU_TIME              (idx, 1)        =  2.64615E+01 ;
RUNNING_TIME              (idx, 1)        =  2.65892E+01 ;
INIT_TIME                 (idx, [1:  2])  = [  4.10817E-01  4.10817E-01 ];
PROCESS_TIME              (idx, [1:  2])  = [  7.08333E-03  7.08333E-03 ];
TRANSPORT_CYCLE_TIME      (idx, [1:  3])  = [  2.61713E+01  2.61713E+01  0.00000E+00 ];
MPI_OVERHEAD_TIME         (idx, [1:  2])  = [  0.00000E+00  0.00000E+00 ];
ESTIMATED_RUNNING_TIME    (idx, [1:  2])  = [  2.65348E+01  0.00000E+00 ];
CPU_USAGE                 (idx, 1)        = 0.99520 ;
TRANSPORT_CPU_USAGE       (idx, [1:   2]) = [  9.96173E-01 7.0E-05 ];
OMP_PARALLEL_FRAC         (idx, 1)        =  9.84462E-01 ;

% Memory usage:

AVAIL_MEM                 (idx, 1)        = 3697.52 ;
ALLOC_MEMSIZE             (idx, 1)        = 1136.32;
MEMSIZE                   (idx, 1)        = 1056.70;
XS_MEMSIZE                (idx, 1)        = 539.71;
MAT_MEMSIZE               (idx, 1)        = 45.65;
RES_MEMSIZE               (idx, 1)        = 412.86;
MISC_MEMSIZE              (idx, 1)        = 58.49;
UNKNOWN_MEMSIZE           (idx, 1)        = 0.00;
UNUSED_MEMSIZE            (idx, 1)        = 79.62;

% Geometry parameters:

TOT_CELLS                 (idx, 1)        = 5 ;
UNION_CELLS               (idx, 1)        = 0 ;

% Neutron energy grid:

NEUTRON_ERG_TOL           (idx, 1)        =  0.00000E+00 ;
NEUTRON_ERG_NE            (idx, 1)        = 249026 ;
NEUTRON_EMIN              (idx, 1)        =  1.00000E-11 ;
NEUTRON_EMAX              (idx, 1)        =  2.00000E+01 ;

% Unresolved resonance probability table sampling:

URES_DILU_CUT             (idx, 1)        =  1.00000E-09 ;
URES_EMIN                 (idx, 1)        =  1.00000E+37 ;
URES_EMAX                 (idx, 1)        = -1.00000E+37 ;
URES_AVAIL                (idx, 1)        = 2 ;
URES_USED                 (idx, 1)        = 0 ;

% Nuclides and reaction channels:

TOT_NUCLIDES              (idx, 1)        = 35 ;
TOT_TRANSPORT_NUCLIDES    (idx, 1)        = 35 ;
TOT_DOSIMETRY_NUCLIDES    (idx, 1)        = 0 ;
TOT_DECAY_NUCLIDES        (idx, 1)        = 0 ;
TOT_PHOTON_NUCLIDES       (idx, 1)        = 0 ;
TOT_REA_CHANNELS          (idx, 1)        = 800 ;
TOT_TRANSMU_REA           (idx, 1)        = 0 ;

% Neutron physics options:

USE_DELNU                 (idx, 1)        = 1 ;
USE_URES                  (idx, 1)        = 0 ;
USE_DBRC                  (idx, 1)        = 0 ;
IMPL_CAPT                 (idx, 1)        = 0 ;
IMPL_NXN                  (idx, 1)        = 1 ;
IMPL_FISS                 (idx, 1)        = 0 ;
DOPPLER_PREPROCESSOR      (idx, 1)        = 1 ;
TMS_MODE                  (idx, 1)        = 0 ;
SAMPLE_FISS               (idx, 1)        = 1 ;
SAMPLE_CAPT               (idx, 1)        = 1 ;
SAMPLE_SCATT              (idx, 1)        = 1 ;

% Radioactivity data:

TOT_ACTIVITY              (idx, 1)        =  2.50386E+09 ;
TOT_DECAY_HEAT            (idx, 1)        =  1.79800E-03 ;
TOT_SF_RATE               (idx, 1)        =  5.29495E+04 ;
ACTINIDE_ACTIVITY         (idx, 1)        =  2.50386E+09 ;
ACTINIDE_DECAY_HEAT       (idx, 1)        =  1.79800E-03 ;
FISSION_PRODUCT_ACTIVITY  (idx, 1)        =  0.00000E+00 ;
FISSION_PRODUCT_DECAY_HEAT(idx, 1)        =  0.00000E+00 ;
INHALATION_TOXICITY       (idx, 1)        =  2.07979E+04 ;
INGESTION_TOXICITY        (idx, 1)        =  1.15742E+02 ;
ACTINIDE_INH_TOX          (idx, 1)        =  2.07979E+04 ;
ACTINIDE_ING_TOX          (idx, 1)        =  1.15742E+02 ;
FISSION_PRODUCT_INH_TOX   (idx, 1)        =  0.00000E+00 ;
FISSION_PRODUCT_ING_TOX   (idx, 1)        =  0.00000E+00 ;
SR90_ACTIVITY             (idx, 1)        =  0.00000E+00 ;
TE132_ACTIVITY            (idx, 1)        =  0.00000E+00 ;
I131_ACTIVITY             (idx, 1)        =  0.00000E+00 ;
I132_ACTIVITY             (idx, 1)        =  0.00000E+00 ;
CS134_ACTIVITY            (idx, 1)        =  0.00000E+00 ;
CS137_ACTIVITY            (idx, 1)        =  0.00000E+00 ;
TOT_PHOTON_SRC            (idx, 1)        =  1.93464E+09 ;

% Normaliation coefficient:

NORM_COEF                 (idx, [1:   4]) = [  6.34752E+08 0.00078  0.00000E+00 0.0E+00 ];

% Analog reaction rate estimators:

CONVERSION_RATIO          (idx, [1:   2]) = [  2.66805E-01 0.00192 ];
U235_FISS                 (idx, [1:   4]) = [  2.84476E+12 0.00088  9.23257E-01 0.00026 ];
U238_FISS                 (idx, [1:   4]) = [  2.36481E+11 0.00338  7.67426E-02 0.00314 ];
U235_CAPT                 (idx, [1:   4]) = [  9.75957E+11 0.00176  3.19992E-01 0.00157 ];
U238_CAPT                 (idx, [1:   4]) = [  1.01970E+12 0.00182  3.34316E-01 0.00146 ];

% Neutron balance (particles/weight):

BALA_SRC_NEUTRON_SRC        (idx, [1:  2])  = [ 0 0.00000E+00 ];
BALA_SRC_NEUTRON_FISS       (idx, [1:  2])  = [ 2000209 2.00021E+06 ];
BALA_SRC_NEUTRON_NXN        (idx, [1:  2])  = [ 0 5.38465E+03 ];
BALA_SRC_NEUTRON_VR         (idx, [1:  2])  = [ 0 0.00000E+00 ];
BALA_SRC_NEUTRON_TOT        (idx, [1:  2])  = [ 2000209 2.00559E+06 ];

BALA_LOSS_NEUTRON_CAPT       (idx, [1:  2])  = [ 958484 9.61035E+05 ];
BALA_LOSS_NEUTRON_FISS       (idx, [1:  2])  = [ 968398 9.70883E+05 ];
BALA_LOSS_NEUTRON_LEAK       (idx, [1:  2])  = [ 73315 7.34663E+04 ];
BALA_LOSS_NEUTRON_CUT        (idx, [1:  2])  = [ 0 0.00000E+00 ];
BALA_LOSS_NEUTRON_TOT        (idx, [1:  2])  = [ 2000197 2.00538E+06 ];

BALA_NEUTRON_DIFF            (idx, [1:  2])  = [ 12 2.09000E+02 ];

% Normalized total reaction rates (neutrons):

TOT_POWER                 (idx, [1:   2]) = [  1.00000E+02 0.0E+00 ];
TOT_POWDENS               (idx, [1:   2]) = [  1.02911E-06 0.0E+00 ];
TOT_GENRATE               (idx, [1:   2]) = [  7.64096E+12 2.5E-05 ];
TOT_FISSRATE              (idx, [1:   2]) = [  3.08018E+12 2.3E-06 ];
TOT_CAPTRATE              (idx, [1:   2]) = [  3.04430E+12 0.00096 ];
TOT_ABSRATE               (idx, [1:   2]) = [  6.12448E+12 0.00048 ];
TOT_SRCRATE               (idx, [1:   2]) = [  6.34752E+12 0.00078 ];
TOT_FLUX                  (idx, [1:   2]) = [  8.81923E+14 0.00118 ];
TOT_PHOTON_PRODRATE       (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
TOT_LEAKRATE              (idx, [1:   2]) = [  2.33186E+11 0.00382 ];
ALBEDO_LEAKRATE           (idx, [1:   2]) = [  0.00000E+00 0.0E+00 ];
TOT_LOSSRATE              (idx, [1:   2]) = [  6.35767E+12 0.00049 ];
TOT_CUTRATE               (idx, [1:   2]) = [  0.00000E+00 0.0E+00 ];
TOT_RR                    (idx, [1:   2]) = [  3.96163E+14 0.00129 ];
INI_FMASS                 (idx, 1)        =  9.71717E+01 ;
TOT_FMASS                 (idx, 1)        =  9.71717E+01 ;

% Fission neutron and energy production:

NUBAR                     (idx, [1:   2]) = [  2.48069E+00 2.7E-05 ];
FISSE                     (idx, [1:   2]) = [  2.02635E+02 2.3E-06 ];

% Criticality eigenvalues:

ANA_KEFF                  (idx, [1:   6]) = [  1.20401E+00 0.00071  1.19552E+00 0.00072  8.70020E-03 0.01196 ];
IMP_KEFF                  (idx, [1:   2]) = [  1.20519E+00 0.00049 ];
COL_KEFF                  (idx, [1:   2]) = [  1.20391E+00 0.00077 ];
ABS_KEFF                  (idx, [1:   2]) = [  1.20519E+00 0.00049 ];
ABS_KINF                  (idx, [1:   2]) = [  1.25121E+00 0.00047 ];
GEOM_ALBEDO               (idx, [1:   6]) = [  1.00000E+00 0.0E+00  1.00000E+00 0.0E+00  1.00000E+00 0.0E+00 ];

% ALF (Average lethargy of neutrons causing fission):
% Based on E0 = 2.000000E+01 MeV

ANA_ALF                   (idx, [1:   2]) = [  9.95233E+00 0.00058 ];
IMP_ALF                   (idx, [1:   2]) = [  9.94928E+00 0.00041 ];

% EALF (Energy corresponding to average lethargy of neutrons causing fission):

ANA_EALF                  (idx, [1:   2]) = [  9.55509E-04 0.00577 ];
IMP_EALF                  (idx, [1:   2]) = [  9.56819E-04 0.00407 ];

% AFGE (Average energy of neutrons causing fission):

ANA_AFGE                  (idx, [1:   2]) = [  4.18812E-01 0.00251 ];
IMP_AFGE                  (idx, [1:   2]) = [  4.18857E-01 0.00135 ];

% Forward-weighted delayed neutron parameters:

FWD_ANA_BETA_ZERO         (idx, [1:  14]) = [  6.14869E-03 0.00837  1.73084E-04 0.05219  9.99809E-04 0.01959  9.37876E-04 0.02097  2.81025E-03 0.01215  9.22839E-04 0.02218  3.04832E-04 0.03673 ];
FWD_ANA_LAMBDA            (idx, [1:  14]) = [  8.13143E-01 0.01939  1.08670E-02 0.02740  3.16087E-02 0.00038  1.10381E-01 0.00049  3.21360E-01 0.00034  1.34397E+00 0.00028  8.74771E+00 0.01043 ];

% Beta-eff using Meulekamp's method:

ADJ_MEULEKAMP_BETA_EFF    (idx, [1:  14]) = [  7.35629E-03 0.01278  2.05345E-04 0.07346  1.17590E-03 0.02783  1.12243E-03 0.03266  3.35828E-03 0.01809  1.14010E-03 0.03236  3.54244E-04 0.05552 ];
ADJ_MEULEKAMP_LAMBDA      (idx, [1:  14]) = [  8.04610E-01 0.02834  1.24908E-02 5.1E-06  3.15974E-02 0.00056  1.10445E-01 0.00073  3.21684E-01 0.00052  1.34404E+00 0.00038  8.89198E+00 0.00272 ];

% Adjoint weighted time constants using Nauchi's method:

ADJ_NAUCHI_GEN_TIME       (idx, [1:   6]) = [  3.24460E-06 0.00446  3.24066E-06 0.00448  3.86689E-06 0.04653 ];
ADJ_NAUCHI_LIFETIME       (idx, [1:   6]) = [  3.90614E-06 0.00441  3.90141E-06 0.00443  4.65418E-06 0.04653 ];
ADJ_NAUCHI_BETA_EFF       (idx, [1:  14]) = [  7.20823E-03 0.01195  2.03805E-04 0.07499  1.17973E-03 0.02880  1.11659E-03 0.03142  3.32005E-03 0.01744  1.06075E-03 0.03081  3.27307E-04 0.05578 ];
ADJ_NAUCHI_LAMBDA         (idx, [1:  14]) = [  7.75064E-01 0.02974  1.24908E-02 5.9E-06  3.16050E-02 0.00060  1.10354E-01 0.00073  3.21646E-01 0.00052  1.34437E+00 0.00043  8.95315E+00 0.00417 ];

% Adjoint weighted time constants using IFP:

ADJ_IFP_GEN_TIME          (idx, [1:   6]) = [  3.21439E-06 0.01130  3.21281E-06 0.01133  3.44734E-06 0.11353 ];
ADJ_IFP_LIFETIME          (idx, [1:   6]) = [  3.86925E-06 0.01120  3.86739E-06 0.01124  4.14373E-06 0.11300 ];
ADJ_IFP_IMP_BETA_EFF      (idx, [1:  14]) = [  7.29813E-03 0.03495  2.08532E-04 0.20219  1.23354E-03 0.08706  1.28328E-03 0.09514  3.19916E-03 0.05436  9.95288E-04 0.11095  3.78334E-04 0.14162 ];
ADJ_IFP_IMP_LAMBDA        (idx, [1:  14]) = [  8.47507E-01 0.08612  1.24907E-02 8.6E-06  3.15842E-02 0.00137  1.10457E-01 0.00174  3.20611E-01 0.00133  1.34509E+00 0.00096  8.91049E+00 0.00728 ];
ADJ_IFP_ANA_BETA_EFF      (idx, [1:  14]) = [  7.36745E-03 0.03372  1.99991E-04 0.19063  1.23710E-03 0.08384  1.26378E-03 0.09379  3.30982E-03 0.05162  9.75038E-04 0.10769  3.81719E-04 0.13513 ];
ADJ_IFP_ANA_LAMBDA        (idx, [1:  14]) = [  8.38845E-01 0.08399  1.24907E-02 8.6E-06  3.15806E-02 0.00137  1.10453E-01 0.00173  3.20668E-01 0.00131  1.34529E+00 0.00095  8.89677E+00 0.00707 ];
ADJ_IFP_ROSSI_ALPHA       (idx, [1:   2]) = [ -2.33238E+03 0.03739 ];

% Adjoint weighted time constants using perturbation technique:

ADJ_PERT_GEN_TIME         (idx, [1:   2]) = [  3.23560E-06 0.00212 ];
ADJ_PERT_LIFETIME         (idx, [1:   2]) = [  3.89525E-06 0.00196 ];
ADJ_PERT_BETA_EFF         (idx, [1:   2]) = [  7.28548E-03 0.00559 ];
ADJ_PERT_ROSSI_ALPHA      (idx, [1:   2]) = [ -2.25388E+03 0.00606 ];

% Inverse neutron speed :

ANA_INV_SPD               (idx, [1:   2]) = [  3.54392E-08 0.00198 ];

% Analog slowing-down and thermal neutron lifetime (total/prompt/delayed):

ANA_SLOW_TIME             (idx, [1:   6]) = [  9.30368E-06 0.00366  9.30699E-06 0.00367  8.90081E-06 0.04952 ];
ANA_THERM_TIME            (idx, [1:   6]) = [  1.96587E-05 0.00440  1.96524E-05 0.00446  2.07805E-05 0.04961 ];
ANA_THERM_FRAC            (idx, [1:   6]) = [  8.12520E-02 0.00229  8.10746E-02 0.00231  1.11437E-01 0.02957 ];
ANA_DELAYED_EMTIME        (idx, [1:   2]) = [  1.02559E+01 0.01765 ];
ANA_MEAN_NCOL             (idx, [1:   4]) = [  6.22510E+01 0.00092  3.64276E+01 0.00110 ];

% Group constant generation:

GC_UNIVERSE_NAME          (idx, [1:  1])  = '0' ;

% Micro- and macro-group structures:

MICRO_NG                  (idx, 1)        = 70 ;
MICRO_E                   (idx, [1:  71]) = [  1.00000E-11  5.00000E-09  1.00000E-08  1.50000E-08  2.00000E-08  2.50000E-08  3.00000E-08  3.50000E-08  4.20000E-08  5.00000E-08  5.80000E-08  6.70000E-08  8.00000E-08  1.00000E-07  1.40000E-07  1.80000E-07  2.20000E-07  2.50000E-07  2.80000E-07  3.00000E-07  3.20000E-07  3.50000E-07  4.00000E-07  5.00000E-07  6.25000E-07  7.80000E-07  8.50000E-07  9.10000E-07  9.50000E-07  9.72000E-07  9.96000E-07  1.02000E-06  1.04500E-06  1.07100E-06  1.09700E-06  1.12300E-06  1.15000E-06  1.30000E-06  1.50000E-06  1.85500E-06  2.10000E-06  2.60000E-06  3.30000E-06  4.00000E-06  9.87700E-06  1.59680E-05  2.77000E-05  4.80520E-05  7.55014E-05  1.48728E-04  3.67262E-04  9.06898E-04  1.42510E-03  2.23945E-03  3.51910E-03  5.50000E-03  9.11800E-03  1.50300E-02  2.47800E-02  4.08500E-02  6.74300E-02  1.11000E-01  1.83000E-01  3.02500E-01  5.00000E-01  8.21000E-01  1.35300E+00  2.23100E+00  3.67900E+00  6.06550E+00  2.00000E+01 ];

MACRO_NG                  (idx, 1)        = 2 ;
MACRO_E                   (idx, [1:   3]) = [  1.00000E+37  6.25000E-07  0.00000E+00 ];

% Micro-group spectrum:

INF_MICRO_FLX             (idx, [1: 140]) = [  4.97477E+04 0.00408  2.28543E+05 0.00172  6.50295E+05 0.00131  1.13836E+06 0.00146  1.76097E+06 0.00190  2.62651E+06 0.00152  2.71149E+06 0.00140  2.46599E+06 0.00154  2.20528E+06 0.00149  1.66958E+06 0.00121  1.41138E+06 0.00144  1.05533E+06 0.00153  1.28562E+06 0.00116  8.86939E+05 0.00104  6.40179E+05 0.00220  5.92985E+05 0.00138  6.30909E+05 0.00187  6.58061E+05 0.00163  6.02272E+05 0.00168  1.04189E+06 0.00224  8.09829E+05 0.00192  5.69610E+05 0.00154  3.31985E+05 0.00252  3.55106E+05 0.00130  3.04185E+05 0.00156  2.31617E+05 0.00236  3.32767E+05 0.00262  5.85213E+04 0.00414  6.42925E+04 0.00324  5.56556E+04 0.00286  2.77779E+04 0.00737  4.66759E+04 0.00419  2.82712E+04 0.00681  2.03820E+04 0.00626  3.50243E+03 0.01248  3.34476E+03 0.00607  3.33689E+03 0.00931  3.33410E+03 0.01096  3.36282E+03 0.01313  3.17032E+03 0.00928  3.22895E+03 0.00911  3.00076E+03 0.01664  5.65923E+03 0.00933  8.80506E+03 0.00733  1.07043E+04 0.00771  2.50476E+04 0.00573  2.17938E+04 0.00534  1.85479E+04 0.00596  9.64780E+03 0.01541  5.80862E+03 0.00907  4.17191E+03 0.01859  4.28928E+03 0.00788  6.82611E+03 0.00845  7.42896E+03 0.01243  1.11906E+04 0.00842  1.35724E+04 0.01068  1.65985E+04 0.01003  9.41304E+03 0.00988  6.39031E+03 0.01351  4.53640E+03 0.01580  3.92826E+03 0.01391  3.95883E+03 0.02272  3.34900E+03 0.01559  2.24530E+03 0.01736  2.07679E+03 0.01465  1.87383E+03 0.01950  1.62752E+03 0.01913  1.36937E+03 0.03799  9.37448E+02 0.04405  3.68031E+02 0.05197 ];

% Integral parameters:

INF_KINF                  (idx, [1:   2]) = [  1.24981E+00 0.00067 ];

% Flux spectra in infinite geometry:

INF_FLX                   (idx, [1:   4]) = [  8.76769E+14 0.00117  5.13992E+12 0.00374 ];
INF_FISS_FLX              (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];

% Reaction cross sections:

INF_TOT                   (idx, [1:   4]) = [  4.47341E-01 0.00027  7.66762E-01 0.00133 ];
INF_CAPT                  (idx, [1:   4]) = [  3.30559E-03 0.00062  2.84466E-02 0.00333 ];
INF_ABS                   (idx, [1:   4]) = [  6.40126E-03 0.00079  9.97391E-02 0.00445 ];
INF_FISS                  (idx, [1:   4]) = [  3.09567E-03 0.00110  7.12925E-02 0.00523 ];
INF_NSF                   (idx, [1:   4]) = [  7.69775E-03 0.00110  1.73718E-01 0.00523 ];
INF_NUBAR                 (idx, [1:   4]) = [  2.48662E+00 3.0E-05  2.43670E+00 0.0E+00 ];
INF_KAPPA                 (idx, [1:   4]) = [  2.02684E+02 2.4E-06  2.02270E+02 0.0E+00 ];
INF_INVV                  (idx, [1:   4]) = [  2.41447E-08 0.00096  1.96199E-06 0.00293 ];

% Total scattering cross sections:

INF_SCATT0                (idx, [1:   4]) = [  4.40933E-01 0.00027  6.67018E-01 0.00121 ];
INF_SCATT1                (idx, [1:   4]) = [  5.11535E-02 0.00072  8.25693E-02 0.00529 ];
INF_SCATT2                (idx, [1:   4]) = [  2.27787E-02 0.00091  2.22023E-02 0.01259 ];
INF_SCATT3                (idx, [1:   4]) = [  6.94894E-03 0.00296  7.17995E-03 0.03925 ];
INF_SCATT4                (idx, [1:   4]) = [  3.19454E-03 0.00467 -7.59858E-04 0.32967 ];
INF_SCATT5                (idx, [1:   4]) = [  1.17015E-03 0.01226  7.62780E-04 0.15345 ];
INF_SCATT6                (idx, [1:   4]) = [  1.43658E-03 0.00919 -2.80843E-03 0.06053 ];
INF_SCATT7                (idx, [1:   4]) = [  2.55466E-04 0.05204 -4.38696E-04 0.43265 ];

% Total scattering production cross sections:

INF_SCATTP0               (idx, [1:   4]) = [  4.40952E-01 0.00027  6.67018E-01 0.00121 ];
INF_SCATTP1               (idx, [1:   4]) = [  5.11539E-02 0.00072  8.25693E-02 0.00529 ];
INF_SCATTP2               (idx, [1:   4]) = [  2.27787E-02 0.00091  2.22023E-02 0.01259 ];
INF_SCATTP3               (idx, [1:   4]) = [  6.94887E-03 0.00295  7.17995E-03 0.03925 ];
INF_SCATTP4               (idx, [1:   4]) = [  3.19456E-03 0.00466 -7.59858E-04 0.32967 ];
INF_SCATTP5               (idx, [1:   4]) = [  1.17016E-03 0.01226  7.62780E-04 0.15345 ];
INF_SCATTP6               (idx, [1:   4]) = [  1.43660E-03 0.00919 -2.80843E-03 0.06053 ];
INF_SCATTP7               (idx, [1:   4]) = [  2.55587E-04 0.05211 -4.38696E-04 0.43265 ];

% Diffusion parameters:

INF_TRANSPXS              (idx, [1:   4]) = [  2.96247E-01 0.00030  6.77581E-01 0.00104 ];
INF_DIFFCOEF              (idx, [1:   4]) = [  1.12519E+00 0.00030  4.91951E-01 0.00104 ];

% Reduced absoption and removal:

INF_RABSXS                (idx, [1:   4]) = [  6.38176E-03 0.00075  9.97391E-02 0.00445 ];
INF_REMXS                 (idx, [1:   4]) = [  7.01137E-03 0.00089  1.02794E-01 0.00396 ];

% Poison cross sections:

INF_I135_YIELD            (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
INF_XE135_YIELD           (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
INF_PM147_YIELD           (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
INF_PM148_YIELD           (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
INF_PM148M_YIELD          (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
INF_PM149_YIELD           (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
INF_SM149_YIELD           (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
INF_I135_MICRO_ABS        (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
INF_XE135_MICRO_ABS       (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
INF_PM147_MICRO_ABS       (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
INF_PM148_MICRO_ABS       (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
INF_PM148M_MICRO_ABS      (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
INF_PM149_MICRO_ABS       (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
INF_SM149_MICRO_ABS       (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
INF_XE135_MACRO_ABS       (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
INF_SM149_MACRO_ABS       (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];

% Fission spectra:

INF_CHIT                  (idx, [1:   4]) = [  1.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
INF_CHIP                  (idx, [1:   4]) = [  1.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
INF_CHID                  (idx, [1:   4]) = [  1.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];

% Scattering matrixes:

INF_S0                    (idx, [1:   8]) = [  4.40330E-01 0.00028  6.02711E-04 0.00265  3.05038E-03 0.01263  6.63967E-01 0.00120 ];
INF_S1                    (idx, [1:   8]) = [  5.10174E-02 0.00072  1.36058E-04 0.00386  2.92976E-04 0.06074  8.22764E-02 0.00517 ];
INF_S2                    (idx, [1:   8]) = [  2.28556E-02 0.00091 -7.68895E-05 0.00892  1.56835E-04 0.21969  2.20454E-02 0.01286 ];
INF_S3                    (idx, [1:   8]) = [  7.01475E-03 0.00292 -6.58070E-05 0.00635  4.95853E-05 0.19599  7.13037E-03 0.03916 ];
INF_S4                    (idx, [1:   8]) = [  3.19800E-03 0.00469 -3.46363E-06 0.08195 -3.78012E-05 0.43538 -7.22057E-04 0.34338 ];
INF_S5                    (idx, [1:   8]) = [  1.15643E-03 0.01225  1.37209E-05 0.02599 -4.64492E-05 0.24803  8.09229E-04 0.15025 ];
INF_S6                    (idx, [1:   8]) = [  1.44243E-03 0.00921 -5.85337E-06 0.06422 -5.32889E-05 0.24650 -2.75514E-03 0.06093 ];
INF_S7                    (idx, [1:   8]) = [  2.67989E-04 0.04969 -1.25226E-05 0.02400 -5.88366E-05 0.16928 -3.79860E-04 0.50364 ];

% Scattering production matrixes:

INF_SP0                   (idx, [1:   8]) = [  4.40349E-01 0.00028  6.02711E-04 0.00265  3.05038E-03 0.01263  6.63967E-01 0.00120 ];
INF_SP1                   (idx, [1:   8]) = [  5.10178E-02 0.00072  1.36058E-04 0.00386  2.92976E-04 0.06074  8.22764E-02 0.00517 ];
INF_SP2                   (idx, [1:   8]) = [  2.28556E-02 0.00091 -7.68895E-05 0.00892  1.56835E-04 0.21969  2.20454E-02 0.01286 ];
INF_SP3                   (idx, [1:   8]) = [  7.01467E-03 0.00292 -6.58070E-05 0.00635  4.95853E-05 0.19599  7.13037E-03 0.03916 ];
INF_SP4                   (idx, [1:   8]) = [  3.19802E-03 0.00468 -3.46363E-06 0.08195 -3.78012E-05 0.43538 -7.22057E-04 0.34338 ];
INF_SP5                   (idx, [1:   8]) = [  1.15644E-03 0.01225  1.37209E-05 0.02599 -4.64492E-05 0.24803  8.09229E-04 0.15025 ];
INF_SP6                   (idx, [1:   8]) = [  1.44246E-03 0.00920 -5.85337E-06 0.06422 -5.32889E-05 0.24650 -2.75514E-03 0.06093 ];
INF_SP7                   (idx, [1:   8]) = [  2.68109E-04 0.04975 -1.25226E-05 0.02400 -5.88366E-05 0.16928 -3.79860E-04 0.50364 ];

% Micro-group spectrum:

B1_MICRO_FLX              (idx, [1: 140]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];

% Integral parameters:

B1_KINF                   (idx, [1:   2]) = [  0.00000E+00 0.0E+00 ];
B1_KEFF                   (idx, [1:   2]) = [  0.00000E+00 0.0E+00 ];
B1_B2                     (idx, [1:   2]) = [  0.00000E+00 0.0E+00 ];
B1_ERR                    (idx, [1:   2]) = [  0.00000E+00 0.0E+00 ];

% Critical spectra in infinite geometry:

B1_FLX                    (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_FISS_FLX               (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];

% Reaction cross sections:

B1_TOT                    (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_CAPT                   (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_ABS                    (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_FISS                   (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_NSF                    (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_NUBAR                  (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_KAPPA                  (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_INVV                   (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];

% Total scattering cross sections:

B1_SCATT0                 (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_SCATT1                 (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_SCATT2                 (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_SCATT3                 (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_SCATT4                 (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_SCATT5                 (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_SCATT6                 (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_SCATT7                 (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];

% Total scattering production cross sections:

B1_SCATTP0                (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_SCATTP1                (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_SCATTP2                (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_SCATTP3                (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_SCATTP4                (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_SCATTP5                (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_SCATTP6                (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_SCATTP7                (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];

% Diffusion parameters:

B1_TRANSPXS               (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_DIFFCOEF               (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];

% Reduced absoption and removal:

B1_RABSXS                 (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_REMXS                  (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];

% Poison cross sections:

B1_I135_YIELD             (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_XE135_YIELD            (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_PM147_YIELD            (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_PM148_YIELD            (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_PM148M_YIELD           (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_PM149_YIELD            (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_SM149_YIELD            (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_I135_MICRO_ABS         (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_XE135_MICRO_ABS        (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_PM147_MICRO_ABS        (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_PM148_MICRO_ABS        (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_PM148M_MICRO_ABS       (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_PM149_MICRO_ABS        (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_SM149_MICRO_ABS        (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_XE135_MACRO_ABS        (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_SM149_MACRO_ABS        (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];

% Fission spectra:

B1_CHIT                   (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_CHIP                   (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_CHID                   (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];

% Scattering matrixes:

B1_S0                     (idx, [1:   8]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_S1                     (idx, [1:   8]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_S2                     (idx, [1:   8]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_S3                     (idx, [1:   8]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_S4                     (idx, [1:   8]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_S5                     (idx, [1:   8]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_S6                     (idx, [1:   8]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_S7                     (idx, [1:   8]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];

% Scattering production matrixes:

B1_SP0                    (idx, [1:   8]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_SP1                    (idx, [1:   8]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_SP2                    (idx, [1:   8]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_SP3                    (idx, [1:   8]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_SP4                    (idx, [1:   8]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_SP5                    (idx, [1:   8]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_SP6                    (idx, [1:   8]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_SP7                    (idx, [1:   8]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];

% Additional diffusion parameters:

CMM_TRANSPXS              (idx, [1:   4]) = [  3.52384E-01 0.00135  5.87797E-01 0.03816 ];
CMM_TRANSPXS_X            (idx, [1:   4]) = [  3.59308E-01 0.00151  6.13875E-01 0.04643 ];
CMM_TRANSPXS_Y            (idx, [1:   4]) = [  3.59006E-01 0.00191  6.49887E-01 0.04876 ];
CMM_TRANSPXS_Z            (idx, [1:   4]) = [  3.39590E-01 0.00212  5.20748E-01 0.03328 ];
CMM_DIFFCOEF              (idx, [1:   4]) = [  9.45954E-01 0.00135  5.76139E-01 0.04625 ];
CMM_DIFFCOEF_X            (idx, [1:   4]) = [  9.27727E-01 0.00151  5.54744E-01 0.05160 ];
CMM_DIFFCOEF_Y            (idx, [1:   4]) = [  9.28519E-01 0.00192  5.26125E-01 0.05865 ];
CMM_DIFFCOEF_Z            (idx, [1:   4]) = [  9.81615E-01 0.00213  6.47549E-01 0.03868 ];

% Delayed neutron parameters (Meulekamp method):

BETA_EFF                  (idx, [1:  14]) = [  7.35629E-03 0.01278  2.05345E-04 0.07346  1.17590E-03 0.02783  1.12243E-03 0.03266  3.35828E-03 0.01809  1.14010E-03 0.03236  3.54244E-04 0.05552 ];
LAMBDA                    (idx, [1:  14]) = [  8.04610E-01 0.02834  1.24908E-02 5.1E-06  3.15974E-02 0.00056  1.10445E-01 0.00073  3.21684E-01 0.00052  1.34404E+00 0.00038  8.89198E+00 0.00272 ];

