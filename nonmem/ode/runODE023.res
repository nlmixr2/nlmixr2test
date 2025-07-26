Run Start Date:  29/08/2019 
Run Start Time: 15:32:50.63 
Run Stop Date:   29/08/2019 
Run Stop Time:  15:36:38.81 
  
************************************************************************************************************************ 
********************                            CONTROL STREAM                                      ******************** 
************************************************************************************************************************ 
  
$PROB    ORAL1_1CPT_KAVCL SINGLE DOSE FOCEI (120 Ind/2273 Obs) runODE023
$INPUT   ID TIME DV LNDV MDV AMT EVID DOSE VI CLI KAI SSX IIX SD CMT
$DATA    ORAL_1CPT.csv IGNORE=@ IGNORE (SD.EQ.0)
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
$THETA   1.8       ;log Cl
$THETA   4.7       ;log Vc
$THETA   0.2       ;log KA
$THETA   (0,0.3,1) ;RSV
$OMEGA   0.15 0.15 0.15
$SIGMA   1 FIX
$EST     NSIG=2 SIGL=6 PRINT=5 MAX=9999 NOABORT POSTHOC METHOD=COND INTER NOOBT
$COV
$TABLE  ID TIME LNDV MDV AMT EVID DOSE VI CLI CL V ETA1 ETA2 ETA3
        IPRED IRES IWRES CWRESI
        ONEHEADER NOPRINT FILE=runODE023.csv   
   
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
 ORAL1_1CPT_KAVCL SINGLE DOSE FOCEI (120 Ind/2273 Obs) runODE023
0DATA CHECKOUT RUN:              NO
 DATA SET LOCATED ON UNIT NO.:    2
 THIS UNIT TO BE REWOUND:        NO
 NO. OF DATA RECS IN DATA SET:     2400
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

 TOT. NO. OF OBS RECS:     2273
 TOT. NO. OF INDIVIDUALS:      120
0LENGTH OF THETA:   4
0DEFAULT THETA BOUNDARY TEST OMITTED:    NO
0OMEGA HAS SIMPLE DIAGONAL FORM WITH DIMENSION:   3
0DEFAULT OMEGA BOUNDARY TEST OMITTED:   YES
0SIGMA HAS SIMPLE DIAGONAL FORM WITH DIMENSION:   1
0DEFAULT SIGMA BOUNDARY TEST OMITTED:    NO
0INITIAL ESTIMATE OF THETA:
 LOWER BOUND    INITIAL EST    UPPER BOUND
 -0.1000E+07     0.1800E+01     0.1000E+07
 -0.1000E+07     0.4700E+01     0.1000E+07
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
 RAW OUTPUT FILE (FILE): runODE023.ext
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

 
0ITERATION NO.:    0    OBJECTIVE VALUE:   20161.5667167785        NO. OF FUNC. EVALS.:   6
 CUMULATIVE NO. OF FUNC. EVALS.:        6
 NPARAMETR:  1.8000E+00  4.7000E+00  2.0000E-01  3.0000E-01  1.5000E-01  1.5000E-01  1.5000E-01
 PARAMETER:  1.0000E-01  1.0000E-01  1.0000E-01  1.0000E-01  1.0000E-01  1.0000E-01  1.0000E-01
 GRADIENT:   1.2577E+04  4.4012E+04  3.7452E+02  1.2243E+03 -4.8006E+01 -1.5264E+02  3.5966E+01
 
0ITERATION NO.:    5    OBJECTIVE VALUE:   19595.7168171928        NO. OF FUNC. EVALS.:  41
 CUMULATIVE NO. OF FUNC. EVALS.:       47
 NPARAMETR:  1.2181E+00  3.7249E+00 -1.3163E-01  1.8418E-01  1.0558E-01  2.2899E-01  1.3886E-01
 PARAMETER:  6.7670E-02  7.9254E-02 -6.5814E-02 -5.4096E-01 -7.5592E-02  3.1152E-01  6.1427E-02
 GRADIENT:   1.1902E+03  1.2031E+04 -2.5908E+02 -4.3932E+02  3.6414E+01 -5.3927E+01  3.2181E+01
 
0ITERATION NO.:   10    OBJECTIVE VALUE:   19462.7121163439        NO. OF FUNC. EVALS.:  79
 CUMULATIVE NO. OF FUNC. EVALS.:      126
 NPARAMETR:  1.2099E+00  4.2111E+00  5.5963E-02  2.0598E-01  1.4129E-01  5.0079E-02  5.4155E-02
 PARAMETER:  6.7216E-02  8.9597E-02  2.7982E-02 -4.0205E-01  7.0077E-02 -4.4852E-01 -4.0939E-01
 GRADIENT:  -1.3648E+02 -4.8446E+04  5.2285E+02  1.7865E+02  6.6771E+01 -1.0261E+02 -1.1310E+02
 
0ITERATION NO.:   15    OBJECTIVE VALUE:   19417.4932938069        NO. OF FUNC. EVALS.:  75
 CUMULATIVE NO. OF FUNC. EVALS.:      201
 NPARAMETR:  1.5124E+00  4.0619E+00 -7.4535E-02  1.9502E-01  8.5304E-02  9.1721E-02  1.0308E-01
 PARAMETER:  8.4020E-02  8.6423E-02 -3.7267E-02 -4.7043E-01 -1.8221E-01 -1.4594E-01 -8.7587E-02
 GRADIENT:   1.3112E+04  1.5123E+04 -1.6017E+02 -1.0836E+02  1.2558E+01 -2.6133E-01 -3.9304E+00
 
0ITERATION NO.:   20    OBJECTIVE VALUE:   19369.7161696146        NO. OF FUNC. EVALS.:  67
 CUMULATIVE NO. OF FUNC. EVALS.:      268
 NPARAMETR:  1.4001E+00  4.2101E+00 -5.3166E-02  1.9669E-01  7.9431E-02  8.2772E-02  1.0297E-01
 PARAMETER:  7.7783E-02  8.9577E-02 -2.6583E-02 -4.5980E-01 -2.1787E-01 -1.9727E-01 -8.8120E-02
 GRADIENT:   6.8094E+03 -5.4971E+04 -1.0938E+02 -6.1076E+01  4.2598E+01  1.8790E+01 -2.1945E+00
 
0ITERATION NO.:   25    OBJECTIVE VALUE:   19365.4322015332        NO. OF FUNC. EVALS.: 100
 CUMULATIVE NO. OF FUNC. EVALS.:      368             RESET HESSIAN, TYPE I
 NPARAMETR:  1.3910E+00  4.1942E+00 -4.0748E-02  1.9793E-01  6.4322E-02  7.5206E-02  1.0391E-01
 PARAMETER:  7.7280E-02  8.9239E-02 -2.0374E-02 -4.5197E-01 -3.2337E-01 -2.4520E-01 -8.3549E-02
 GRADIENT:   6.5694E+03  2.9444E+04 -4.9262E+01 -1.9494E+01  2.7339E-01  1.9763E-01  4.2210E-03
 
0ITERATION NO.:   30    OBJECTIVE VALUE:   19365.3482256315        NO. OF FUNC. EVALS.:  85
 CUMULATIVE NO. OF FUNC. EVALS.:      453
 NPARAMETR:  1.3891E+00  4.1947E+00 -1.4101E-02  1.9880E-01  6.4257E-02  7.5179E-02  1.0390E-01
 PARAMETER:  7.7171E-02  8.9249E-02 -7.0507E-03 -4.4650E-01 -3.2387E-01 -2.4538E-01 -8.3611E-02
 GRADIENT:   5.9852E+03 -5.5871E+04  4.6183E+01  5.7106E+00 -1.0651E-01 -3.5398E-02 -3.1367E-01
 
0ITERATION NO.:   35    OBJECTIVE VALUE:   19365.2480309149        NO. OF FUNC. EVALS.:  96
 CUMULATIVE NO. OF FUNC. EVALS.:      549
 NPARAMETR:  1.3900E+00  4.1922E+00 -1.9065E-02  1.9862E-01  6.4244E-02  7.5138E-02  1.0388E-01
 PARAMETER:  7.7220E-02  8.9196E-02 -9.5324E-03 -4.4763E-01 -3.2397E-01 -2.4566E-01 -8.3693E-02
 GRADIENT:   6.0730E+03 -5.6314E+04  2.8660E+01  6.0726E-01 -9.0680E-02 -9.8902E-02 -1.6224E-01
 
0ITERATION NO.:   40    OBJECTIVE VALUE:   19365.1981521033        NO. OF FUNC. EVALS.:  99
 CUMULATIVE NO. OF FUNC. EVALS.:      648             RESET HESSIAN, TYPE I
 NPARAMETR:  1.3902E+00  4.1930E+00 -2.8948E-02  1.9861E-01  6.4278E-02  7.5169E-02  1.0373E-01
 PARAMETER:  7.7235E-02  8.9213E-02 -1.4474E-02 -4.4772E-01 -3.2371E-01 -2.4545E-01 -8.4415E-02
 GRADIENT:   6.4315E+03  2.8925E+04 -4.8505E+00  1.1094E+00  9.4732E-02  7.8147E-02 -4.5739E-02
 
0ITERATION NO.:   45    OBJECTIVE VALUE:   19365.1935957455        NO. OF FUNC. EVALS.:  87
 CUMULATIVE NO. OF FUNC. EVALS.:      735
 NPARAMETR:  1.3902E+00  4.1929E+00 -2.6995E-02  1.9861E-01  6.4255E-02  7.5162E-02  1.0393E-01
 PARAMETER:  7.7232E-02  8.9211E-02 -1.3498E-02 -4.4770E-01 -3.2389E-01 -2.4550E-01 -8.3450E-02
 GRADIENT:   6.1096E+03 -5.6212E+04 -1.1707E+00 -3.9675E-02  4.6202E-03  3.9633E-02  2.1248E-01
 
0ITERATION NO.:   46    OBJECTIVE VALUE:   19365.1935957455        NO. OF FUNC. EVALS.:  17
 CUMULATIVE NO. OF FUNC. EVALS.:      752
 NPARAMETR:  1.3902E+00  4.1929E+00 -2.6995E-02  1.9861E-01  6.4255E-02  7.5162E-02  1.0393E-01
 PARAMETER:  7.7232E-02  8.9211E-02 -1.3498E-02 -4.4770E-01 -3.2389E-01 -2.4550E-01 -8.3450E-02
 GRADIENT:   2.3300E+00  1.3220E+01 -1.2416E+00 -4.3447E-02 -7.6726E-02  2.2194E-02  2.3476E-01
 
 #TERM:
0MINIMIZATION SUCCESSFUL
 HOWEVER, PROBLEMS OCCURRED WITH THE MINIMIZATION.
 REGARD THE RESULTS OF THE ESTIMATION STEP CAREFULLY, AND ACCEPT THEM ONLY
 AFTER CHECKING THAT THE COVARIANCE STEP PRODUCES REASONABLE OUTPUT.
 NO. OF FUNCTION EVALUATIONS USED:      752
 NO. OF SIG. DIGITS IN FINAL EST.:  2.2

 ETABAR IS THE ARITHMETIC MEAN OF THE ETA-ESTIMATES,
 AND THE P-VALUE IS GIVEN FOR THE NULL HYPOTHESIS THAT THE TRUE MEAN IS 0.
 
 ETABAR:        -7.6950E-04 -3.4328E-03 -6.8458E-03
 SE:             2.2642E-02  2.4178E-02  2.6235E-02
 N:                     120         120         120
 
 P VAL.:         9.7289E-01  8.8709E-01  7.9413E-01
 
 ETASHRINKSD(%)  1.7424E+00  2.9882E+00  1.0482E+01
 ETASHRINKVR(%)  3.4543E+00  5.8871E+00  1.9865E+01
 EBVSHRINKSD(%)  1.9600E+00  3.1653E+00  1.0564E+01
 EBVSHRINKVR(%)  3.8817E+00  6.2304E+00  2.0013E+01
 EPSSHRINKSD(%)  6.7960E+00
 EPSSHRINKVR(%)  1.3130E+01
 
  
 TOTAL DATA POINTS NORMALLY DISTRIBUTED (N):         2273
 N*LOG(2PI) CONSTANT TO OBJECTIVE FUNCTION:    4177.49457194844     
 OBJECTIVE FUNCTION VALUE WITHOUT CONSTANT:    19365.1935957455     
 OBJECTIVE FUNCTION VALUE WITH CONSTANT:       23542.6881676940     
 REPORTED OBJECTIVE FUNCTION DOES NOT CONTAIN CONSTANT
  
 TOTAL EFFECTIVE ETAS (NIND*NETA):                           360
  
 #TERE:
 Elapsed estimation  time in seconds:   197.71
 Elapsed covariance  time in seconds:    21.21
 Elapsed postprocess time in seconds:     0.48
1
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 ************************************************************************************************************************
 ********************                                                                                ********************
 ********************               FIRST ORDER CONDITIONAL ESTIMATION WITH INTERACTION              ********************
 #OBJT:**************                       MINIMUM VALUE OF OBJECTIVE FUNCTION                      ********************
 ********************                                                                                ********************
 ************************************************************************************************************************
 





 #OBJV:********************************************    19365.194       **************************************************
1
 ************************************************************************************************************************
 ********************                                                                                ********************
 ********************               FIRST ORDER CONDITIONAL ESTIMATION WITH INTERACTION              ********************
 ********************                             FINAL PARAMETER ESTIMATE                           ********************
 ********************                                                                                ********************
 ************************************************************************************************************************
 


 THETA - VECTOR OF FIXED EFFECTS PARAMETERS   *********


         TH 1      TH 2      TH 3      TH 4     
 
         1.39E+00  4.19E+00 -2.70E-02  1.99E-01
 


 OMEGA - COV MATRIX FOR RANDOM EFFECTS - ETAS  ********


         ETA1      ETA2      ETA3     
 
 ETA1
+        6.43E-02
 
 ETA2
+        0.00E+00  7.52E-02
 
 ETA3
+        0.00E+00  0.00E+00  1.04E-01
 


 SIGMA - COV MATRIX FOR RANDOM EFFECTS - EPSILONS  ****


         EPS1     
 
 EPS1
+        1.00E+00
 
1


 OMEGA - CORR MATRIX FOR RANDOM EFFECTS - ETAS  *******


         ETA1      ETA2      ETA3     
 
 ETA1
+        2.53E-01
 
 ETA2
+        0.00E+00  2.74E-01
 
 ETA3
+        0.00E+00  0.00E+00  3.22E-01
 


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
 
         2.36E-02  2.58E-02  3.33E-02  2.98E-03
 


 OMEGA - COV MATRIX FOR RANDOM EFFECTS - ETAS  ********


         ETA1      ETA2      ETA3     
 
 ETA1
+        6.89E-03
 
 ETA2
+       .........  1.12E-02
 
 ETA3
+       ......... .........  1.62E-02
 


 SIGMA - COV MATRIX FOR RANDOM EFFECTS - EPSILONS  ****


         EPS1     
 
 EPS1
+       .........
 
1


 OMEGA - CORR MATRIX FOR RANDOM EFFECTS - ETAS  *******


         ETA1      ETA2      ETA3     
 
 ETA1
+        1.36E-02
 
 ETA2
+       .........  2.04E-02
 
 ETA3
+       ......... .........  2.52E-02
 


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
+        5.55E-04
 
 TH 2
+       -5.34E-06  6.65E-04
 
 TH 3
+        1.10E-05  6.65E-05  1.11E-03
 
 TH 4
+        1.74E-06 -8.44E-06 -1.85E-06  8.91E-06
 
 OM11
+       -9.95E-06 -1.97E-05 -1.31E-05 -2.11E-06  4.75E-05
 
 OM12
+       ......... ......... ......... ......... ......... .........
 
 OM13
+       ......... ......... ......... ......... ......... ......... .........
 
 OM22
+        2.52E-05  5.75E-05  9.16E-06  1.52E-06 -1.04E-05 ......... .........  1.25E-04
 
 OM23
+       ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 OM33
+        2.86E-05 -9.37E-05  8.02E-05 -3.74E-06  9.30E-06 ......... ......... -6.11E-06 .........  2.64E-04
 
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
+        2.36E-02
 
 TH 2
+       -8.79E-03  2.58E-02
 
 TH 3
+        1.40E-02  7.75E-02  3.33E-02
 
 TH 4
+        2.47E-02 -1.10E-01 -1.87E-02  2.98E-03
 
 OM11
+       -6.13E-02 -1.11E-01 -5.72E-02 -1.02E-01  6.89E-03
 
 OM12
+       ......... ......... ......... ......... ......... .........
 
 OM13
+       ......... ......... ......... ......... ......... ......... .........
 
 OM22
+        9.59E-02  2.00E-01  2.47E-02  4.56E-02 -1.35E-01 ......... .........  1.12E-02
 
 OM23
+       ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 OM33
+        7.49E-02 -2.24E-01  1.48E-01 -7.71E-02  8.32E-02 ......... ......... -3.37E-02 .........  1.62E-02
 
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
+        1.84E+03
 
 TH 2
+        2.16E+01  1.71E+03
 
 TH 3
+        2.81E+00 -1.34E+02  9.40E+02
 
 TH 4
+       -2.85E+02  2.10E+03 -1.21E+01  1.17E+05
 
 OM11
+        3.46E+02  4.85E+02  2.71E+02  5.16E+03  2.21E+04
 
 OM12
+       ......... ......... ......... ......... ......... .........
 
 OM13
+       ......... ......... ......... ......... ......... ......... .........
 
 OM22
+       -3.60E+02 -7.38E+02 -1.84E+00 -1.80E+03  1.43E+03 ......... .........  8.57E+03
 
 OM23
+       ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 OM33
+       -2.18E+02  6.43E+02 -3.44E+02  2.21E+03 -6.21E+02 ......... ......... -9.98E+01 .........  4.20E+03
 
 SG11
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 Elapsed finaloutput time in seconds:     0.18
1THERE ARE ERROR MESSAGES IN FILE PRDERR                                                                  
 #CPUT: Total CPU Time in Seconds,      220.016
