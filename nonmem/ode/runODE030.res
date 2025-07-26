Run Start Date:  29/08/2019 
Run Start Time: 15:59:04.45 
Run Stop Date:   29/08/2019 
Run Stop Time:  16:25:16.45 
  
************************************************************************************************************************ 
********************                            CONTROL STREAM                                      ******************** 
************************************************************************************************************************ 
  
$PROB    ORAL1_1CPT_KAVVMKM MULTIPLE DOSE FOCEI runODE030
$INPUT   ID TIME DV LNDV MDV AMT EVID DOSE VI VMI KMI KAI SD CMT
$DATA    ORAL_1CPTMM.csv IGNORE=@ IGNORE (SD.EQ.1)
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
        ONEHEADER NOPRINT FILE=runODE030.csv   
   
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
 ORAL1_1CPT_KAVVMKM MULTIPLE DOSE FOCEI runODE030
0DATA CHECKOUT RUN:              NO
 DATA SET LOCATED ON UNIT NO.:    2
 THIS UNIT TO BE REWOUND:        NO
 NO. OF DATA RECS IN DATA SET:     5520
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

 TOT. NO. OF OBS RECS:     4680
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
 RAW OUTPUT FILE (FILE): runODE030.ext
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

 
0ITERATION NO.:    0    OBJECTIVE VALUE:   54296.1247629554        NO. OF FUNC. EVALS.:   7
 CUMULATIVE NO. OF FUNC. EVALS.:        7
 NPARAMETR:  7.0000E+00  5.7000E+00  4.5000E+00  2.0000E-01  3.0000E-01  1.5000E-01  1.5000E-01  1.5000E-01  1.5000E-01
 PARAMETER:  1.0000E-01  1.0000E-01  1.0000E-01  1.0000E-01  1.0000E-01  1.0000E-01  1.0000E-01  1.0000E-01  1.0000E-01
 GRADIENT:   7.4122E+04  1.5089E+04  2.8031E+04  2.1851E+02  2.9814E+03  6.7043E+01 -1.2411E+01  3.4690E+00  1.2292E+01
 
0ITERATION NO.:    5    OBJECTIVE VALUE:   53332.6388258536        NO. OF FUNC. EVALS.: 100
 CUMULATIVE NO. OF FUNC. EVALS.:      107
 NPARAMETR:  6.7602E+00  5.3571E+00  4.3315E+00  1.1115E-01  1.9102E-01  9.4483E-02  1.3164E-01  4.5756E-02  1.4983E-01
 PARAMETER:  9.6574E-02  9.3985E-02  9.6257E-02  5.5575E-02 -4.9607E-01 -1.3111E-01  3.4707E-02 -4.9365E-01  9.9421E-02
 GRADIENT:   8.1017E+05 -1.0902E+05  6.9955E+03  1.8829E+02 -8.2975E+02  9.4712E+00 -1.6444E+01 -2.2110E+02 -3.9754E+00
 
0ITERATION NO.:   10    OBJECTIVE VALUE:   53184.6622897923        NO. OF FUNC. EVALS.: 122
 CUMULATIVE NO. OF FUNC. EVALS.:      229
 NPARAMETR:  6.9590E+00  5.7568E+00  4.1761E+00 -1.5888E-01  1.9972E-01  8.5104E-02  1.7146E-01  8.2790E-02  1.5266E-01
 PARAMETER:  9.9414E-02  1.0100E-01  9.2803E-02 -7.9442E-02 -4.4074E-01 -1.8338E-01  1.6687E-01 -1.9716E-01  1.0878E-01
 GRADIENT:   5.9362E+05 -9.3126E+04 -1.7521E+04 -2.5899E+01 -5.6322E+01  3.3261E+01 -2.3194E+01  1.8572E+00  4.4385E+00
 
0ITERATION NO.:   15    OBJECTIVE VALUE:   53184.5165285830        NO. OF FUNC. EVALS.:  97
 CUMULATIVE NO. OF FUNC. EVALS.:      326
 NPARAMETR:  6.9513E+00  5.8099E+00  4.1726E+00 -1.5879E-01  1.9987E-01  8.5098E-02  1.8045E-01  8.2650E-02  1.5227E-01
 PARAMETER:  9.9305E-02  1.0193E-01  9.2724E-02 -7.9395E-02 -4.3983E-01 -1.8341E-01  1.9242E-01 -1.9801E-01  1.0750E-01
 GRADIENT:   5.8193E+05 -9.3335E+04 -1.8187E+04 -2.5205E+01 -4.0735E+01  3.1935E+01 -2.7105E+01  1.6217E+00  4.7530E+00
 
0ITERATION NO.:   20    OBJECTIVE VALUE:   53171.4238786025        NO. OF FUNC. EVALS.: 113
 CUMULATIVE NO. OF FUNC. EVALS.:      439
 NPARAMETR:  6.9893E+00  5.8562E+00  4.1760E+00 -8.3600E-02  2.0074E-01  3.9767E-02  5.7903E-01  8.2141E-02  1.5161E-01
 PARAMETER:  9.9846E-02  1.0274E-01  9.2800E-02 -4.1800E-02 -4.3440E-01 -5.6380E-01  7.7536E-01 -2.0110E-01  1.0535E-01
 GRADIENT:   6.6793E+05 -1.0150E+05 -2.1598E+04  4.3099E+01  3.9456E+01  5.7163E-02  2.0015E+01 -5.0897E+00  7.4971E+00
 
0ITERATION NO.:   25    OBJECTIVE VALUE:   53163.5035672266        NO. OF FUNC. EVALS.: 118
 CUMULATIVE NO. OF FUNC. EVALS.:      557
 NPARAMETR:  7.0599E+00  6.0174E+00  4.1835E+00 -1.0897E-01  2.0010E-01  3.8250E-02  5.3013E-01  8.4665E-02  1.3076E-01
 PARAMETER:  1.0086E-01  1.0557E-01  9.2966E-02 -5.4483E-02 -4.3836E-01 -5.8325E-01  7.3124E-01 -1.8596E-01  3.1365E-02
 GRADIENT:   6.2968E+05 -1.0477E+05 -1.9368E+04  2.9596E+01  1.7209E+00  4.7931E+00  2.3426E+00 -1.2940E-01  1.5167E+00
 
0ITERATION NO.:   30    OBJECTIVE VALUE:   53162.4435868642        NO. OF FUNC. EVALS.: 111
 CUMULATIVE NO. OF FUNC. EVALS.:      668
 NPARAMETR:  7.0662E+00  6.0889E+00  4.1845E+00 -1.2293E-01  2.0007E-01  3.4371E-02  5.3708E-01  8.4846E-02  1.2797E-01
 PARAMETER:  1.0095E-01  1.0682E-01  9.2990E-02 -6.1465E-02 -4.3855E-01 -6.3671E-01  7.3775E-01 -1.8490E-01  2.0581E-02
 GRADIENT:   6.2210E+05 -1.0646E+05 -1.9354E+04  1.1359E+01  7.2666E-01  9.4958E-01 -1.6365E+00 -1.2884E-01  5.9693E-01
 
0ITERATION NO.:   35    OBJECTIVE VALUE:   53162.3354939443        NO. OF FUNC. EVALS.: 112
 CUMULATIVE NO. OF FUNC. EVALS.:      780
 NPARAMETR:  7.0720E+00  6.1136E+00  4.1851E+00 -1.2121E-01  2.0005E-01  3.3232E-02  5.5097E-01  8.4939E-02  1.2760E-01
 PARAMETER:  1.0103E-01  1.0726E-01  9.3002E-02 -6.0604E-02 -4.3866E-01 -6.5356E-01  7.5053E-01 -1.8435E-01  1.9137E-02
 GRADIENT:   6.2003E+05 -1.0710E+05 -1.9342E+04  1.4277E+01  2.8037E-01  3.6463E-01 -1.4758E+00 -2.6000E-02  6.1577E-01
 
0ITERATION NO.:   40    OBJECTIVE VALUE:   53162.2733404818        NO. OF FUNC. EVALS.: 123
 CUMULATIVE NO. OF FUNC. EVALS.:      903             RESET HESSIAN, TYPE I
 NPARAMETR:  7.0759E+00  6.1274E+00  4.1862E+00 -1.3758E-01  2.0004E-01  3.2504E-02  5.6403E-01  8.5059E-02  1.2679E-01
 PARAMETER:  1.0108E-01  1.0750E-01  9.3026E-02 -6.8791E-02 -4.3873E-01 -6.6463E-01  7.6224E-01 -1.8365E-01  1.5968E-02
 GRADIENT:   1.4978E+05  3.6442E+04  2.0770E+04 -6.5427E+00  2.7473E+00 -9.2101E-03 -1.0098E-01  2.6728E-01 -1.2928E-01
 
0ITERATION NO.:   45    OBJECTIVE VALUE:   53162.2623188066        NO. OF FUNC. EVALS.: 107
 CUMULATIVE NO. OF FUNC. EVALS.:     1010
 NPARAMETR:  7.0770E+00  6.1317E+00  4.1863E+00 -1.3478E-01  2.0004E-01  3.2387E-02  5.6635E-01  8.4956E-02  1.2667E-01
 PARAMETER:  1.0110E-01  1.0757E-01  9.3029E-02 -6.7390E-02 -4.3876E-01 -6.6643E-01  7.6429E-01 -1.8425E-01  1.5490E-02
 GRADIENT:   6.1847E+05 -1.0767E+05 -1.9152E+04 -3.5845E+00 -2.0667E-01 -1.6445E-03 -1.4313E-01 -1.0415E-03 -4.2717E-02
 
0ITERATION NO.:   50    OBJECTIVE VALUE:   53162.2596964589        NO. OF FUNC. EVALS.: 123
 CUMULATIVE NO. OF FUNC. EVALS.:     1133             RESET HESSIAN, TYPE I
 NPARAMETR:  7.0784E+00  6.1331E+00  4.1860E+00 -1.3096E-01  2.0004E-01  3.2352E-02  5.6762E-01  8.4775E-02  1.2703E-01
 PARAMETER:  1.0112E-01  1.0760E-01  9.3023E-02 -6.5479E-02 -4.3875E-01 -6.6698E-01  7.6540E-01 -1.8532E-01  1.6875E-02
 GRADIENT:   1.4993E+05  3.6468E+04  2.0681E+04  2.7120E+00  2.7110E+00  8.8177E-02 -1.5215E-01 -4.5576E-01  1.8930E-01
 
0ITERATION NO.:   52    OBJECTIVE VALUE:   53162.2596964589        NO. OF FUNC. EVALS.:  38
 CUMULATIVE NO. OF FUNC. EVALS.:     1171
 NPARAMETR:  7.0784E+00  6.1331E+00  4.1860E+00 -1.3096E-01  2.0004E-01  3.2352E-02  5.6762E-01  8.4775E-02  1.2703E-01
 PARAMETER:  1.0112E-01  1.0760E-01  9.3023E-02 -6.5479E-02 -4.3875E-01 -6.6698E-01  7.6540E-01 -1.8532E-01  1.6875E-02
 GRADIENT:   5.6769E+01 -1.7819E+01 -1.7496E+01  2.1671E+00  1.5990E-02  8.0076E-02 -1.0898E-01 -7.0568E-01 -1.6845E-01
 
 #TERM:
0MINIMIZATION SUCCESSFUL
 HOWEVER, PROBLEMS OCCURRED WITH THE MINIMIZATION.
 REGARD THE RESULTS OF THE ESTIMATION STEP CAREFULLY, AND ACCEPT THEM ONLY
 AFTER CHECKING THAT THE COVARIANCE STEP PRODUCES REASONABLE OUTPUT.
 NO. OF FUNCTION EVALUATIONS USED:     1171
 NO. OF SIG. DIGITS IN FINAL EST.:  2.3

 ETABAR IS THE ARITHMETIC MEAN OF THE ETA-ESTIMATES,
 AND THE P-VALUE IS GIVEN FOR THE NULL HYPOTHESIS THAT THE TRUE MEAN IS 0.
 
 ETABAR:         3.6843E-03 -2.2485E-02 -9.7154E-03 -6.3472E-03
 SE:             9.8066E-03  5.2552E-02  2.5389E-02  1.9889E-02
 N:                     120         120         120         120
 
 P VAL.:         7.0714E-01  6.6875E-01  7.0197E-01  7.4963E-01
 
 ETASHRINKSD(%)  4.0024E+01  2.3269E+01  4.0759E+00  3.8613E+01
 ETASHRINKVR(%)  6.4029E+01  4.1123E+01  7.9856E+00  6.2316E+01
 EBVSHRINKSD(%)  4.0179E+01  2.3667E+01  4.6051E+00  3.8911E+01
 EBVSHRINKVR(%)  6.4214E+01  4.1732E+01  8.9981E+00  6.2682E+01
 EPSSHRINKSD(%)  2.6748E+00
 EPSSHRINKVR(%)  5.2781E+00
 
  
 TOTAL DATA POINTS NORMALLY DISTRIBUTED (N):         4680
 N*LOG(2PI) CONSTANT TO OBJECTIVE FUNCTION:    8601.26467079574     
 OBJECTIVE FUNCTION VALUE WITHOUT CONSTANT:    53162.2596964589     
 OBJECTIVE FUNCTION VALUE WITH CONSTANT:       61763.5243672546     
 REPORTED OBJECTIVE FUNCTION DOES NOT CONTAIN CONSTANT
  
 TOTAL EFFECTIVE ETAS (NIND*NETA):                           480
  
 #TERE:
 Elapsed estimation  time in seconds:  1426.58
 Elapsed covariance  time in seconds:   132.88
 Elapsed postprocess time in seconds:     1.99
1
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 ************************************************************************************************************************
 ********************                                                                                ********************
 ********************               FIRST ORDER CONDITIONAL ESTIMATION WITH INTERACTION              ********************
 #OBJT:**************                       MINIMUM VALUE OF OBJECTIVE FUNCTION                      ********************
 ********************                                                                                ********************
 ************************************************************************************************************************
 





 #OBJV:********************************************    53162.260       **************************************************
1
 ************************************************************************************************************************
 ********************                                                                                ********************
 ********************               FIRST ORDER CONDITIONAL ESTIMATION WITH INTERACTION              ********************
 ********************                             FINAL PARAMETER ESTIMATE                           ********************
 ********************                                                                                ********************
 ************************************************************************************************************************
 


 THETA - VECTOR OF FIXED EFFECTS PARAMETERS   *********


         TH 1      TH 2      TH 3      TH 4      TH 5     
 
         7.08E+00  6.13E+00  4.19E+00 -1.31E-01  2.00E-01
 


 OMEGA - COV MATRIX FOR RANDOM EFFECTS - ETAS  ********


         ETA1      ETA2      ETA3      ETA4     
 
 ETA1
+        3.24E-02
 
 ETA2
+        0.00E+00  5.68E-01
 
 ETA3
+        0.00E+00  0.00E+00  8.48E-02
 
 ETA4
+        0.00E+00  0.00E+00  0.00E+00  1.27E-01
 


 SIGMA - COV MATRIX FOR RANDOM EFFECTS - EPSILONS  ****


         EPS1     
 
 EPS1
+        1.00E+00
 
1


 OMEGA - CORR MATRIX FOR RANDOM EFFECTS - ETAS  *******


         ETA1      ETA2      ETA3      ETA4     
 
 ETA1
+        1.80E-01
 
 ETA2
+        0.00E+00  7.53E-01
 
 ETA3
+        0.00E+00  0.00E+00  2.91E-01
 
 ETA4
+        0.00E+00  0.00E+00  0.00E+00  3.56E-01
 


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
 
         4.72E-02  1.66E-01  2.75E-02  5.66E-02  2.36E-03
 


 OMEGA - COV MATRIX FOR RANDOM EFFECTS - ETAS  ********


         ETA1      ETA2      ETA3      ETA4     
 
 ETA1
+        1.02E-02
 
 ETA2
+       .........  1.37E-01
 
 ETA3
+       ......... .........  1.03E-02
 
 ETA4
+       ......... ......... .........  4.69E-02
 


 SIGMA - COV MATRIX FOR RANDOM EFFECTS - EPSILONS  ****


         EPS1     
 
 EPS1
+       .........
 
1


 OMEGA - CORR MATRIX FOR RANDOM EFFECTS - ETAS  *******


         ETA1      ETA2      ETA3      ETA4     
 
 ETA1
+        2.83E-02
 
 ETA2
+       .........  9.11E-02
 
 ETA3
+       ......... .........  1.77E-02
 
 ETA4
+       ......... ......... .........  6.58E-02
 


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
+        2.23E-03
 
 TH 2
+        6.23E-03  2.74E-02
 
 TH 3
+        8.75E-05  1.47E-04  7.58E-04
 
 TH 4
+       -8.70E-04 -2.68E-03  1.08E-04  3.20E-03
 
 TH 5
+        2.96E-06  1.65E-05 -7.75E-06 -4.72E-06  5.59E-06
 
 OM11
+       -1.55E-04 -6.77E-04 -1.60E-05  1.36E-04  8.74E-07  1.04E-04
 
 OM12
+       ......... ......... ......... ......... ......... ......... .........
 
 OM13
+       ......... ......... ......... ......... ......... ......... ......... .........
 
 OM14
+       ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 OM22
+        3.56E-03  1.77E-02  5.26E-04 -1.31E-03 -2.29E-06 -5.68E-04 ......... ......... .........  1.88E-02
 
 OM23
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 OM24
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 OM33
+       -1.00E-05 -3.66E-05 -5.63E-05 -3.91E-05 -1.64E-06 -7.79E-06 ......... ......... .........  8.24E-06 ......... .........
          1.06E-04
 
 OM34
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
         ......... .........
 
 OM44
+       -2.50E-04 -4.16E-04 -2.12E-04 -7.63E-04 -9.27E-06 -2.04E-05 ......... ......... ......... -6.87E-04 ......... .........
          5.21E-05 .........  2.20E-03
 
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
+        4.72E-02
 
 TH 2
+        7.97E-01  1.66E-01
 
 TH 3
+        6.73E-02  3.22E-02  2.75E-02
 
 TH 4
+       -3.26E-01 -2.86E-01  6.91E-02  5.66E-02
 
 TH 5
+        2.65E-02  4.21E-02 -1.19E-01 -3.53E-02  2.36E-03
 
 OM11
+       -3.22E-01 -4.02E-01 -5.69E-02  2.37E-01  3.63E-02  1.02E-02
 
 OM12
+       ......... ......... ......... ......... ......... ......... .........
 
 OM13
+       ......... ......... ......... ......... ......... ......... ......... .........
 
 OM14
+       ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 OM22
+        5.49E-01  7.77E-01  1.39E-01 -1.69E-01 -7.06E-03 -4.06E-01 ......... ......... .........  1.37E-01
 
 OM23
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 OM24
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 OM33
+       -2.06E-02 -2.15E-02 -1.98E-01 -6.70E-02 -6.71E-02 -7.43E-02 ......... ......... .........  5.83E-03 ......... .........
          1.03E-02
 
 OM34
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
         ......... .........
 
 OM44
+       -1.13E-01 -5.36E-02 -1.64E-01 -2.88E-01 -8.36E-02 -4.28E-02 ......... ......... ......... -1.07E-01 ......... .........
          1.08E-01 .........  4.69E-02
 
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
+        1.37E+03
 
 TH 2
+       -3.51E+02  1.92E+02
 
 TH 3
+       -1.30E+02  7.86E+01  1.49E+03
 
 TH 4
+        1.58E+02  3.80E+00 -2.46E+01  4.07E+02
 
 TH 5
+        5.44E+02 -3.56E+02  2.23E+03  5.30E+02  1.86E+05
 
 OM11
+        4.96E+01  1.22E+02  1.88E+02 -2.90E+02 -1.78E+03  1.23E+04
 
 OM12
+       ......... ......... ......... ......... ......... ......... .........
 
 OM13
+       ......... ......... ......... ......... ......... ......... ......... .........
 
 OM14
+       ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 OM22
+        9.25E+01 -1.13E+02 -8.33E+01 -7.51E+00  2.15E+02  2.23E+02 ......... ......... .........  1.51E+02
 
 OM23
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 OM24
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 OM33
+       -7.89E+01  1.04E+02  8.03E+02  6.52E+01  3.47E+03  8.45E+02 ......... ......... ......... -8.42E+01 ......... .........
          1.01E+04
 
 OM34
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
         ......... .........
 
 OM44
+        1.65E+02 -3.28E+01  1.02E+02  1.53E+02  1.15E+03  1.02E+02 ......... ......... .........  3.07E+01 ......... .........
         -1.32E+02 .........  5.49E+02
 
 SG11
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
         ......... ......... ......... .........
 
 Elapsed finaloutput time in seconds:     0.40
 #CPUT: Total CPU Time in Seconds,     1563.266
