Run Start Date:  29/08/2019 
Run Start Time: 19:15:28.86 
Run Stop Date:   29/08/2019 
Run Stop Time:  19:37:29.77 
  
************************************************************************************************************************ 
********************                            CONTROL STREAM                                      ******************** 
************************************************************************************************************************ 
  
$PROB    INFUSION_2CPT_V1QV2VMKM ALL DOSES FOCEI (120 Ind/6960 Obs) runODE056
$INPUT   ID TIME DV LNDV MDV AMT RATE EVID DOSE VI VMI KMI QI V2I SD CMT
$DATA    INFUSION_2CPTMM.csv IGNORE=@ 
$SUBR    ADVAN13 TOL=7
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
$OMEGA   0.15 0.15 0.15 0.15 0.15
$SIGMA   1 FIX
$EST     NSIG=2 SIGL=6 PRINT=5 MAX=9999 NOABORT POSTHOC METHOD=COND INTER NOOBT
$COV
$TABLE  ID TIME LNDV MDV AMT EVID DOSE VI VMI KMI V VM KM Q V2 ETA1 ETA2 ETA3 ETA4 ETA5
        IPRED IRES IWRES CWRESI
        ONEHEADER NOPRINT FILE=runODE056.csv   
   
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
 INFUSION_2CPT_V1QV2VMKM ALL DOSES FOCEI (120 Ind/6960 Obs) runODE056
0DATA CHECKOUT RUN:              NO
 DATA SET LOCATED ON UNIT NO.:    2
 THIS UNIT TO BE REWOUND:        NO
 NO. OF DATA RECS IN DATA SET:     7920
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

 TOT. NO. OF OBS RECS:     6960
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
 0.1500E+00
 0.0000E+00   0.1500E+00
 0.0000E+00   0.0000E+00   0.1500E+00
 0.0000E+00   0.0000E+00   0.0000E+00   0.1500E+00
 0.0000E+00   0.0000E+00   0.0000E+00   0.0000E+00   0.1500E+00
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
 NRD (RELATIVE) VALUE(S) OF TOLERANCE:   7
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
 RAW OUTPUT FILE (FILE): runODE056.ext
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
 NRD (RELATIVE) VALUE(S) OF TOLERANCE:   7
 ANRD (ABSOLUTE) VALUE(S) OF TOLERANCE:  12
 TOLERANCES FOR COVARIANCE STEP:
 NRD (RELATIVE) VALUE(S) OF TOLERANCE:   7
 ANRD (ABSOLUTE) VALUE(S) OF TOLERANCE:  12
 TOLERANCES FOR TABLE/SCATTER STEP:
 NRD (RELATIVE) VALUE(S) OF TOLERANCE:   7
 ANRD (ABSOLUTE) VALUE(S) OF TOLERANCE:  12
 
 THE FOLLOWING LABELS ARE EQUIVALENT
 PRED=PREDI
 RES=RESI
 WRES=WRESI
 IWRS=IWRESI
 IPRD=IPREDI
 IRS=IRESI
 
 MONITORING OF SEARCH:

 
0ITERATION NO.:    0    OBJECTIVE VALUE:   76683.7846949583        NO. OF FUNC. EVALS.:   8
 CUMULATIVE NO. OF FUNC. EVALS.:        8
 NPARAMETR:  7.0000E+00  5.7000E+00  4.5000E+00  1.5000E+00  4.0000E+00  3.0000E-01  1.5000E-01  1.5000E-01  1.5000E-01  1.5000E-01
             1.5000E-01
 PARAMETER:  1.0000E-01  1.0000E-01  1.0000E-01  1.0000E-01  1.0000E-01  1.0000E-01  1.0000E-01  1.0000E-01  1.0000E-01  1.0000E-01
             1.0000E-01
 GRADIENT:   3.3575E+04  1.4642E+04  2.0928E+04  1.2062E+03  4.2024E+03  4.5272E+03  5.9236E+01  1.3235E+01  3.3833E+01  2.2861E+01
             4.3856E+01
 
0ITERATION NO.:    5    OBJECTIVE VALUE:   75089.3621345173        NO. OF FUNC. EVALS.: 139
 CUMULATIVE NO. OF FUNC. EVALS.:      147             RESET HESSIAN, TYPE I
 NPARAMETR:  6.9202E+00  5.4142E+00  4.2223E+00  1.2796E+00  3.9028E+00  2.0247E-01  1.2614E-01  9.9672E-02  1.0856E-01  1.3778E-01
             1.2939E-01
 PARAMETER:  9.8860E-02  9.4986E-02  9.3828E-02  8.5310E-02  9.7570E-02 -4.2362E-01  1.3381E-02 -1.0438E-01 -6.1677E-02  5.7495E-02
             2.6097E-02
 GRADIENT:   7.0316E+04  1.1462E+04  9.3209E+03 -8.9434E+02  1.4852E+03  2.5144E+02  2.6993E+01  4.8049E+00  3.8021E+01  2.0788E+01
             1.1086E+01
 
0ITERATION NO.:   10    OBJECTIVE VALUE:   75076.4436395165        NO. OF FUNC. EVALS.: 139
 CUMULATIVE NO. OF FUNC. EVALS.:      286             RESET HESSIAN, TYPE I
 NPARAMETR:  6.9206E+00  5.4651E+00  4.2535E+00  1.3086E+00  3.9031E+00  2.0160E-01  1.0597E-01  9.6739E-02  8.8580E-02  9.0136E-02
             1.1540E-01
 PARAMETER:  9.8866E-02  9.5880E-02  9.4521E-02  8.7242E-02  9.7578E-02 -4.2902E-01 -7.3761E-02 -1.1931E-01 -1.6337E-01 -1.5466E-01
            -3.1114E-02
 GRADIENT:   6.8792E+04  1.4343E+04  1.2397E+04 -5.4155E+02  1.9659E+03  1.5020E+02  2.3298E+00  1.5386E-01  7.6717E-01  8.5416E+00
            -2.3496E+00
 
0ITERATION NO.:   15    OBJECTIVE VALUE:   75074.3186647831        NO. OF FUNC. EVALS.: 137
 CUMULATIVE NO. OF FUNC. EVALS.:      423             RESET HESSIAN, TYPE I
 NPARAMETR:  6.9212E+00  5.4709E+00  4.2585E+00  1.3402E+00  3.9052E+00  2.0017E-01  1.0402E-01  9.7109E-02  8.8413E-02  7.3324E-02
             1.1845E-01
 PARAMETER:  9.8875E-02  9.5980E-02  9.4633E-02  8.9345E-02  9.7631E-02 -4.3794E-01 -8.3042E-02 -1.1740E-01 -1.6431E-01 -2.5787E-01
            -1.8082E-02
 GRADIENT:   6.9533E+04  1.4975E+04  1.3415E+04 -1.0127E+02  2.3063E+03  8.5773E+00 -3.0223E-01 -6.8380E-01  2.4747E-01  1.7887E+00
            -1.2990E-01
 
0ITERATION NO.:   20    OBJECTIVE VALUE:   75074.2494536411        NO. OF FUNC. EVALS.: 130
 CUMULATIVE NO. OF FUNC. EVALS.:      553
 NPARAMETR:  6.9220E+00  5.4722E+00  4.2586E+00  1.3482E+00  3.9046E+00  2.0014E-01  1.0409E-01  9.8731E-02  8.8366E-02  7.1048E-02
             1.1833E-01
 PARAMETER:  9.8886E-02  9.6004E-02  9.4635E-02  8.9879E-02  9.7616E-02 -4.3815E-01 -8.2707E-02 -1.0912E-01 -1.6458E-01 -2.7364E-01
            -1.8559E-02
 GRADIENT:   1.3061E+05 -1.6603E+04  4.9629E+03 -3.0027E+01  4.6838E+02  1.1122E+00  1.9393E-01 -2.6807E-02  6.1757E-02  5.3939E-01
             1.4381E-03
 
0ITERATION NO.:   23    OBJECTIVE VALUE:   75074.2446828094        NO. OF FUNC. EVALS.:  82
 CUMULATIVE NO. OF FUNC. EVALS.:      635
 NPARAMETR:  6.9214E+00  5.4739E+00  4.2591E+00  1.3505E+00  3.9048E+00  2.0012E-01  1.0400E-01  9.8771E-02  8.8344E-02  6.9651E-02
             1.1828E-01
 PARAMETER:  9.8877E-02  9.6034E-02  9.4647E-02  9.0035E-02  9.7619E-02 -4.3822E-01 -8.3120E-02 -1.0891E-01 -1.6470E-01 -2.8357E-01
            -1.8784E-02
 GRADIENT:  -7.3260E+01  3.0717E+01  1.9270E+01  1.3440E+01  4.9474E+00 -5.3357E-01  5.5150E-02 -1.2985E-01 -5.4365E-02 -9.8362E-02
            -1.2085E-02
 
 #TERM:
0MINIMIZATION SUCCESSFUL
 HOWEVER, PROBLEMS OCCURRED WITH THE MINIMIZATION.
 REGARD THE RESULTS OF THE ESTIMATION STEP CAREFULLY, AND ACCEPT THEM ONLY
 AFTER CHECKING THAT THE COVARIANCE STEP PRODUCES REASONABLE OUTPUT.
 NO. OF FUNCTION EVALUATIONS USED:      635
 NO. OF SIG. DIGITS IN FINAL EST.:  2.3

 ETABAR IS THE ARITHMETIC MEAN OF THE ETA-ESTIMATES,
 AND THE P-VALUE IS GIVEN FOR THE NULL HYPOTHESIS THAT THE TRUE MEAN IS 0.
 
 ETABAR:         9.3864E-03 -9.7153E-03 -5.7918E-03  1.2329E-02 -1.2448E-02
 SE:             2.5903E-02  1.8456E-02  2.6581E-02  1.2480E-02  2.5293E-02
 N:                     120         120         120         120         120
 
 P VAL.:         7.1708E-01  5.9860E-01  8.2751E-01  3.2320E-01  6.2262E-01
 
 ETASHRINKSD(%)  1.1644E+01  3.5402E+01  1.6240E+00  4.7980E+01  1.9100E+01
 ETASHRINKVR(%)  2.1931E+01  5.8271E+01  3.2215E+00  7.2940E+01  3.4551E+01
 EBVSHRINKSD(%)  1.1661E+01  3.6290E+01  2.0805E+00  4.8272E+01  1.9108E+01
 EBVSHRINKVR(%)  2.1961E+01  5.9411E+01  4.1177E+00  7.3242E+01  3.4566E+01
 EPSSHRINKSD(%)  2.4866E+00
 EPSSHRINKVR(%)  4.9115E+00
 
  
 TOTAL DATA POINTS NORMALLY DISTRIBUTED (N):         6960
 N*LOG(2PI) CONSTANT TO OBJECTIVE FUNCTION:    12791.6243822090     
 OBJECTIVE FUNCTION VALUE WITHOUT CONSTANT:    75074.2446828094     
 OBJECTIVE FUNCTION VALUE WITH CONSTANT:       87865.8690650184     
 REPORTED OBJECTIVE FUNCTION DOES NOT CONTAIN CONSTANT
  
 TOTAL EFFECTIVE ETAS (NIND*NETA):                           600
  
 #TERE:
 Elapsed estimation  time in seconds:  1077.38
 Elapsed covariance  time in seconds:   229.70
 Elapsed postprocess time in seconds:     2.55
1
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 ************************************************************************************************************************
 ********************                                                                                ********************
 ********************               FIRST ORDER CONDITIONAL ESTIMATION WITH INTERACTION              ********************
 #OBJT:**************                       MINIMUM VALUE OF OBJECTIVE FUNCTION                      ********************
 ********************                                                                                ********************
 ************************************************************************************************************************
 





 #OBJV:********************************************    75074.245       **************************************************
1
 ************************************************************************************************************************
 ********************                                                                                ********************
 ********************               FIRST ORDER CONDITIONAL ESTIMATION WITH INTERACTION              ********************
 ********************                             FINAL PARAMETER ESTIMATE                           ********************
 ********************                                                                                ********************
 ************************************************************************************************************************
 


 THETA - VECTOR OF FIXED EFFECTS PARAMETERS   *********


         TH 1      TH 2      TH 3      TH 4      TH 5      TH 6     
 
         6.92E+00  5.47E+00  4.26E+00  1.35E+00  3.90E+00  2.00E-01
 


 OMEGA - COV MATRIX FOR RANDOM EFFECTS - ETAS  ********


         ETA1      ETA2      ETA3      ETA4      ETA5     
 
 ETA1
+        1.04E-01
 
 ETA2
+        0.00E+00  9.88E-02
 
 ETA3
+        0.00E+00  0.00E+00  8.83E-02
 
 ETA4
+        0.00E+00  0.00E+00  0.00E+00  6.97E-02
 
 ETA5
+        0.00E+00  0.00E+00  0.00E+00  0.00E+00  1.18E-01
 


 SIGMA - COV MATRIX FOR RANDOM EFFECTS - EPSILONS  ****


         EPS1     
 
 EPS1
+        1.00E+00
 
1


 OMEGA - CORR MATRIX FOR RANDOM EFFECTS - ETAS  *******


         ETA1      ETA2      ETA3      ETA4      ETA5     
 
 ETA1
+        3.22E-01
 
 ETA2
+        0.00E+00  3.14E-01
 
 ETA3
+        0.00E+00  0.00E+00  2.97E-01
 
 ETA4
+        0.00E+00  0.00E+00  0.00E+00  2.64E-01
 
 ETA5
+        0.00E+00  0.00E+00  0.00E+00  0.00E+00  3.44E-01
 


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
 
         4.03E-02  5.32E-02  2.77E-02  6.08E-02  4.42E-02  2.20E-03
 


 OMEGA - COV MATRIX FOR RANDOM EFFECTS - ETAS  ********


         ETA1      ETA2      ETA3      ETA4      ETA5     
 
 ETA1
+        1.93E-02
 
 ETA2
+       .........  3.12E-02
 
 ETA3
+       ......... .........  1.20E-02
 
 ETA4
+       ......... ......... .........  2.69E-02
 
 ETA5
+       ......... ......... ......... .........  2.89E-02
 


 SIGMA - COV MATRIX FOR RANDOM EFFECTS - EPSILONS  ****


         EPS1     
 
 EPS1
+       .........
 
1


 OMEGA - CORR MATRIX FOR RANDOM EFFECTS - ETAS  *******


         ETA1      ETA2      ETA3      ETA4      ETA5     
 
 ETA1
+        2.99E-02
 
 ETA2
+       .........  4.97E-02
 
 ETA3
+       ......... .........  2.02E-02
 
 ETA4
+       ......... ......... .........  5.10E-02
 
 ETA5
+       ......... ......... ......... .........  4.20E-02
 


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
+        1.62E-03
 
 TH 2
+        1.01E-03  2.84E-03
 
 TH 3
+        1.10E-04  1.20E-04  7.70E-04
 
 TH 4
+        3.77E-04 -1.77E-04 -8.74E-05  3.70E-03
 
 TH 5
+       -6.55E-04 -7.15E-04 -1.87E-04 -5.44E-04  1.95E-03
 
 TH 6
+       -8.86E-06  1.06E-05  3.12E-07 -1.30E-05  6.44E-06  4.83E-06
 
 OM11
+       -4.18E-05 -9.62E-05 -3.76E-05  2.19E-04 -2.81E-05 -3.20E-06  3.71E-04
 
 OM12
+       ......... ......... ......... ......... ......... ......... ......... .........
 
 OM13
+       ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 OM14
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 OM15
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 OM22
+       -6.42E-05  5.10E-05  1.66E-04 -2.15E-04  3.89E-04 -4.34E-06 -1.78E-04 ......... ......... ......... .........  9.76E-04
 
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
+       -7.36E-05 -1.40E-04  5.64E-05 -3.20E-05  9.03E-05  4.07E-07 -2.11E-05 ......... ......... ......... .........  3.47E-05
         ......... ......... .........  1.44E-04
 
 OM34
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
         ......... ......... ......... ......... .........
 
 OM35
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
         ......... ......... ......... ......... ......... .........
 
 OM44
+        1.55E-04 -6.19E-05 -5.57E-05  8.01E-04 -2.91E-04 -2.00E-06  8.16E-05 ......... ......... ......... ......... -1.36E-04
         ......... ......... ......... -3.18E-05 ......... .........  7.26E-04
 
1

            TH 1      TH 2      TH 3      TH 4      TH 5      TH 6      OM11      OM12      OM13      OM14      OM15      OM22  
             OM23      OM24      OM25      OM33      OM34      OM35      OM44      OM45      OM55      SG11  
 
 OM45
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
         ......... ......... ......... ......... ......... ......... ......... .........
 
 OM55
+       -6.40E-05  2.98E-04  1.06E-05 -4.50E-04 -8.18E-05 -3.46E-06 -6.48E-05 ......... ......... ......... .........  6.57E-05
         ......... ......... ......... -1.81E-05 ......... ......... -1.20E-04 .........  8.36E-04
 
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
+        4.03E-02
 
 TH 2
+        4.70E-01  5.32E-02
 
 TH 3
+        9.83E-02  8.09E-02  2.77E-02
 
 TH 4
+        1.54E-01 -5.47E-02 -5.18E-02  6.08E-02
 
 TH 5
+       -3.68E-01 -3.04E-01 -1.53E-01 -2.02E-01  4.42E-02
 
 TH 6
+       -1.00E-01  9.09E-02  5.12E-03 -9.76E-02  6.63E-02  2.20E-03
 
 OM11
+       -5.39E-02 -9.38E-02 -7.04E-02  1.87E-01 -3.30E-02 -7.57E-02  1.93E-02
 
 OM12
+       ......... ......... ......... ......... ......... ......... ......... .........
 
 OM13
+       ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 OM14
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 OM15
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 OM22
+       -5.10E-02  3.06E-02  1.92E-01 -1.13E-01  2.81E-01 -6.32E-02 -2.96E-01 ......... ......... ......... .........  3.12E-02
 
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
+       -1.52E-01 -2.20E-01  1.70E-01 -4.40E-02  1.71E-01  1.55E-02 -9.12E-02 ......... ......... ......... .........  9.26E-02
         ......... ......... .........  1.20E-02
 
 OM34
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
         ......... ......... ......... ......... .........
 
 OM35
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
         ......... ......... ......... ......... ......... .........
 
 OM44
+        1.42E-01 -4.31E-02 -7.45E-02  4.89E-01 -2.44E-01 -3.37E-02  1.57E-01 ......... ......... ......... ......... -1.62E-01
         ......... ......... ......... -9.85E-02 ......... .........  2.69E-02
 
1

            TH 1      TH 2      TH 3      TH 4      TH 5      TH 6      OM11      OM12      OM13      OM14      OM15      OM22  
             OM23      OM24      OM25      OM33      OM34      OM35      OM44      OM45      OM55      SG11  
 
 OM45
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
         ......... ......... ......... ......... ......... ......... ......... .........
 
 OM55
+       -5.49E-02  1.94E-01  1.32E-02 -2.56E-01 -6.40E-02 -5.44E-02 -1.16E-01 ......... ......... ......... .........  7.27E-02
         ......... ......... ......... -5.22E-02 ......... ......... -1.54E-01 .........  2.89E-02
 
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
+        9.23E+02
 
 TH 2
+       -3.08E+02  5.39E+02
 
 TH 3
+       -6.56E+01 -5.10E+00  1.50E+03
 
 TH 4
+       -4.47E+01  2.24E+01  3.66E+01  3.90E+02
 
 TH 5
+        1.58E+02  1.15E+02  2.45E+02  6.13E+01  7.57E+02
 
 TH 6
+        2.25E+03 -2.02E+03 -6.54E+02  6.89E+02 -1.00E+03  2.24E+05
 
 OM11
+        1.43E+02  1.04E+01 -7.94E+01 -1.26E+02 -1.06E+02  2.66E+03  3.15E+03
 
 OM12
+       ......... ......... ......... ......... ......... ......... ......... .........
 
 OM13
+       ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 OM14
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 OM15
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 OM22
+        2.35E+01 -8.20E+01 -3.30E+02 -2.72E+01 -3.22E+02  2.16E+03  5.81E+02 ......... ......... ......... .........  1.33E+03
 
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
+        1.00E+02  3.30E+02 -6.74E+02 -4.16E+01 -2.46E+02 -4.82E+02  4.54E+02 ......... ......... ......... .........  1.81E+01
         ......... ......... .........  7.87E+03
 
 OM34
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
         ......... ......... ......... ......... .........
 
 OM35
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
         ......... ......... ......... ......... ......... .........
 
 OM44
+       -8.64E+01  9.61E+01  1.09E+02 -3.58E+02  1.86E+02 -8.32E+02 -1.36E+02 ......... ......... ......... .........  4.65E+01
         ......... ......... .........  2.12E+02 ......... .........  1.92E+03
 
1

            TH 1      TH 2      TH 3      TH 4      TH 5      TH 6      OM11      OM12      OM13      OM14      OM15      OM22  
             OM23      OM24      OM25      OM33      OM34      OM35      OM44      OM45      OM55      SG11  
 
 OM45
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
         ......... ......... ......... ......... ......... ......... ......... .........
 
 OM55
+        1.81E+02 -1.72E+02  3.96E+01  1.47E+02  1.09E+02  2.01E+03  1.30E+02 ......... ......... ......... ......... -5.47E+01
         ......... ......... .........  8.43E+01 ......... .........  4.57E+01 .........  1.39E+03
 
 SG11
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
         ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 Elapsed finaloutput time in seconds:     0.58
1THERE ARE ERROR MESSAGES IN FILE PRDERR                                                                  
 #CPUT: Total CPU Time in Seconds,     1312.156
