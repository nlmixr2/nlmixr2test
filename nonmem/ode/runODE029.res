Run Start Date:  29/08/2019 
Run Start Time: 15:51:57.51 
Run Stop Date:   29/08/2019 
Run Stop Time:  15:59:03.17 
  
************************************************************************************************************************ 
********************                            CONTROL STREAM                                      ******************** 
************************************************************************************************************************ 
  
$PROB    ORAL1_1CPT_KAVVMKM SINGLE DOSE FOCEI (120 Ind/2279 Obs) runODE029
$INPUT   ID TIME DV LNDV MDV AMT EVID DOSE VI VMI KMI KAI SD CMT
$DATA    ORAL_1CPTMM.csv IGNORE=@ IGNORE (SD.EQ.0)
$SUBR    ADVAN13 TOL=6
$MODEL
         COMP=(ABS,DEFDOSE)
         COMP=(CENTRAL,DEFOBS)
$PK
         VM=EXP(THETA(1)+ETA(1))
         KM=EXP(THETA(2)+ETA(2))
         V =EXP(THETA(3)+ETA(3))
         KA=EXP(THETA(4)+ETA(4))
         S2=V
$DES
         DADT(1)= -KA*A(1)
         DADT(2)=  KA*A(1)-VM*(A(2)/V)/(KM+(A(2)/V))  
$ERROR   
         IPRED = F     
         RESCV = THETA(5) 
         W     = IPRED*RESCV
         IRES  = DV-IPRED
         IWRES = IRES/W
         Y     = IPRED+W*EPS(1)

$THETA   7         ;log VM
$THETA   5.7       ;log KM 
$THETA   4.5       ;log Vc
$THETA   0.2       ;log KA
$THETA   (0,0.3,1) ;RSV
$OMEGA   0.15 0.15 0.15 0.15
$SIGMA   1 FIX
$EST     NSIG=2 SIGL=6 PRINT=5 MAX=9999 NOABORT POSTHOC METHOD=COND INTER NOOBT
$COV
$TABLE  ID TIME LNDV MDV AMT EVID DOSE VI VMI KMI V VM KM KA ETA1 ETA2 ETA3 ETA4
        IPRED IRES IWRES CWRESI
        ONEHEADER NOPRINT FILE=runODE029.csv   
   
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
 ORAL1_1CPT_KAVVMKM SINGLE DOSE FOCEI (120 Ind/2279 Obs) runODE029
0DATA CHECKOUT RUN:              NO
 DATA SET LOCATED ON UNIT NO.:    2
 THIS UNIT TO BE REWOUND:        NO
 NO. OF DATA RECS IN DATA SET:     2400
 NO. OF DATA ITEMS IN DATA SET:  14
 ID DATA ITEM IS DATA ITEM NO.:   1
 DEP VARIABLE IS DATA ITEM NO.:   3
 MDV DATA ITEM IS DATA ITEM NO.:  5
0INDICES PASSED TO SUBROUTINE PRED:
   7   2   6   0   0   0  14   0   0   0   0
0LABELS FOR DATA ITEMS:
 ID TIME DV LNDV MDV AMT EVID DOSE VI VMI KMI KAI SD CMT
0(NONBLANK) LABELS FOR PRED-DEFINED ITEMS:
 VM KM V KA IPRED IRES IWRES
0FORMAT FOR DATA:
 (E4.0,3E7.0,E2.0,E6.0,E2.0,2E6.0,E7.0,2E6.0,2E2.0)

 TOT. NO. OF OBS RECS:     2279
 TOT. NO. OF INDIVIDUALS:      120
0LENGTH OF THETA:   5
0DEFAULT THETA BOUNDARY TEST OMITTED:    NO
0OMEGA HAS SIMPLE DIAGONAL FORM WITH DIMENSION:   4
0DEFAULT OMEGA BOUNDARY TEST OMITTED:   YES
0SIGMA HAS SIMPLE DIAGONAL FORM WITH DIMENSION:   1
0DEFAULT SIGMA BOUNDARY TEST OMITTED:    NO
0INITIAL ESTIMATE OF THETA:
 LOWER BOUND    INITIAL EST    UPPER BOUND
 -0.1000E+07     0.7000E+01     0.1000E+07
 -0.1000E+07     0.5700E+01     0.1000E+07
 -0.1000E+07     0.4500E+01     0.1000E+07
 -0.1000E+07     0.2000E+00     0.1000E+07
  0.0000E+00     0.3000E+00     0.1000E+01
0INITIAL ESTIMATE OF OMEGA:
 0.1500E+00
 0.0000E+00   0.1500E+00
 0.0000E+00   0.0000E+00   0.1500E+00
 0.0000E+00   0.0000E+00   0.0000E+00   0.1500E+00
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
 ID TIME LNDV MDV AMT EVID DOSE VI VMI KMI V VM KM KA ETA1 ETA2 ETA3 ETA4 IPRED IRES IWRES CWRESI
1DOUBLE PRECISION PREDPP VERSION 7.4.3

 GENERAL NONLINEAR KINETICS MODEL WITH STIFF/NONSTIFF EQUATIONS (LSODA, ADVAN13)
0MODEL SUBROUTINE USER-SUPPLIED - ID NO. 9999
0MAXIMUM NO. OF BASIC PK PARAMETERS:   4
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
    2            5           *           *           *           *
    3            *           -           -           -           -
             - PARAMETER IS NOT ALLOWED FOR THIS MODEL
             * PARAMETER IS NOT SUPPLIED BY PK SUBROUTINE;
               WILL DEFAULT TO ONE IF APPLICABLE
0DATA ITEM INDICES USED BY PRED ARE:
   EVENT ID DATA ITEM IS DATA ITEM NO.:      7
   TIME DATA ITEM IS DATA ITEM NO.:          2
   DOSE AMOUNT DATA ITEM IS DATA ITEM NO.:   6
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
 RAW OUTPUT FILE (FILE): runODE029.ext
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

 
0ITERATION NO.:    0    OBJECTIVE VALUE:   20526.4952237058        NO. OF FUNC. EVALS.:   7
 CUMULATIVE NO. OF FUNC. EVALS.:        7
 NPARAMETR:  7.0000E+00  5.7000E+00  4.5000E+00  2.0000E-01  3.0000E-01  1.5000E-01  1.5000E-01  1.5000E-01  1.5000E-01
 PARAMETER:  1.0000E-01  1.0000E-01  1.0000E-01  1.0000E-01  1.0000E-01  1.0000E-01  1.0000E-01  1.0000E-01  1.0000E-01
 GRADIENT:   2.8532E+04  1.4040E+04  2.1564E+04  4.4715E+02  1.4059E+03  7.9245E+01  1.2250E+01  3.2187E+01  3.9201E+01
 
0ITERATION NO.:    5    OBJECTIVE VALUE:   19942.6229973314        NO. OF FUNC. EVALS.:  87
 CUMULATIVE NO. OF FUNC. EVALS.:       94             RESET HESSIAN, TYPE I
 NPARAMETR:  6.7176E+00  5.1717E+00  4.3427E+00  1.3740E-01  1.9094E-01  1.2423E-01  1.2392E-01  1.3308E-01  1.3825E-01
 PARAMETER:  9.5966E-02  9.0732E-02  9.6505E-02  6.8701E-02 -4.9659E-01  5.7657E-03  4.4815E-03  4.0170E-02  5.9206E-02
 GRADIENT:   7.4081E+04  1.9979E+04  2.4109E+04  3.1253E+02 -7.2217E+01  4.9449E+01  1.7829E+01  7.0244E+01  4.0466E+01
 
0ITERATION NO.:   10    OBJECTIVE VALUE:   19921.4461076133        NO. OF FUNC. EVALS.:  80
 CUMULATIVE NO. OF FUNC. EVALS.:      174
 NPARAMETR:  6.7114E+00  5.1956E+00  4.2948E+00  8.3934E-02  1.9172E-01  1.2320E-01  1.0622E-01  6.6498E-02  1.2647E-01
 PARAMETER:  9.5876E-02  9.1151E-02  9.5439E-02  4.1967E-02 -4.9155E-01  1.6066E-03 -7.2554E-02 -3.0673E-01  1.4692E-02
 GRADIENT:   7.1412E+04  2.0728E+04  2.3237E+04  1.7718E+02 -4.9662E+01  4.5340E+01  1.6250E+01 -6.2032E+01  3.8149E+01
 
0ITERATION NO.:   15    OBJECTIVE VALUE:   19894.6505152867        NO. OF FUNC. EVALS.: 103
 CUMULATIVE NO. OF FUNC. EVALS.:      277
 NPARAMETR:  6.7992E+00  5.3333E+00  4.2588E+00  9.0181E-03  1.9263E-01  8.9245E-02  5.8187E-02  8.6295E-02  9.1138E-02
 PARAMETER:  9.7131E-02  9.3566E-02  9.4639E-02  4.5091E-03 -4.8574E-01 -1.5962E-01 -3.7349E-01 -1.7643E-01 -1.4913E-01
 GRADIENT:   3.2666E+05 -7.1720E+04 -1.2682E+04 -7.8803E+00 -2.1643E+01  7.8102E-01 -5.8767E+00  3.6466E+00 -3.8007E+00
 
0ITERATION NO.:   20    OBJECTIVE VALUE:   19891.5863526637        NO. OF FUNC. EVALS.: 106
 CUMULATIVE NO. OF FUNC. EVALS.:      383
 NPARAMETR:  6.8505E+00  5.3853E+00  4.2439E+00  6.3650E-03  1.9213E-01  7.2812E-02  8.9129E-02  8.5503E-02  9.2812E-02
 PARAMETER:  9.7865E-02  9.4479E-02  9.4310E-02  3.1825E-03 -4.8895E-01 -2.6138E-01 -1.6028E-01 -1.8104E-01 -1.4003E-01
 GRADIENT:   7.3598E+04  2.1263E+04  1.7123E+04  5.2375E+00 -3.0005E+01 -9.0023E+00 -5.9752E+00  1.3366E-02 -1.3399E+00
 
0ITERATION NO.:   25    OBJECTIVE VALUE:   19890.5515823716        NO. OF FUNC. EVALS.: 115
 CUMULATIVE NO. OF FUNC. EVALS.:      498
 NPARAMETR:  6.8658E+00  5.4182E+00  4.2431E+00  3.5999E-03  1.9257E-01  7.6658E-02  9.9144E-02  8.5815E-02  9.3156E-02
 PARAMETER:  9.8084E-02  9.5056E-02  9.4292E-02  1.8000E-03 -4.8608E-01 -2.3564E-01 -1.0703E-01 -1.7922E-01 -1.3818E-01
 GRADIENT:   3.2362E+05 -7.2518E+04 -1.4191E+04 -1.3281E+00 -1.5181E+01  2.2412E+00 -1.8988E+00  1.8412E-01 -4.5896E-01
 
0ITERATION NO.:   30    OBJECTIVE VALUE:   19890.0714390344        NO. OF FUNC. EVALS.: 117
 CUMULATIVE NO. OF FUNC. EVALS.:      615             RESET HESSIAN, TYPE I
 NPARAMETR:  6.8747E+00  5.4459E+00  4.2422E+00  3.4773E-03  1.9300E-01  7.1499E-02  1.0880E-01  8.6052E-02  9.3306E-02
 PARAMETER:  9.8211E-02  9.5542E-02  9.4272E-02  1.7387E-03 -4.8334E-01 -2.7047E-01 -6.0548E-02 -1.7784E-01 -1.3737E-01
 GRADIENT:   7.1404E+04  2.2280E+04  1.6928E+04  8.2711E+00  1.1371E-01 -1.2539E+00 -1.7608E+00  9.3180E-02 -9.0531E-02
 
0ITERATION NO.:   35    OBJECTIVE VALUE:   19889.9244534609        NO. OF FUNC. EVALS.: 110
 CUMULATIVE NO. OF FUNC. EVALS.:      725
 NPARAMETR:  6.8818E+00  5.4609E+00  4.2415E+00  2.3514E-03  1.9300E-01  6.9927E-02  1.1288E-01  8.6152E-02  9.3292E-02
 PARAMETER:  9.8312E-02  9.5806E-02  9.4256E-02  1.1757E-03 -4.8335E-01 -2.8159E-01 -4.2176E-02 -1.7726E-01 -1.3745E-01
 GRADIENT:   3.1848E+05 -7.1455E+04 -1.4180E+04  3.5295E+00 -1.1118E+00 -1.6577E+00 -1.6424E+00  1.6558E-02 -9.9796E-02
 
0ITERATION NO.:   40    OBJECTIVE VALUE:   19889.8111749136        NO. OF FUNC. EVALS.: 127
 CUMULATIVE NO. OF FUNC. EVALS.:      852             RESET HESSIAN, TYPE I
 NPARAMETR:  6.8918E+00  5.4770E+00  4.2403E+00  3.8692E-04  1.9303E-01  6.9954E-02  1.2014E-01  8.6251E-02  9.3226E-02
 PARAMETER:  9.8455E-02  9.6087E-02  9.4229E-02  1.9346E-04 -4.8316E-01 -2.8140E-01 -1.0974E-02 -1.7669E-01 -1.3780E-01
 GRADIENT:   7.1377E+04  2.2558E+04  1.6811E+04  3.5750E+00  1.9788E+00  1.3415E+00  4.2149E-01 -1.0828E-01 -1.3670E-01
 
0ITERATION NO.:   45    OBJECTIVE VALUE:   19889.7931075110        NO. OF FUNC. EVALS.: 107
 CUMULATIVE NO. OF FUNC. EVALS.:      959
 NPARAMETR:  6.8941E+00  5.4814E+00  4.2401E+00  1.2043E-04  1.9302E-01  6.9183E-02  1.2028E-01  8.6243E-02  9.3163E-02
 PARAMETER:  9.8488E-02  9.6166E-02  9.4225E-02  6.0214E-05 -4.8323E-01 -2.8694E-01 -1.0417E-02 -1.7674E-01 -1.3814E-01
 GRADIENT:   3.1697E+05 -7.1369E+04 -1.4236E+04  2.8136E-01  5.3787E-03  4.7408E-01 -1.0058E-01 -2.1241E-01 -2.4549E-01
 
0ITERATION NO.:   46    OBJECTIVE VALUE:   19889.7931075110        NO. OF FUNC. EVALS.:  23
 CUMULATIVE NO. OF FUNC. EVALS.:      982
 NPARAMETR:  6.8941E+00  5.4814E+00  4.2401E+00  1.2043E-04  1.9302E-01  6.9183E-02  1.2028E-01  8.6243E-02  9.3163E-02
 PARAMETER:  9.8488E-02  9.6166E-02  9.4225E-02  6.0214E-05 -4.8323E-01 -2.8694E-01 -1.0417E-02 -1.7674E-01 -1.3814E-01
 GRADIENT:  -4.1435E+01 -1.1720E+02  7.1077E+00  3.0558E-01  2.4664E-02  4.6657E-01 -6.0815E-02 -1.9563E-01 -2.7204E-01
 
 #TERM:
0MINIMIZATION SUCCESSFUL
 HOWEVER, PROBLEMS OCCURRED WITH THE MINIMIZATION.
 REGARD THE RESULTS OF THE ESTIMATION STEP CAREFULLY, AND ACCEPT THEM ONLY
 AFTER CHECKING THAT THE COVARIANCE STEP PRODUCES REASONABLE OUTPUT.
 NO. OF FUNCTION EVALUATIONS USED:      982
 NO. OF SIG. DIGITS IN FINAL EST.:  2.0

 ETABAR IS THE ARITHMETIC MEAN OF THE ETA-ESTIMATES,
 AND THE P-VALUE IS GIVEN FOR THE NULL HYPOTHESIS THAT THE TRUE MEAN IS 0.
 
 ETABAR:         1.3686E-03 -8.0722E-03 -4.9293E-03 -9.0567E-03
 SE:             1.9266E-02  1.9708E-02  2.6108E-02  2.4709E-02
 N:                     120         120         120         120
 
 P VAL.:         9.4337E-01  6.8211E-01  8.5025E-01  7.1397E-01
 
 ETASHRINKSD(%)  1.9426E+01  3.7489E+01  2.2053E+00  1.0949E+01
 ETASHRINKVR(%)  3.5078E+01  6.0923E+01  4.3619E+00  2.0699E+01
 EBVSHRINKSD(%)  1.8566E+01  3.8255E+01  2.4272E+00  1.1324E+01
 EBVSHRINKVR(%)  3.3684E+01  6.1876E+01  4.7956E+00  2.1366E+01
 EPSSHRINKSD(%)  7.0350E+00
 EPSSHRINKVR(%)  1.3575E+01
 
  
 TOTAL DATA POINTS NORMALLY DISTRIBUTED (N):         2279
 N*LOG(2PI) CONSTANT TO OBJECTIVE FUNCTION:    4188.52183434690     
 OBJECTIVE FUNCTION VALUE WITHOUT CONSTANT:    19889.7931075110     
 OBJECTIVE FUNCTION VALUE WITH CONSTANT:       24078.3149418579     
 REPORTED OBJECTIVE FUNCTION DOES NOT CONTAIN CONSTANT
  
 TOTAL EFFECTIVE ETAS (NIND*NETA):                           480
  
 #TERE:
 Elapsed estimation  time in seconds:   376.22
 Elapsed covariance  time in seconds:    39.54
 Elapsed postprocess time in seconds:     0.60
1
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 ************************************************************************************************************************
 ********************                                                                                ********************
 ********************               FIRST ORDER CONDITIONAL ESTIMATION WITH INTERACTION              ********************
 #OBJT:**************                       MINIMUM VALUE OF OBJECTIVE FUNCTION                      ********************
 ********************                                                                                ********************
 ************************************************************************************************************************
 





 #OBJV:********************************************    19889.793       **************************************************
1
 ************************************************************************************************************************
 ********************                                                                                ********************
 ********************               FIRST ORDER CONDITIONAL ESTIMATION WITH INTERACTION              ********************
 ********************                             FINAL PARAMETER ESTIMATE                           ********************
 ********************                                                                                ********************
 ************************************************************************************************************************
 


 THETA - VECTOR OF FIXED EFFECTS PARAMETERS   *********


         TH 1      TH 2      TH 3      TH 4      TH 5     
 
         6.89E+00  5.48E+00  4.24E+00  1.20E-04  1.93E-01
 


 OMEGA - COV MATRIX FOR RANDOM EFFECTS - ETAS  ********


         ETA1      ETA2      ETA3      ETA4     
 
 ETA1
+        6.92E-02
 
 ETA2
+        0.00E+00  1.20E-01
 
 ETA3
+        0.00E+00  0.00E+00  8.62E-02
 
 ETA4
+        0.00E+00  0.00E+00  0.00E+00  9.32E-02
 


 SIGMA - COV MATRIX FOR RANDOM EFFECTS - EPSILONS  ****


         EPS1     
 
 EPS1
+        1.00E+00
 
1


 OMEGA - CORR MATRIX FOR RANDOM EFFECTS - ETAS  *******


         ETA1      ETA2      ETA3      ETA4     
 
 ETA1
+        2.63E-01
 
 ETA2
+        0.00E+00  3.47E-01
 
 ETA3
+        0.00E+00  0.00E+00  2.94E-01
 
 ETA4
+        0.00E+00  0.00E+00  0.00E+00  3.05E-01
 


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


         TH 1      TH 2      TH 3      TH 4      TH 5     
 
         6.05E-02  1.12E-01  2.84E-02  3.20E-02  3.49E-03
 


 OMEGA - COV MATRIX FOR RANDOM EFFECTS - ETAS  ********


         ETA1      ETA2      ETA3      ETA4     
 
 ETA1
+        1.74E-02
 
 ETA2
+       .........  4.82E-02
 
 ETA3
+       ......... .........  9.22E-03
 
 ETA4
+       ......... ......... .........  1.27E-02
 


 SIGMA - COV MATRIX FOR RANDOM EFFECTS - EPSILONS  ****


         EPS1     
 
 EPS1
+       .........
 
1


 OMEGA - CORR MATRIX FOR RANDOM EFFECTS - ETAS  *******


         ETA1      ETA2      ETA3      ETA4     
 
 ETA1
+        3.30E-02
 
 ETA2
+       .........  6.96E-02
 
 ETA3
+       ......... .........  1.57E-02
 
 ETA4
+       ......... ......... .........  2.08E-02
 


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
 

            TH 1      TH 2      TH 3      TH 4      TH 5      OM11      OM12      OM13      OM14      OM22      OM23      OM24  
             OM33      OM34      OM44      SG11  
 
 TH 1
+        3.67E-03
 
 TH 2
+        5.91E-03  1.25E-02
 
 TH 3
+       -3.29E-04 -9.38E-04  8.06E-04
 
 TH 4
+       -2.75E-04 -7.70E-04  9.33E-05  1.02E-03
 
 TH 5
+       -1.53E-05 -4.11E-05  5.89E-06  2.13E-05  1.22E-05
 
 OM11
+       -4.66E-04 -7.45E-04 -1.07E-05 -3.44E-05 -4.84E-06  3.02E-04
 
 OM12
+       ......... ......... ......... ......... ......... ......... .........
 
 OM13
+       ......... ......... ......... ......... ......... ......... ......... .........
 
 OM14
+       ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 OM22
+        1.28E-03  2.88E-03 -1.28E-04 -8.99E-05 -1.74E-05 -5.05E-04 ......... ......... .........  2.33E-03
 
 OM23
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 OM24
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 OM33
+        5.06E-05  1.71E-04 -2.46E-05 -1.38E-06  1.28E-07 -6.43E-06 ......... ......... .........  5.35E-05 ......... .........
          8.50E-05
 
 OM34
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
         ......... .........
 
 OM44
+       -1.58E-05 -9.58E-05  2.85E-05  3.03E-05  5.21E-06  3.36E-06 ......... ......... ......... -7.11E-05 ......... .........
          2.89E-06 .........  1.61E-04
 
 SG11
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
         ......... ......... ......... .........
 
1
 ************************************************************************************************************************
 ********************                                                                                ********************
 ********************               FIRST ORDER CONDITIONAL ESTIMATION WITH INTERACTION              ********************
 ********************                          CORRELATION MATRIX OF ESTIMATE                        ********************
 ********************                                                                                ********************
 ************************************************************************************************************************
 

            TH 1      TH 2      TH 3      TH 4      TH 5      OM11      OM12      OM13      OM14      OM22      OM23      OM24  
             OM33      OM34      OM44      SG11  
 
 TH 1
+        6.05E-02
 
 TH 2
+        8.73E-01  1.12E-01
 
 TH 3
+       -1.91E-01 -2.95E-01  2.84E-02
 
 TH 4
+       -1.42E-01 -2.15E-01  1.03E-01  3.20E-02
 
 TH 5
+       -7.23E-02 -1.05E-01  5.95E-02  1.91E-01  3.49E-03
 
 OM11
+       -4.43E-01 -3.83E-01 -2.16E-02 -6.19E-02 -7.99E-02  1.74E-02
 
 OM12
+       ......... ......... ......... ......... ......... ......... .........
 
 OM13
+       ......... ......... ......... ......... ......... ......... ......... .........
 
 OM14
+       ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 OM22
+        4.37E-01  5.33E-01 -9.34E-02 -5.83E-02 -1.03E-01 -6.03E-01 ......... ......... .........  4.82E-02
 
 OM23
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 OM24
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 OM33
+        9.07E-02  1.66E-01 -9.39E-02 -4.67E-03  3.98E-03 -4.02E-02 ......... ......... .........  1.20E-01 ......... .........
          9.22E-03
 
 OM34
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
         ......... .........
 
 OM44
+       -2.06E-02 -6.74E-02  7.92E-02  7.47E-02  1.18E-01  1.52E-02 ......... ......... ......... -1.16E-01 ......... .........
          2.47E-02 .........  1.27E-02
 
 SG11
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
         ......... ......... ......... .........
 
1
 ************************************************************************************************************************
 ********************                                                                                ********************
 ********************               FIRST ORDER CONDITIONAL ESTIMATION WITH INTERACTION              ********************
 ********************                      INVERSE COVARIANCE MATRIX OF ESTIMATE                     ********************
 ********************                                                                                ********************
 ************************************************************************************************************************
 

            TH 1      TH 2      TH 3      TH 4      TH 5      OM11      OM12      OM13      OM14      OM22      OM23      OM24  
             OM33      OM34      OM44      SG11  
 
 TH 1
+        1.32E+03
 
 TH 2
+       -6.49E+02  4.51E+02
 
 TH 3
+       -1.45E+02  1.94E+02  1.42E+03
 
 TH 4
+       -7.45E+01  1.16E+02 -1.09E+01  1.09E+03
 
 TH 5
+        3.97E+02 -5.53E+01 -8.40E+01 -1.49E+03  8.94E+04
 
 OM11
+        8.37E+02 -2.73E+02  2.41E+02  2.33E+02  3.81E+03  6.15E+03
 
 OM12
+       ......... ......... ......... ......... ......... ......... .........
 
 OM13
+       ......... ......... ......... ......... ......... ......... ......... .........
 
 OM14
+       ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 OM22
+        2.38E+02 -2.37E+02 -3.96E+01 -2.23E+01  1.24E+03  1.27E+03 ......... ......... .........  8.84E+02
 
 OM23
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 OM24
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 OM33
+        3.94E+02 -3.37E+02  1.55E+02 -1.38E+02 -7.26E+02 -2.23E+02 ......... ......... ......... -1.47E+02 ......... .........
          1.23E+04
 
 OM34
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
         ......... .........
 
 OM44
+       -1.48E+02  5.73E+01 -1.71E+02 -1.05E+02 -2.11E+03  1.48E+02 ......... ......... .........  2.20E+02 ......... .........
         -4.21E+02 .........  6.45E+03
 
 SG11
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
         ......... ......... ......... .........
 
 Elapsed finaloutput time in seconds:     0.19
 #CPUT: Total CPU Time in Seconds,      417.125
