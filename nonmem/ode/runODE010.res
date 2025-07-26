Run Start Date:  29/08/2019 
Run Start Time: 15:14:54.78 
Run Stop Date:   29/08/2019 
Run Stop Time:  15:18:25.50 
  
************************************************************************************************************************ 
********************                            CONTROL STREAM                                      ******************** 
************************************************************************************************************************ 
  
$PROB    BOLUS_1CPT_VVMKM MULTIPLE DOSE FOCE INTER runODE010
$INPUT   ID TIME DV LNDV MDV AMT EVID DOSE VI VMI KMI SD CMT
$DATA    BOLUS_1CPTMM.csv IGNORE=@ IGNORE (SD.EQ.1)
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

$THETA   6.9       ;log VM
$THETA   5.8       ;log KM 
$THETA   4.2       ;log Vc
$THETA   (0,0.2,1) ;RSV
$OMEGA   0.1 0.14 0.1
$SIGMA   1 FIX
$EST     NSIG=2 SIGL=6 PRINT=5 MAX=9999 NOABORT POSTHOC METHOD=COND INTER NOOBT
$COV
$TABLE  ID TIME LNDV MDV AMT EVID DOSE VI VMI KMI V VM KM ETA1 ETA2 ETA3
        IPRED IRES IWRES CWRESI
        ONEHEADER NOPRINT FILE=runODE010.csv   
   
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
 BOLUS_1CPT_VVMKM MULTIPLE DOSE FOCE INTER runODE010
0DATA CHECKOUT RUN:              NO
 DATA SET LOCATED ON UNIT NO.:    2
 THIS UNIT TO BE REWOUND:        NO
 NO. OF DATA RECS IN DATA SET:     5520
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

 TOT. NO. OF OBS RECS:     4676
 TOT. NO. OF INDIVIDUALS:      120
0LENGTH OF THETA:   4
0DEFAULT THETA BOUNDARY TEST OMITTED:    NO
0OMEGA HAS SIMPLE DIAGONAL FORM WITH DIMENSION:   3
0DEFAULT OMEGA BOUNDARY TEST OMITTED:   YES
0SIGMA HAS SIMPLE DIAGONAL FORM WITH DIMENSION:   1
0DEFAULT SIGMA BOUNDARY TEST OMITTED:    NO
0INITIAL ESTIMATE OF THETA:
 LOWER BOUND    INITIAL EST    UPPER BOUND
 -0.1000E+07     0.6900E+01     0.1000E+07
 -0.1000E+07     0.5800E+01     0.1000E+07
 -0.1000E+07     0.4200E+01     0.1000E+07
  0.0000E+00     0.2000E+00     0.1000E+01
0INITIAL ESTIMATE OF OMEGA:
 0.1000E+00
 0.0000E+00   0.1400E+00
 0.0000E+00   0.0000E+00   0.1000E+00
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
 RAW OUTPUT FILE (FILE): runODE010.ext
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

 
0ITERATION NO.:    0    OBJECTIVE VALUE:   53993.9257643113        NO. OF FUNC. EVALS.:   6
 CUMULATIVE NO. OF FUNC. EVALS.:        6
 NPARAMETR:  6.9000E+00  5.8000E+00  4.2000E+00  2.0000E-01  1.0000E-01  1.4000E-01  1.0000E-01
 PARAMETER:  1.0000E-01  1.0000E-01  1.0000E-01  1.0000E-01  1.0000E-01  1.0000E-01  1.0000E-01
 GRADIENT:   1.3512E+05  3.6252E+04  2.5748E+04 -3.0305E+02  2.3572E+01 -2.7599E-01  7.0247E+00
 
0ITERATION NO.:    5    OBJECTIVE VALUE:   53979.6616186127        NO. OF FUNC. EVALS.:  87
 CUMULATIVE NO. OF FUNC. EVALS.:       93
 NPARAMETR:  7.0490E+00  5.7778E+00  4.0952E+00  2.0893E-01  8.3883E-02  1.4032E-01  9.6190E-02
 PARAMETER:  1.0216E-01  9.9618E-02  9.7504E-02  1.5491E-01  1.2127E-02  1.0116E-01  8.0575E-02
 GRADIENT:   5.7690E+05 -9.7863E+04 -1.8390E+04  2.7883E+02  2.9473E+01  3.3587E+00 -2.6763E-01
 
0ITERATION NO.:   10    OBJECTIVE VALUE:   53978.2598048921        NO. OF FUNC. EVALS.:  74
 CUMULATIVE NO. OF FUNC. EVALS.:      167
 NPARAMETR:  6.9712E+00  5.7884E+00  4.1158E+00  2.0881E-01  8.6403E-02  1.0783E-01  9.4752E-02
 PARAMETER:  1.0103E-01  9.9801E-02  9.7995E-02  1.5421E-01  2.6923E-02 -3.0524E-02  7.3045E-02
 GRADIENT:   5.4764E+05 -9.4417E+04 -1.6839E+04  2.6696E+02  2.4276E+01 -2.3730E+00  5.4137E-01
 
0ITERATION NO.:   15    OBJECTIVE VALUE:   53974.3985934854        NO. OF FUNC. EVALS.:  83
 CUMULATIVE NO. OF FUNC. EVALS.:      250
 NPARAMETR:  7.0332E+00  5.8055E+00  4.1368E+00  1.9995E-01  7.2045E-02  1.5407E-01  9.4592E-02
 PARAMETER:  1.0193E-01  1.0009E-01  9.8495E-02  9.9657E-02 -6.3942E-02  1.4787E-01  7.2199E-02
 GRADIENT:   6.3009E+05 -1.0617E+05 -1.5585E+04 -2.9767E+02  1.3673E+01 -1.8146E+00 -2.1566E+00
 
0ITERATION NO.:   20    OBJECTIVE VALUE:   53966.0147662204        NO. OF FUNC. EVALS.: 101
 CUMULATIVE NO. OF FUNC. EVALS.:      351
 NPARAMETR:  7.0430E+00  5.9010E+00  4.1337E+00  2.0411E-01  6.4467E-02  1.9168E-01  9.5778E-02
 PARAMETER:  1.0207E-01  1.0174E-01  9.8422E-02  1.2552E-01 -1.1951E-01  2.5709E-01  7.8431E-02
 GRADIENT:   5.9555E+05 -1.0386E+05 -1.5707E+04 -5.6809E+00  9.0462E+00 -4.3716E+00 -1.0518E+00
 
0ITERATION NO.:   25    OBJECTIVE VALUE:   53965.7735367043        NO. OF FUNC. EVALS.:  87
 CUMULATIVE NO. OF FUNC. EVALS.:      438
 NPARAMETR:  7.0321E+00  5.9404E+00  4.1349E+00  2.0417E-01  6.4502E-02  1.9447E-01  9.5762E-02
 PARAMETER:  1.0191E-01  1.0242E-01  9.8450E-02  1.2585E-01 -1.1924E-01  2.6431E-01  7.8346E-02
 GRADIENT:   5.8531E+05 -1.0378E+05 -1.5753E+04  2.1706E+00  8.1781E+00 -8.1171E+00 -1.1335E+00
 
0ITERATION NO.:   30    OBJECTIVE VALUE:   53962.4566562188        NO. OF FUNC. EVALS.: 102
 CUMULATIVE NO. OF FUNC. EVALS.:      540             RESET HESSIAN, TYPE I
 NPARAMETR:  7.0858E+00  6.0044E+00  4.1356E+00  2.0390E-01  5.0847E-02  3.0551E-01  9.6926E-02
 PARAMETER:  1.0269E-01  1.0352E-01  9.8468E-02  1.2422E-01 -2.3818E-01  4.9017E-01  8.4388E-02
 GRADIENT:   1.4587E+05  3.4726E+04  1.8681E+04 -1.0451E+00  2.4666E+00 -8.5664E-01 -1.3508E+00
 
0ITERATION NO.:   35    OBJECTIVE VALUE:   53960.6844167447        NO. OF FUNC. EVALS.:  94
 CUMULATIVE NO. OF FUNC. EVALS.:      634             RESET HESSIAN, TYPE I
 NPARAMETR:  7.0990E+00  6.0837E+00  4.1379E+00  2.0383E-01  4.7913E-02  3.6582E-01  9.7921E-02
 PARAMETER:  1.0288E-01  1.0489E-01  9.8521E-02  1.2378E-01 -2.6789E-01  5.8025E-01  8.9497E-02
 GRADIENT:   1.4427E+05  3.5912E+04  1.8488E+04  5.3240E+00  3.7770E+00 -1.4196E-01  8.4393E-02
 
0ITERATION NO.:   40    OBJECTIVE VALUE:   53960.0395883123        NO. OF FUNC. EVALS.:  86
 CUMULATIVE NO. OF FUNC. EVALS.:      720
 NPARAMETR:  7.0963E+00  6.1410E+00  4.1415E+00  2.0370E-01  4.5746E-02  3.8870E-01  9.7762E-02
 PARAMETER:  1.0284E-01  1.0588E-01  9.8606E-02  1.2296E-01 -2.9103E-01  6.1059E-01  8.8685E-02
 GRADIENT:   6.0929E+05 -1.1300E+05 -1.6173E+04  1.0065E+00  2.3064E+00 -2.8150E+00 -3.9110E-01
 
0ITERATION NO.:   45    OBJECTIVE VALUE:   53959.3787258864        NO. OF FUNC. EVALS.:  98
 CUMULATIVE NO. OF FUNC. EVALS.:      818
 NPARAMETR:  7.1211E+00  6.1779E+00  4.1425E+00  2.0361E-01  4.1560E-02  4.5175E-01  9.8199E-02
 PARAMETER:  1.0320E-01  1.0651E-01  9.8631E-02  1.2240E-01 -3.3902E-01  6.8574E-01  9.0910E-02
 GRADIENT:   6.1470E+05 -1.1497E+05 -1.6169E+04  2.3516E-01  2.2116E+00  8.9683E-01 -3.4500E-01
 
0ITERATION NO.:   50    OBJECTIVE VALUE:   53959.0306311835        NO. OF FUNC. EVALS.: 103
 CUMULATIVE NO. OF FUNC. EVALS.:      921             RESET HESSIAN, TYPE I
 NPARAMETR:  7.1295E+00  6.2232E+00  4.1420E+00  2.0358E-01  3.8336E-02  4.7696E-01  9.8639E-02
 PARAMETER:  1.0333E-01  1.0730E-01  9.8620E-02  1.2224E-01 -3.7940E-01  7.1289E-01  9.3149E-02
 GRADIENT:   1.4314E+05  3.7675E+04  1.8239E+04  2.2774E+00  6.5250E-01 -7.6972E-01  1.0276E-01
 
0ITERATION NO.:   55    OBJECTIVE VALUE:   53958.9485516887        NO. OF FUNC. EVALS.:  91
 CUMULATIVE NO. OF FUNC. EVALS.:     1012
 NPARAMETR:  7.1320E+00  6.2449E+00  4.1441E+00  2.0352E-01  3.7361E-02  4.9424E-01  9.8481E-02
 PARAMETER:  1.0336E-01  1.0767E-01  9.8669E-02  1.2185E-01 -3.9227E-01  7.3069E-01  9.2347E-02
 GRADIENT:   6.1378E+05 -1.1717E+05 -1.6277E+04 -7.9234E-01  5.4136E-01 -7.4679E-01 -2.6837E-01
 
0ITERATION NO.:   59    OBJECTIVE VALUE:   53958.9157156316        NO. OF FUNC. EVALS.:  80
 CUMULATIVE NO. OF FUNC. EVALS.:     1092
 NPARAMETR:  7.1349E+00  6.2581E+00  4.1433E+00  2.0354E-01  3.6349E-02  5.0391E-01  9.8751E-02
 PARAMETER:  1.0340E-01  1.0790E-01  9.8650E-02  1.2200E-01 -4.0600E-01  7.4037E-01  9.3717E-02
 GRADIENT:  -4.9444E+02  2.2585E+01 -6.8633E+01  1.6045E+00  1.1869E-01 -8.4944E-01  2.6578E-01
 
 #TERM:
0MINIMIZATION SUCCESSFUL
 HOWEVER, PROBLEMS OCCURRED WITH THE MINIMIZATION.
 REGARD THE RESULTS OF THE ESTIMATION STEP CAREFULLY, AND ACCEPT THEM ONLY
 AFTER CHECKING THAT THE COVARIANCE STEP PRODUCES REASONABLE OUTPUT.
 NO. OF FUNCTION EVALUATIONS USED:     1092
 NO. OF SIG. DIGITS IN FINAL EST.:  2.0

 ETABAR IS THE ARITHMETIC MEAN OF THE ETA-ESTIMATES,
 AND THE P-VALUE IS GIVEN FOR THE NULL HYPOTHESIS THAT THE TRUE MEAN IS 0.
 
 ETABAR:         4.8798E-03 -1.7789E-02 -6.8214E-03
 SE:             1.0897E-02  4.9974E-02  2.7640E-02
 N:                     120         120         120
 
 P VAL.:         6.5428E-01  7.2186E-01  8.0506E-01
 
 ETASHRINKSD(%)  3.7128E+01  2.2558E+01  3.2459E+00
 ETASHRINKVR(%)  6.0471E+01  4.0028E+01  6.3865E+00
 EBVSHRINKSD(%)  3.7407E+01  2.3697E+01  3.1389E+00
 EBVSHRINKVR(%)  6.0821E+01  4.1778E+01  6.1793E+00
 EPSSHRINKSD(%)  2.3026E+00
 EPSSHRINKVR(%)  4.5522E+00
 
  
 TOTAL DATA POINTS NORMALLY DISTRIBUTED (N):         4676
 N*LOG(2PI) CONSTANT TO OBJECTIVE FUNCTION:    8593.91316253010     
 OBJECTIVE FUNCTION VALUE WITHOUT CONSTANT:    53958.9157156316     
 OBJECTIVE FUNCTION VALUE WITH CONSTANT:       62552.8288781617     
 REPORTED OBJECTIVE FUNCTION DOES NOT CONTAIN CONSTANT
  
 TOTAL EFFECTIVE ETAS (NIND*NETA):                           360
  
 #TERE:
 Elapsed estimation  time in seconds:   187.06
 Elapsed covariance  time in seconds:    14.03
 Elapsed postprocess time in seconds:     0.34
1
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 ************************************************************************************************************************
 ********************                                                                                ********************
 ********************               FIRST ORDER CONDITIONAL ESTIMATION WITH INTERACTION              ********************
 #OBJT:**************                       MINIMUM VALUE OF OBJECTIVE FUNCTION                      ********************
 ********************                                                                                ********************
 ************************************************************************************************************************
 





 #OBJV:********************************************    53958.916       **************************************************
1
 ************************************************************************************************************************
 ********************                                                                                ********************
 ********************               FIRST ORDER CONDITIONAL ESTIMATION WITH INTERACTION              ********************
 ********************                             FINAL PARAMETER ESTIMATE                           ********************
 ********************                                                                                ********************
 ************************************************************************************************************************
 


 THETA - VECTOR OF FIXED EFFECTS PARAMETERS   *********


         TH 1      TH 2      TH 3      TH 4     
 
         7.13E+00  6.26E+00  4.14E+00  2.04E-01
 


 OMEGA - COV MATRIX FOR RANDOM EFFECTS - ETAS  ********


         ETA1      ETA2      ETA3     
 
 ETA1
+        3.63E-02
 
 ETA2
+        0.00E+00  5.04E-01
 
 ETA3
+        0.00E+00  0.00E+00  9.88E-02
 


 SIGMA - COV MATRIX FOR RANDOM EFFECTS - EPSILONS  ****


         EPS1     
 
 EPS1
+        1.00E+00
 
1


 OMEGA - CORR MATRIX FOR RANDOM EFFECTS - ETAS  *******


         ETA1      ETA2      ETA3     
 
 ETA1
+        1.91E-01
 
 ETA2
+        0.00E+00  7.10E-01
 
 ETA3
+        0.00E+00  0.00E+00  3.14E-01
 


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
 
         8.42E-02  3.06E-01  3.00E-02  2.30E-03
 


 OMEGA - COV MATRIX FOR RANDOM EFFECTS - ETAS  ********


         ETA1      ETA2      ETA3     
 
 ETA1
+        2.32E-02
 
 ETA2
+       .........  3.21E-01
 
 ETA3
+       ......... .........  1.47E-02
 


 SIGMA - COV MATRIX FOR RANDOM EFFECTS - EPSILONS  ****


         EPS1     
 
 EPS1
+       .........
 
1


 OMEGA - CORR MATRIX FOR RANDOM EFFECTS - ETAS  *******


         ETA1      ETA2      ETA3     
 
 ETA1
+        6.08E-02
 
 ETA2
+       .........  2.26E-01
 
 ETA3
+       ......... .........  2.34E-02
 


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
+        7.09E-03
 
 TH 2
+        2.40E-02  9.36E-02
 
 TH 3
+        6.68E-04  2.45E-03  9.03E-04
 
 TH 4
+        1.55E-05  8.38E-05  1.28E-06  5.29E-06
 
 OM11
+       -1.68E-03 -6.09E-03 -2.15E-04 -7.05E-06  5.37E-04
 
 OM12
+       ......... ......... ......... ......... ......... .........
 
 OM13
+       ......... ......... ......... ......... ......... ......... .........
 
 OM22
+        2.43E-02  9.55E-02  2.24E-03  8.17E-05 -6.30E-03 ......... .........  1.03E-01
 
 OM23
+       ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 OM33
+        7.88E-05  3.51E-04 -3.01E-05  3.10E-06 -1.76E-05 ......... .........  3.17E-04 .........  2.16E-04
 
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
+        8.42E-02
 
 TH 2
+        9.31E-01  3.06E-01
 
 TH 3
+        2.64E-01  2.66E-01  3.00E-02
 
 TH 4
+        7.99E-02  1.19E-01  1.85E-02  2.30E-03
 
 OM11
+       -8.62E-01 -8.58E-01 -3.08E-01 -1.32E-01  2.32E-02
 
 OM12
+       ......... ......... ......... ......... ......... .........
 
 OM13
+       ......... ......... ......... ......... ......... ......... .........
 
 OM22
+        9.02E-01  9.73E-01  2.32E-01  1.11E-01 -8.48E-01 ......... .........  3.21E-01
 
 OM23
+       ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 OM33
+        6.36E-02  7.79E-02 -6.82E-02  9.15E-02 -5.17E-02 ......... .........  6.73E-02 .........  1.47E-02
 
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
+        1.23E+03
 
 TH 2
+       -2.99E+02  2.97E+02
 
 TH 3
+        3.51E+01 -8.13E+01  1.26E+03
 
 TH 4
+        1.79E+03 -6.22E+02  3.68E+02  1.96E+05
 
 OM11
+        1.13E+03  3.15E+01  5.69E+02  4.17E+03  8.46E+03
 
 OM12
+       ......... ......... ......... ......... ......... .........
 
 OM13
+       ......... ......... ......... ......... ......... ......... .........
 
 OM22
+        5.32E+01 -2.00E+02  7.37E+01  2.53E+02  2.06E+02 ......... .........  1.94E+02
 
 OM23
+       ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 OM33
+        2.94E+01 -7.78E+01  2.28E+02 -2.44E+03 -5.65E+01 ......... .........  4.42E+01 .........  4.73E+03
 
 SG11
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 Elapsed finaloutput time in seconds:     0.32
 #CPUT: Total CPU Time in Seconds,      202.062
