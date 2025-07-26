Run Start Date:  29/08/2019 
Run Start Time: 15:36:40.10 
Run Stop Date:   29/08/2019 
Run Stop Time:  15:43:20.43 
  
************************************************************************************************************************ 
********************                            CONTROL STREAM                                      ******************** 
************************************************************************************************************************ 
  
$PROB    ORAL1_1CPT_KAVCL MULTIPLE DOSE FOCEI (120 Ind/4674 Obs) runODE024
$INPUT   ID TIME DV LNDV MDV AMT EVID DOSE VI CLI KAI SSX IIX SD CMT
$DATA    ORAL_1CPT.csv IGNORE=@ IGNORE (SD.EQ.1)
$SUBR    ADVAN13 TOL=6
$MODEL
         COMP=(ABS,DEFDOSE)
         COMP=(CENTRAL,DEFOBS)
$PK
         CL=EXP(THETA(1)+ETA(1))
         V =EXP(THETA(2)+ETA(2))
         KA=EXP(THETA(3)+ETA(3))
         S2=V
$DES
         DADT(1)= -KA*A(1)
         DADT(2)=  KA*A(1)-CL*(A(2)/V)
$ERROR   
         IPRED = F     
         RESCV = THETA(4) 
         W     = IPRED*RESCV
         IRES  = DV-IPRED
         IWRES = IRES/W
         Y     = IPRED+W*EPS(1)
$THETA   1.6       ;log Cl
$THETA   4.5       ;log Vc
$THETA   0.2       ;log KA
$THETA   (0,0.3,1) ;RSV
$OMEGA   0.15 0.15 0.15
$SIGMA   1 FIX
$EST     NSIG=2 SIGL=6 PRINT=5 MAX=9999 NOABORT POSTHOC METHOD=COND INTER NOOBT
$COV
$TABLE  ID TIME LNDV MDV AMT EVID DOSE VI CLI CL V ETA1 ETA2 ETA3
        IPRED IRES IWRES CWRESI
        ONEHEADER NOPRINT FILE=runODE024.csv   
   
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
 ORAL1_1CPT_KAVCL MULTIPLE DOSE FOCEI (120 Ind/4674 Obs) runODE024
0DATA CHECKOUT RUN:              NO
 DATA SET LOCATED ON UNIT NO.:    2
 THIS UNIT TO BE REWOUND:        NO
 NO. OF DATA RECS IN DATA SET:     5520
 NO. OF DATA ITEMS IN DATA SET:  15
 ID DATA ITEM IS DATA ITEM NO.:   1
 DEP VARIABLE IS DATA ITEM NO.:   3
 MDV DATA ITEM IS DATA ITEM NO.:  5
0INDICES PASSED TO SUBROUTINE PRED:
   7   2   6   0   0   0  15   0   0   0   0
0LABELS FOR DATA ITEMS:
 ID TIME DV LNDV MDV AMT EVID DOSE VI CLI KAI SSX IIX SD CMT
0(NONBLANK) LABELS FOR PRED-DEFINED ITEMS:
 CL V IPRED IRES IWRES
0FORMAT FOR DATA:
 (E4.0,3E7.0,E2.0,E7.0,E2.0,E7.0,E6.0,E5.0,E6.0,2E3.0,2E2.0)

 TOT. NO. OF OBS RECS:     4674
 TOT. NO. OF INDIVIDUALS:      120
0LENGTH OF THETA:   4
0DEFAULT THETA BOUNDARY TEST OMITTED:    NO
0OMEGA HAS SIMPLE DIAGONAL FORM WITH DIMENSION:   3
0DEFAULT OMEGA BOUNDARY TEST OMITTED:   YES
0SIGMA HAS SIMPLE DIAGONAL FORM WITH DIMENSION:   1
0DEFAULT SIGMA BOUNDARY TEST OMITTED:    NO
0INITIAL ESTIMATE OF THETA:
 LOWER BOUND    INITIAL EST    UPPER BOUND
 -0.1000E+07     0.1600E+01     0.1000E+07
 -0.1000E+07     0.4500E+01     0.1000E+07
 -0.1000E+07     0.2000E+00     0.1000E+07
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
 ID TIME LNDV MDV AMT EVID DOSE VI CLI CL V ETA1 ETA2 ETA3 IPRED IRES IWRES CWRESI
1DOUBLE PRECISION PREDPP VERSION 7.4.3

 GENERAL NONLINEAR KINETICS MODEL WITH STIFF/NONSTIFF EQUATIONS (LSODA, ADVAN13)
0MODEL SUBROUTINE USER-SUPPLIED - ID NO. 9999
0MAXIMUM NO. OF BASIC PK PARAMETERS:   3
0COMPARTMENT ATTRIBUTES
 COMPT. NO.   FUNCTION   INITIAL    ON/OFF      DOSE      DEFAULT    DEFAULT
                         STATUS     ALLOWED    ALLOWED    FOR DOSE   FOR OBS.
    1         ABS          ON         YES        YES        YES        NO
    2         CENTRAL      ON         YES        YES        NO         YES
    3         OUTPUT       OFF        YES        NO         NO         NO
 INITIAL (BASE) TOLERANCE SETTINGS:
 NRD (RELATIVE) VALUE(S) OF TOLERANCE:   6
 ANRD (ABSOLUTE) VALUE(S) OF TOLERANCE:  12
1
 ADDITIONAL PK PARAMETERS - ASSIGNMENT OF ROWS IN GG
 COMPT. NO.                             INDICES
              SCALE      BIOAVAIL.   ZERO-ORDER  ZERO-ORDER  ABSORB
                         FRACTION    RATE        DURATION    LAG
    1            *           *           *           *           *
    2            4           *           *           *           *
    3            *           -           -           -           -
             - PARAMETER IS NOT ALLOWED FOR THIS MODEL
             * PARAMETER IS NOT SUPPLIED BY PK SUBROUTINE;
               WILL DEFAULT TO ONE IF APPLICABLE
0DATA ITEM INDICES USED BY PRED ARE:
   EVENT ID DATA ITEM IS DATA ITEM NO.:      7
   TIME DATA ITEM IS DATA ITEM NO.:          2
   DOSE AMOUNT DATA ITEM IS DATA ITEM NO.:   6
   COMPT. NO. DATA ITEM IS DATA ITEM NO.:   15

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
 RAW OUTPUT FILE (FILE): runODE024.ext
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

 
0ITERATION NO.:    0    OBJECTIVE VALUE:   44915.6831597936        NO. OF FUNC. EVALS.:   6
 CUMULATIVE NO. OF FUNC. EVALS.:        6
 NPARAMETR:  1.6000E+00  4.5000E+00  2.0000E-01  3.0000E-01  1.5000E-01  1.5000E-01  1.5000E-01
 PARAMETER:  1.0000E-01  1.0000E-01  1.0000E-01  1.0000E-01  1.0000E-01  1.0000E-01  1.0000E-01
 GRADIENT:   8.3366E+03  3.0497E+04  3.4308E+02  3.0331E+03  8.8943E+01  2.7680E+01  1.7516E+01
 
0ITERATION NO.:    5    OBJECTIVE VALUE:   43755.7950556674        NO. OF FUNC. EVALS.:  45
 CUMULATIVE NO. OF FUNC. EVALS.:       51
 NPARAMETR:  1.2859E+00  4.1724E+00 -6.6012E-02  1.9656E-01  1.3471E-01  1.4138E-01  1.4965E-01
 PARAMETER:  8.0371E-02  9.2721E-02 -3.3006E-02 -4.6067E-01  4.6258E-02  7.0407E-02  9.8843E-02
 GRADIENT:   6.7624E+03  3.0591E+04 -1.3264E+02  2.7485E+00  9.2857E+01  9.7895E+01  1.7226E+01
 
0ITERATION NO.:   10    OBJECTIVE VALUE:   43727.5798214710        NO. OF FUNC. EVALS.:  62
 CUMULATIVE NO. OF FUNC. EVALS.:      113
 NPARAMETR:  1.2785E+00  4.2012E+00 -3.7298E-02  1.9688E-01  8.6069E-02  7.8469E-02  1.2014E-01
 PARAMETER:  7.9905E-02  9.3359E-02 -1.8649E-02 -4.5863E-01 -1.7774E-01 -2.2396E-01 -1.0987E-02
 GRADIENT:   1.3898E+03 -7.0021E+04 -6.7415E+01  1.8685E+01  7.3370E+00 -2.9386E+00 -1.1659E+01
 
0ITERATION NO.:   15    OBJECTIVE VALUE:   43710.4667308194        NO. OF FUNC. EVALS.:  80
 CUMULATIVE NO. OF FUNC. EVALS.:      193
 NPARAMETR:  1.3564E+00  4.2014E+00 -1.0490E-02  1.9677E-01  8.3421E-02  7.8824E-02  1.3156E-01
 PARAMETER:  8.4778E-02  9.3365E-02 -5.2448E-03 -4.5931E-01 -1.9337E-01 -2.2171E-01  3.4427E-02
 GRADIENT:   4.7330E+03 -7.0172E+04  7.1651E-01  2.9010E+00  3.2159E+01 -2.1870E+00  1.6049E+00
 
0ITERATION NO.:   20    OBJECTIVE VALUE:   43707.1196391407        NO. OF FUNC. EVALS.:  90
 CUMULATIVE NO. OF FUNC. EVALS.:      283             RESET HESSIAN, TYPE I
 NPARAMETR:  1.3916E+00  4.2069E+00 -6.5862E-03  1.9686E-01  7.0649E-02  7.9616E-02  1.3045E-01
 PARAMETER:  8.6977E-02  9.3487E-02 -3.2931E-03 -4.5874E-01 -2.7646E-01 -2.1671E-01  3.0187E-02
 GRADIENT:   9.6216E+03  3.2549E+04  7.5802E+00  4.6430E+00 -6.0864E-02 -8.4957E-02  4.8065E-01
 
0ITERATION NO.:   24    OBJECTIVE VALUE:   43707.1169126168        NO. OF FUNC. EVALS.:  69
 CUMULATIVE NO. OF FUNC. EVALS.:      352
 NPARAMETR:  1.3921E+00  4.2069E+00 -9.3810E-03  1.9683E-01  7.0662E-02  7.9647E-02  1.2993E-01
 PARAMETER:  8.7006E-02  9.3487E-02 -4.6905E-03 -4.5892E-01 -2.7637E-01 -2.1651E-01  2.8187E-02
 GRADIENT:   3.9151E+00  1.5849E+01 -1.3319E+00 -2.9360E-01 -1.3549E-01 -2.5420E-02 -7.4190E-03
 
 #TERM:
0MINIMIZATION SUCCESSFUL
 HOWEVER, PROBLEMS OCCURRED WITH THE MINIMIZATION.
 REGARD THE RESULTS OF THE ESTIMATION STEP CAREFULLY, AND ACCEPT THEM ONLY
 AFTER CHECKING THAT THE COVARIANCE STEP PRODUCES REASONABLE OUTPUT.
 NO. OF FUNCTION EVALUATIONS USED:      352
 NO. OF SIG. DIGITS IN FINAL EST.:  2.2

 ETABAR IS THE ARITHMETIC MEAN OF THE ETA-ESTIMATES,
 AND THE P-VALUE IS GIVEN FOR THE NULL HYPOTHESIS THAT THE TRUE MEAN IS 0.
 
 ETABAR:        -9.7365E-04 -3.4550E-03 -4.6428E-03
 SE:             2.4045E-02  2.5080E-02  2.8494E-02
 N:                     120         120         120
 
 P VAL.:         9.6770E-01  8.9043E-01  8.7056E-01
 
 ETASHRINKSD(%)  4.9417E-01  2.2425E+00  1.3045E+01
 ETASHRINKVR(%)  9.8591E-01  4.4347E+00  2.4387E+01
 EBVSHRINKSD(%)  8.7491E-01  2.3943E+00  1.3208E+01
 EBVSHRINKVR(%)  1.7422E+00  4.7312E+00  2.4671E+01
 EPSSHRINKSD(%)  3.2390E+00
 EPSSHRINKVR(%)  6.3731E+00
 
  
 TOTAL DATA POINTS NORMALLY DISTRIBUTED (N):         4674
 N*LOG(2PI) CONSTANT TO OBJECTIVE FUNCTION:    8590.23740839728     
 OBJECTIVE FUNCTION VALUE WITHOUT CONSTANT:    43707.1169126168     
 OBJECTIVE FUNCTION VALUE WITH CONSTANT:       52297.3543210141     
 REPORTED OBJECTIVE FUNCTION DOES NOT CONTAIN CONSTANT
  
 TOTAL EFFECTIVE ETAS (NIND*NETA):                           360
  
 #TERE:
 Elapsed estimation  time in seconds:   316.88
 Elapsed covariance  time in seconds:    71.96
 Elapsed postprocess time in seconds:     1.59
1
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 ************************************************************************************************************************
 ********************                                                                                ********************
 ********************               FIRST ORDER CONDITIONAL ESTIMATION WITH INTERACTION              ********************
 #OBJT:**************                       MINIMUM VALUE OF OBJECTIVE FUNCTION                      ********************
 ********************                                                                                ********************
 ************************************************************************************************************************
 





 #OBJV:********************************************    43707.117       **************************************************
1
 ************************************************************************************************************************
 ********************                                                                                ********************
 ********************               FIRST ORDER CONDITIONAL ESTIMATION WITH INTERACTION              ********************
 ********************                             FINAL PARAMETER ESTIMATE                           ********************
 ********************                                                                                ********************
 ************************************************************************************************************************
 


 THETA - VECTOR OF FIXED EFFECTS PARAMETERS   *********


         TH 1      TH 2      TH 3      TH 4     
 
         1.39E+00  4.21E+00 -9.38E-03  1.97E-01
 


 OMEGA - COV MATRIX FOR RANDOM EFFECTS - ETAS  ********


         ETA1      ETA2      ETA3     
 
 ETA1
+        7.07E-02
 
 ETA2
+        0.00E+00  7.96E-02
 
 ETA3
+        0.00E+00  0.00E+00  1.30E-01
 


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
+        0.00E+00  2.82E-01
 
 ETA3
+        0.00E+00  0.00E+00  3.60E-01
 


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
 
         2.44E-02  2.65E-02  3.82E-02  1.86E-03
 


 OMEGA - COV MATRIX FOR RANDOM EFFECTS - ETAS  ********


         ETA1      ETA2      ETA3     
 
 ETA1
+        7.38E-03
 
 ETA2
+       .........  1.04E-02
 
 ETA3
+       ......... .........  2.18E-02
 


 SIGMA - COV MATRIX FOR RANDOM EFFECTS - EPSILONS  ****


         EPS1     
 
 EPS1
+       .........
 
1


 OMEGA - CORR MATRIX FOR RANDOM EFFECTS - ETAS  *******


         ETA1      ETA2      ETA3     
 
 ETA1
+        1.39E-02
 
 ETA2
+       .........  1.84E-02
 
 ETA3
+       ......... .........  3.02E-02
 


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
+        5.95E-04
 
 TH 2
+        1.90E-05  7.02E-04
 
 TH 3
+        3.68E-06  3.45E-05  1.46E-03
 
 TH 4
+       -5.91E-06 -1.45E-06  5.07E-06  3.45E-06
 
 OM11
+       -1.14E-05 -2.61E-05  1.82E-05 -2.00E-06  5.44E-05
 
 OM12
+       ......... ......... ......... ......... ......... .........
 
 OM13
+       ......... ......... ......... ......... ......... ......... .........
 
 OM22
+        2.55E-05  4.75E-05 -1.95E-05  1.79E-06 -7.57E-06 ......... .........  1.08E-04
 
 OM23
+       ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 OM33
+       -2.18E-05 -6.04E-05  1.87E-04  1.35E-06  1.29E-05 ......... ......... -3.84E-06 .........  4.74E-04
 
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
+        2.44E-02
 
 TH 2
+        2.94E-02  2.65E-02
 
 TH 3
+        3.95E-03  3.41E-02  3.82E-02
 
 TH 4
+       -1.30E-01 -2.95E-02  7.13E-02  1.86E-03
 
 OM11
+       -6.33E-02 -1.34E-01  6.44E-02 -1.46E-01  7.38E-03
 
 OM12
+       ......... ......... ......... ......... ......... .........
 
 OM13
+       ......... ......... ......... ......... ......... ......... .........
 
 OM22
+        1.00E-01  1.72E-01 -4.91E-02  9.24E-02 -9.88E-02 ......... .........  1.04E-02
 
 OM23
+       ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 OM33
+       -4.11E-02 -1.05E-01  2.25E-01  3.33E-02  8.05E-02 ......... ......... -1.70E-02 .........  2.18E-02
 
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
+        1.75E+03
 
 TH 2
+        1.46E+01  1.52E+03
 
 TH 3
+       -3.75E+01 -8.35E+01  7.34E+02
 
 TH 4
+        3.51E+03  1.44E+03 -1.29E+03  3.09E+05
 
 OM11
+        4.34E+02  6.75E+02 -2.47E+02  1.25E+04  1.95E+04
 
 OM12
+       ......... ......... ......... ......... ......... .........
 
 OM13
+       ......... ......... ......... ......... ......... ......... .........
 
 OM22
+       -4.50E+02 -6.56E+02  1.72E+02 -5.93E+03  7.05E+02 ......... .........  9.83E+03
 
 OM23
+       ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 OM33
+        7.17E+01  1.99E+02 -2.90E+02 -4.10E+02 -3.59E+02 ......... ......... -9.47E+01 .........  2.26E+03
 
 SG11
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 Elapsed finaloutput time in seconds:     0.36
1THERE ARE ERROR MESSAGES IN FILE PRDERR                                                                  
 #CPUT: Total CPU Time in Seconds,      392.125
