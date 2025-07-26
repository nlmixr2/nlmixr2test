Run Start Date:  29/08/2019 
Run Start Time: 15:29:15.50 
Run Stop Date:   29/08/2019 
Run Stop Time:  15:32:49.34 
  
************************************************************************************************************************ 
********************                            CONTROL STREAM                                      ******************** 
************************************************************************************************************************ 
  
$PROB    INFUSION_1CPT_VVMKM SINGLE + MULTIPLE DOSE FOCE INTER (120 Ind/6955 Obs) runODE022
$INPUT   ID TIME DV LNDV MDV AMT RATE EVID DOSE VI VMI KMI SD CMT
$DATA    INFUSION_1CPTMM.csv IGNORE=@ 
$SUBR    ADVAN13 TOL=6
$MODEL   COMP(CENTRAL,DEFOBS)
$PK
         VM=EXP(THETA(1)+ETA(1))
         KM=EXP(THETA(2)+ETA(2))
         V=EXP(THETA(3)+ETA(3))
         S1=V
$DES
         DADT(1)=-VM*(A(1)/V)/(KM+(A(1)/V))
$ERROR   
         IPRED = F     
         RESCV = THETA(4) 
         W     = IPRED*RESCV
         IRES  = DV-IPRED
         IWRES = IRES/W
         Y     = IPRED+W*EPS(1)

$THETA   7         ;log VM
$THETA   5.7       ;log KM 
$THETA   4.5       ;log Vc
$THETA   (0,0.3,1) ;RSV
$OMEGA   0.15 0.15 0.15
$SIGMA   1 FIX
$EST     NSIG=2 SIGL=6 PRINT=5 MAX=9999 NOABORT POSTHOC METHOD=COND INTER NOOBT
$COV
$TABLE  ID TIME LNDV MDV AMT EVID DOSE VI VMI KMI V VM KM ETA1 ETA2 ETA3
        IPRED IRES IWRES CWRESI
        ONEHEADER NOPRINT FILE=runODE022.csv   
   
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
 INFUSION_1CPT_VVMKM SINGLE + MULTIPLE DOSE FOCE INTER (120 Ind/6955 Obs)
0DATA CHECKOUT RUN:              NO
 DATA SET LOCATED ON UNIT NO.:    2
 THIS UNIT TO BE REWOUND:        NO
 NO. OF DATA RECS IN DATA SET:     7920
 NO. OF DATA ITEMS IN DATA SET:  14
 ID DATA ITEM IS DATA ITEM NO.:   1
 DEP VARIABLE IS DATA ITEM NO.:   3
 MDV DATA ITEM IS DATA ITEM NO.:  5
0INDICES PASSED TO SUBROUTINE PRED:
   8   2   6   7   0   0  14   0   0   0   0
0LABELS FOR DATA ITEMS:
 ID TIME DV LNDV MDV AMT RATE EVID DOSE VI VMI KMI SD CMT
0(NONBLANK) LABELS FOR PRED-DEFINED ITEMS:
 VM KM V IPRED IRES IWRES
0FORMAT FOR DATA:
 (E4.0,3E7.0,E2.0,2E7.0,E2.0,E7.0,E6.0,E7.0,E6.0,2E2.0)

 TOT. NO. OF OBS RECS:     6955
 TOT. NO. OF INDIVIDUALS:      120
0LENGTH OF THETA:   4
0DEFAULT THETA BOUNDARY TEST OMITTED:    NO
0OMEGA HAS SIMPLE DIAGONAL FORM WITH DIMENSION:   3
0DEFAULT OMEGA BOUNDARY TEST OMITTED:   YES
0SIGMA HAS SIMPLE DIAGONAL FORM WITH DIMENSION:   1
0DEFAULT SIGMA BOUNDARY TEST OMITTED:    NO
0INITIAL ESTIMATE OF THETA:
 LOWER BOUND    INITIAL EST    UPPER BOUND
 -0.1000E+07     0.7000E+01     0.1000E+07
 -0.1000E+07     0.5700E+01     0.1000E+07
 -0.1000E+07     0.4500E+01     0.1000E+07
  0.0000E+00     0.3000E+00     0.1000E+01
0INITIAL ESTIMATE OF OMEGA:
 0.1500E+00
 0.0000E+00   0.1500E+00
 0.0000E+00   0.0000E+00   0.1500E+00
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
 ID TIME LNDV MDV AMT EVID DOSE VI VMI KMI V VM KM ETA1 ETA2 ETA3 IPRED IRES IWRES CWRESI
1DOUBLE PRECISION PREDPP VERSION 7.4.3

 GENERAL NONLINEAR KINETICS MODEL WITH STIFF/NONSTIFF EQUATIONS (LSODA, ADVAN13)
0MODEL SUBROUTINE USER-SUPPLIED - ID NO. 9999
0MAXIMUM NO. OF BASIC PK PARAMETERS:   3
0COMPARTMENT ATTRIBUTES
 COMPT. NO.   FUNCTION   INITIAL    ON/OFF      DOSE      DEFAULT    DEFAULT
                         STATUS     ALLOWED    ALLOWED    FOR DOSE   FOR OBS.
    1         CENTRAL      ON         YES        YES        YES        YES
    2         OUTPUT       OFF        YES        NO         NO         NO
 INITIAL (BASE) TOLERANCE SETTINGS:
 NRD (RELATIVE) VALUE(S) OF TOLERANCE:   6
 ANRD (ABSOLUTE) VALUE(S) OF TOLERANCE:  12
1
 ADDITIONAL PK PARAMETERS - ASSIGNMENT OF ROWS IN GG
 COMPT. NO.                             INDICES
              SCALE      BIOAVAIL.   ZERO-ORDER  ZERO-ORDER  ABSORB
                         FRACTION    RATE        DURATION    LAG
    1            4           *           *           *           *
    2            *           -           -           -           -
             - PARAMETER IS NOT ALLOWED FOR THIS MODEL
             * PARAMETER IS NOT SUPPLIED BY PK SUBROUTINE;
               WILL DEFAULT TO ONE IF APPLICABLE
0DATA ITEM INDICES USED BY PRED ARE:
   EVENT ID DATA ITEM IS DATA ITEM NO.:      8
   TIME DATA ITEM IS DATA ITEM NO.:          2
   DOSE AMOUNT DATA ITEM IS DATA ITEM NO.:   6
   DOSE RATE DATA ITEM IS DATA ITEM NO.:     7
   COMPT. NO. DATA ITEM IS DATA ITEM NO.:   14

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
 RAW OUTPUT FILE (FILE): runODE022.ext
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

 
0ITERATION NO.:    0    OBJECTIVE VALUE:   80433.4545276800        NO. OF FUNC. EVALS.:   6
 CUMULATIVE NO. OF FUNC. EVALS.:        6
 NPARAMETR:  7.0000E+00  5.7000E+00  4.5000E+00  3.0000E-01  1.5000E-01  1.5000E-01  1.5000E-01
 PARAMETER:  1.0000E-01  1.0000E-01  1.0000E-01  1.0000E-01  1.0000E-01  1.0000E-01  1.0000E-01
 GRADIENT:   1.1234E+05  2.9512E+04  3.2798E+04  4.4678E+03  1.0329E+02  1.9188E+01  2.4006E+01
 
0ITERATION NO.:    5    OBJECTIVE VALUE:   78998.9815635228        NO. OF FUNC. EVALS.:  89
 CUMULATIVE NO. OF FUNC. EVALS.:       95
 NPARAMETR:  6.8717E+00  5.4118E+00  4.3546E+00  1.9093E-01  1.1946E-01  1.1489E-01  1.3237E-01
 PARAMETER:  9.8168E-02  9.4943E-02  9.6770E-02 -4.9669E-01 -1.3834E-02 -3.3323E-02  3.7480E-02
 GRADIENT:   1.7595E+06 -1.4748E+05 -1.8778E+04 -1.3865E+03  7.1383E+01  2.1173E+01  5.4583E+01
 
0ITERATION NO.:   10    OBJECTIVE VALUE:   78914.3621652854        NO. OF FUNC. EVALS.:  93
 CUMULATIVE NO. OF FUNC. EVALS.:      188
 NPARAMETR:  6.9125E+00  5.4886E+00  4.2637E+00  2.0083E-01  7.2224E-02  7.2789E-02  9.0394E-02
 PARAMETER:  9.8750E-02  9.6291E-02  9.4748E-02 -4.3379E-01 -2.6543E-01 -2.6154E-01 -1.5323E-01
 GRADIENT:   1.5891E+06 -1.2981E+05 -2.3096E+04 -2.8760E+02  1.7985E+00 -4.5331E+00 -1.6054E+00
 
0ITERATION NO.:   15    OBJECTIVE VALUE:   78912.5628393595        NO. OF FUNC. EVALS.: 113
 CUMULATIVE NO. OF FUNC. EVALS.:      301             RESET HESSIAN, TYPE I
 NPARAMETR:  6.9114E+00  5.4996E+00  4.2528E+00  2.0556E-01  7.1081E-02  7.8962E-02  9.0942E-02
 PARAMETER:  9.8734E-02  9.6485E-02  9.4507E-02 -4.0457E-01 -2.7341E-01 -2.2083E-01 -1.5020E-01
 GRADIENT:   2.1033E+05  4.1439E+04  3.4967E+04  1.8156E+02  1.0052E+00  1.3231E+00  1.1367E-01
 
0ITERATION NO.:   20    OBJECTIVE VALUE:   78911.9764472629        NO. OF FUNC. EVALS.: 100
 CUMULATIVE NO. OF FUNC. EVALS.:      401
 NPARAMETR:  6.9118E+00  5.4996E+00  4.2530E+00  2.0492E-01  7.0977E-02  7.8580E-02  9.0937E-02
 PARAMETER:  9.8740E-02  9.6485E-02  9.4511E-02 -4.0850E-01 -2.7414E-01 -2.2326E-01 -1.5023E-01
 GRADIENT:   1.5301E+06 -1.2428E+05 -2.3629E+04  1.1755E+02  6.4324E-01  8.1064E-01  8.5244E-02
 
0ITERATION NO.:   25    OBJECTIVE VALUE:   78911.5462492037        NO. OF FUNC. EVALS.: 107
 CUMULATIVE NO. OF FUNC. EVALS.:      508             RESET HESSIAN, TYPE I
 NPARAMETR:  6.9124E+00  5.4988E+00  4.2538E+00  2.0345E-01  7.0762E-02  7.7768E-02  9.0911E-02
 PARAMETER:  9.8748E-02  9.6470E-02  9.4529E-02 -4.1758E-01 -2.7566E-01 -2.2845E-01 -1.5038E-01
 GRADIENT:   2.1461E+05  4.2082E+04  3.5835E+04 -2.0428E+01 -2.0643E-01 -2.6859E-01 -1.9248E-02
 
0ITERATION NO.:   27    OBJECTIVE VALUE:   78911.5462492037        NO. OF FUNC. EVALS.:  31
 CUMULATIVE NO. OF FUNC. EVALS.:      539
 NPARAMETR:  6.9124E+00  5.4988E+00  4.2538E+00  2.0345E-01  7.0762E-02  7.7768E-02  9.0911E-02
 PARAMETER:  9.8748E-02  9.6470E-02  9.4529E-02 -4.1758E-01 -2.7566E-01 -2.2845E-01 -1.5038E-01
 GRADIENT:   4.7661E+01 -2.4568E+01  3.6382E+01 -2.4231E+01 -1.7661E-01 -2.8477E-01 -1.9696E-02
 
 #TERM:
0MINIMIZATION SUCCESSFUL
 HOWEVER, PROBLEMS OCCURRED WITH THE MINIMIZATION.
 REGARD THE RESULTS OF THE ESTIMATION STEP CAREFULLY, AND ACCEPT THEM ONLY
 AFTER CHECKING THAT THE COVARIANCE STEP PRODUCES REASONABLE OUTPUT.
 NO. OF FUNCTION EVALUATIONS USED:      539
 NO. OF SIG. DIGITS IN FINAL EST.:  2.0

 ETABAR IS THE ARITHMETIC MEAN OF THE ETA-ESTIMATES,
 AND THE P-VALUE IS GIVEN FOR THE NULL HYPOTHESIS THAT THE TRUE MEAN IS 0.
 
 ETABAR:         5.5312E-03 -4.6872E-03 -3.6213E-03
 SE:             2.2063E-02  1.7124E-02  2.7216E-02
 N:                     120         120         120
 
 P VAL.:         8.0204E-01  7.8430E-01  8.9415E-01
 
 ETASHRINKSD(%)  8.7639E+00  3.2453E+01  7.0653E-01
 ETASHRINKVR(%)  1.6760E+01  5.4374E+01  1.4081E+00
 EBVSHRINKSD(%)  8.2246E+00  3.3235E+01  9.2445E-01
 EBVSHRINKVR(%)  1.5773E+01  5.5424E+01  1.8404E+00
 EPSSHRINKSD(%)  1.7044E+00
 EPSSHRINKVR(%)  3.3797E+00
 
  
 TOTAL DATA POINTS NORMALLY DISTRIBUTED (N):         6955
 N*LOG(2PI) CONSTANT TO OBJECTIVE FUNCTION:    12782.4349968770     
 OBJECTIVE FUNCTION VALUE WITHOUT CONSTANT:    78911.5462492037     
 OBJECTIVE FUNCTION VALUE WITH CONSTANT:       91693.9812460807     
 REPORTED OBJECTIVE FUNCTION DOES NOT CONTAIN CONSTANT
  
 TOTAL EFFECTIVE ETAS (NIND*NETA):                           360
  
 #TERE:
 Elapsed estimation  time in seconds:   179.11
 Elapsed covariance  time in seconds:    24.23
 Elapsed postprocess time in seconds:     0.62
1
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 ************************************************************************************************************************
 ********************                                                                                ********************
 ********************               FIRST ORDER CONDITIONAL ESTIMATION WITH INTERACTION              ********************
 #OBJT:**************                       MINIMUM VALUE OF OBJECTIVE FUNCTION                      ********************
 ********************                                                                                ********************
 ************************************************************************************************************************
 





 #OBJV:********************************************    78911.546       **************************************************
1
 ************************************************************************************************************************
 ********************                                                                                ********************
 ********************               FIRST ORDER CONDITIONAL ESTIMATION WITH INTERACTION              ********************
 ********************                             FINAL PARAMETER ESTIMATE                           ********************
 ********************                                                                                ********************
 ************************************************************************************************************************
 


 THETA - VECTOR OF FIXED EFFECTS PARAMETERS   *********


         TH 1      TH 2      TH 3      TH 4     
 
         6.91E+00  5.50E+00  4.25E+00  2.03E-01
 


 OMEGA - COV MATRIX FOR RANDOM EFFECTS - ETAS  ********


         ETA1      ETA2      ETA3     
 
 ETA1
+        7.08E-02
 
 ETA2
+        0.00E+00  7.78E-02
 
 ETA3
+        0.00E+00  0.00E+00  9.09E-02
 


 SIGMA - COV MATRIX FOR RANDOM EFFECTS - EPSILONS  ****


         EPS1     
 
 EPS1
+        1.00E+00
 
1


 OMEGA - CORR MATRIX FOR RANDOM EFFECTS - ETAS  *******


         ETA1      ETA2      ETA3     
 
 ETA1
+        2.66E-01
 
 ETA2
+        0.00E+00  2.79E-01
 
 ETA3
+        0.00E+00  0.00E+00  3.02E-01
 


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


         TH 1      TH 2      TH 3      TH 4     
 
         2.70E-02  4.08E-02  2.80E-02  2.20E-03
 


 OMEGA - COV MATRIX FOR RANDOM EFFECTS - ETAS  ********


         ETA1      ETA2      ETA3     
 
 ETA1
+        1.02E-02
 
 ETA2
+       .........  1.65E-02
 
 ETA3
+       ......... .........  1.15E-02
 


 SIGMA - COV MATRIX FOR RANDOM EFFECTS - EPSILONS  ****


         EPS1     
 
 EPS1
+       .........
 
1


 OMEGA - CORR MATRIX FOR RANDOM EFFECTS - ETAS  *******


         ETA1      ETA2      ETA3     
 
 ETA1
+        1.91E-02
 
 ETA2
+       .........  2.95E-02
 
 ETA3
+       ......... .........  1.90E-02
 


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
 

            TH 1      TH 2      TH 3      TH 4      OM11      OM12      OM13      OM22      OM23      OM33      SG11  
 
 TH 1
+        7.27E-04
 
 TH 2
+        2.34E-04  1.66E-03
 
 TH 3
+       -7.42E-05 -4.26E-05  7.83E-04
 
 TH 4
+       -3.87E-06 -4.00E-06  4.55E-06  4.86E-06
 
 OM11
+        6.04E-07 -7.45E-05  1.74E-06  2.51E-07  1.04E-04
 
 OM12
+       ......... ......... ......... ......... ......... .........
 
 OM13
+       ......... ......... ......... ......... ......... ......... .........
 
 OM22
+        2.52E-05  1.49E-04  4.23E-05 -1.93E-06 -4.37E-05 ......... .........  2.71E-04
 
 OM23
+       ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 OM33
+        3.95E-06  4.32E-05  9.64E-05  1.14E-06 -9.00E-06 ......... .........  2.85E-06 .........  1.32E-04
 
 SG11
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
 
1
 ************************************************************************************************************************
 ********************                                                                                ********************
 ********************               FIRST ORDER CONDITIONAL ESTIMATION WITH INTERACTION              ********************
 ********************                          CORRELATION MATRIX OF ESTIMATE                        ********************
 ********************                                                                                ********************
 ************************************************************************************************************************
 

            TH 1      TH 2      TH 3      TH 4      OM11      OM12      OM13      OM22      OM23      OM33      SG11  
 
 TH 1
+        2.70E-02
 
 TH 2
+        2.13E-01  4.08E-02
 
 TH 3
+       -9.84E-02 -3.73E-02  2.80E-02
 
 TH 4
+       -6.51E-02 -4.45E-02  7.38E-02  2.20E-03
 
 OM11
+        2.20E-03 -1.80E-01  6.11E-03  1.12E-02  1.02E-02
 
 OM12
+       ......... ......... ......... ......... ......... .........
 
 OM13
+       ......... ......... ......... ......... ......... ......... .........
 
 OM22
+        5.68E-02  2.22E-01  9.18E-02 -5.31E-02 -2.61E-01 ......... .........  1.65E-02
 
 OM23
+       ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 OM33
+        1.28E-02  9.22E-02  3.00E-01  4.50E-02 -7.70E-02 ......... .........  1.51E-02 .........  1.15E-02
 
 SG11
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
 
1
 ************************************************************************************************************************
 ********************                                                                                ********************
 ********************               FIRST ORDER CONDITIONAL ESTIMATION WITH INTERACTION              ********************
 ********************                      INVERSE COVARIANCE MATRIX OF ESTIMATE                     ********************
 ********************                                                                                ********************
 ************************************************************************************************************************
 

            TH 1      TH 2      TH 3      TH 4      OM11      OM12      OM13      OM22      OM23      OM33      SG11  
 
 TH 1
+        1.46E+03
 
 TH 2
+       -2.00E+02  6.80E+02
 
 TH 3
+        1.39E+02  6.11E+01  1.45E+03
 
 TH 4
+        8.75E+02  2.60E+02 -1.05E+03  2.09E+05
 
 OM11
+       -1.96E+02  3.40E+02 -2.00E+02  2.13E+02  1.06E+04
 
 OM12
+       ......... ......... ......... ......... ......... .........
 
 OM13
+       ......... ......... ......... ......... ......... ......... .........
 
 OM22
+       -7.22E+01 -3.05E+02 -3.01E+02  1.47E+03  1.57E+03 ......... .........  4.17E+03
 
 OM23
+       ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 OM33
+       -9.97E+01 -2.34E+02 -1.08E+03 -1.16E+03  7.31E+02 ......... .........  3.27E+02 .........  8.52E+03
 
 SG11
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 Elapsed finaloutput time in seconds:     0.46
1THERE ARE ERROR MESSAGES IN FILE PRDERR                                                                  
 #CPUT: Total CPU Time in Seconds,      205.000
