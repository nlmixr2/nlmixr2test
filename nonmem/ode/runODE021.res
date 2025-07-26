Run Start Date:  29/08/2019 
Run Start Time: 15:25:21.87 
Run Stop Date:   29/08/2019 
Run Stop Time:  15:29:14.21 
  
************************************************************************************************************************ 
********************                            CONTROL STREAM                                      ******************** 
************************************************************************************************************************ 
  
$PROB    INFUSION_1CPT_VVMKM MULTIPLE DOSE FOCE INTER (120 Ind/4679 Obs) runODE021
$INPUT   ID TIME DV LNDV MDV AMT RATE EVID DOSE VI VMI KMI SD CMT
$DATA    INFUSION_1CPTMM.csv IGNORE=@ IGNORE (SD.EQ.1)
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
        ONEHEADER NOPRINT FILE=runODE021.csv   
   
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
 INFUSION_1CPT_VVMKM MULTIPLE DOSE FOCE INTER (120 Ind/4679 Obs) runODE02
0DATA CHECKOUT RUN:              NO
 DATA SET LOCATED ON UNIT NO.:    2
 THIS UNIT TO BE REWOUND:        NO
 NO. OF DATA RECS IN DATA SET:     5520
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

 TOT. NO. OF OBS RECS:     4679
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
 RAW OUTPUT FILE (FILE): runODE021.ext
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

 
0ITERATION NO.:    0    OBJECTIVE VALUE:   58805.1394957441        NO. OF FUNC. EVALS.:   6
 CUMULATIVE NO. OF FUNC. EVALS.:        6
 NPARAMETR:  7.0000E+00  5.7000E+00  4.5000E+00  3.0000E-01  1.5000E-01  1.5000E-01  1.5000E-01
 PARAMETER:  1.0000E-01  1.0000E-01  1.0000E-01  1.0000E-01  1.0000E-01  1.0000E-01  1.0000E-01
 GRADIENT:   7.0885E+04  1.1937E+04  2.9570E+04  2.7736E+03  7.5190E+01  2.3090E+00 -7.4528E+00
 
0ITERATION NO.:    5    OBJECTIVE VALUE:   58046.3911901102        NO. OF FUNC. EVALS.:  82
 CUMULATIVE NO. OF FUNC. EVALS.:       88             RESET HESSIAN, TYPE I
 NPARAMETR:  6.9037E+00  5.6102E+00  4.3405E+00  1.9053E-01  1.3265E-01  1.4983E-01  1.4339E-01
 PARAMETER:  9.8625E-02  9.8424E-02  9.6455E-02 -4.9929E-01  3.8524E-02  9.9425E-02  7.7456E-02
 GRADIENT:   1.6701E+05  2.5726E+04  3.6493E+04 -1.4797E+03  6.1484E+01 -1.3189E+01  5.3761E+01
 
0ITERATION NO.:   10    OBJECTIVE VALUE:   57924.1434364923        NO. OF FUNC. EVALS.:  67
 CUMULATIVE NO. OF FUNC. EVALS.:      155
 NPARAMETR:  6.9135E+00  5.6952E+00  4.1573E+00  2.1190E-01  1.0049E-01  3.9365E-01  1.1463E-01
 PARAMETER:  9.8765E-02  9.9915E-02  9.2385E-02 -3.6622E-01 -1.0027E-01  5.8241E-01 -3.4458E-02
 GRADIENT:   1.3665E+05  2.2082E+04  1.7248E+04  1.2853E+02  2.9588E+01  2.0223E+01  5.9173E+01
 
0ITERATION NO.:   15    OBJECTIVE VALUE:   57899.2506552387        NO. OF FUNC. EVALS.:  96
 CUMULATIVE NO. OF FUNC. EVALS.:      251
 NPARAMETR:  7.0236E+00  5.8848E+00  4.1796E+00  2.0970E-01  8.9151E-02  2.7475E-01  9.3213E-02
 PARAMETER:  1.0034E-01  1.0324E-01  9.2880E-02 -3.7946E-01 -1.6015E-01  4.0262E-01 -1.3787E-01
 GRADIENT:   1.1865E+06 -7.3775E+04 -1.3050E+04 -5.2044E+00  3.6587E+01 -6.2213E+00  2.3238E+01
 
0ITERATION NO.:   20    OBJECTIVE VALUE:   57890.0294040249        NO. OF FUNC. EVALS.: 102
 CUMULATIVE NO. OF FUNC. EVALS.:      353             RESET HESSIAN, TYPE I
 NPARAMETR:  7.0893E+00  5.9793E+00  4.1802E+00  2.0968E-01  5.5524E-02  3.8163E-01  8.4479E-02
 PARAMETER:  1.0128E-01  1.0490E-01  9.2894E-02 -3.7955E-01 -3.9691E-01  5.6691E-01 -1.8707E-01
 GRADIENT:   1.4246E+05  2.4076E+04  1.9974E+04  5.7529E+00  3.7960E+00 -9.6906E-01 -1.1855E+00
 
0ITERATION NO.:   25    OBJECTIVE VALUE:   57888.3454753857        NO. OF FUNC. EVALS.:  88
 CUMULATIVE NO. OF FUNC. EVALS.:      441
 NPARAMETR:  7.1258E+00  6.0634E+00  4.1782E+00  2.0947E-01  5.1010E-02  4.7426E-01  8.5462E-02
 PARAMETER:  1.0180E-01  1.0637E-01  9.2848E-02 -3.8083E-01 -4.3930E-01  6.7556E-01 -1.8128E-01
 GRADIENT:   1.3234E+06 -8.0389E+04 -1.3395E+04  2.3662E+00  2.5437E+00  3.4696E-01 -2.4245E-01
 
0ITERATION NO.:   30    OBJECTIVE VALUE:   57886.0473195262        NO. OF FUNC. EVALS.:  99
 CUMULATIVE NO. OF FUNC. EVALS.:      540             RESET HESSIAN, TYPE I
 NPARAMETR:  7.1587E+00  6.2115E+00  4.1826E+00  2.0912E-01  4.6169E-02  6.1835E-01  8.5902E-02
 PARAMETER:  1.0227E-01  1.0897E-01  9.2948E-02 -3.8294E-01 -4.8916E-01  8.0821E-01 -1.7871E-01
 GRADIENT:   1.4473E+05  2.5239E+04  1.9273E+04  6.1550E-01  1.7769E+00  4.2797E-01 -4.4772E-01
 
0ITERATION NO.:   35    OBJECTIVE VALUE:   57885.1998922967        NO. OF FUNC. EVALS.:  91
 CUMULATIVE NO. OF FUNC. EVALS.:      631
 NPARAMETR:  7.1696E+00  6.2886E+00  4.1859E+00  2.0906E-01  4.3778E-02  6.9993E-01  8.6206E-02
 PARAMETER:  1.0242E-01  1.1033E-01  9.3019E-02 -3.8331E-01 -5.1575E-01  8.7017E-01 -1.7695E-01
 GRADIENT:   1.3658E+06 -8.6214E+04 -1.3454E+04  2.7442E+00  7.2594E-01  1.5577E+00  2.4430E-02
 
0ITERATION NO.:   40    OBJECTIVE VALUE:   57884.8418105632        NO. OF FUNC. EVALS.:  92
 CUMULATIVE NO. OF FUNC. EVALS.:      723
 NPARAMETR:  7.1682E+00  6.3484E+00  4.1888E+00  2.0897E-01  4.3604E-02  7.2788E-01  8.6158E-02
 PARAMETER:  1.0240E-01  1.1137E-01  9.3085E-02 -3.8386E-01 -5.1775E-01  8.8975E-01 -1.7723E-01
 GRADIENT:   1.3636E+06 -8.7534E+04 -1.3440E+04  1.7113E+00  8.6174E-01 -4.9586E-01 -1.9123E-02
 
0ITERATION NO.:   45    OBJECTIVE VALUE:   57884.6955908307        NO. OF FUNC. EVALS.: 102
 CUMULATIVE NO. OF FUNC. EVALS.:      825
 NPARAMETR:  7.1825E+00  6.3844E+00  4.1886E+00  2.0893E-01  4.1762E-02  7.7292E-01  8.6417E-02
 PARAMETER:  1.0261E-01  1.1201E-01  9.3079E-02 -3.8411E-01 -5.3933E-01  9.1977E-01 -1.7573E-01
 GRADIENT:   1.3684E+06 -8.8482E+04 -1.3508E+04  2.2340E+00  7.0687E-02  9.2838E-01  3.7557E-01
 
0ITERATION NO.:   47    OBJECTIVE VALUE:   57884.6860086879        NO. OF FUNC. EVALS.:  38
 CUMULATIVE NO. OF FUNC. EVALS.:      863
 NPARAMETR:  7.1809E+00  6.3912E+00  4.1888E+00  2.0893E-01  4.1762E-02  7.7291E-01  8.6417E-02
 PARAMETER:  1.0258E-01  1.1213E-01  9.3085E-02 -3.8411E-01 -5.3933E-01  9.1976E-01 -1.7573E-01
 GRADIENT:  -2.6192E+02 -4.8430E+01  3.9304E+01  2.5910E+00  8.3175E-02  4.9894E-01  4.0727E-01
 
 #TERM:
0MINIMIZATION SUCCESSFUL
 HOWEVER, PROBLEMS OCCURRED WITH THE MINIMIZATION.
 REGARD THE RESULTS OF THE ESTIMATION STEP CAREFULLY, AND ACCEPT THEM ONLY
 AFTER CHECKING THAT THE COVARIANCE STEP PRODUCES REASONABLE OUTPUT.
 NO. OF FUNCTION EVALUATIONS USED:      863
 NO. OF SIG. DIGITS IN FINAL EST.:  2.2

 ETABAR IS THE ARITHMETIC MEAN OF THE ETA-ESTIMATES,
 AND THE P-VALUE IS GIVEN FOR THE NULL HYPOTHESIS THAT THE TRUE MEAN IS 0.
 
 ETABAR:         6.9103E-03 -1.8070E-02 -9.4467E-03
 SE:             1.1235E-02  5.8782E-02  2.5598E-02
 N:                     120         120         120
 
 P VAL.:         5.3852E-01  7.5853E-01  7.1209E-01
 
 ETASHRINKSD(%)  3.9521E+01  2.6449E+01  4.2125E+00
 ETASHRINKVR(%)  6.3423E+01  4.5902E+01  8.2476E+00
 EBVSHRINKSD(%)  4.1817E+01  2.7331E+01  4.1216E+00
 EBVSHRINKVR(%)  6.6147E+01  4.7192E+01  8.0732E+00
 EPSSHRINKSD(%)  2.1732E+00
 EPSSHRINKVR(%)  4.2992E+00
 
  
 TOTAL DATA POINTS NORMALLY DISTRIBUTED (N):         4679
 N*LOG(2PI) CONSTANT TO OBJECTIVE FUNCTION:    8599.42679372933     
 OBJECTIVE FUNCTION VALUE WITHOUT CONSTANT:    57884.6860086879     
 OBJECTIVE FUNCTION VALUE WITH CONSTANT:       66484.1128024172     
 REPORTED OBJECTIVE FUNCTION DOES NOT CONTAIN CONSTANT
  
 TOTAL EFFECTIVE ETAS (NIND*NETA):                           360
  
 #TERE:
 Elapsed estimation  time in seconds:   203.87
 Elapsed covariance  time in seconds:    18.81
 Elapsed postprocess time in seconds:     0.45
1
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 ************************************************************************************************************************
 ********************                                                                                ********************
 ********************               FIRST ORDER CONDITIONAL ESTIMATION WITH INTERACTION              ********************
 #OBJT:**************                       MINIMUM VALUE OF OBJECTIVE FUNCTION                      ********************
 ********************                                                                                ********************
 ************************************************************************************************************************
 





 #OBJV:********************************************    57884.686       **************************************************
1
 ************************************************************************************************************************
 ********************                                                                                ********************
 ********************               FIRST ORDER CONDITIONAL ESTIMATION WITH INTERACTION              ********************
 ********************                             FINAL PARAMETER ESTIMATE                           ********************
 ********************                                                                                ********************
 ************************************************************************************************************************
 


 THETA - VECTOR OF FIXED EFFECTS PARAMETERS   *********


         TH 1      TH 2      TH 3      TH 4     
 
         7.18E+00  6.39E+00  4.19E+00  2.09E-01
 


 OMEGA - COV MATRIX FOR RANDOM EFFECTS - ETAS  ********


         ETA1      ETA2      ETA3     
 
 ETA1
+        4.18E-02
 
 ETA2
+        0.00E+00  7.73E-01
 
 ETA3
+        0.00E+00  0.00E+00  8.64E-02
 


 SIGMA - COV MATRIX FOR RANDOM EFFECTS - EPSILONS  ****


         EPS1     
 
 EPS1
+        1.00E+00
 
1


 OMEGA - CORR MATRIX FOR RANDOM EFFECTS - ETAS  *******


         ETA1      ETA2      ETA3     
 
 ETA1
+        2.04E-01
 
 ETA2
+        0.00E+00  8.79E-01
 
 ETA3
+        0.00E+00  0.00E+00  2.94E-01
 


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
 
         8.25E-02  3.19E-01  2.79E-02  2.92E-03
 


 OMEGA - COV MATRIX FOR RANDOM EFFECTS - ETAS  ********


         ETA1      ETA2      ETA3     
 
 ETA1
+        1.73E-02
 
 ETA2
+       .........  3.46E-01
 
 ETA3
+       ......... .........  1.18E-02
 


 SIGMA - COV MATRIX FOR RANDOM EFFECTS - EPSILONS  ****


         EPS1     
 
 EPS1
+       .........
 
1


 OMEGA - CORR MATRIX FOR RANDOM EFFECTS - ETAS  *******


         ETA1      ETA2      ETA3     
 
 ETA1
+        4.22E-02
 
 ETA2
+       .........  1.97E-01
 
 ETA3
+       ......... .........  2.00E-02
 


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
+        6.81E-03
 
 TH 2
+        2.38E-02  1.02E-01
 
 TH 3
+        4.33E-04  1.77E-03  7.76E-04
 
 TH 4
+       -1.45E-05 -5.61E-05 -6.45E-06  8.55E-06
 
 OM11
+       -8.08E-04 -2.64E-03 -3.21E-05 -4.22E-06  2.98E-04
 
 OM12
+       ......... ......... ......... ......... ......... .........
 
 OM13
+       ......... ......... ......... ......... ......... ......... .........
 
 OM22
+        2.18E-02  9.99E-02  1.56E-03 -7.13E-05 -1.57E-03 ......... .........  1.20E-01
 
 OM23
+       ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 OM33
+        1.06E-04  3.16E-04  2.30E-05  7.44E-07 -3.43E-05 ......... .........  4.18E-05 .........  1.38E-04
 
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
+        8.25E-02
 
 TH 2
+        9.05E-01  3.19E-01
 
 TH 3
+        1.88E-01  1.99E-01  2.79E-02
 
 TH 4
+       -6.02E-02 -6.02E-02 -7.92E-02  2.92E-03
 
 OM11
+       -5.67E-01 -4.80E-01 -6.68E-02 -8.36E-02  1.73E-02
 
 OM12
+       ......... ......... ......... ......... ......... .........
 
 OM13
+       ......... ......... ......... ......... ......... ......... .........
 
 OM22
+        7.63E-01  9.04E-01  1.62E-01 -7.05E-02 -2.63E-01 ......... .........  3.46E-01
 
 OM23
+       ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 OM33
+        1.09E-01  8.41E-02  7.01E-02  2.16E-02 -1.69E-01 ......... .........  1.03E-02 .........  1.18E-02
 
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
+        9.56E+02
 
 TH 2
+       -2.45E+02  1.47E+02
 
 TH 3
+       -2.18E+01 -3.71E+01  1.36E+03
 
 TH 4
+        6.37E+02  2.60E+01  8.05E+02  1.20E+05
 
 OM11
+        6.27E+02  2.40E+02 -1.69E+02  3.54E+03  6.06E+03
 
 OM12
+       ......... ......... ......... ......... ......... .........
 
 OM13
+       ......... ......... ......... ......... ......... ......... .........
 
 OM22
+        3.86E+01 -7.43E+01  1.55E+01 -2.98E+01 -2.30E+02 ......... .........  5.99E+01
 
 OM23
+       ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 OM33
+       -3.06E+01 -6.02E+01 -1.75E+02 -4.42E+02  5.54E+02 ......... .........  6.23E+01 .........  7.54E+03
 
 SG11
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 Elapsed finaloutput time in seconds:     0.33
 #CPUT: Total CPU Time in Seconds,      223.781
