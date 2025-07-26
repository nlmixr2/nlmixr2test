Run Start Date:  29/08/2019 
Run Start Time: 18:45:56.46 
Run Stop Date:   29/08/2019 
Run Stop Time:  19:15:27.57 
  
************************************************************************************************************************ 
********************                            CONTROL STREAM                                      ******************** 
************************************************************************************************************************ 
  
$PROB    INFUSION_2CPT_V1QV2VMKM MULTIPLE DOSES FOCEI runODE055
$INPUT   ID TIME DV LNDV MDV AMT RATE EVID DOSE VI VMI KMI QI V2I SD CMT
$DATA    INFUSION_2CPTMM.csv IGNORE=@ IGNORE(SD.EQ.1)
$SUBR    ADVAN13 TOL=6
$MODEL
         COMP=(CENTRAL,DEFOBS,DEFDOSE)
         COMP=(PERI)
$PK
         VM=EXP(THETA(1)+ETA(1))
         KM=EXP(THETA(2)+ETA(2))
         V =EXP(THETA(3)+ETA(3))
         Q =EXP(THETA(4)+ETA(4))
         V2=EXP(THETA(5)+ETA(5))
         K12=Q/V
         K21=Q/V2
         S1=V
$DES
         C1=A(1)/V
         DADT(1)= K21*A(2)-K12*A(1)-VM*C1/(KM+C1)
         DADT(2)=-K21*A(2)+K12*A(1)  
$ERROR   
         IPRED = F     
         RESCV = THETA(6) 
         W     = IPRED*RESCV
         IRES  = DV-IPRED
         IWRES = IRES/W
         Y     = IPRED+W*EPS(1)

$THETA   7         ;log VM
$THETA   5.7       ;log KM 
$THETA   4.5       ;log Vc
$THETA   1.5       ;log Q
$THETA   4         ;log Vp
$THETA   (0,0.3,1) ;RSV
$OMEGA   0.1 0.1 0.1 0.1 0.1
$SIGMA   1 FIX
$EST     NSIG=2 SIGL=6 PRINT=5 MAX=9999 NOABORT POSTHOC METHOD=COND INTER NOOBT
$COV
$TABLE  ID TIME LNDV MDV AMT EVID DOSE VI VMI KMI V VM KM Q V2 ETA1 ETA2 ETA3 ETA4 ETA5
        IPRED IRES IWRES CWRESI
        ONEHEADER NOPRINT FILE=runODE055.csv   
   
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
Current Date:       29 AUG 2019
Days until program expires : 290
1NONLINEAR MIXED EFFECTS MODEL PROGRAM (NONMEM) VERSION 7.4.3
 ORIGINALLY DEVELOPED BY STUART BEAL, LEWIS SHEINER, AND ALISON BOECKMANN
 CURRENT DEVELOPERS ARE ROBERT BAUER, ICON DEVELOPMENT SOLUTIONS,
 AND ALISON BOECKMANN. IMPLEMENTATION, EFFICIENCY, AND STANDARDIZATION
 PERFORMED BY NOUS INFOSYSTEMS.

 PROBLEM NO.:         1
 INFUSION_2CPT_V1QV2VMKM MULTIPLE DOSES FOCEI runODE055
0DATA CHECKOUT RUN:              NO
 DATA SET LOCATED ON UNIT NO.:    2
 THIS UNIT TO BE REWOUND:        NO
 NO. OF DATA RECS IN DATA SET:     5520
 NO. OF DATA ITEMS IN DATA SET:  16
 ID DATA ITEM IS DATA ITEM NO.:   1
 DEP VARIABLE IS DATA ITEM NO.:   3
 MDV DATA ITEM IS DATA ITEM NO.:  5
0INDICES PASSED TO SUBROUTINE PRED:
   8   2   6   7   0   0  16   0   0   0   0
0LABELS FOR DATA ITEMS:
 ID TIME DV LNDV MDV AMT RATE EVID DOSE VI VMI KMI QI V2I SD CMT
0(NONBLANK) LABELS FOR PRED-DEFINED ITEMS:
 VM KM V Q V2 IPRED IRES IWRES
0FORMAT FOR DATA:
 (E3.0,3E6.0,E1.0,2E6.0,E1.0,E6.0,E5.0,E6.0,3E5.0,2E1.0)

 TOT. NO. OF OBS RECS:     4680
 TOT. NO. OF INDIVIDUALS:      120
0LENGTH OF THETA:   6
0DEFAULT THETA BOUNDARY TEST OMITTED:    NO
0OMEGA HAS SIMPLE DIAGONAL FORM WITH DIMENSION:   5
0DEFAULT OMEGA BOUNDARY TEST OMITTED:   YES
0SIGMA HAS SIMPLE DIAGONAL FORM WITH DIMENSION:   1
0DEFAULT SIGMA BOUNDARY TEST OMITTED:    NO
0INITIAL ESTIMATE OF THETA:
 LOWER BOUND    INITIAL EST    UPPER BOUND
 -0.1000E+07     0.7000E+01     0.1000E+07
 -0.1000E+07     0.5700E+01     0.1000E+07
 -0.1000E+07     0.4500E+01     0.1000E+07
 -0.1000E+07     0.1500E+01     0.1000E+07
 -0.1000E+07     0.4000E+01     0.1000E+07
  0.0000E+00     0.3000E+00     0.1000E+01
0INITIAL ESTIMATE OF OMEGA:
 0.1000E+00
 0.0000E+00   0.1000E+00
 0.0000E+00   0.0000E+00   0.1000E+00
 0.0000E+00   0.0000E+00   0.0000E+00   0.1000E+00
 0.0000E+00   0.0000E+00   0.0000E+00   0.0000E+00   0.1000E+00
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
 ID TIME LNDV MDV AMT EVID DOSE VI VMI KMI V VM KM Q V2 ETA1 ETA2 ETA3 ETA4 ETA5 IPRED IRES IWRES CWRESI
1DOUBLE PRECISION PREDPP VERSION 7.4.3

 GENERAL NONLINEAR KINETICS MODEL WITH STIFF/NONSTIFF EQUATIONS (LSODA, ADVAN13)
0MODEL SUBROUTINE USER-SUPPLIED - ID NO. 9999
0MAXIMUM NO. OF BASIC PK PARAMETERS:   5
0COMPARTMENT ATTRIBUTES
 COMPT. NO.   FUNCTION   INITIAL    ON/OFF      DOSE      DEFAULT    DEFAULT
                         STATUS     ALLOWED    ALLOWED    FOR DOSE   FOR OBS.
    1         CENTRAL      ON         YES        YES        YES        YES
    2         PERI         ON         YES        YES        NO         NO
    3         OUTPUT       OFF        YES        NO         NO         NO
 INITIAL (BASE) TOLERANCE SETTINGS:
 NRD (RELATIVE) VALUE(S) OF TOLERANCE:   6
 ANRD (ABSOLUTE) VALUE(S) OF TOLERANCE:  12
1
 ADDITIONAL PK PARAMETERS - ASSIGNMENT OF ROWS IN GG
 COMPT. NO.                             INDICES
              SCALE      BIOAVAIL.   ZERO-ORDER  ZERO-ORDER  ABSORB
                         FRACTION    RATE        DURATION    LAG
    1            6           *           *           *           *
    2            *           *           *           *           *
    3            *           -           -           -           -
             - PARAMETER IS NOT ALLOWED FOR THIS MODEL
             * PARAMETER IS NOT SUPPLIED BY PK SUBROUTINE;
               WILL DEFAULT TO ONE IF APPLICABLE
0DATA ITEM INDICES USED BY PRED ARE:
   EVENT ID DATA ITEM IS DATA ITEM NO.:      8
   TIME DATA ITEM IS DATA ITEM NO.:          2
   DOSE AMOUNT DATA ITEM IS DATA ITEM NO.:   6
   DOSE RATE DATA ITEM IS DATA ITEM NO.:     7
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
 RAW OUTPUT FILE (FILE): runODE055.ext
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

 
0ITERATION NO.:    0    OBJECTIVE VALUE:   55806.4518666403        NO. OF FUNC. EVALS.:   8
 CUMULATIVE NO. OF FUNC. EVALS.:        8
 NPARAMETR:  7.0000E+00  5.7000E+00  4.5000E+00  1.5000E+00  4.0000E+00  3.0000E-01  1.0000E-01  1.0000E-01  1.0000E-01  1.0000E-01
             1.0000E-01
 PARAMETER:  1.0000E-01  1.0000E-01  1.0000E-01  1.0000E-01  1.0000E-01  1.0000E-01  1.0000E-01  1.0000E-01  1.0000E-01  1.0000E-01
             1.0000E-01
 GRADIENT:   2.6435E+04 -4.9904E+02  2.7301E+04  7.8262E+02  1.3286E+04  2.7881E+03 -5.9029E+00 -1.7324E+01 -6.9441E+01 -1.2380E+00
            -3.5347E+01
 
0ITERATION NO.:    5    OBJECTIVE VALUE:   54931.9872272050        NO. OF FUNC. EVALS.: 101
 CUMULATIVE NO. OF FUNC. EVALS.:      109
 NPARAMETR:  6.8342E+00  5.5742E+00  4.2495E+00  1.4859E+00  3.8641E+00  1.9128E-01  1.0012E-01  1.1171E-01  9.3234E-02  1.0218E-01
             9.9965E-02
 PARAMETER:  9.7632E-02  9.7793E-02  9.4434E-02  9.9062E-02  9.6602E-02 -4.9445E-01  1.0058E-01  1.5539E-01  6.4969E-02  1.1079E-01
             9.9824E-02
 GRADIENT:   3.8857E+04  3.3435E+03  1.2054E+04  1.0385E+03  9.0295E+03 -1.1349E+03 -1.9468E+01 -2.5849E+01  2.2716E+01 -2.7160E+01
            -3.4436E+01
 
0ITERATION NO.:   10    OBJECTIVE VALUE:   54763.4535875367        NO. OF FUNC. EVALS.: 132
 CUMULATIVE NO. OF FUNC. EVALS.:      241
 NPARAMETR:  7.1987E+00  6.0525E+00  4.2424E+00  1.4425E+00  3.7196E+00  2.0479E-01  1.0187E-01  2.9963E-01  8.5855E-02  1.2634E-01
             1.0057E-01
 PARAMETER:  1.0284E-01  1.0619E-01  9.4275E-02  9.6164E-02  9.2991E-02 -4.0933E-01  1.0925E-01  6.4868E-01  2.3743E-02  2.1688E-01
             1.0284E-01
 GRADIENT:   4.4142E+04  5.7779E+03  8.2168E+03  3.8925E+02  4.4739E+03  5.6193E+00  2.9198E+01 -1.0909E+01  1.5699E+01 -3.4733E+00
            -1.7014E+01
 
0ITERATION NO.:   15    OBJECTIVE VALUE:   54749.3752794668        NO. OF FUNC. EVALS.: 115
 CUMULATIVE NO. OF FUNC. EVALS.:      356
 NPARAMETR:  7.1779E+00  6.5597E+00  4.2330E+00  1.4070E+00  3.5958E+00  2.0459E-01  1.0345E-01  4.4259E-01  8.0330E-02  1.2754E-01
             1.2420E-01
 PARAMETER:  1.0254E-01  1.1508E-01  9.4068E-02  9.3797E-02  8.9896E-02 -4.1058E-01  1.1695E-01  8.4374E-01 -9.5117E-03  2.2163E-01
             2.0835E-01
 GRADIENT:   5.7971E+04 -1.4758E+04 -1.9881E+03  6.4921E+02 -3.2974E+03  7.5685E+01  5.8342E+00 -2.3302E+00 -3.0499E-01 -2.6627E+00
            -1.3832E+01
 
0ITERATION NO.:   20    OBJECTIVE VALUE:   54671.7894117054        NO. OF FUNC. EVALS.:  73
 CUMULATIVE NO. OF FUNC. EVALS.:      429
 NPARAMETR:  7.2484E+00  6.3769E+00  4.2740E+00  4.6527E-01  3.7731E+00  2.0243E-01  9.0599E-02  4.3147E-01  7.8576E-02  1.1599E-01
             1.5409E-01
 PARAMETER:  1.0355E-01  1.1188E-01  9.4979E-02  3.1018E-02  9.4328E-02 -4.2390E-01  5.0635E-02  8.3102E-01 -2.0550E-02  1.7418E-01
             3.1618E-01
 GRADIENT:   4.6999E+04  1.0088E+04  5.9039E+03 -5.9172E+00  1.7178E+01  3.7980E+00  1.2253E+01  1.7065E+00  3.7710E+00 -6.2277E+00
            -9.7718E+00
 
0ITERATION NO.:   25    OBJECTIVE VALUE:   54666.4691052126        NO. OF FUNC. EVALS.:  47
 CUMULATIVE NO. OF FUNC. EVALS.:      476
 NPARAMETR:  7.1561E+00  6.4289E+00  4.2693E+00  6.3657E-01  3.8766E+00  2.0218E-01  7.5419E-02  5.1624E-01  7.7156E-02  2.0334E-01
             1.4307E-01
 PARAMETER:  1.0223E-01  1.1279E-01  9.4874E-02  4.2438E-02  9.6915E-02 -4.2544E-01 -4.1057E-02  9.2070E-01 -2.9670E-02  4.5486E-01
             2.7907E-01
 GRADIENT:   3.9643E+04  1.1407E+04  6.7912E+03  9.3096E+02  8.0297E+02  1.1463E+01  5.7123E+00 -1.6022E+00 -7.6582E-01 -9.4013E+00
             1.4624E+00
 
0ITERATION NO.:   30    OBJECTIVE VALUE:   54666.3870273035        NO. OF FUNC. EVALS.:  50
 CUMULATIVE NO. OF FUNC. EVALS.:      526
 NPARAMETR:  7.1334E+00  6.4258E+00  4.2706E+00  6.3858E-01  3.9000E+00  2.0198E-01  7.5022E-02  5.3396E-01  7.7297E-02  2.1821E-01
             1.3887E-01
 PARAMETER:  1.0191E-01  1.1273E-01  9.4902E-02  4.2572E-02  9.7499E-02 -4.2669E-01 -4.3692E-02  9.3758E-01 -2.8757E-02  4.9014E-01
             2.6419E-01
 GRADIENT:   3.8689E+04  1.1561E+04  7.0191E+03  9.5027E+02  1.1121E+03  1.6933E+00  3.7432E+00 -1.2380E+00 -8.2979E-01 -6.6477E+00
             6.3082E-01
 
0ITERATION NO.:   35    OBJECTIVE VALUE:   54666.3825644739        NO. OF FUNC. EVALS.:  53
 CUMULATIVE NO. OF FUNC. EVALS.:      579
 NPARAMETR:  7.1142E+00  6.4139E+00  4.2710E+00  6.2998E-01  3.9151E+00  2.0193E-01  7.7275E-02  5.3541E-01  7.7370E-02  2.1734E-01
             1.3933E-01
 PARAMETER:  1.0163E-01  1.1252E-01  9.4910E-02  4.1998E-02  9.7878E-02 -4.2699E-01 -2.8902E-02  9.3894E-01 -2.8288E-02  4.8815E-01
             2.6584E-01
 GRADIENT:   3.8073E+04  1.1605E+04  7.0659E+03  9.5659E+02  1.2360E+03  6.1388E-02  2.7679E+00 -1.0184E+00 -8.5175E-01 -5.7157E+00
             5.9674E-01
 
0ITERATION NO.:   40    OBJECTIVE VALUE:   54666.3802651726        NO. OF FUNC. EVALS.:  50
 CUMULATIVE NO. OF FUNC. EVALS.:      629
 NPARAMETR:  7.0990E+00  6.4008E+00  4.2711E+00  6.2098E-01  3.9256E+00  2.0190E-01  8.0034E-02  5.3130E-01  7.7410E-02  2.1438E-01
             1.4026E-01
 PARAMETER:  1.0141E-01  1.1230E-01  9.4913E-02  4.1398E-02  9.8141E-02 -4.2718E-01 -1.1359E-02  9.3508E-01 -2.8030E-02  4.8128E-01
             2.6917E-01
 GRADIENT:   3.7670E+04  1.1614E+04  7.0740E+03  9.5780E+02  1.2986E+03 -9.8707E-01  2.2331E+00 -8.7557E-01 -8.6512E-01 -5.2557E+00
             6.3422E-01
 
0ITERATION NO.:   45    OBJECTIVE VALUE:   54662.0418205401        NO. OF FUNC. EVALS.: 101
 CUMULATIVE NO. OF FUNC. EVALS.:      730
 NPARAMETR:  7.0833E+00  6.3588E+00  4.2719E+00  3.6265E-01  3.9449E+00  2.0190E-01  8.6829E-02  5.1715E-01  7.7771E-02  2.2457E-01
             1.4154E-01
 PARAMETER:  1.0119E-01  1.1156E-01  9.4931E-02  2.4177E-02  9.8623E-02 -4.2718E-01  2.9387E-02  9.2158E-01 -2.5703E-02  5.0450E-01
             2.7369E-01
 GRADIENT:   3.9273E+04  1.1636E+04  4.9274E+03 -6.6902E+01  9.5524E+02  6.1319E+00  2.1869E+00  4.6504E+00 -1.0265E+00 -3.8158E+00
             8.0598E+00
 
0ITERATION NO.:   50    OBJECTIVE VALUE:   54660.9511931466        NO. OF FUNC. EVALS.: 136
 CUMULATIVE NO. OF FUNC. EVALS.:      866             RESET HESSIAN, TYPE I
 NPARAMETR:  7.0836E+00  6.3471E+00  4.2880E+00  3.5537E-01  3.9406E+00  2.0196E-01  8.8630E-02  4.9313E-01  7.7945E-02  2.6184E-01
             1.1799E-01
 PARAMETER:  1.0119E-01  1.1135E-01  9.5289E-02  2.3691E-02  9.8515E-02 -4.2680E-01  3.9648E-02  8.9780E-01 -2.4583E-02  5.8127E-01
             1.8273E-01
 GRADIENT:   3.9481E+04  1.1593E+04  6.7800E+03 -6.2979E+01  1.1310E+03  6.9484E+00  1.2646E+00  2.8798E+00  3.4663E-01  7.8199E-01
             1.1880E+00
 
0ITERATION NO.:   55    OBJECTIVE VALUE:   54660.8577222117        NO. OF FUNC. EVALS.: 126
 CUMULATIVE NO. OF FUNC. EVALS.:      992             RESET HESSIAN, TYPE I
 NPARAMETR:  7.0810E+00  6.3352E+00  4.2895E+00  3.5910E-01  3.9358E+00  2.0197E-01  8.6644E-02  4.7430E-01  7.7780E-02  2.6400E-01
             1.1597E-01
 PARAMETER:  1.0116E-01  1.1114E-01  9.5323E-02  2.3940E-02  9.8396E-02 -4.2676E-01  2.8317E-02  8.7833E-01 -2.5646E-02  5.8539E-01
             1.7406E-01
 GRADIENT:   3.9421E+04  1.1578E+04  7.0127E+03 -3.0185E+01  1.0699E+03  5.6239E+00 -3.7273E-01  9.9713E-01  2.4198E-02  7.2438E-01
             4.5148E-01
 
0ITERATION NO.:   60    OBJECTIVE VALUE:   54660.8136850539        NO. OF FUNC. EVALS.: 133
 CUMULATIVE NO. OF FUNC. EVALS.:     1125             RESET HESSIAN, TYPE I
 NPARAMETR:  7.0829E+00  6.3300E+00  4.2910E+00  3.6800E-01  3.9377E+00  2.0194E-01  8.8449E-02  4.6897E-01  7.7810E-02  2.6158E-01
             1.1495E-01
 PARAMETER:  1.0118E-01  1.1105E-01  9.5356E-02  2.4533E-02  9.8442E-02 -4.2690E-01  3.8626E-02  8.7269E-01 -2.5452E-02  5.8078E-01
             1.6965E-01
 GRADIENT:   3.9708E+04  1.1458E+04  7.3275E+03  2.1126E+01  1.1745E+03  3.0089E+00  2.4900E-01  9.7301E-01  2.0778E-01  1.6210E-02
             1.2478E-01
 
0ITERATION NO.:   65    OBJECTIVE VALUE:   54660.8035072067        NO. OF FUNC. EVALS.: 120
 CUMULATIVE NO. OF FUNC. EVALS.:     1245             RESET HESSIAN, TYPE I
 NPARAMETR:  7.0778E+00  6.3241E+00  4.2920E+00  3.6974E-01  3.9387E+00  2.0194E-01  8.8556E-02  4.5758E-01  7.7775E-02  2.6080E-01
             1.1480E-01
 PARAMETER:  1.0111E-01  1.1095E-01  9.5378E-02  2.4650E-02  9.8469E-02 -4.2694E-01  3.9231E-02  8.6040E-01 -2.5673E-02  5.7929E-01
             1.6899E-01
 GRADIENT:   3.9472E+04  1.1492E+04  7.4783E+03  4.3085E+01  1.1648E+03  2.0236E+00 -6.3087E-01 -1.8924E-01  9.3857E-02 -7.5070E-02
            -3.0684E-03
 
0ITERATION NO.:   70    OBJECTIVE VALUE:   54660.7996756268        NO. OF FUNC. EVALS.: 129
 CUMULATIVE NO. OF FUNC. EVALS.:     1374
 NPARAMETR:  7.0776E+00  6.3220E+00  4.2918E+00  3.6848E-01  3.9376E+00  2.0194E-01  9.0347E-02  4.5676E-01  7.7670E-02  2.6134E-01
             1.1471E-01
 PARAMETER:  1.0111E-01  1.1091E-01  9.5373E-02  2.4565E-02  9.8440E-02 -4.2689E-01  4.9246E-02  8.5949E-01 -2.6352E-02  5.8033E-01
             1.6861E-01
 GRADIENT:   6.6868E+04 -1.3026E+04  2.3932E+03  3.8939E-01  1.5138E+02  8.5754E-02  1.2715E-01  4.1962E-01 -7.0820E-02 -5.6060E-02
             4.3218E-02
 
0ITERATION NO.:   75    OBJECTIVE VALUE:   54660.7963808736        NO. OF FUNC. EVALS.: 125
 CUMULATIVE NO. OF FUNC. EVALS.:     1499
 NPARAMETR:  7.0726E+00  6.3109E+00  4.2914E+00  3.6675E-01  3.9382E+00  2.0194E-01  9.1004E-02  4.4983E-01  7.7805E-02  2.6239E-01
             1.1477E-01
 PARAMETER:  1.0104E-01  1.1072E-01  9.5364E-02  2.4450E-02  9.8455E-02 -4.2690E-01  5.2866E-02  8.5184E-01 -2.5482E-02  5.8234E-01
             1.6887E-01
 GRADIENT:   6.6808E+04 -1.2975E+04  2.3345E+03  1.9866E+00  1.2334E+02 -5.1642E-02 -1.7852E-01  3.8166E-01  2.6289E-01  2.2232E-01
             1.1590E-01
 
0ITERATION NO.:   80    OBJECTIVE VALUE:   54660.7925545185        NO. OF FUNC. EVALS.: 145
 CUMULATIVE NO. OF FUNC. EVALS.:     1644             RESET HESSIAN, TYPE I
 NPARAMETR:  7.0722E+00  6.3094E+00  4.2920E+00  3.6536E-01  3.9401E+00  2.0195E-01  9.1777E-02  4.4470E-01  7.7766E-02  2.6129E-01
             1.1447E-01
 PARAMETER:  1.0103E-01  1.1069E-01  9.5377E-02  2.4357E-02  9.8503E-02 -4.2688E-01  5.7098E-02  8.4611E-01 -2.5734E-02  5.8023E-01
             1.6755E-01
 GRADIENT:   3.9472E+04  1.1434E+04  7.4577E+03  3.8336E+01  1.1460E+03  2.4709E+00 -2.4592E-01 -1.9788E-02  1.8855E-01  3.0542E-02
            -3.4911E-02
 
0ITERATION NO.:   85    OBJECTIVE VALUE:   54660.7917405683        NO. OF FUNC. EVALS.: 131
 CUMULATIVE NO. OF FUNC. EVALS.:     1775
 NPARAMETR:  7.0714E+00  6.3079E+00  4.2920E+00  3.6489E-01  3.9403E+00  2.0194E-01  9.2289E-02  4.4422E-01  7.7630E-02  2.6086E-01
             1.1466E-01
 PARAMETER:  1.0102E-01  1.1066E-01  9.5377E-02  2.4326E-02  9.8507E-02 -4.2689E-01  5.9879E-02  8.4557E-01 -2.6611E-02  5.7940E-01
             1.6838E-01
 GRADIENT:   6.6719E+04 -1.2961E+04  2.4125E+03 -1.4335E-01  1.6901E+02 -2.4000E-01 -9.0339E-02  1.4243E-01 -9.9486E-02 -1.4004E-02
             2.1897E-02
 
0ITERATION NO.:   90    OBJECTIVE VALUE:   54660.7903419064        NO. OF FUNC. EVALS.: 144
 CUMULATIVE NO. OF FUNC. EVALS.:     1919             RESET HESSIAN, TYPE I
 NPARAMETR:  7.0695E+00  6.3067E+00  4.2919E+00  3.6413E-01  3.9404E+00  2.0195E-01  9.2793E-02  4.4077E-01  7.7683E-02  2.6101E-01
             1.1455E-01
 PARAMETER:  1.0099E-01  1.1064E-01  9.5376E-02  2.4275E-02  9.8511E-02 -4.2688E-01  6.2602E-02  8.4167E-01 -2.6267E-02  5.7969E-01
             1.6794E-01
 GRADIENT:   3.9346E+04  1.1459E+04  7.4334E+03  3.7245E+01  1.1137E+03  2.6232E+00 -1.9997E-01 -9.5704E-02  9.5349E-03  4.8936E-02
            -8.7721E-03
 
0ITERATION NO.:   94    OBJECTIVE VALUE:   54660.7903290137        NO. OF FUNC. EVALS.: 101
 CUMULATIVE NO. OF FUNC. EVALS.:     2020
 NPARAMETR:  7.0700E+00  6.3038E+00  4.2920E+00  3.6400E-01  3.9411E+00  2.0195E-01  9.3200E-02  4.4174E-01  7.7622E-02  2.6065E-01
             1.1479E-01
 PARAMETER:  1.0100E-01  1.1059E-01  9.5377E-02  2.4266E-02  9.8527E-02 -4.2688E-01  6.4790E-02  8.4278E-01 -2.6663E-02  5.7900E-01
             1.6896E-01
 GRADIENT:   1.0494E+02 -1.8049E+01  1.2216E+01  1.9454E+00  1.1191E+01 -1.4317E-01  8.6807E-02  2.7422E-01  1.5552E-02  5.9227E-03
             1.1973E-02
 
 #TERM:
0MINIMIZATION SUCCESSFUL
 HOWEVER, PROBLEMS OCCURRED WITH THE MINIMIZATION.
 REGARD THE RESULTS OF THE ESTIMATION STEP CAREFULLY, AND ACCEPT THEM ONLY
 AFTER CHECKING THAT THE COVARIANCE STEP PRODUCES REASONABLE OUTPUT.
 NO. OF FUNCTION EVALUATIONS USED:     2020
 NO. OF SIG. DIGITS IN FINAL EST.:  2.4

 ETABAR IS THE ARITHMETIC MEAN OF THE ETA-ESTIMATES,
 AND THE P-VALUE IS GIVEN FOR THE NULL HYPOTHESIS THAT THE TRUE MEAN IS 0.
 
 ETABAR:         6.0029E-03 -2.5087E-02 -1.6890E-02  1.8648E-03  9.5929E-03
 SE:             1.6600E-02  3.8154E-02  2.3179E-02  2.8317E-02  1.7283E-02
 N:                     120         120         120         120         120
 
 P VAL.:         7.1764E-01  5.1085E-01  4.6618E-01  9.4749E-01  5.7886E-01
 
 ETASHRINKSD(%)  4.0185E+01  3.6851E+01  8.4828E+00  3.8986E+01  4.3886E+01
 ETASHRINKVR(%)  6.4221E+01  6.0122E+01  1.6246E+01  6.2773E+01  6.8512E+01
 EBVSHRINKSD(%)  3.8612E+01  3.8022E+01  9.2350E+00  4.0037E+01  4.3106E+01
 EBVSHRINKVR(%)  6.2315E+01  6.1588E+01  1.7617E+01  6.4044E+01  6.7630E+01
 EPSSHRINKSD(%)  2.7209E+00
 EPSSHRINKVR(%)  5.3678E+00
 
  
 TOTAL DATA POINTS NORMALLY DISTRIBUTED (N):         4680
 N*LOG(2PI) CONSTANT TO OBJECTIVE FUNCTION:    8601.26467079574     
 OBJECTIVE FUNCTION VALUE WITHOUT CONSTANT:    54660.7903290137     
 OBJECTIVE FUNCTION VALUE WITH CONSTANT:       63262.0549998094     
 REPORTED OBJECTIVE FUNCTION DOES NOT CONTAIN CONSTANT
  
 TOTAL EFFECTIVE ETAS (NIND*NETA):                           600
  
 #TERE:
 Elapsed estimation  time in seconds:  1644.37
 Elapsed covariance  time in seconds:   115.53
 Elapsed postprocess time in seconds:     1.25
1
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 ************************************************************************************************************************
 ********************                                                                                ********************
 ********************               FIRST ORDER CONDITIONAL ESTIMATION WITH INTERACTION              ********************
 #OBJT:**************                       MINIMUM VALUE OF OBJECTIVE FUNCTION                      ********************
 ********************                                                                                ********************
 ************************************************************************************************************************
 





 #OBJV:********************************************    54660.790       **************************************************
1
 ************************************************************************************************************************
 ********************                                                                                ********************
 ********************               FIRST ORDER CONDITIONAL ESTIMATION WITH INTERACTION              ********************
 ********************                             FINAL PARAMETER ESTIMATE                           ********************
 ********************                                                                                ********************
 ************************************************************************************************************************
 


 THETA - VECTOR OF FIXED EFFECTS PARAMETERS   *********


         TH 1      TH 2      TH 3      TH 4      TH 5      TH 6     
 
         7.07E+00  6.30E+00  4.29E+00  3.64E-01  3.94E+00  2.02E-01
 


 OMEGA - COV MATRIX FOR RANDOM EFFECTS - ETAS  ********


         ETA1      ETA2      ETA3      ETA4      ETA5     
 
 ETA1
+        9.32E-02
 
 ETA2
+        0.00E+00  4.42E-01
 
 ETA3
+        0.00E+00  0.00E+00  7.76E-02
 
 ETA4
+        0.00E+00  0.00E+00  0.00E+00  2.61E-01
 
 ETA5
+        0.00E+00  0.00E+00  0.00E+00  0.00E+00  1.15E-01
 


 SIGMA - COV MATRIX FOR RANDOM EFFECTS - EPSILONS  ****


         EPS1     
 
 EPS1
+        1.00E+00
 
1


 OMEGA - CORR MATRIX FOR RANDOM EFFECTS - ETAS  *******


         ETA1      ETA2      ETA3      ETA4      ETA5     
 
 ETA1
+        3.05E-01
 
 ETA2
+        0.00E+00  6.65E-01
 
 ETA3
+        0.00E+00  0.00E+00  2.79E-01
 
 ETA4
+        0.00E+00  0.00E+00  0.00E+00  5.11E-01
 
 ETA5
+        0.00E+00  0.00E+00  0.00E+00  0.00E+00  3.39E-01
 


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


         TH 1      TH 2      TH 3      TH 4      TH 5      TH 6     
 
         2.11E-01  5.31E-01  3.24E-02  1.65E-01  4.32E-02  2.56E-03
 


 OMEGA - COV MATRIX FOR RANDOM EFFECTS - ETAS  ********


         ETA1      ETA2      ETA3      ETA4      ETA5     
 
 ETA1
+        8.50E-02
 
 ETA2
+       .........  4.88E-01
 
 ETA3
+       ......... .........  1.15E-02
 
 ETA4
+       ......... ......... .........  9.65E-02
 
 ETA5
+       ......... ......... ......... .........  3.63E-02
 


 SIGMA - COV MATRIX FOR RANDOM EFFECTS - EPSILONS  ****


         EPS1     
 
 EPS1
+       .........
 
1


 OMEGA - CORR MATRIX FOR RANDOM EFFECTS - ETAS  *******


         ETA1      ETA2      ETA3      ETA4      ETA5     
 
 ETA1
+        1.39E-01
 
 ETA2
+       .........  3.67E-01
 
 ETA3
+       ......... .........  2.06E-02
 
 ETA4
+       ......... ......... .........  9.45E-02
 
 ETA5
+       ......... ......... ......... .........  5.36E-02
 


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
 

            TH 1      TH 2      TH 3      TH 4      TH 5      TH 6      OM11      OM12      OM13      OM14      OM15      OM22  
             OM23      OM24      OM25      OM33      OM34      OM35      OM44      OM45      OM55      SG11  
 
 TH 1
+        4.46E-02
 
 TH 2
+        1.09E-01  2.82E-01
 
 TH 3
+       -2.14E-03 -5.32E-03  1.05E-03
 
 TH 4
+        3.02E-02  7.38E-02 -2.59E-03  2.73E-02
 
 TH 5
+       -6.39E-05  1.89E-03 -3.39E-04  4.19E-04  1.87E-03
 
 TH 6
+       -9.83E-05 -1.98E-04  1.09E-05 -6.87E-05  1.81E-05  6.54E-06
 
 OM11
+       -1.68E-02 -4.21E-02  7.95E-04 -1.12E-02 -1.77E-04  3.29E-05  7.22E-03
 
 OM12
+       ......... ......... ......... ......... ......... ......... ......... .........
 
 OM13
+       ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 OM14
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 OM15
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 OM22
+        9.88E-02  2.55E-01 -4.65E-03  6.80E-02  1.20E-03 -1.93E-04 -3.88E-02 ......... ......... ......... .........  2.38E-01
 
 OM23
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
         .........
 
 OM24
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
         ......... .........
 
 OM25
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
         ......... ......... .........
 
 OM33
+        2.11E-04  5.21E-04  5.91E-05  1.71E-04  4.56E-05 -8.54E-07 -1.29E-04 ......... ......... ......... .........  6.06E-04
         ......... ......... .........  1.32E-04
 
 OM34
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
         ......... ......... ......... ......... .........
 
 OM35
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
         ......... ......... ......... ......... ......... .........
 
 OM44
+        1.38E-04 -3.59E-03  1.88E-04 -1.19E-03 -1.60E-03 -2.45E-05  1.09E-03 ......... ......... ......... ......... -4.02E-03
         ......... ......... ......... -1.04E-04 ......... .........  9.31E-03
 
1

            TH 1      TH 2      TH 3      TH 4      TH 5      TH 6      OM11      OM12      OM13      OM14      OM15      OM22  
             OM23      OM24      OM25      OM33      OM34      OM35      OM44      OM45      OM55      SG11  
 
 OM45
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
         ......... ......... ......... ......... ......... ......... ......... .........
 
 OM55
+       -5.19E-04 -1.15E-03  4.00E-05 -5.47E-04  3.93E-04 -2.15E-06  3.99E-04 ......... ......... ......... ......... -1.50E-03
         ......... ......... ......... -5.50E-06 ......... ......... -1.65E-03 .........  1.32E-03
 
 SG11
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
         ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
 
1
 ************************************************************************************************************************
 ********************                                                                                ********************
 ********************               FIRST ORDER CONDITIONAL ESTIMATION WITH INTERACTION              ********************
 ********************                          CORRELATION MATRIX OF ESTIMATE                        ********************
 ********************                                                                                ********************
 ************************************************************************************************************************
 

            TH 1      TH 2      TH 3      TH 4      TH 5      TH 6      OM11      OM12      OM13      OM14      OM15      OM22  
             OM23      OM24      OM25      OM33      OM34      OM35      OM44      OM45      OM55      SG11  
 
 TH 1
+        2.11E-01
 
 TH 2
+        9.69E-01  5.31E-01
 
 TH 3
+       -3.12E-01 -3.08E-01  3.24E-02
 
 TH 4
+        8.65E-01  8.40E-01 -4.83E-01  1.65E-01
 
 TH 5
+       -6.99E-03  8.22E-02 -2.42E-01  5.86E-02  4.32E-02
 
 TH 6
+       -1.82E-01 -1.46E-01  1.31E-01 -1.62E-01  1.64E-01  2.56E-03
 
 OM11
+       -9.38E-01 -9.32E-01  2.88E-01 -8.00E-01 -4.82E-02  1.51E-01  8.50E-02
 
 OM12
+       ......... ......... ......... ......... ......... ......... ......... .........
 
 OM13
+       ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 OM14
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 OM15
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 OM22
+        9.58E-01  9.84E-01 -2.94E-01  8.43E-01  5.69E-02 -1.55E-01 -9.36E-01 ......... ......... ......... .........  4.88E-01
 
 OM23
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
         .........
 
 OM24
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
         ......... .........
 
 OM25
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
         ......... ......... .........
 
 OM33
+        8.70E-02  8.52E-02  1.58E-01  8.99E-02  9.18E-02 -2.90E-02 -1.32E-01 ......... ......... ......... .........  1.08E-01
         ......... ......... .........  1.15E-02
 
 OM34
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
         ......... ......... ......... ......... .........
 
 OM35
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
         ......... ......... ......... ......... ......... .........
 
 OM44
+        6.77E-03 -7.00E-02  5.99E-02 -7.43E-02 -3.83E-01 -9.94E-02  1.33E-01 ......... ......... ......... ......... -8.54E-02
         ......... ......... ......... -9.33E-02 ......... .........  9.65E-02
 
1

            TH 1      TH 2      TH 3      TH 4      TH 5      TH 6      OM11      OM12      OM13      OM14      OM15      OM22  
             OM23      OM24      OM25      OM33      OM34      OM35      OM44      OM45      OM55      SG11  
 
 OM45
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
         ......... ......... ......... ......... ......... ......... ......... .........
 
 OM55
+       -6.76E-02 -5.98E-02  3.39E-02 -9.10E-02  2.50E-01 -2.31E-02  1.29E-01 ......... ......... ......... ......... -8.46E-02
         ......... ......... ......... -1.32E-02 ......... ......... -4.71E-01 .........  3.63E-02
 
 SG11
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
         ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
 
1
 ************************************************************************************************************************
 ********************                                                                                ********************
 ********************               FIRST ORDER CONDITIONAL ESTIMATION WITH INTERACTION              ********************
 ********************                      INVERSE COVARIANCE MATRIX OF ESTIMATE                     ********************
 ********************                                                                                ********************
 ************************************************************************************************************************
 

            TH 1      TH 2      TH 3      TH 4      TH 5      TH 6      OM11      OM12      OM13      OM14      OM15      OM22  
             OM23      OM24      OM25      OM33      OM34      OM35      OM44      OM45      OM55      SG11  
 
 TH 1
+        8.18E+02
 
 TH 2
+       -1.81E+02  1.75E+02
 
 TH 3
+       -8.14E+01  1.88E+01  1.55E+03
 
 TH 4
+       -1.95E+02  2.79E+01  2.57E+02  2.12E+02
 
 TH 5
+        1.92E+02 -1.03E+02  3.03E+02 -1.37E-01  7.93E+02
 
 TH 6
+        2.94E+02 -3.71E+02 -2.25E+03 -6.35E+01 -1.87E+03  1.70E+05
 
 OM11
+        7.33E+02 -3.82E+01 -1.22E+02 -1.77E+02  5.66E+01 -6.75E+02  2.00E+03
 
 OM12
+       ......... ......... ......... ......... ......... ......... ......... .........
 
 OM13
+       ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 OM14
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 OM15
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 OM22
+        2.02E+01 -1.27E+02 -5.00E+01 -3.14E+01  4.12E+01  3.03E+02  9.83E+01 ......... ......... ......... .........  1.57E+02
 
 OM23
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
         .........
 
 OM24
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
         ......... .........
 
 OM25
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
         ......... ......... .........
 
 OM33
+        5.24E+01  1.35E+02 -9.58E+02 -1.63E+02 -4.16E+02  2.33E+03  4.26E+02 ......... ......... ......... ......... -8.71E+01
         ......... ......... .........  8.56E+03
 
 OM34
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
         ......... ......... ......... ......... .........
 
 OM35
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
         ......... ......... ......... ......... ......... .........
 
 OM44
+       -2.29E+02  5.77E+00  3.20E+01  6.25E+01  6.11E+01  6.04E+02 -3.63E+02 ......... ......... ......... .........  1.88E+01
         ......... ......... ......... -1.61E+00 ......... .........  2.48E+02
 
1

            TH 1      TH 2      TH 3      TH 4      TH 5      TH 6      OM11      OM12      OM13      OM14      OM15      OM22  
             OM23      OM24      OM25      OM33      OM34      OM35      OM44      OM45      OM55      SG11  
 
 OM45
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
         ......... ......... ......... ......... ......... ......... ......... .........
 
 OM55
+       -4.55E+02 -1.69E+00 -3.37E+01  1.23E+02 -1.58E+02  1.98E+03 -7.78E+02 ......... ......... ......... .........  4.53E+01
         ......... ......... .........  3.40E+01 ......... .........  3.64E+02 .........  1.42E+03
 
 SG11
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
         ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 Elapsed finaloutput time in seconds:     0.41
1THERE ARE ERROR MESSAGES IN FILE PRDERR                                                                  
 #CPUT: Total CPU Time in Seconds,     1762.375
