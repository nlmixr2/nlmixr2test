Run Start Date:  30/08/2019 
Run Start Time:  8:57:36.73 
Run Stop Date:   30/08/2019 
Run Stop Time:  10:02:31.21 
  
************************************************************************************************************************ 
********************                            CONTROL STREAM                                      ******************** 
************************************************************************************************************************ 
  
$PROB    ORAL1_2CPT_KAV1QV2VMKM SINGLE and MULTIPLE DOSE FOCEI (120 Ind/2280 Obs) runODE070
$INPUT   ID TIME DV LNDV MDV AMT EVID DOSE VI VMI KMI QI V2I KAI SD CMT
$DATA    ORAL_2CPTMM.csv IGNORE=@ 
$SUBR    ADVAN13 TOL=6
$MODEL
         COMP=(ABS,DEFDOSE)
         COMP=(CENTRAL,DEFOBS)
         COMP=(PERI)
$PK
         VM=EXP(THETA(1)+ETA(1))
         KM=EXP(THETA(2)+ETA(2))
         V2=EXP(THETA(3)+ETA(3))
         Q =EXP(THETA(4)+ETA(4))
         V3=EXP(THETA(5)+ETA(5))
         K12=EXP(THETA(6)+ETA(6))
         K23=Q/V2
         K32=Q/V3
         S2=V2
$DES
         C2     =  A(2)/V2
         DADT(1)= -K12*A(1)
         DADT(2)=  K12*A(1)+K32*A(3)-K23*A(2)-VM*C2/(KM+C2)  
         DADT(3)=         -K32*A(3)+K23*A(2)
$ERROR   
         IPRED = F     
         RESCV = THETA(7) 
         W     = IPRED*RESCV
         IRES  = DV-IPRED
         IWRES = IRES/W
         Y     = IPRED+W*EPS(1)

$THETA   7.1       ;log VM
$THETA   5.7       ;log KM 
$THETA   4.5       ;log Vc
$THETA   1.6       ;log Q
$THETA   4.1       ;log Vp
$THETA   0.22      ;log KA
$THETA   (0,0.3,1) ;RSV
$OMEGA   0.15 0.15 0.15 0.15 0.15 0.15
$SIGMA   1 FIX
$EST     NSIG=2 SIGL=6 PRINT=5 MAX=9999 NOABORT POSTHOC METHOD=COND INTER NOOBT
$COV
$TABLE  ID TIME LNDV MDV AMT EVID DOSE VI VMI KMI V2I V2 VM KM Q V3 K12 ETA1 ETA2 ETA3 ETA4 ETA5 ETA6
        IPRED IRES IWRES CWRESI
        ONEHEADER NOPRINT FILE=runODE070.csv   
   
************************************************************************************************************************ 
********************                            SYSTEM INFORMATION                                  ******************** 
************************************************************************************************************************ 
   
Operating system: 

Microsoft Windows [Version 10.0.18362.295]
   
Compiler: Intel(R) Parallel Studio XE 2015 Update 3 Composer Edition (package 208)  
   
Compiler settings: /Gs /nologo /nbs /w /fp:strict   
   
************************************************************************************************************************ 
********************                            NMTRAN MESSAGES                                     ******************** 
************************************************************************************************************************ 
   
  
 WARNINGS AND ERRORS (IF ANY) FOR PROBLEM    1
             
 (WARNING  2) NM-TRAN INFERS THAT THE DATA ARE POPULATION.
   
************************************************************************************************************************ 
********************                            NONMEM EXECUTION                                    ******************** 
************************************************************************************************************************ 
   
License Registered to: Occams Cooperatie U.A
Expiration Date:    14 JUN 2020
Current Date:       30 AUG 2019
Days until program expires : 289
1NONLINEAR MIXED EFFECTS MODEL PROGRAM (NONMEM) VERSION 7.4.3
 ORIGINALLY DEVELOPED BY STUART BEAL, LEWIS SHEINER, AND ALISON BOECKMANN
 CURRENT DEVELOPERS ARE ROBERT BAUER, ICON DEVELOPMENT SOLUTIONS,
 AND ALISON BOECKMANN. IMPLEMENTATION, EFFICIENCY, AND STANDARDIZATION
 PERFORMED BY NOUS INFOSYSTEMS.

 PROBLEM NO.:         1
 ORAL1_2CPT_KAV1QV2VMKM SINGLE and MULTIPLE DOSE FOCEI (120 Ind/2280 Obs)
0DATA CHECKOUT RUN:              NO
 DATA SET LOCATED ON UNIT NO.:    2
 THIS UNIT TO BE REWOUND:        NO
 NO. OF DATA RECS IN DATA SET:     7920
 NO. OF DATA ITEMS IN DATA SET:  16
 ID DATA ITEM IS DATA ITEM NO.:   1
 DEP VARIABLE IS DATA ITEM NO.:   3
 MDV DATA ITEM IS DATA ITEM NO.:  5
0INDICES PASSED TO SUBROUTINE PRED:
   7   2   6   0   0   0  16   0   0   0   0
0LABELS FOR DATA ITEMS:
 ID TIME DV LNDV MDV AMT EVID DOSE VI VMI KMI QI V2I KAI SD CMT
0(NONBLANK) LABELS FOR PRED-DEFINED ITEMS:
 VM KM V2 Q V3 K12 IPRED IRES IWRES
0FORMAT FOR DATA:
 (E3.0,3E6.0,E1.0,E5.0,E1.0,2E5.0,E6.0,E5.0,E4.0,2E5.0,2E1.0)

 TOT. NO. OF OBS RECS:     6960
 TOT. NO. OF INDIVIDUALS:      120
0LENGTH OF THETA:   7
0DEFAULT THETA BOUNDARY TEST OMITTED:    NO
0OMEGA HAS SIMPLE DIAGONAL FORM WITH DIMENSION:   6
0DEFAULT OMEGA BOUNDARY TEST OMITTED:   YES
0SIGMA HAS SIMPLE DIAGONAL FORM WITH DIMENSION:   1
0DEFAULT SIGMA BOUNDARY TEST OMITTED:    NO
0INITIAL ESTIMATE OF THETA:
 LOWER BOUND    INITIAL EST    UPPER BOUND
 -0.1000E+07     0.7100E+01     0.1000E+07
 -0.1000E+07     0.5700E+01     0.1000E+07
 -0.1000E+07     0.4500E+01     0.1000E+07
 -0.1000E+07     0.1600E+01     0.1000E+07
 -0.1000E+07     0.4100E+01     0.1000E+07
 -0.1000E+07     0.2200E+00     0.1000E+07
  0.0000E+00     0.3000E+00     0.1000E+01
0INITIAL ESTIMATE OF OMEGA:
 0.1500E+00
 0.0000E+00   0.1500E+00
 0.0000E+00   0.0000E+00   0.1500E+00
 0.0000E+00   0.0000E+00   0.0000E+00   0.1500E+00
 0.0000E+00   0.0000E+00   0.0000E+00   0.0000E+00   0.1500E+00
 0.0000E+00   0.0000E+00   0.0000E+00   0.0000E+00   0.0000E+00   0.1500E+00
0INITIAL ESTIMATE OF SIGMA:
 0.1000E+01
0SIGMA CONSTRAINED TO BE THIS INITIAL ESTIMATE
0COVARIANCE STEP OMITTED:        NO
 EIGENVLS. PRINTED:              NO
 SPECIAL COMPUTATION:            NO
 COMPRESSED FORMAT:              NO
 GRADIENT METHOD USED:     NOSLOW
 SIGDIGITS ETAHAT (SIGLO):                  -1
 SIGDIGITS GRADIENTS (SIGL):                -1
 EXCLUDE COV FOR FOCE (NOFCOV):              NO
 TURN OFF Cholesky Transposition of R Matrix (CHOLROFF): NO
 KNUTHSUMOFF:                                -1
 RESUME COV ANALYSIS (RESUME):               NO
 SIR SAMPLE SIZE (SIRSAMPLE):              -1
 NON-LINEARLY TRANSFORM THETAS DURING COV (THBND): 1
 PRECONDTIONING CYCLES (PRECOND):        0
 PRECONDTIONING TYPES (PRECONDS):        TOS
 FORCED PRECONDTIONING CYCLES (PFCOND):0
 PRECONDTIONING TYPE (PRETYPE):        0
 FORCED POS. DEFINITE SETTING: (FPOSDEF):0
0TABLES STEP OMITTED:    NO
 NO. OF TABLES:           1
 SEED NUMBER (SEED):    11456
 RANMETHOD:             3U
 MC SAMPLES (ESAMPLE):    300
 WRES SQUARE ROOT TYPE (WRESCHOL): EIGENVALUE
0-- TABLE   1 --
0RECORDS ONLY:    ALL
04 COLUMNS APPENDED:    YES
 PRINTED:                NO
 HEADERS:               ONE
 FILE TO BE FORWARDED:   NO
 FORMAT:                S1PE11.4
 LFORMAT:
 RFORMAT:
 FIXED_EFFECT_ETAS:
0USER-CHOSEN ITEMS:
 ID TIME LNDV MDV AMT EVID DOSE VI VMI KMI V2I V2 VM KM Q V3 K12 ETA1 ETA2 ETA3 ETA4 ETA5 ETA6 IPRED IRES IWRES CWRESI
1DOUBLE PRECISION PREDPP VERSION 7.4.3

 GENERAL NONLINEAR KINETICS MODEL WITH STIFF/NONSTIFF EQUATIONS (LSODA, ADVAN13)
0MODEL SUBROUTINE USER-SUPPLIED - ID NO. 9999
0MAXIMUM NO. OF BASIC PK PARAMETERS:   6
0COMPARTMENT ATTRIBUTES
 COMPT. NO.   FUNCTION   INITIAL    ON/OFF      DOSE      DEFAULT    DEFAULT
                         STATUS     ALLOWED    ALLOWED    FOR DOSE   FOR OBS.
    1         ABS          ON         YES        YES        YES        NO
    2         CENTRAL      ON         YES        YES        NO         YES
    3         PERI         ON         YES        YES        NO         NO
    4         OUTPUT       OFF        YES        NO         NO         NO
 INITIAL (BASE) TOLERANCE SETTINGS:
 NRD (RELATIVE) VALUE(S) OF TOLERANCE:   6
 ANRD (ABSOLUTE) VALUE(S) OF TOLERANCE:  12
1
 ADDITIONAL PK PARAMETERS - ASSIGNMENT OF ROWS IN GG
 COMPT. NO.                             INDICES
              SCALE      BIOAVAIL.   ZERO-ORDER  ZERO-ORDER  ABSORB
                         FRACTION    RATE        DURATION    LAG
    1            *           *           *           *           *
    2            7           *           *           *           *
    3            *           *           *           *           *
    4            *           -           -           -           -
             - PARAMETER IS NOT ALLOWED FOR THIS MODEL
             * PARAMETER IS NOT SUPPLIED BY PK SUBROUTINE;
               WILL DEFAULT TO ONE IF APPLICABLE
0DATA ITEM INDICES USED BY PRED ARE:
   EVENT ID DATA ITEM IS DATA ITEM NO.:      7
   TIME DATA ITEM IS DATA ITEM NO.:          2
   DOSE AMOUNT DATA ITEM IS DATA ITEM NO.:   6
   COMPT. NO. DATA ITEM IS DATA ITEM NO.:   16

0PK SUBROUTINE CALLED WITH EVERY EVENT RECORD.
 PK SUBROUTINE NOT CALLED AT NONEVENT (ADDITIONAL OR LAGGED) DOSE TIMES.
0ERROR SUBROUTINE CALLED WITH EVERY EVENT RECORD.
0DES SUBROUTINE USES COMPACT STORAGE MODE.
1
 
 
 #TBLN:      1
 #METH: First Order Conditional Estimation with Interaction
 
 ESTIMATION STEP OMITTED:                 NO
 ANALYSIS TYPE:                           POPULATION
 NUMBER OF SADDLE POINT RESET ITERATIONS:      0
 GRADIENT METHOD USED:               NOSLOW
 CONDITIONAL ESTIMATES USED:              YES
 CENTERED ETA:                            NO
 EPS-ETA INTERACTION:                     YES
 LAPLACIAN OBJ. FUNC.:                    NO
 NO. OF FUNCT. EVALS. ALLOWED:            9999
 NO. OF SIG. FIGURES REQUIRED:            2
 INTERMEDIATE PRINTOUT:                   YES
 ESTIMATE OUTPUT TO MSF:                  NO
 ABORT WITH PRED EXIT CODE 1:             NO
 IND. OBJ. FUNC. VALUES SORTED:           NO
 NUMERICAL DERIVATIVE
       FILE REQUEST (NUMDER):               NONE
 MAP (ETAHAT) ESTIMATION METHOD (OPTMAP):   0
 ETA HESSIAN EVALUATION METHOD (ETADER):    0
 INITIAL ETA FOR MAP ESTIMATION (MCETA):    0
 SIGDIGITS FOR MAP ESTIMATION (SIGLO):      6
 GRADIENT SIGDIGITS OF
       FIXED EFFECTS PARAMETERS (SIGL):     6
 NOPRIOR SETTING (NOPRIOR):                 OFF
 NOCOV SETTING (NOCOV):                     OFF
 DERCONT SETTING (DERCONT):                 OFF
 FINAL ETA RE-EVALUATION (FNLETA):          ON
 EXCLUDE NON-INFLUENTIAL (NON-INFL.) ETAS
       IN SHRINKAGE (ETASTYPE):             NO
 NON-INFL. ETA CORRECTION (NONINFETA):      OFF
 RAW OUTPUT FILE (FILE): runODE070.ext
 EXCLUDE TITLE (NOTITLE):                   NO
 EXCLUDE COLUMN LABELS (NOLABEL):           NO
 FORMAT FOR ADDITIONAL FILES (FORMAT):      S1PE12.5
 PARAMETER ORDER FOR OUTPUTS (ORDER):       TSOL
 WISHART PRIOR DF INTERPRETATION (WISHTYPE):0
 KNUTHSUMOFF:                               0
 INCLUDE LNTWOPI:                           NO
 INCLUDE CONSTANT TERM TO PRIOR (PRIORC):   NO
 INCLUDE CONSTANT TERM TO OMEGA (ETA) (OLNTWOPI):NO
 ADDITIONAL CONVERGENCE TEST (CTYPE=4)?:    NO
 EM OR BAYESIAN METHOD USED:                 NONE

 TOLERANCES FOR ESTIMATION/EVALUATION STEP:
 NRD (RELATIVE) VALUE(S) OF TOLERANCE:   6
 ANRD (ABSOLUTE) VALUE(S) OF TOLERANCE:  12
 TOLERANCES FOR COVARIANCE STEP:
 NRD (RELATIVE) VALUE(S) OF TOLERANCE:   6
 ANRD (ABSOLUTE) VALUE(S) OF TOLERANCE:  12
 TOLERANCES FOR TABLE/SCATTER STEP:
 NRD (RELATIVE) VALUE(S) OF TOLERANCE:   6
 ANRD (ABSOLUTE) VALUE(S) OF TOLERANCE:  12
 
 THE FOLLOWING LABELS ARE EQUIVALENT
 PRED=PREDI
 RES=RESI
 WRES=WRESI
 IWRS=IWRESI
 IPRD=IPREDI
 IRS=IRESI
 
 MONITORING OF SEARCH:

 
0ITERATION NO.:    0    OBJECTIVE VALUE:   71196.1732872047        NO. OF FUNC. EVALS.:   9
 CUMULATIVE NO. OF FUNC. EVALS.:        9
 NPARAMETR:  7.1000E+00  5.7000E+00  4.5000E+00  1.6000E+00  4.1000E+00  2.2000E-01  3.0000E-01  1.5000E-01  1.5000E-01  1.5000E-01
             1.5000E-01  1.5000E-01  1.5000E-01
 PARAMETER:  1.0000E-01  1.0000E-01  1.0000E-01  1.0000E-01  1.0000E-01  1.0000E-01  1.0000E-01  1.0000E-01  1.0000E-01  1.0000E-01
             1.0000E-01  1.0000E-01  1.0000E-01
 GRADIENT:   5.2138E+04  1.2048E+04  1.8934E+04  2.3046E+03  1.0062E+04  5.9121E+02  4.4075E+03  7.1336E+01  3.5568E+01  1.2915E+01
             6.0450E-01  3.0991E+01  2.5039E+01
 
0ITERATION NO.:    5    OBJECTIVE VALUE:   69630.4414671567        NO. OF FUNC. EVALS.: 110
 CUMULATIVE NO. OF FUNC. EVALS.:      119             RESET HESSIAN, TYPE I
 NPARAMETR:  6.8081E+00  5.3050E+00  4.3284E+00  1.4225E+00  4.0083E+00  1.1286E-01  1.9214E-01  1.1374E-01  1.3667E-01  1.3059E-01
             1.4279E-01  6.7848E-02  1.4164E-01
 PARAMETER:  9.5889E-02  9.3071E-02  9.6188E-02  8.8903E-02  9.7765E-02  5.1299E-02 -4.8887E-01 -3.8349E-02  5.3458E-02  3.0720E-02
             7.5360E-02 -2.9669E-01  7.1314E-02
 GRADIENT:   8.3591E+04  8.2979E+03  1.8751E+04  7.9427E+02  9.6886E+03  4.0680E+02 -9.3700E+02  5.9486E+01  2.2642E+01  2.7374E+01
             3.2439E+00 -8.5143E+00  4.1868E+01
 
0ITERATION NO.:   10    OBJECTIVE VALUE:   69558.9589605513        NO. OF FUNC. EVALS.: 132
 CUMULATIVE NO. OF FUNC. EVALS.:      251             RESET HESSIAN, TYPE I
 NPARAMETR:  6.7918E+00  5.4135E+00  4.2796E+00  1.3508E+00  3.9451E+00  1.5874E-02  1.9832E-01  9.9041E-02  1.2303E-01  1.1962E-01
             1.4057E-01  6.8209E-02  7.1565E-02
 PARAMETER:  9.5660E-02  9.4974E-02  9.5103E-02  8.4427E-02  9.6223E-02  7.2155E-03 -4.4955E-01 -1.0755E-01  9.0481E-04 -1.3142E-02
             6.7534E-02 -2.9403E-01 -2.7001E-01
 GRADIENT:   7.2370E+04  1.3290E+04  1.3657E+04 -4.6059E+01  4.4716E+03  1.2014E+02 -2.7000E+02  3.6971E+01  3.4411E+01  1.8464E+01
             6.5327E+00  2.2034E+00 -1.6858E+01
 
0ITERATION NO.:   15    OBJECTIVE VALUE:   69542.7583729167        NO. OF FUNC. EVALS.:  99
 CUMULATIVE NO. OF FUNC. EVALS.:      350
 NPARAMETR:  6.8120E+00  5.4444E+00  4.2614E+00  1.3673E+00  3.9265E+00 -6.7002E-03  2.0097E-01  8.6698E-02  6.5086E-02  1.1372E-01
             1.4016E-01  6.5978E-02  7.4994E-02
 PARAMETER:  9.5944E-02  9.5516E-02  9.4697E-02  8.5459E-02  9.5768E-02 -3.0456E-03 -4.3292E-01 -1.7410E-01 -3.1746E-01 -3.8428E-02
             6.6060E-02 -3.1066E-01 -2.4661E-01
 GRADIENT:   7.1884E+04  1.3805E+04  1.2116E+04 -1.1879E+02  3.3618E+03  2.9044E+01 -1.4554E+01  1.6938E+01 -4.4177E-01  8.5630E+00
             7.1060E+00  2.9939E+00 -1.0974E+01
 
0ITERATION NO.:   20    OBJECTIVE VALUE:   69533.5540690416        NO. OF FUNC. EVALS.: 154
 CUMULATIVE NO. OF FUNC. EVALS.:      504             RESET HESSIAN, TYPE I
 NPARAMETR:  6.8827E+00  5.5074E+00  4.2553E+00  1.3965E+00  3.8979E+00 -1.8768E-02  2.0110E-01  7.2417E-02  7.0205E-02  1.0989E-01
             9.7151E-02  6.2749E-02  8.3151E-02
 PARAMETER:  9.6940E-02  9.6622E-02  9.4563E-02  8.7278E-02  9.5071E-02 -8.5310E-03 -4.3215E-01 -2.6410E-01 -2.7961E-01 -5.5585E-02
            -1.1719E-01 -3.3575E-01 -1.9499E-01
 GRADIENT:   7.9003E+04  1.6319E+04  1.2016E+04  9.3635E+01  2.4192E+03  3.2446E+00  4.4789E-01  2.0690E+00 -1.2947E+00  1.8170E-01
            -1.2251E+00 -5.6187E-01 -2.5288E+00
 
0ITERATION NO.:   25    OBJECTIVE VALUE:   69533.3137917282        NO. OF FUNC. EVALS.: 133
 CUMULATIVE NO. OF FUNC. EVALS.:      637
 NPARAMETR:  6.8896E+00  5.5187E+00  4.2560E+00  1.3893E+00  3.8940E+00 -1.8369E-02  2.0113E-01  7.1450E-02  7.1831E-02  1.0980E-01
             1.1071E-01  6.3367E-02  8.4865E-02
 PARAMETER:  9.7036E-02  9.6819E-02  9.4578E-02  8.6829E-02  9.4975E-02 -8.3498E-03 -4.3192E-01 -2.7082E-01 -2.6816E-01 -5.6003E-02
            -5.1857E-02 -3.3085E-01 -1.8479E-01
 GRADIENT:   1.4677E+05 -1.7576E+04  4.4259E+03 -2.8179E+01  6.2604E+02 -7.7051E+00  4.8135E+00  1.3565E+00 -6.5595E-01  6.0885E-01
             1.9610E+00 -3.2240E-01  6.9123E-01
 
0ITERATION NO.:   30    OBJECTIVE VALUE:   69533.1836870306        NO. OF FUNC. EVALS.: 160
 CUMULATIVE NO. OF FUNC. EVALS.:      797             RESET HESSIAN, TYPE I
 NPARAMETR:  6.8963E+00  5.5251E+00  4.2568E+00  1.3884E+00  3.8895E+00 -1.6215E-02  2.0110E-01  7.0335E-02  7.3440E-02  1.0953E-01
             1.0072E-01  6.4045E-02  8.4729E-02
 PARAMETER:  9.7131E-02  9.6931E-02  9.4596E-02  8.6777E-02  9.4866E-02 -7.3706E-03 -4.3216E-01 -2.7869E-01 -2.5708E-01 -5.7210E-02
            -9.9150E-02 -3.2553E-01 -1.8559E-01
 GRADIENT:   8.0289E+04  1.7098E+04  1.2027E+04  4.5940E+01  2.1211E+03  4.6318E+00  3.7526E+00  1.3062E-01 -9.9934E-02 -5.6564E-02
             2.0423E-02 -7.2062E-02 -1.5359E-01
 
0ITERATION NO.:   35    OBJECTIVE VALUE:   69533.1810347568        NO. OF FUNC. EVALS.: 141
 CUMULATIVE NO. OF FUNC. EVALS.:      938
 NPARAMETR:  6.8970E+00  5.5261E+00  4.2571E+00  1.3871E+00  3.8887E+00 -1.5876E-02  2.0110E-01  7.0244E-02  7.3725E-02  1.0949E-01
             1.0039E-01  6.4159E-02  8.4889E-02
 PARAMETER:  9.7141E-02  9.6948E-02  9.4603E-02  8.6695E-02  9.4846E-02 -7.2165E-03 -4.3216E-01 -2.7933E-01 -2.5515E-01 -5.7415E-02
            -1.0079E-01 -3.2463E-01 -1.8465E-01
 GRADIENT:   1.4767E+05 -1.7415E+04  4.4602E+03  3.5487E+00  4.7418E+02 -3.6375E-01 -1.2790E-01  9.3974E-02  5.6274E-02 -1.0452E-01
             2.2237E-02 -4.1794E-02  5.1532E-02
 
0ITERATION NO.:   36    OBJECTIVE VALUE:   69533.1810347568        NO. OF FUNC. EVALS.:  29
 CUMULATIVE NO. OF FUNC. EVALS.:      967
 NPARAMETR:  6.8970E+00  5.5261E+00  4.2571E+00  1.3871E+00  3.8887E+00 -1.5876E-02  2.0110E-01  7.0244E-02  7.3725E-02  1.0949E-01
             1.0039E-01  6.4159E-02  8.4889E-02
 PARAMETER:  9.7141E-02  9.6948E-02  9.4603E-02  8.6695E-02  9.4846E-02 -7.2165E-03 -4.3216E-01 -2.7933E-01 -2.5515E-01 -5.7415E-02
            -1.0079E-01 -3.2463E-01 -1.8465E-01
 GRADIENT:  -2.8588E+01 -1.4046E+01 -5.9977E+00  4.8433E+00  1.1131E+01 -1.5124E-01 -1.0758E-01  9.3662E-02  7.5512E-02 -4.6050E-02
            -1.5863E-01 -2.5905E-02 -3.3588E-02
 
 #TERM:
0MINIMIZATION SUCCESSFUL
 HOWEVER, PROBLEMS OCCURRED WITH THE MINIMIZATION.
 REGARD THE RESULTS OF THE ESTIMATION STEP CAREFULLY, AND ACCEPT THEM ONLY
 AFTER CHECKING THAT THE COVARIANCE STEP PRODUCES REASONABLE OUTPUT.
 NO. OF FUNCTION EVALUATIONS USED:      967
 NO. OF SIG. DIGITS IN FINAL EST.:  2.2

 ETABAR IS THE ARITHMETIC MEAN OF THE ETA-ESTIMATES,
 AND THE P-VALUE IS GIVEN FOR THE NULL HYPOTHESIS THAT THE TRUE MEAN IS 0.
 
 ETABAR:         5.3973E-03 -8.7640E-03 -9.9928E-03  1.1740E-02 -6.3204E-03 -1.2900E-02
 SE:             2.1288E-02  1.6725E-02  2.9012E-02  1.4521E-02  1.6176E-02  2.2276E-02
 N:                     120         120         120         120         120         120
 
 P VAL.:         7.9986E-01  6.0028E-01  7.3052E-01  4.1884E-01  6.9601E-01  5.6252E-01
 
 ETASHRINKSD(%)  1.1642E+01  3.2239E+01  3.5491E+00  4.9584E+01  2.9748E+01  1.5895E+01
 ETASHRINKVR(%)  2.1928E+01  5.4085E+01  6.9722E+00  7.4582E+01  5.0646E+01  2.9263E+01
 EBVSHRINKSD(%)  1.1287E+01  3.3125E+01  4.0684E+00  5.0015E+01  3.0465E+01  1.6202E+01
 EBVSHRINKVR(%)  2.1300E+01  5.5277E+01  7.9714E+00  7.5015E+01  5.1648E+01  2.9779E+01
 EPSSHRINKSD(%)  2.9182E+00
 EPSSHRINKVR(%)  5.7513E+00
 
  
 TOTAL DATA POINTS NORMALLY DISTRIBUTED (N):         6960
 N*LOG(2PI) CONSTANT TO OBJECTIVE FUNCTION:    12791.6243822090     
 OBJECTIVE FUNCTION VALUE WITHOUT CONSTANT:    69533.1810347568     
 OBJECTIVE FUNCTION VALUE WITH CONSTANT:       82324.8054169658     
 REPORTED OBJECTIVE FUNCTION DOES NOT CONTAIN CONSTANT
  
 TOTAL EFFECTIVE ETAS (NIND*NETA):                           720
  
 #TERE:
 Elapsed estimation  time in seconds:  3275.41
 Elapsed covariance  time in seconds:   600.53
 Elapsed postprocess time in seconds:     4.90
1
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 ************************************************************************************************************************
 ********************                                                                                ********************
 ********************               FIRST ORDER CONDITIONAL ESTIMATION WITH INTERACTION              ********************
 #OBJT:**************                       MINIMUM VALUE OF OBJECTIVE FUNCTION                      ********************
 ********************                                                                                ********************
 ************************************************************************************************************************
 





 #OBJV:********************************************    69533.181       **************************************************
1
 ************************************************************************************************************************
 ********************                                                                                ********************
 ********************               FIRST ORDER CONDITIONAL ESTIMATION WITH INTERACTION              ********************
 ********************                             FINAL PARAMETER ESTIMATE                           ********************
 ********************                                                                                ********************
 ************************************************************************************************************************
 


 THETA - VECTOR OF FIXED EFFECTS PARAMETERS   *********


         TH 1      TH 2      TH 3      TH 4      TH 5      TH 6      TH 7     
 
         6.90E+00  5.53E+00  4.26E+00  1.39E+00  3.89E+00 -1.59E-02  2.01E-01
 


 OMEGA - COV MATRIX FOR RANDOM EFFECTS - ETAS  ********


         ETA1      ETA2      ETA3      ETA4      ETA5      ETA6     
 
 ETA1
+        7.02E-02
 
 ETA2
+        0.00E+00  7.37E-02
 
 ETA3
+        0.00E+00  0.00E+00  1.09E-01
 
 ETA4
+        0.00E+00  0.00E+00  0.00E+00  1.00E-01
 
 ETA5
+        0.00E+00  0.00E+00  0.00E+00  0.00E+00  6.42E-02
 
 ETA6
+        0.00E+00  0.00E+00  0.00E+00  0.00E+00  0.00E+00  8.49E-02
 


 SIGMA - COV MATRIX FOR RANDOM EFFECTS - EPSILONS  ****


         EPS1     
 
 EPS1
+        1.00E+00
 
1


 OMEGA - CORR MATRIX FOR RANDOM EFFECTS - ETAS  *******


         ETA1      ETA2      ETA3      ETA4      ETA5      ETA6     
 
 ETA1
+        2.65E-01
 
 ETA2
+        0.00E+00  2.72E-01
 
 ETA3
+        0.00E+00  0.00E+00  3.31E-01
 
 ETA4
+        0.00E+00  0.00E+00  0.00E+00  3.17E-01
 
 ETA5
+        0.00E+00  0.00E+00  0.00E+00  0.00E+00  2.53E-01
 
 ETA6
+        0.00E+00  0.00E+00  0.00E+00  0.00E+00  0.00E+00  2.91E-01
 


 SIGMA - CORR MATRIX FOR RANDOM EFFECTS - EPSILONS  ***


         EPS1     
 
 EPS1
+        1.00E+00
 
1
 ************************************************************************************************************************
 ********************                                                                                ********************
 ********************               FIRST ORDER CONDITIONAL ESTIMATION WITH INTERACTION              ********************
 ********************                            STANDARD ERROR OF ESTIMATE                          ********************
 ********************                                                                                ********************
 ************************************************************************************************************************
 


 THETA - VECTOR OF FIXED EFFECTS PARAMETERS   *********


         TH 1      TH 2      TH 3      TH 4      TH 5      TH 6      TH 7     
 
         3.20E-02  4.34E-02  3.44E-02  7.70E-02  3.91E-02  3.77E-02  1.89E-03
 


 OMEGA - COV MATRIX FOR RANDOM EFFECTS - ETAS  ********


         ETA1      ETA2      ETA3      ETA4      ETA5      ETA6     
 
 ETA1
+        1.30E-02
 
 ETA2
+       .........  1.97E-02
 
 ETA3
+       ......... .........  1.54E-02
 
 ETA4
+       ......... ......... .........  3.92E-02
 
 ETA5
+       ......... ......... ......... .........  1.66E-02
 
 ETA6
+       ......... ......... ......... ......... .........  1.79E-02
 


 SIGMA - COV MATRIX FOR RANDOM EFFECTS - EPSILONS  ****


         EPS1     
 
 EPS1
+       .........
 
1


 OMEGA - CORR MATRIX FOR RANDOM EFFECTS - ETAS  *******


         ETA1      ETA2      ETA3      ETA4      ETA5      ETA6     
 
 ETA1
+        2.45E-02
 
 ETA2
+       .........  3.63E-02
 
 ETA3
+       ......... .........  2.32E-02
 
 ETA4
+       ......... ......... .........  6.18E-02
 
 ETA5
+       ......... ......... ......... .........  3.27E-02
 
 ETA6
+       ......... ......... ......... ......... .........  3.07E-02
 


 SIGMA - CORR MATRIX FOR RANDOM EFFECTS - EPSILONS  ***


         EPS1     
 
 EPS1
+       .........
 
1
 ************************************************************************************************************************
 ********************                                                                                ********************
 ********************               FIRST ORDER CONDITIONAL ESTIMATION WITH INTERACTION              ********************
 ********************                          COVARIANCE MATRIX OF ESTIMATE                         ********************
 ********************                                                                                ********************
 ************************************************************************************************************************
 

            TH 1      TH 2      TH 3      TH 4      TH 5      TH 6      TH 7      OM11      OM12      OM13      OM14      OM15  
             OM16      OM22      OM23      OM24      OM25      OM26      OM33      OM34      OM35      OM36      OM44      OM45  
            OM46      OM55      OM56      OM66      SG11  
 
 TH 1
+        1.03E-03
 
 TH 2
+        6.24E-04  1.88E-03
 
 TH 3
+       -1.79E-05  3.23E-06  1.18E-03
 
 TH 4
+       -6.38E-05 -2.50E-04 -9.40E-04  5.92E-03
 
 TH 5
+       -3.36E-04 -2.68E-04 -3.05E-04  1.23E-03  1.53E-03
 
 TH 6
+        2.58E-04  3.18E-04  4.00E-04 -1.44E-03 -6.17E-04  1.42E-03
 
 TH 7
+        2.71E-06 -1.69E-06 -4.52E-07 -1.59E-05  7.41E-07 -4.82E-06  3.57E-06
 
 OM11
+       -1.03E-04 -1.06E-04  2.85E-05  3.14E-05  5.00E-05 -1.16E-05  3.57E-06  1.68E-04
 
 OM12
+       ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 OM13
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 OM14
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 OM15
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 OM16
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
         .........
 
 OM22
+        8.97E-05  2.21E-04 -5.47E-05 -1.73E-04  4.44E-05  6.57E-05 -1.31E-06 -2.81E-05 ......... ......... ......... .........
         .........  3.89E-04
 
 OM23
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
         ......... ......... .........
 
 OM24
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
         ......... ......... ......... .........
 
 OM25
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
         ......... ......... ......... ......... .........
 
 OM26
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
         ......... ......... ......... ......... ......... .........
 
 OM33
+        3.21E-05  1.05E-04 -1.13E-04 -3.53E-05 -5.68E-05 -5.13E-05  3.63E-07 -4.74E-06 ......... ......... ......... .........
         .........  4.07E-06 ......... ......... ......... .........  2.36E-04
 
1

            TH 1      TH 2      TH 3      TH 4      TH 5      TH 6      TH 7      OM11      OM12      OM13      OM14      OM15  
             OM16      OM22      OM23      OM24      OM25      OM26      OM33      OM34      OM35      OM36      OM44      OM45  
            OM46      OM55      OM56      OM66      SG11  
 
 OM34
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
         ......... ......... ......... ......... ......... ......... ......... .........
 
 OM35
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
         ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 OM36
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
         ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 OM44
+       -1.29E-04 -2.97E-05  3.01E-05  4.64E-04  2.20E-04 -1.55E-04 -6.23E-06 -8.77E-05 ......... ......... ......... .........
         ......... -9.22E-05 ......... ......... ......... ......... -4.28E-05 ......... ......... .........  1.53E-03
 
 OM45
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
         ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 OM46
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
         ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
        .........
 
 OM55
+       -5.46E-05 -5.19E-05  6.35E-05 -1.09E-04  4.76E-05  6.47E-05  1.50E-06 -1.41E-05 ......... ......... ......... .........
         ......... -2.16E-05 ......... ......... ......... ......... -3.61E-05 ......... ......... ......... -4.31E-05 .........
        .........  2.75E-04
 
 OM56
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
         ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
        ......... ......... .........
 
 OM66
+        1.84E-05  4.19E-05 -3.81E-05 -5.18E-05 -2.94E-05 -6.64E-05  6.60E-07 -1.36E-05 ......... ......... ......... .........
         ......... -2.67E-05 ......... ......... ......... .........  1.71E-06 ......... ......... ......... -1.27E-04 .........
        ......... -9.27E-06 .........  3.21E-04
 
 SG11
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
         ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
        ......... ......... ......... ......... .........
 
1
 ************************************************************************************************************************
 ********************                                                                                ********************
 ********************               FIRST ORDER CONDITIONAL ESTIMATION WITH INTERACTION              ********************
 ********************                          CORRELATION MATRIX OF ESTIMATE                        ********************
 ********************                                                                                ********************
 ************************************************************************************************************************
 

            TH 1      TH 2      TH 3      TH 4      TH 5      TH 6      TH 7      OM11      OM12      OM13      OM14      OM15  
             OM16      OM22      OM23      OM24      OM25      OM26      OM33      OM34      OM35      OM36      OM44      OM45  
            OM46      OM55      OM56      OM66      SG11  
 
 TH 1
+        3.20E-02
 
 TH 2
+        4.49E-01  4.34E-02
 
 TH 3
+       -1.63E-02  2.17E-03  3.44E-02
 
 TH 4
+       -2.59E-02 -7.49E-02 -3.56E-01  7.70E-02
 
 TH 5
+       -2.68E-01 -1.58E-01 -2.27E-01  4.07E-01  3.91E-02
 
 TH 6
+        2.14E-01  1.94E-01  3.09E-01 -4.96E-01 -4.18E-01  3.77E-02
 
 TH 7
+        4.47E-02 -2.06E-02 -6.96E-03 -1.09E-01  1.00E-02 -6.77E-02  1.89E-03
 
 OM11
+       -2.48E-01 -1.88E-01  6.39E-02  3.15E-02  9.85E-02 -2.37E-02  1.46E-01  1.30E-02
 
 OM12
+       ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 OM13
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 OM14
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 OM15
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 OM16
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
         .........
 
 OM22
+        1.42E-01  2.58E-01 -8.07E-02 -1.14E-01  5.75E-02  8.83E-02 -3.51E-02 -1.10E-01 ......... ......... ......... .........
         .........  1.97E-02
 
 OM23
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
         ......... ......... .........
 
 OM24
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
         ......... ......... ......... .........
 
 OM25
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
         ......... ......... ......... ......... .........
 
 OM26
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
         ......... ......... ......... ......... ......... .........
 
 OM33
+        6.51E-02  1.58E-01 -2.15E-01 -2.98E-02 -9.44E-02 -8.85E-02  1.25E-02 -2.38E-02 ......... ......... ......... .........
         .........  1.34E-02 ......... ......... ......... .........  1.54E-02
 
1

            TH 1      TH 2      TH 3      TH 4      TH 5      TH 6      TH 7      OM11      OM12      OM13      OM14      OM15  
             OM16      OM22      OM23      OM24      OM25      OM26      OM33      OM34      OM35      OM36      OM44      OM45  
            OM46      OM55      OM56      OM66      SG11  
 
 OM34
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
         ......... ......... ......... ......... ......... ......... ......... .........
 
 OM35
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
         ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 OM36
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
         ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 OM44
+       -1.03E-01 -1.75E-02  2.24E-02  1.54E-01  1.44E-01 -1.05E-01 -8.41E-02 -1.73E-01 ......... ......... ......... .........
         ......... -1.19E-01 ......... ......... ......... ......... -7.11E-02 ......... ......... .........  3.92E-02
 
 OM45
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
         ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 OM46
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
         ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
        .........
 
 OM55
+       -1.03E-01 -7.21E-02  1.11E-01 -8.58E-02  7.34E-02  1.04E-01  4.78E-02 -6.57E-02 ......... ......... ......... .........
         ......... -6.60E-02 ......... ......... ......... ......... -1.42E-01 ......... ......... ......... -6.64E-02 .........
        .........  1.66E-02
 
 OM56
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
         ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
        ......... ......... .........
 
 OM66
+        3.21E-02  5.38E-02 -6.18E-02 -3.75E-02 -4.19E-02 -9.84E-02  1.95E-02 -5.87E-02 ......... ......... ......... .........
         ......... -7.54E-02 ......... ......... ......... .........  6.22E-03 ......... ......... ......... -1.81E-01 .........
        ......... -3.12E-02 .........  1.79E-02
 
 SG11
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
         ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
        ......... ......... ......... ......... .........
 
1
 ************************************************************************************************************************
 ********************                                                                                ********************
 ********************               FIRST ORDER CONDITIONAL ESTIMATION WITH INTERACTION              ********************
 ********************                      INVERSE COVARIANCE MATRIX OF ESTIMATE                     ********************
 ********************                                                                                ********************
 ************************************************************************************************************************
 

            TH 1      TH 2      TH 3      TH 4      TH 5      TH 6      TH 7      OM11      OM12      OM13      OM14      OM15  
             OM16      OM22      OM23      OM24      OM25      OM26      OM33      OM34      OM35      OM36      OM44      OM45  
            OM46      OM55      OM56      OM66      SG11  
 
 TH 1
+        1.43E+03
 
 TH 2
+       -3.73E+02  7.39E+02
 
 TH 3
+        2.86E+01 -3.41E+01  1.10E+03
 
 TH 4
+       -1.05E+02 -1.46E+01  1.44E+02  2.84E+02
 
 TH 5
+        2.16E+02  7.93E+00  9.91E+01 -1.28E+02  9.69E+02
 
 TH 6
+       -1.90E+02 -1.07E+02 -1.06E+02  2.15E+02  2.45E+02  1.17E+03
 
 TH 7
+       -2.64E+03  1.21E+02  7.76E+02  1.73E+03 -5.50E+02  2.84E+03  3.04E+05
 
 OM11
+        7.14E+02  1.26E+02 -2.59E+02 -1.12E+02 -2.27E+02 -2.40E+02 -7.76E+03  7.22E+03
 
 OM12
+       ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 OM13
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 OM14
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 OM15
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 OM16
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
         .........
 
 OM22
+       -6.29E+01 -3.38E+02  2.01E+02  1.54E+02 -3.04E+02 -3.76E+01  1.46E+03  4.53E+02 ......... ......... ......... .........
         .........  3.05E+03
 
 OM23
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
         ......... ......... .........
 
 OM24
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
         ......... ......... ......... .........
 
 OM25
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
         ......... ......... ......... ......... .........
 
 OM26
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
         ......... ......... ......... ......... ......... .........
 
 OM33
+        6.24E+01 -3.17E+02  5.19E+02  1.39E+02  2.25E+02  3.24E+02  4.92E+02 -2.32E+01 ......... ......... ......... .........
         .........  2.45E+02 ......... ......... ......... .........  4.84E+03
 
1

            TH 1      TH 2      TH 3      TH 4      TH 5      TH 6      TH 7      OM11      OM12      OM13      OM14      OM15  
             OM16      OM22      OM23      OM24      OM25      OM26      OM33      OM34      OM35      OM36      OM44      OM45  
            OM46      OM55      OM56      OM66      SG11  
 
 OM34
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
         ......... ......... ......... ......... ......... ......... ......... .........
 
 OM35
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
         ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 OM36
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
         ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 OM44
+        1.30E+02 -5.72E+01 -6.75E+01 -3.47E+01 -9.09E+01  2.36E+01  4.59E+02  5.77E+02 ......... ......... ......... .........
         .........  2.46E+02 ......... ......... ......... .........  1.33E+02 ......... ......... .........  7.77E+02
 
 OM45
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
         ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 OM46
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
         ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
        .........
 
 OM55
+        2.47E+02  1.49E+01 -1.30E+02  4.09E+01 -2.71E+02 -2.40E+02 -2.36E+03  8.28E+02 ......... ......... ......... .........
         .........  3.41E+02 ......... ......... ......... .........  4.55E+02 ......... ......... .........  2.24E+02 .........
        .........  4.02E+03
 
 OM56
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
         ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
        ......... ......... .........
 
 OM66
+        2.27E+01 -1.46E+02  1.15E+02  9.46E+01  3.82E+01  2.92E+02  3.22E+02  4.37E+02 ......... ......... ......... .........
         .........  4.37E+02 ......... ......... ......... .........  2.68E+02 ......... ......... .........  3.40E+02 .........
        .........  1.72E+02 .........  3.42E+03
 
 SG11
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
         ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
        ......... ......... ......... ......... .........
 
 Elapsed finaloutput time in seconds:     0.58
1THERE ARE ERROR MESSAGES IN FILE PRDERR                                                                  
 #CPUT: Total CPU Time in Seconds,     3884.531
