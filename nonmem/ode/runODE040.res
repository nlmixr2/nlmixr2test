Run Start Date:  29/08/2019 
Run Start Time: 16:54:33.88 
Run Stop Date:   29/08/2019 
Run Stop Time:  17:05:21.34 
  
************************************************************************************************************************ 
********************                            CONTROL STREAM                                      ******************** 
************************************************************************************************************************ 
  
$PROB    BOLUS_2CPT_V1QV2VMKM SINGLE DOSE FOCEI (120 Ind/2280 Obs) runODE040
$INPUT   ID TIME DV LNDV MDV AMT EVID DOSE VI VMI KMI QI V2I SD CMT
$DATA    BOLUS_2CPTMM.csv IGNORE=@ IGNORE(SD.EQ.0)
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
         V1=V
         S1=V
$DES
         C1=A(1)/V1
         DADT(1)= K21*A(2)-K12*A(1)-VM*C1/(KM+C1)
         DADT(2)=-K21*A(2)+K12*A(1)  
$ERROR   
         IPRED = F     
         RESCV = THETA(6) 
         W     = IPRED*RESCV
         IRES  = DV-IPRED
         IWRES = IRES/W
         Y     = IPRED+W*EPS(1)

$THETA   7.1       ;log VM
$THETA   5.7       ;log KM 
$THETA   4.3       ;log Vc
$THETA   1.5       ;log Q
$THETA   4         ;log Vp
$THETA   (0,0.3,1) ;RSV
$OMEGA   0.15 0.1 0.15 0.15 0.15
$SIGMA   1 FIX
$EST     NSIG=2 SIGL=6 PRINT=5 MAX=9999 NOABORT POSTHOC METHOD=COND INTER NOOBT
$COV
$TABLE  ID TIME LNDV MDV AMT EVID DOSE VI VMI KMI V VM KM Q V2 ETA1 ETA2 ETA3 ETA4 ETA5
        IPRED IRES IWRES CWRESI
        ONEHEADER NOPRINT FILE=runODE040.csv   
   
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
 BOLUS_2CPT_V1QV2VMKM SINGLE DOSE FOCEI (120 Ind/2280 Obs) runODE040
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
 ID TIME DV LNDV MDV AMT EVID DOSE VI VMI KMI QI V2I SD CMT
0(NONBLANK) LABELS FOR PRED-DEFINED ITEMS:
 VM KM V Q V2 IPRED IRES IWRES
0FORMAT FOR DATA:
 (E4.0,3E7.0,E2.0,E6.0,E2.0,2E6.0,E7.0,E6.0,E5.0,E6.0,2E2.0)

 TOT. NO. OF OBS RECS:     2280
 TOT. NO. OF INDIVIDUALS:      120
0LENGTH OF THETA:   6
0DEFAULT THETA BOUNDARY TEST OMITTED:    NO
0OMEGA HAS SIMPLE DIAGONAL FORM WITH DIMENSION:   5
0DEFAULT OMEGA BOUNDARY TEST OMITTED:   YES
0SIGMA HAS SIMPLE DIAGONAL FORM WITH DIMENSION:   1
0DEFAULT SIGMA BOUNDARY TEST OMITTED:    NO
0INITIAL ESTIMATE OF THETA:
 LOWER BOUND    INITIAL EST    UPPER BOUND
 -0.1000E+07     0.7100E+01     0.1000E+07
 -0.1000E+07     0.5700E+01     0.1000E+07
 -0.1000E+07     0.4300E+01     0.1000E+07
 -0.1000E+07     0.1500E+01     0.1000E+07
 -0.1000E+07     0.4000E+01     0.1000E+07
  0.0000E+00     0.3000E+00     0.1000E+01
0INITIAL ESTIMATE OF OMEGA:
 0.1500E+00
 0.0000E+00   0.1000E+00
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
 RAW OUTPUT FILE (FILE): runODE040.ext
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

 
0ITERATION NO.:    0    OBJECTIVE VALUE:   20362.2220357005        NO. OF FUNC. EVALS.:   8
 CUMULATIVE NO. OF FUNC. EVALS.:        8
 NPARAMETR:  7.1000E+00  5.7000E+00  4.3000E+00  1.5000E+00  4.0000E+00  3.0000E-01  1.5000E-01  1.0000E-01  1.5000E-01  1.5000E-01
             1.5000E-01
 PARAMETER:  1.0000E-01  1.0000E-01  1.0000E-01  1.0000E-01  1.0000E-01  1.0000E-01  1.0000E-01  1.0000E-01  1.0000E-01  1.0000E-01
             1.0000E-01
 GRADIENT:   1.1261E+04  4.0684E+03  3.1188E+03  7.8194E+02  4.0708E+03  1.4373E+03  5.6048E+01  2.0198E+01  1.0084E+02  1.8803E+01
             3.5978E+01
 
0ITERATION NO.:    5    OBJECTIVE VALUE:   19805.0147712860        NO. OF FUNC. EVALS.: 100
 CUMULATIVE NO. OF FUNC. EVALS.:      108             RESET HESSIAN, TYPE I
 NPARAMETR:  6.7126E+00  5.0966E+00  4.2777E+00  1.4498E+00  3.9610E+00  1.9215E-01  1.3169E-01  8.5771E-02  1.2620E-01  1.3585E-01
             1.1872E-01
 PARAMETER:  9.4543E-02  8.9415E-02  9.9480E-02  9.6650E-02  9.9026E-02 -4.8880E-01  3.4910E-02  2.3255E-02  1.3612E-02  5.0468E-02
            -1.6930E-02
 GRADIENT:   2.5046E+04  4.0010E+03  7.6809E+03  7.1986E+02  1.3799E+02 -1.7798E+01  4.7121E+01  1.6651E+01  7.6037E+01  2.8567E+00
             1.7674E+01
 
0ITERATION NO.:   10    OBJECTIVE VALUE:   19788.7699272950        NO. OF FUNC. EVALS.: 100
 CUMULATIVE NO. OF FUNC. EVALS.:      208             RESET HESSIAN, TYPE I
 NPARAMETR:  6.6009E+00  4.9771E+00  4.2515E+00  1.4025E+00  4.0089E+00  1.9281E-01  1.0224E-01  4.5182E-02  9.2969E-02  1.2699E-01
             9.9979E-02
 PARAMETER:  9.2971E-02  8.7318E-02  9.8873E-02  9.3497E-02  1.0022E-01 -4.8458E-01 -9.1679E-02 -2.9724E-01 -1.3919E-01  1.6726E-02
            -1.0284E-01
 GRADIENT:   2.0225E+04  5.0828E+03  5.0688E+03  1.2651E+02  8.3395E+02  2.5252E-02  7.6440E-01  4.3850E+00  2.4340E+01  4.8159E+00
             1.8438E+00
 
0ITERATION NO.:   15    OBJECTIVE VALUE:   19787.3171243941        NO. OF FUNC. EVALS.: 100
 CUMULATIVE NO. OF FUNC. EVALS.:      308
 NPARAMETR:  6.6037E+00  4.9622E+00  4.2616E+00  1.3939E+00  4.0090E+00  1.9152E-01  1.0413E-01  2.3036E-02  8.1039E-02  1.1165E-01
             9.7471E-02
 PARAMETER:  9.3010E-02  8.7056E-02  9.9106E-02  9.2925E-02  1.0023E-01 -4.9286E-01 -8.2480E-02 -6.3405E-01 -2.0785E-01 -4.7647E-02
            -1.1554E-01
 GRADIENT:   4.4375E+04 -7.4630E+03  2.7089E+03  2.8908E+01  5.1086E+02 -5.0382E+01 -5.1384E+00  1.2406E+00 -3.6777E+00 -7.5280E-01
            -1.3809E+00
 
0ITERATION NO.:   20    OBJECTIVE VALUE:   19786.0364723524        NO. OF FUNC. EVALS.: 133
 CUMULATIVE NO. OF FUNC. EVALS.:      441             RESET HESSIAN, TYPE I
 NPARAMETR:  6.6155E+00  4.9964E+00  4.2615E+00  1.3888E+00  3.9975E+00  1.9209E-01  1.0963E-01  7.8005E-03  8.2304E-02  1.1577E-01
             9.8028E-02
 PARAMETER:  9.3176E-02  8.7656E-02  9.9104E-02  9.2585E-02  9.9937E-02 -4.8922E-01 -5.6766E-02 -1.1755E+00 -2.0011E-01 -2.9501E-02
            -1.1269E-01
 GRADIENT:   2.1071E+04  5.0664E+03  6.1428E+03  3.5269E+01  9.2500E+02 -3.0087E+01 -3.2872E+00  3.2739E-01 -3.4562E-01  7.5027E-01
            -1.2564E+00
 
0ITERATION NO.:   25    OBJECTIVE VALUE:   19785.4011575383        NO. OF FUNC. EVALS.: 131
 CUMULATIVE NO. OF FUNC. EVALS.:      572
 NPARAMETR:  6.6283E+00  5.0165E+00  4.2608E+00  1.3874E+00  3.9894E+00  1.9284E-01  1.1244E-01  3.4818E-04  8.2379E-02  1.1206E-01
             9.8967E-02
 PARAMETER:  9.3356E-02  8.8009E-02  9.9089E-02  9.2490E-02  9.9734E-02 -4.8437E-01 -4.4095E-02 -2.7301E+00 -1.9965E-01 -4.5797E-02
            -1.0793E-01
 GRADIENT:   4.2711E+04 -7.1246E+03  2.4992E+03  2.2082E+00  2.9023E+02 -9.9730E+00 -1.9763E+00  1.2318E-02 -9.4232E-02 -4.2054E-01
            -4.9292E-01
 
0ITERATION NO.:   30    OBJECTIVE VALUE:   19784.8468479618        NO. OF FUNC. EVALS.: 133
 CUMULATIVE NO. OF FUNC. EVALS.:      705             RESET HESSIAN, TYPE I
 NPARAMETR:  6.6624E+00  5.0558E+00  4.2591E+00  1.3854E+00  3.9761E+00  1.9309E-01  1.1239E-01  5.1031E-06  8.2333E-02  1.1257E-01
             9.9190E-02
 PARAMETER:  9.3836E-02  8.8699E-02  9.9048E-02  9.2362E-02  9.9402E-02 -4.8273E-01 -4.4347E-02 -4.8415E+00 -1.9993E-01 -4.3535E-02
            -1.0680E-01
 GRADIENT:   2.2390E+04  4.7366E+03  5.7831E+03  1.5823E+01  7.9802E+02 -1.7502E+00 -8.0254E-01  1.7935E-04 -1.6936E-01 -4.2015E-01
            -3.9440E-01
 
0ITERATION NO.:   35    OBJECTIVE VALUE:   19784.7029532970        NO. OF FUNC. EVALS.: 120
 CUMULATIVE NO. OF FUNC. EVALS.:      825
 NPARAMETR:  6.6619E+00  5.0752E+00  4.2611E+00  1.3827E+00  3.9727E+00  1.9318E-01  1.1374E-01  1.0115E-05  8.2392E-02  1.2529E-01
             1.0063E-01
 PARAMETER:  9.3829E-02  8.9039E-02  9.9096E-02  9.2183E-02  9.9318E-02 -4.8219E-01 -3.8366E-02 -4.4994E+00 -1.9957E-01  1.0007E-02
            -9.9588E-02
 GRADIENT:   4.2197E+04 -7.0986E+03  2.5184E+03 -3.5742E+01  1.4069E+02  3.9390E+00  9.2237E-01  4.3915E-04  4.7731E-02  3.6984E+00
             3.6251E-01
 
0ITERATION NO.:   40    OBJECTIVE VALUE:   19784.4075522781        NO. OF FUNC. EVALS.: 136
 CUMULATIVE NO. OF FUNC. EVALS.:      961             RESET HESSIAN, TYPE I
 NPARAMETR:  6.6765E+00  5.0923E+00  4.2596E+00  1.3829E+00  3.9661E+00  1.9318E-01  1.1320E-01  2.5877E-07  8.2387E-02  1.1640E-01
             9.9898E-02
 PARAMETER:  9.4035E-02  8.9339E-02  9.9061E-02  9.2196E-02  9.9154E-02 -4.8215E-01 -4.0757E-02 -6.3324E+00 -1.9960E-01 -2.6799E-02
            -1.0324E-01
 GRADIENT:   2.1254E+04  5.4386E+03  5.8470E+03  2.1089E+01  6.6019E+02  2.4947E+00  5.0322E-01  1.0344E-05  6.9868E-03  5.1422E-01
            -1.6235E-01
 
0ITERATION NO.:   45    OBJECTIVE VALUE:   19784.3345624802        NO. OF FUNC. EVALS.: 114
 CUMULATIVE NO. OF FUNC. EVALS.:     1075
 NPARAMETR:  6.6793E+00  5.1038E+00  4.2610E+00  1.3827E+00  3.9655E+00  1.9314E-01  1.1331E-01  3.2221E-07  8.2378E-02  1.1480E-01
             1.0040E-01
 PARAMETER:  9.4074E-02  8.9540E-02  9.9094E-02  9.2183E-02  9.9138E-02 -4.8241E-01 -4.0256E-02 -6.2227E+00 -1.9966E-01 -3.3705E-02
            -1.0075E-01
 GRADIENT:   4.2095E+04 -7.0176E+03  2.5290E+03  9.7114E+00  1.9943E+02 -6.5873E-01  2.5352E-01  1.2495E-05 -1.1639E-02 -2.3794E-01
             6.7511E-02
 
0ITERATION NO.:   50    OBJECTIVE VALUE:   19784.2493018444        NO. OF FUNC. EVALS.: 124
 CUMULATIVE NO. OF FUNC. EVALS.:     1199
 NPARAMETR:  6.6869E+00  5.1210E+00  4.2603E+00  1.3845E+00  3.9610E+00  1.9317E-01  1.1261E-01  2.3890E-07  8.2378E-02  1.1206E-01
             1.0027E-01
 PARAMETER:  9.4182E-02  8.9842E-02  9.9078E-02  9.2297E-02  9.9025E-02 -4.8226E-01 -4.3368E-02 -6.3723E+00 -1.9966E-01 -4.5815E-02
            -1.0138E-01
 GRADIENT:   4.1584E+04 -6.7840E+03  2.4756E+03  4.7961E+01  1.9360E+02 -8.0856E-01 -1.1354E+00  7.8363E-06 -2.4372E-02 -1.4180E+00
            -4.6896E-02
 
0ITERATION NO.:   55    OBJECTIVE VALUE:   19784.1273607247        NO. OF FUNC. EVALS.: 131
 CUMULATIVE NO. OF FUNC. EVALS.:     1330
 NPARAMETR:  6.6967E+00  5.1263E+00  4.2603E+00  1.3820E+00  3.9581E+00  1.9315E-01  1.1296E-01  1.1185E-07  8.2377E-02  1.1250E-01
             1.0058E-01
 PARAMETER:  9.4320E-02  8.9935E-02  9.9076E-02  9.2132E-02  9.8954E-02 -4.8237E-01 -4.1791E-02 -6.7518E+00 -1.9967E-01 -4.3844E-02
            -9.9823E-02
 GRADIENT:   4.2560E+04 -7.2517E+03  2.4499E+03  1.2505E+01  1.7623E+02 -1.7182E+00  1.9836E-01  4.0859E-06 -1.4220E-02 -1.1713E+00
             1.0651E-01
 
0ITERATION NO.:   60    OBJECTIVE VALUE:   19783.9842670217        NO. OF FUNC. EVALS.: 133
 CUMULATIVE NO. OF FUNC. EVALS.:     1463
 NPARAMETR:  6.7098E+00  5.1460E+00  4.2604E+00  1.3819E+00  3.9528E+00  1.9315E-01  1.1276E-01  8.7770E-08  8.2363E-02  1.1662E-01
             1.0081E-01
 PARAMETER:  9.4504E-02  9.0281E-02  9.9080E-02  9.2128E-02  9.8820E-02 -4.8239E-01 -4.2676E-02 -6.8730E+00 -1.9975E-01 -2.5841E-02
            -9.8696E-02
 GRADIENT:  -2.0168E+02 -1.8378E+02  6.4289E+01  1.3210E+01  7.5825E+01 -9.0340E-01  8.9861E-02 -1.1066E-04 -2.8690E-02 -6.4741E-02
             7.9817E-02
 
 #TERM:
0MINIMIZATION SUCCESSFUL
 HOWEVER, PROBLEMS OCCURRED WITH THE MINIMIZATION.
 REGARD THE RESULTS OF THE ESTIMATION STEP CAREFULLY, AND ACCEPT THEM ONLY
 AFTER CHECKING THAT THE COVARIANCE STEP PRODUCES REASONABLE OUTPUT.
 NO. OF FUNCTION EVALUATIONS USED:     1463
 NO. OF SIG. DIGITS IN FINAL EST.:  2.2

 ETABAR IS THE ARITHMETIC MEAN OF THE ETA-ESTIMATES,
 AND THE P-VALUE IS GIVEN FOR THE NULL HYPOTHESIS THAT THE TRUE MEAN IS 0.
 
 ETABAR:         1.2973E-02 -1.6227E-08 -7.4617E-03  1.8680E-02 -9.4444E-03
 SE:             2.8755E-02  1.4666E-08  2.5420E-02  1.8618E-02  2.1032E-02
 N:                     120         120         120         120         120
 
 P VAL.:         6.5187E-01  2.6854E-01  7.6911E-01  3.1569E-01  6.5340E-01
 
 ETASHRINKSD(%)  5.8015E+00  9.9946E+01  2.5641E+00  4.0028E+01  2.7133E+01
 ETASHRINKVR(%)  1.1266E+01  1.0000E+02  5.0625E+00  6.4033E+01  4.6904E+01
 EBVSHRINKSD(%)  5.2682E+00  9.9946E+01  3.1669E+00  4.0185E+01  2.7247E+01
 EBVSHRINKVR(%)  1.0259E+01  1.0000E+02  6.2335E+00  6.4222E+01  4.7071E+01
 EPSSHRINKSD(%)  6.9026E+00
 EPSSHRINKVR(%)  1.3329E+01
 
  
 TOTAL DATA POINTS NORMALLY DISTRIBUTED (N):         2280
 N*LOG(2PI) CONSTANT TO OBJECTIVE FUNCTION:    4190.35971141331     
 OBJECTIVE FUNCTION VALUE WITHOUT CONSTANT:    19783.9842670217     
 OBJECTIVE FUNCTION VALUE WITH CONSTANT:       23974.3439784350     
 REPORTED OBJECTIVE FUNCTION DOES NOT CONTAIN CONSTANT
  
 TOTAL EFFECTIVE ETAS (NIND*NETA):                           600
  
 #TERE:
 Elapsed estimation  time in seconds:   579.00
 Elapsed covariance  time in seconds:    58.75
 Elapsed postprocess time in seconds:     0.64
1
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 ************************************************************************************************************************
 ********************                                                                                ********************
 ********************               FIRST ORDER CONDITIONAL ESTIMATION WITH INTERACTION              ********************
 #OBJT:**************                       MINIMUM VALUE OF OBJECTIVE FUNCTION                      ********************
 ********************                                                                                ********************
 ************************************************************************************************************************
 





 #OBJV:********************************************    19783.984       **************************************************
1
 ************************************************************************************************************************
 ********************                                                                                ********************
 ********************               FIRST ORDER CONDITIONAL ESTIMATION WITH INTERACTION              ********************
 ********************                             FINAL PARAMETER ESTIMATE                           ********************
 ********************                                                                                ********************
 ************************************************************************************************************************
 


 THETA - VECTOR OF FIXED EFFECTS PARAMETERS   *********


         TH 1      TH 2      TH 3      TH 4      TH 5      TH 6     
 
         6.71E+00  5.15E+00  4.26E+00  1.38E+00  3.95E+00  1.93E-01
 


 OMEGA - COV MATRIX FOR RANDOM EFFECTS - ETAS  ********


         ETA1      ETA2      ETA3      ETA4      ETA5     
 
 ETA1
+        1.13E-01
 
 ETA2
+        0.00E+00  8.78E-08
 
 ETA3
+        0.00E+00  0.00E+00  8.24E-02
 
 ETA4
+        0.00E+00  0.00E+00  0.00E+00  1.17E-01
 
 ETA5
+        0.00E+00  0.00E+00  0.00E+00  0.00E+00  1.01E-01
 


 SIGMA - COV MATRIX FOR RANDOM EFFECTS - EPSILONS  ****


         EPS1     
 
 EPS1
+        1.00E+00
 
1


 OMEGA - CORR MATRIX FOR RANDOM EFFECTS - ETAS  *******


         ETA1      ETA2      ETA3      ETA4      ETA5     
 
 ETA1
+        3.36E-01
 
 ETA2
+        0.00E+00  2.96E-04
 
 ETA3
+        0.00E+00  0.00E+00  2.87E-01
 
 ETA4
+        0.00E+00  0.00E+00  0.00E+00  3.42E-01
 
 ETA5
+        0.00E+00  0.00E+00  0.00E+00  0.00E+00  3.18E-01
 


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
 
         1.04E-01  1.56E-01  2.74E-02  6.02E-02  5.96E-02  2.99E-03
 


 OMEGA - COV MATRIX FOR RANDOM EFFECTS - ETAS  ********


         ETA1      ETA2      ETA3      ETA4      ETA5     
 
 ETA1
+        1.59E-02
 
 ETA2
+       .........  8.08E-06
 
 ETA3
+       ......... .........  1.05E-02
 
 ETA4
+       ......... ......... .........  3.79E-02
 
 ETA5
+       ......... ......... ......... .........  2.15E-02
 


 SIGMA - COV MATRIX FOR RANDOM EFFECTS - EPSILONS  ****


         EPS1     
 
 EPS1
+       .........
 
1


 OMEGA - CORR MATRIX FOR RANDOM EFFECTS - ETAS  *******


         ETA1      ETA2      ETA3      ETA4      ETA5     
 
 ETA1
+        2.37E-02
 
 ETA2
+       .........  1.36E-02
 
 ETA3
+       ......... .........  1.84E-02
 
 ETA4
+       ......... ......... .........  5.55E-02
 
 ETA5
+       ......... ......... ......... .........  3.38E-02
 


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
+        1.08E-02
 
 TH 2
+        1.54E-02  2.42E-02
 
 TH 3
+        2.06E-04  2.87E-04  7.51E-04
 
 TH 4
+       -5.58E-04 -1.19E-03 -2.94E-04  3.62E-03
 
 TH 5
+       -4.37E-03 -6.49E-03 -2.15E-04  1.14E-04  3.55E-03
 
 TH 6
+       -2.23E-05 -1.13E-05  1.30E-06 -8.85E-06 -4.64E-06  8.91E-06
 
 OM11
+        4.50E-05  4.38E-05  1.27E-05 -1.00E-04  8.48E-05  4.07E-06  2.53E-04
 
 OM12
+       ......... ......... ......... ......... ......... ......... ......... .........
 
 OM13
+       ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 OM14
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 OM15
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 OM22
+       -1.60E-07 -1.89E-07  1.53E-08 -1.78E-08  4.08E-08  2.93E-09  1.32E-08 ......... ......... ......... .........  6.53E-11
 
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
+       -8.53E-05 -1.46E-04  6.41E-06 -2.76E-05  5.48E-05 -8.53E-07 -1.08E-05 ......... ......... ......... .........  8.52E-09
         ......... ......... .........  1.11E-04
 
 OM34
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
         ......... ......... ......... ......... .........
 
 OM35
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
         ......... ......... ......... ......... ......... .........
 
 OM44
+        9.20E-04  1.17E-03 -9.53E-05  3.51E-04 -2.01E-04 -1.83E-05 -6.51E-05 ......... ......... ......... ......... -2.66E-07
         ......... ......... ......... -5.71E-05 ......... .........  1.43E-03
 
1

            TH 1      TH 2      TH 3      TH 4      TH 5      TH 6      OM11      OM12      OM13      OM14      OM15      OM22  
             OM23      OM24      OM25      OM33      OM34      OM35      OM44      OM45      OM55      SG11  
 
 OM45
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
         ......... ......... ......... ......... ......... ......... ......... .........
 
 OM55
+       -1.01E-04 -2.04E-04  1.03E-05 -2.67E-04 -6.78E-07  2.42E-06 -1.09E-05 ......... ......... ......... ......... -7.70E-08
         ......... ......... .........  3.57E-05 ......... ......... -4.29E-05 .........  4.60E-04
 
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
+        1.04E-01
 
 TH 2
+        9.51E-01  1.56E-01
 
 TH 3
+        7.24E-02  6.74E-02  2.74E-02
 
 TH 4
+       -8.92E-02 -1.27E-01 -1.78E-01  6.02E-02
 
 TH 5
+       -7.05E-01 -7.00E-01 -1.32E-01  3.17E-02  5.96E-02
 
 TH 6
+       -7.17E-02 -2.42E-02  1.59E-02 -4.92E-02 -2.61E-02  2.99E-03
 
 OM11
+        2.72E-02  1.77E-02  2.91E-02 -1.05E-01  8.95E-02  8.57E-02  1.59E-02
 
 OM12
+       ......... ......... ......... ......... ......... ......... ......... .........
 
 OM13
+       ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 OM14
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 OM15
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 OM22
+       -1.90E-01 -1.51E-01  6.89E-02 -3.67E-02  8.47E-02  1.22E-01  1.03E-01 ......... ......... ......... .........  8.08E-06
 
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
+       -7.78E-02 -8.91E-02  2.22E-02 -4.34E-02  8.72E-02 -2.71E-02 -6.44E-02 ......... ......... ......... .........  1.00E-01
         ......... ......... .........  1.05E-02
 
 OM34
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
         ......... ......... ......... ......... .........
 
 OM35
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
         ......... ......... ......... ......... ......... .........
 
 OM44
+        2.34E-01  1.98E-01 -9.18E-02  1.54E-01 -8.92E-02 -1.62E-01 -1.08E-01 ......... ......... ......... ......... -8.69E-01
         ......... ......... ......... -1.43E-01 ......... .........  3.79E-02
 
1

            TH 1      TH 2      TH 3      TH 4      TH 5      TH 6      OM11      OM12      OM13      OM14      OM15      OM22  
             OM23      OM24      OM25      OM33      OM34      OM35      OM44      OM45      OM55      SG11  
 
 OM45
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
         ......... ......... ......... ......... ......... ......... ......... .........
 
 OM55
+       -4.55E-02 -6.12E-02  1.75E-02 -2.06E-01 -5.31E-04  3.78E-02 -3.18E-02 ......... ......... ......... ......... -4.45E-01
         ......... ......... .........  1.58E-01 ......... ......... -5.28E-02 .........  2.15E-02
 
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
+        1.07E+03
 
 TH 2
+       -6.34E+02  4.64E+02
 
 TH 3
+       -1.46E+01  2.89E+01  1.51E+03
 
 TH 4
+       -4.11E+01  5.80E+01  1.34E+02  3.25E+02
 
 TH 5
+        1.62E+02  6.71E+01  1.20E+02  4.50E+01  6.15E+02
 
 TH 6
+        1.83E+03 -9.46E+02  4.12E+02  1.14E+02  7.62E+02  1.21E+05
 
 OM11
+       -1.82E+02  3.85E+01  1.19E+02  1.30E+02 -2.66E+02 -1.36E+03  4.53E+03
 
 OM12
+       ......... ......... ......... ......... ......... ......... ......... .........
 
 OM13
+       ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 OM14
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 OM15
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 OM22
+        1.48E+07 -7.55E+06  5.87E+07  1.28E+07  2.02E+06  2.16E+08  1.07E+08 ......... ......... ......... .........  3.73E+13
 
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
+       -7.31E+02  3.78E+02 -2.38E+03 -4.99E+02 -2.56E+02 -7.17E+03 -3.65E+03 ......... ......... ......... ......... -1.47E+09
         ......... ......... .........  6.71E+04
 
 OM34
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
         ......... ......... ......... ......... .........
 
 OM35
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
         ......... ......... ......... ......... ......... .........
 
 OM44
+        2.66E+03 -1.41E+03  1.12E+04  2.36E+03  3.01E+02  4.22E+04  2.04E+04 ......... ......... ......... .........  7.07E+09
         ......... ......... ......... -2.77E+05 ......... .........  1.34E+06
 
1

            TH 1      TH 2      TH 3      TH 4      TH 5      TH 6      OM11      OM12      OM13      OM14      OM15      OM22  
             OM23      OM24      OM25      OM33      OM34      OM35      OM44      OM45      OM55      SG11  
 
 OM45
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
         ......... ......... ......... ......... ......... ......... ......... .........
 
 OM55
+        2.69E+03 -1.32E+03  1.11E+04  2.61E+03  4.66E+02  4.01E+04  2.02E+04 ......... ......... ......... .........  7.02E+09
         ......... ......... ......... -2.77E+05 ......... .........  1.33E+06 .........  1.33E+06
 
 SG11
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
         ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 Elapsed finaloutput time in seconds:     0.19
 #CPUT: Total CPU Time in Seconds,      639.078
