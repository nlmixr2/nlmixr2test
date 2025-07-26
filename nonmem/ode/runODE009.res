Run Start Date:  29/08/2019 
Run Start Time: 15:13:20.94 
Run Stop Date:   29/08/2019 
Run Stop Time:  15:14:53.48 
  
************************************************************************************************************************ 
********************                            CONTROL STREAM                                      ******************** 
************************************************************************************************************************ 
  
$PROB    BOLUS_1CPT_VVMKM SINGLE DOSE FOCE INTER (120 Ind/2274 Obs) runODE009
$INPUT   ID TIME DV LNDV MDV AMT EVID DOSE VI VMI KMI SD CMT
$DATA    BOLUS_1CPTMM.csv IGNORE=@ IGNORE (SD.EQ.0)
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
        ONEHEADER NOPRINT FILE=runODE009.csv   
   
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
 BOLUS_1CPT_VVMKM SINGLE DOSE FOCE INTER (120 Ind/2274 Obs) runODE009
0DATA CHECKOUT RUN:              NO
 DATA SET LOCATED ON UNIT NO.:    2
 THIS UNIT TO BE REWOUND:        NO
 NO. OF DATA RECS IN DATA SET:     2400
 NO. OF DATA ITEMS IN DATA SET:  13
 ID DATA ITEM IS DATA ITEM NO.:   1
 DEP VARIABLE IS DATA ITEM NO.:   3
 MDV DATA ITEM IS DATA ITEM NO.:  5
0INDICES PASSED TO SUBROUTINE PRED:
   7   2   6   0   0   0  13   0   0   0   0
0LABELS FOR DATA ITEMS:
 ID TIME DV LNDV MDV AMT EVID DOSE VI VMI KMI SD CMT
0(NONBLANK) LABELS FOR PRED-DEFINED ITEMS:
 VM KM V IPRED IRES IWRES
0FORMAT FOR DATA:
 (E4.0,3E7.0,E2.0,E6.0,E2.0,2E6.0,E7.0,E6.0,2E2.0)

 TOT. NO. OF OBS RECS:     2274
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
   EVENT ID DATA ITEM IS DATA ITEM NO.:      7
   TIME DATA ITEM IS DATA ITEM NO.:          2
   DOSE AMOUNT DATA ITEM IS DATA ITEM NO.:   6
   COMPT. NO. DATA ITEM IS DATA ITEM NO.:   13

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
 RAW OUTPUT FILE (FILE): runODE009.ext
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

 
0ITERATION NO.:    0    OBJECTIVE VALUE:   21544.3052657138        NO. OF FUNC. EVALS.:   6
 CUMULATIVE NO. OF FUNC. EVALS.:        6
 NPARAMETR:  7.0000E+00  5.7000E+00  4.5000E+00  3.0000E-01  1.5000E-01  1.5000E-01  1.5000E-01
 PARAMETER:  1.0000E-01  1.0000E-01  1.0000E-01  1.0000E-01  1.0000E-01  1.0000E-01  1.0000E-01
 GRADIENT:   3.6261E+04  1.4541E+04  2.7428E+04  1.3878E+03  7.4553E+01  1.3407E+01 -2.6781E+01
 
0ITERATION NO.:    5    OBJECTIVE VALUE:   20988.7642039461        NO. OF FUNC. EVALS.:  89
 CUMULATIVE NO. OF FUNC. EVALS.:       95
 NPARAMETR:  6.7444E+00  5.2475E+00  4.2685E+00  1.9080E-01  1.3351E-01  1.1092E-01  1.3021E-01
 PARAMETER:  9.6348E-02  9.2062E-02  9.4855E-02 -4.9749E-01  4.1779E-02 -5.0903E-02  2.9259E-02
 GRADIENT:   5.0124E+05 -8.4176E+04 -1.0362E+04 -2.5817E+02  4.6720E+01  1.7075E+01  6.1849E+01
 
0ITERATION NO.:   10    OBJECTIVE VALUE:   20959.5057439716        NO. OF FUNC. EVALS.:  87
 CUMULATIVE NO. OF FUNC. EVALS.:      182             RESET HESSIAN, TYPE I
 NPARAMETR:  6.7967E+00  5.3151E+00  4.1889E+00  1.9587E-01  9.6679E-02  5.4851E-02  8.8618E-02
 PARAMETER:  9.7095E-02  9.3247E-02  9.3087E-02 -4.6502E-01 -1.1962E-01 -4.0301E-01 -1.6315E-01
 GRADIENT:   8.5962E+04  2.1853E+04  1.7715E+04 -9.6281E+01  1.4999E+00 -2.9910E+00  6.5988E-02
 
0ITERATION NO.:   15    OBJECTIVE VALUE:   20958.3817858131        NO. OF FUNC. EVALS.:  93
 CUMULATIVE NO. OF FUNC. EVALS.:      275             RESET HESSIAN, TYPE I
 NPARAMETR:  6.8090E+00  5.3467E+00  4.1862E+00  1.9621E-01  9.4125E-02  6.5720E-02  8.8638E-02
 PARAMETER:  9.7271E-02  9.3803E-02  9.3026E-02 -4.6287E-01 -1.3301E-01 -3.1262E-01 -1.6304E-01
 GRADIENT:   8.4754E+04  2.2554E+04  1.7374E+04 -8.0972E+01  9.3146E-01 -1.6405E+00 -2.3200E-01
 
0ITERATION NO.:   20    OBJECTIVE VALUE:   20957.9326420915        NO. OF FUNC. EVALS.:  84
 CUMULATIVE NO. OF FUNC. EVALS.:      359
 NPARAMETR:  6.8083E+00  5.3695E+00  4.1853E+00  2.0104E-01  9.3665E-02  7.2468E-02  8.8822E-02
 PARAMETER:  9.7261E-02  9.4202E-02  9.3006E-02 -4.3248E-01 -1.3546E-01 -2.6374E-01 -1.6200E-01
 GRADIENT:   4.2129E+05 -7.2545E+04 -1.5048E+04  6.7973E+01  2.6697E+00  5.2251E-01  2.5572E-01
 
0ITERATION NO.:   25    OBJECTIVE VALUE:   20957.5891077156        NO. OF FUNC. EVALS.:  97
 CUMULATIVE NO. OF FUNC. EVALS.:      456
 NPARAMETR:  6.8181E+00  5.3764E+00  4.1836E+00  2.0042E-01  9.2355E-02  7.5912E-02  8.8852E-02
 PARAMETER:  9.7401E-02  9.4323E-02  9.2969E-02 -4.3638E-01 -1.4250E-01 -2.4053E-01 -1.6183E-01
 GRADIENT:   4.2447E+05 -7.3234E+04 -1.5275E+04  5.0166E+01  1.9042E+00  7.1174E-01  2.0927E-01
 
0ITERATION NO.:   30    OBJECTIVE VALUE:   20957.3240748637        NO. OF FUNC. EVALS.: 104
 CUMULATIVE NO. OF FUNC. EVALS.:      560             RESET HESSIAN, TYPE I
 NPARAMETR:  6.8228E+00  5.3867E+00  4.1845E+00  1.9803E-01  9.0889E-02  7.5917E-02  8.8814E-02
 PARAMETER:  9.7469E-02  9.4504E-02  9.2989E-02 -4.5133E-01 -1.5050E-01 -2.4050E-01 -1.6205E-01
 GRADIENT:   8.1895E+04  2.3189E+04  1.6867E+04 -2.0596E+01 -4.0923E-01 -7.7481E-01 -1.3068E-01
 
0ITERATION NO.:   35    OBJECTIVE VALUE:   20957.2634882346        NO. OF FUNC. EVALS.:  88
 CUMULATIVE NO. OF FUNC. EVALS.:      648
 NPARAMETR:  6.8247E+00  5.3897E+00  4.1841E+00  1.9871E-01  9.0713E-02  7.7635E-02  8.8847E-02
 PARAMETER:  9.7495E-02  9.4557E-02  9.2981E-02 -4.4708E-01 -1.5147E-01 -2.2931E-01 -1.6186E-01
 GRADIENT:   4.2969E+05 -7.4105E+04 -1.5311E+04 -8.6354E-01 -6.7476E-02 -2.8252E-01 -4.1769E-02
 
0ITERATION NO.:   40    OBJECTIVE VALUE:   20957.2577846260        NO. OF FUNC. EVALS.: 105
 CUMULATIVE NO. OF FUNC. EVALS.:      753             RESET HESSIAN, TYPE I
 NPARAMETR:  6.8267E+00  5.3930E+00  4.1839E+00  1.9873E-01  9.0504E-02  7.9211E-02  8.8875E-02
 PARAMETER:  9.7524E-02  9.4613E-02  9.2975E-02 -4.4696E-01 -1.5262E-01 -2.1926E-01 -1.6170E-01
 GRADIENT:   8.1422E+04  2.3080E+04  1.6664E+04  1.4270E+00  9.6251E-02 -1.4674E-02 -2.1451E-03
 
0ITERATION NO.:   42    OBJECTIVE VALUE:   20957.2577846260        NO. OF FUNC. EVALS.:  31
 CUMULATIVE NO. OF FUNC. EVALS.:      784
 NPARAMETR:  6.8267E+00  5.3930E+00  4.1839E+00  1.9873E-01  9.0504E-02  7.9211E-02  8.8875E-02
 PARAMETER:  9.7524E-02  9.4613E-02  9.2975E-02 -4.4696E-01 -1.5262E-01 -2.1926E-01 -1.6170E-01
 GRADIENT:  -1.7156E+01 -3.1564E+01  1.0617E-01  8.0118E-02  1.1241E-01 -2.4235E-02 -1.4633E-03
 
 #TERM:
0MINIMIZATION SUCCESSFUL
 HOWEVER, PROBLEMS OCCURRED WITH THE MINIMIZATION.
 REGARD THE RESULTS OF THE ESTIMATION STEP CAREFULLY, AND ACCEPT THEM ONLY
 AFTER CHECKING THAT THE COVARIANCE STEP PRODUCES REASONABLE OUTPUT.
 NO. OF FUNCTION EVALUATIONS USED:      784
 NO. OF SIG. DIGITS IN FINAL EST.:  2.6

 ETABAR IS THE ARITHMETIC MEAN OF THE ETA-ESTIMATES,
 AND THE P-VALUE IS GIVEN FOR THE NULL HYPOTHESIS THAT THE TRUE MEAN IS 0.
 
 ETABAR:         8.9487E-04 -9.6765E-03 -2.4073E-03
 SE:             2.3953E-02  1.3951E-02  2.6774E-02
 N:                     120         120         120
 
 P VAL.:         9.7020E-01  4.8792E-01  9.2836E-01
 
 ETASHRINKSD(%)  1.2414E+01  4.5473E+01  1.2043E+00
 ETASHRINKVR(%)  2.3288E+01  7.0268E+01  2.3942E+00
 EBVSHRINKSD(%)  1.1257E+01  4.6694E+01  1.4800E+00
 EBVSHRINKVR(%)  2.1247E+01  7.1585E+01  2.9381E+00
 EPSSHRINKSD(%)  5.1058E+00
 EPSSHRINKVR(%)  9.9510E+00
 
  
 TOTAL DATA POINTS NORMALLY DISTRIBUTED (N):         2274
 N*LOG(2PI) CONSTANT TO OBJECTIVE FUNCTION:    4179.33244901485     
 OBJECTIVE FUNCTION VALUE WITHOUT CONSTANT:    20957.2577846260     
 OBJECTIVE FUNCTION VALUE WITH CONSTANT:       25136.5902336408     
 REPORTED OBJECTIVE FUNCTION DOES NOT CONTAIN CONSTANT
  
 TOTAL EFFECTIVE ETAS (NIND*NETA):                           360
  
 #TERE:
 Elapsed estimation  time in seconds:    75.83
 Elapsed covariance  time in seconds:     7.26
 Elapsed postprocess time in seconds:     0.18
1
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 ************************************************************************************************************************
 ********************                                                                                ********************
 ********************               FIRST ORDER CONDITIONAL ESTIMATION WITH INTERACTION              ********************
 #OBJT:**************                       MINIMUM VALUE OF OBJECTIVE FUNCTION                      ********************
 ********************                                                                                ********************
 ************************************************************************************************************************
 





 #OBJV:********************************************    20957.258       **************************************************
1
 ************************************************************************************************************************
 ********************                                                                                ********************
 ********************               FIRST ORDER CONDITIONAL ESTIMATION WITH INTERACTION              ********************
 ********************                             FINAL PARAMETER ESTIMATE                           ********************
 ********************                                                                                ********************
 ************************************************************************************************************************
 


 THETA - VECTOR OF FIXED EFFECTS PARAMETERS   *********


         TH 1      TH 2      TH 3      TH 4     
 
         6.83E+00  5.39E+00  4.18E+00  1.99E-01
 


 OMEGA - COV MATRIX FOR RANDOM EFFECTS - ETAS  ********


         ETA1      ETA2      ETA3     
 
 ETA1
+        9.05E-02
 
 ETA2
+        0.00E+00  7.92E-02
 
 ETA3
+        0.00E+00  0.00E+00  8.89E-02
 


 SIGMA - COV MATRIX FOR RANDOM EFFECTS - EPSILONS  ****


         EPS1     
 
 EPS1
+        1.00E+00
 
1


 OMEGA - CORR MATRIX FOR RANDOM EFFECTS - ETAS  *******


         ETA1      ETA2      ETA3     
 
 ETA1
+        3.01E-01
 
 ETA2
+        0.00E+00  2.81E-01
 
 ETA3
+        0.00E+00  0.00E+00  2.98E-01
 


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
 
         5.24E-02  8.64E-02  2.79E-02  3.44E-03
 


 OMEGA - COV MATRIX FOR RANDOM EFFECTS - ETAS  ********


         ETA1      ETA2      ETA3     
 
 ETA1
+        1.60E-02
 
 ETA2
+       .........  4.08E-02
 
 ETA3
+       ......... .........  1.16E-02
 


 SIGMA - COV MATRIX FOR RANDOM EFFECTS - EPSILONS  ****


         EPS1     
 
 EPS1
+       .........
 
1


 OMEGA - CORR MATRIX FOR RANDOM EFFECTS - ETAS  *******


         ETA1      ETA2      ETA3     
 
 ETA1
+        2.66E-02
 
 ETA2
+       .........  7.24E-02
 
 ETA3
+       ......... .........  1.94E-02
 


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
+        2.74E-03
 
 TH 2
+        3.62E-03  7.47E-03
 
 TH 3
+       -1.74E-04 -2.83E-04  7.76E-04
 
 TH 4
+       -1.23E-05 -3.05E-05  6.88E-06  1.18E-05
 
 OM11
+       -2.52E-04 -2.29E-04 -2.61E-05  6.58E-07  2.57E-04
 
 OM12
+       ......... ......... ......... ......... ......... .........
 
 OM13
+       ......... ......... ......... ......... ......... ......... .........
 
 OM22
+        9.12E-04  1.75E-03 -7.46E-05 -2.26E-05 -1.65E-04 ......... .........  1.66E-03
 
 OM23
+       ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 OM33
+       -1.00E-04 -9.10E-05  3.77E-05 -2.41E-06  3.21E-05 ......... ......... -8.44E-05 .........  1.34E-04
 
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
+        5.24E-02
 
 TH 2
+        7.99E-01  8.64E-02
 
 TH 3
+       -1.19E-01 -1.18E-01  2.79E-02
 
 TH 4
+       -6.80E-02 -1.03E-01  7.18E-02  3.44E-03
 
 OM11
+       -3.00E-01 -1.66E-01 -5.84E-02  1.19E-02  1.60E-02
 
 OM12
+       ......... ......... ......... ......... ......... .........
 
 OM13
+       ......... ......... ......... ......... ......... ......... .........
 
 OM22
+        4.27E-01  4.98E-01 -6.57E-02 -1.61E-01 -2.52E-01 ......... .........  4.08E-02
 
 OM23
+       ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 OM33
+       -1.65E-01 -9.08E-02  1.17E-01 -6.04E-02  1.73E-01 ......... ......... -1.79E-01 .........  1.16E-02
 
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
+        1.12E+03
 
 TH 2
+       -5.19E+02  4.22E+02
 
 TH 3
+        6.82E+01  1.84E+01  1.35E+03
 
 TH 4
+       -1.66E+02  1.57E+02 -7.59E+02  8.80E+04
 
 OM11
+        6.07E+02 -2.32E+02  2.71E+02  1.51E+02  4.62E+03
 
 OM12
+       ......... ......... ......... ......... ......... .........
 
 OM13
+       ......... ......... ......... ......... ......... ......... .........
 
 OM22
+        1.29E+01 -1.89E+02  1.90E-01  1.23E+03  3.50E+02 ......... .........  8.64E+02
 
 OM23
+       ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 OM33
+        3.23E+02 -1.68E+02 -3.93E+02  2.51E+03 -6.60E+02 ......... .........  3.63E+02 .........  8.11E+03
 
 SG11
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 Elapsed finaloutput time in seconds:     0.16
 #CPUT: Total CPU Time in Seconds,       83.641
