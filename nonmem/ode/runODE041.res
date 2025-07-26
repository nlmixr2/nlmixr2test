Run Start Date:  29/08/2019 
Run Start Time: 17:05:22.63 
Run Stop Date:   29/08/2019 
Run Stop Time:  17:36:18.32 
  
************************************************************************************************************************ 
********************                            CONTROL STREAM                                      ******************** 
************************************************************************************************************************ 
  
$PROB    BOLUS_2CPT_V1QV2VMKM MULTIPLE DOSE FOCEI (120 Ind/4680 Obs) runODE041
$INPUT   ID TIME DV LNDV MDV AMT EVID DOSE VI VMI KMI QI V2I SD CMT
$DATA    BOLUS_2CPTMM.csv IGNORE=@ IGNORE(SD.EQ.1)
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
        ONEHEADER NOPRINT FILE=runODE041.csv   
   
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
 BOLUS_2CPT_V1QV2VMKM MULTIPLE DOSE FOCEI (120 Ind/4680 Obs) runODE041
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
 ID TIME DV LNDV MDV AMT EVID DOSE VI VMI KMI QI V2I SD CMT
0(NONBLANK) LABELS FOR PRED-DEFINED ITEMS:
 VM KM V Q V2 IPRED IRES IWRES
0FORMAT FOR DATA:
 (E4.0,3E7.0,E2.0,E6.0,E2.0,2E6.0,E7.0,E6.0,E5.0,E6.0,2E2.0)

 TOT. NO. OF OBS RECS:     4680
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
 RAW OUTPUT FILE (FILE): runODE041.ext
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

 
0ITERATION NO.:    0    OBJECTIVE VALUE:   52203.2773661247        NO. OF FUNC. EVALS.:   8
 CUMULATIVE NO. OF FUNC. EVALS.:        8
 NPARAMETR:  7.0000E+00  5.7000E+00  4.5000E+00  1.5000E+00  4.0000E+00  3.0000E-01  1.5000E-01  1.5000E-01  1.5000E-01  1.5000E-01
             1.5000E-01
 PARAMETER:  1.0000E-01  1.0000E-01  1.0000E-01  1.0000E-01  1.0000E-01  1.0000E-01  1.0000E-01  1.0000E-01  1.0000E-01  1.0000E-01
             1.0000E-01
 GRADIENT:   2.6408E+04  1.5146E+03  1.7993E+04  1.3523E+02  1.0204E+04  2.6474E+03  5.9478E+01  6.4429E+00  2.5854E+01  5.0750E+00
            -1.2426E+01
 
0ITERATION NO.:    5    OBJECTIVE VALUE:   51506.8759199855        NO. OF FUNC. EVALS.: 110
 CUMULATIVE NO. OF FUNC. EVALS.:      118
 NPARAMETR:  6.8407E+00  5.6171E+00  4.2998E+00  1.4915E+00  3.7880E+00  1.9102E-01  1.4880E-01  1.3169E-01  1.1610E-01  1.3818E-01
             1.4988E-01
 PARAMETER:  9.7724E-02  9.8545E-02  9.5552E-02  9.9435E-02  9.4700E-02 -4.9608E-01  9.5979E-02  3.4893E-02 -2.8072E-02  5.8957E-02
             9.9588E-02
 GRADIENT:   1.1032E+05 -2.3947E+04  7.1560E+03 -4.8543E+02  6.2245E+03 -1.5634E+03  3.3454E+01 -1.4366E+01  4.9936E+01 -2.4015E+00
            -2.4432E+01
 
0ITERATION NO.:   10    OBJECTIVE VALUE:   51386.4256620470        NO. OF FUNC. EVALS.:  77
 CUMULATIVE NO. OF FUNC. EVALS.:      195
 NPARAMETR:  6.8509E+00  5.5931E+00  4.2511E+00  1.7837E+00  3.6696E+00  2.1220E-01  1.2482E-01  1.5377E-01  8.4657E-02  1.9059E-01
             1.7953E-01
 PARAMETER:  9.7870E-02  9.8125E-02  9.4469E-02  1.1892E-01  9.1739E-02 -3.6442E-01  8.1046E-03  1.1241E-01 -1.8601E-01  2.1976E-01
             1.8986E-01
 GRADIENT:   3.7393E+04  8.0711E+03  6.6768E+03  1.8827E+02  1.4137E+03  1.2575E+01  1.7448E+01  4.0878E+00  3.4905E+00 -2.6129E+00
             1.2657E+00
 
0ITERATION NO.:   15    OBJECTIVE VALUE:   51305.6521571935        NO. OF FUNC. EVALS.: 105
 CUMULATIVE NO. OF FUNC. EVALS.:      300
 NPARAMETR:  7.1963E+00  5.9092E+00  4.2512E+00  1.6650E+00  3.6615E+00  2.1203E-01  1.0262E-01  1.4046E-01  8.3149E-02  2.1431E-01
             1.7734E-01
 PARAMETER:  1.0280E-01  1.0367E-01  9.4471E-02  1.1100E-01  9.1538E-02 -3.6545E-01 -8.9819E-02  6.7148E-02 -1.9500E-01  2.7838E-01
             1.8371E-01
 GRADIENT:   1.0042E+05 -2.2855E+04  2.1565E+03 -7.3874E+01  2.1428E+03  7.5973E+01  4.6484E+01 -7.8536E+00 -3.8312E+00  1.7137E-01
            -9.8965E+00
 
0ITERATION NO.:   20    OBJECTIVE VALUE:   51282.6372369664        NO. OF FUNC. EVALS.: 129
 CUMULATIVE NO. OF FUNC. EVALS.:      429
 NPARAMETR:  7.3071E+00  6.0998E+00  4.2564E+00  1.5082E+00  3.6139E+00  2.0947E-01  7.5791E-02  1.8524E-01  8.5584E-02  2.3968E-01
             2.0708E-01
 PARAMETER:  1.0439E-01  1.0701E-01  9.4587E-02  1.0054E-01  9.0347E-02 -3.8080E-01 -2.4133E-01  2.0550E-01 -1.8057E-01  3.3433E-01
             2.6123E-01
 GRADIENT:   1.0173E+05 -2.3857E+04  1.2580E+03 -2.7520E+02  1.5492E+03 -3.4688E+01  1.8847E+01 -1.1067E+01  1.2279E+00  5.7471E+00
            -6.9171E+00
 
0ITERATION NO.:   25    OBJECTIVE VALUE:   51269.6716359830        NO. OF FUNC. EVALS.: 126
 CUMULATIVE NO. OF FUNC. EVALS.:      555
 NPARAMETR:  7.3431E+00  6.2453E+00  4.2629E+00  1.4460E+00  3.6254E+00  2.0948E-01  5.8849E-02  2.8975E-01  8.5716E-02  2.3076E-01
             2.2439E-01
 PARAMETER:  1.0490E-01  1.0957E-01  9.4732E-02  9.6398E-02  9.0636E-02 -3.8079E-01 -3.6783E-01  4.2920E-01 -1.7980E-01  3.1537E-01
             3.0139E-01
 GRADIENT:   5.4941E+04  1.1382E+04  5.8513E+03 -2.8235E+02  2.2629E+03 -6.7518E+00  1.0247E+01 -6.7750E-01  2.6823E+00  7.2243E+00
            -2.7249E-01
 
0ITERATION NO.:   30    OBJECTIVE VALUE:   51263.5887452517        NO. OF FUNC. EVALS.: 140
 CUMULATIVE NO. OF FUNC. EVALS.:      695             RESET HESSIAN, TYPE I
 NPARAMETR:  7.4031E+00  6.3721E+00  4.2674E+00  1.4255E+00  3.6280E+00  2.0933E-01  4.7850E-02  3.1917E-01  8.5629E-02  2.0714E-01
             2.2477E-01
 PARAMETER:  1.0576E-01  1.1179E-01  9.4830E-02  9.5034E-02  9.0700E-02 -3.8169E-01 -4.7128E-01  4.7754E-01 -1.8031E-01  2.6137E-01
             3.0221E-01
 GRADIENT:   5.5473E+04  1.2496E+04  6.0111E+03 -2.5745E+02  2.2272E+03 -7.0795E+00  3.8479E+00 -3.4187E+00  2.2610E+00  5.8039E+00
            -1.0887E+00
 
0ITERATION NO.:   35    OBJECTIVE VALUE:   51259.3721142443        NO. OF FUNC. EVALS.: 127
 CUMULATIVE NO. OF FUNC. EVALS.:      822             RESET HESSIAN, TYPE I
 NPARAMETR:  7.4109E+00  6.4470E+00  4.2691E+00  1.4200E+00  3.6167E+00  2.0928E-01  4.1771E-02  3.4499E-01  8.5642E-02  1.7797E-01
             2.2636E-01
 PARAMETER:  1.0587E-01  1.1311E-01  9.4868E-02  9.4665E-02  9.0418E-02 -3.8200E-01 -5.3922E-01  5.1644E-01 -1.8023E-01  1.8549E-01
             3.0575E-01
 GRADIENT:   5.2355E+04  1.4172E+04  5.8174E+03 -2.0079E+02  1.6959E+03 -4.8835E+00  2.2446E+00 -1.5930E+00  2.4220E+00  3.8648E+00
            -4.8853E-01
 
0ITERATION NO.:   40    OBJECTIVE VALUE:   51257.9308761367        NO. OF FUNC. EVALS.: 118
 CUMULATIVE NO. OF FUNC. EVALS.:      940
 NPARAMETR:  7.4218E+00  6.5323E+00  4.2765E+00  1.6057E+00  3.6027E+00  2.0933E-01  4.1097E-02  3.7188E-01  8.4240E-02  1.3489E-01
             2.2041E-01
 PARAMETER:  1.0603E-01  1.1460E-01  9.5032E-02  1.0705E-01  9.0068E-02 -3.8169E-01 -5.4735E-01  5.5397E-01 -1.8849E-01  4.6912E-02
             2.9243E-01
 GRADIENT:   8.8938E+04 -2.0904E+04  2.7482E+03  2.8251E+02 -1.1308E+02  4.8671E+00  4.5855E+00  8.7873E-01 -3.4395E+00 -5.0581E+00
            -1.1285E+00
 
0ITERATION NO.:   45    OBJECTIVE VALUE:   51256.2345234002        NO. OF FUNC. EVALS.: 136
 CUMULATIVE NO. OF FUNC. EVALS.:     1076             RESET HESSIAN, TYPE I
 NPARAMETR:  7.4347E+00  6.5649E+00  4.2735E+00  1.5229E+00  3.6066E+00  2.0929E-01  3.4710E-02  3.7958E-01  8.5067E-02  1.3660E-01
             2.2496E-01
 PARAMETER:  1.0621E-01  1.1517E-01  9.4966E-02  1.0153E-01  9.0166E-02 -3.8192E-01 -6.3180E-01  5.6421E-01 -1.8360E-01  5.3208E-02
             3.0265E-01
 GRADIENT:   4.8919E+04  1.6490E+04  6.4108E+03  9.7188E+01  9.0026E+02  4.9523E+00  1.1548E+00 -1.8137E+00 -2.9238E-01 -2.0866E+00
            -1.7257E-01
 
0ITERATION NO.:   50    OBJECTIVE VALUE:   51255.7780982993        NO. OF FUNC. EVALS.: 132
 CUMULATIVE NO. OF FUNC. EVALS.:     1208             RESET HESSIAN, TYPE I
 NPARAMETR:  7.4513E+00  6.5909E+00  4.2762E+00  1.5083E+00  3.6018E+00  2.0927E-01  3.1955E-02  3.9342E-01  8.4666E-02  1.3762E-01
             2.2769E-01
 PARAMETER:  1.0645E-01  1.1563E-01  9.5027E-02  1.0055E-01  9.0045E-02 -3.8204E-01 -6.7315E-01  5.8212E-01 -1.8596E-01  5.6930E-02
             3.0867E-01
 GRADIENT:   4.9512E+04  1.6522E+04  6.5202E+03  8.1074E+01  8.2047E+02  4.9191E+00  7.9805E-01 -6.6298E-01 -8.7232E-01 -1.6491E+00
            -1.0587E-01
 
0ITERATION NO.:   55    OBJECTIVE VALUE:   51255.5235128400        NO. OF FUNC. EVALS.: 129
 CUMULATIVE NO. OF FUNC. EVALS.:     1337             RESET HESSIAN, TYPE I
 NPARAMETR:  7.4589E+00  6.6088E+00  4.2755E+00  1.4794E+00  3.6044E+00  2.0923E-01  3.0475E-02  3.9936E-01  8.4850E-02  1.4117E-01
             2.2804E-01
 PARAMETER:  1.0656E-01  1.1594E-01  9.5011E-02  9.8625E-02  9.0110E-02 -3.8226E-01 -6.9686E-01  5.8962E-01 -1.8488E-01  6.9669E-02
             3.0944E-01
 GRADIENT:   4.9464E+04  1.6631E+04  6.2723E+03  1.9121E+01  9.0384E+02  2.8797E+00  4.1698E-01 -9.1149E-01 -4.1498E-02 -5.6237E-01
             2.7791E-02
 
0ITERATION NO.:   60    OBJECTIVE VALUE:   51255.3520154743        NO. OF FUNC. EVALS.: 136
 CUMULATIVE NO. OF FUNC. EVALS.:     1473             RESET HESSIAN, TYPE I
 NPARAMETR:  7.4727E+00  6.6318E+00  4.2762E+00  1.4792E+00  3.6058E+00  2.0921E-01  2.8698E-02  4.1031E-01  8.4752E-02  1.4781E-01
             2.2762E-01
 PARAMETER:  1.0675E-01  1.1635E-01  9.5028E-02  9.8610E-02  9.0144E-02 -3.8241E-01 -7.2691E-01  6.0314E-01 -1.8545E-01  9.2644E-02
             3.0853E-01
 GRADIENT:   4.9870E+04  1.6689E+04  6.3121E+03  1.5731E+01  9.0860E+02  2.6426E+00  3.7178E-01 -1.2575E-01 -2.4355E-01 -4.5623E-02
            -6.1433E-03
 
0ITERATION NO.:   65    OBJECTIVE VALUE:   51255.3033240357        NO. OF FUNC. EVALS.: 122
 CUMULATIVE NO. OF FUNC. EVALS.:     1595
 NPARAMETR:  7.4773E+00  6.6431E+00  4.2759E+00  1.4741E+00  3.6071E+00  2.0920E-01  2.7785E-02  4.1440E-01  8.4818E-02  1.4781E-01
             2.2744E-01
 PARAMETER:  1.0682E-01  1.1654E-01  9.5021E-02  9.8270E-02  9.0177E-02 -3.8247E-01 -7.4308E-01  6.0809E-01 -1.8506E-01  9.2644E-02
             3.0812E-01
 GRADIENT:   8.8050E+04 -2.1546E+04  1.7737E+03  6.4296E-02  1.6673E+02  1.5233E-03  2.2269E-01 -1.8812E-01 -4.0069E-02  7.9325E-02
             1.9192E-02
 
0ITERATION NO.:   68    OBJECTIVE VALUE:   51255.2879126149        NO. OF FUNC. EVALS.:  77
 CUMULATIVE NO. OF FUNC. EVALS.:     1672
 NPARAMETR:  7.4780E+00  6.6503E+00  4.2758E+00  1.4738E+00  3.6068E+00  2.0920E-01  2.7317E-02  4.1514E-01  8.4850E-02  1.4620E-01
             2.2736E-01
 PARAMETER:  1.0683E-01  1.1667E-01  9.5019E-02  9.8255E-02  9.0170E-02 -3.8247E-01 -7.5156E-01  6.0900E-01 -1.8487E-01  8.7166E-02
             3.0796E-01
 GRADIENT:  -3.4858E+02 -2.6049E+01 -1.8131E+01  4.8901E+00 -2.4047E+01  1.7690E-01  6.1375E-02 -6.7516E-01  4.4668E-03 -1.5148E-02
             2.1658E-02
 
 #TERM:
0MINIMIZATION SUCCESSFUL
 HOWEVER, PROBLEMS OCCURRED WITH THE MINIMIZATION.
 REGARD THE RESULTS OF THE ESTIMATION STEP CAREFULLY, AND ACCEPT THEM ONLY
 AFTER CHECKING THAT THE COVARIANCE STEP PRODUCES REASONABLE OUTPUT.
 NO. OF FUNCTION EVALUATIONS USED:     1672
 NO. OF SIG. DIGITS IN FINAL EST.:  2.2

 ETABAR IS THE ARITHMETIC MEAN OF THE ETA-ESTIMATES,
 AND THE P-VALUE IS GIVEN FOR THE NULL HYPOTHESIS THAT THE TRUE MEAN IS 0.
 
 ETABAR:         5.6655E-03 -1.0593E-02 -1.6265E-02  1.0086E-02  1.1235E-02
 SE:             6.7199E-03  4.8439E-02  2.4407E-02  1.1040E-02  3.1581E-02
 N:                     120         120         120         120         120
 
 P VAL.:         3.9917E-01  8.2690E-01  5.0516E-01  3.6091E-01  7.2202E-01
 
 ETASHRINKSD(%)  5.5275E+01  1.7300E+01  7.8283E+00  6.8239E+01  2.7142E+01
 ETASHRINKVR(%)  7.9997E+01  3.1606E+01  1.5044E+01  8.9912E+01  4.6918E+01
 EBVSHRINKSD(%)  5.4872E+01  1.7838E+01  8.5940E+00  6.8003E+01  2.7303E+01
 EBVSHRINKVR(%)  7.9635E+01  3.2494E+01  1.6449E+01  8.9762E+01  4.7151E+01
 EPSSHRINKSD(%)  2.8053E+00
 EPSSHRINKVR(%)  5.5319E+00
 
  
 TOTAL DATA POINTS NORMALLY DISTRIBUTED (N):         4680
 N*LOG(2PI) CONSTANT TO OBJECTIVE FUNCTION:    8601.26467079574     
 OBJECTIVE FUNCTION VALUE WITHOUT CONSTANT:    51255.2879126149     
 OBJECTIVE FUNCTION VALUE WITH CONSTANT:       59856.5525834107     
 REPORTED OBJECTIVE FUNCTION DOES NOT CONTAIN CONSTANT
  
 TOTAL EFFECTIVE ETAS (NIND*NETA):                           600
  
 #TERE:
 Elapsed estimation  time in seconds:  1699.27
 Elapsed covariance  time in seconds:   144.54
 Elapsed postprocess time in seconds:     1.59
1
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 ************************************************************************************************************************
 ********************                                                                                ********************
 ********************               FIRST ORDER CONDITIONAL ESTIMATION WITH INTERACTION              ********************
 #OBJT:**************                       MINIMUM VALUE OF OBJECTIVE FUNCTION                      ********************
 ********************                                                                                ********************
 ************************************************************************************************************************
 





 #OBJV:********************************************    51255.288       **************************************************
1
 ************************************************************************************************************************
 ********************                                                                                ********************
 ********************               FIRST ORDER CONDITIONAL ESTIMATION WITH INTERACTION              ********************
 ********************                             FINAL PARAMETER ESTIMATE                           ********************
 ********************                                                                                ********************
 ************************************************************************************************************************
 


 THETA - VECTOR OF FIXED EFFECTS PARAMETERS   *********


         TH 1      TH 2      TH 3      TH 4      TH 5      TH 6     
 
         7.48E+00  6.65E+00  4.28E+00  1.47E+00  3.61E+00  2.09E-01
 


 OMEGA - COV MATRIX FOR RANDOM EFFECTS - ETAS  ********


         ETA1      ETA2      ETA3      ETA4      ETA5     
 
 ETA1
+        2.73E-02
 
 ETA2
+        0.00E+00  4.15E-01
 
 ETA3
+        0.00E+00  0.00E+00  8.49E-02
 
 ETA4
+        0.00E+00  0.00E+00  0.00E+00  1.46E-01
 
 ETA5
+        0.00E+00  0.00E+00  0.00E+00  0.00E+00  2.27E-01
 


 SIGMA - COV MATRIX FOR RANDOM EFFECTS - EPSILONS  ****


         EPS1     
 
 EPS1
+        1.00E+00
 
1


 OMEGA - CORR MATRIX FOR RANDOM EFFECTS - ETAS  *******


         ETA1      ETA2      ETA3      ETA4      ETA5     
 
 ETA1
+        1.65E-01
 
 ETA2
+        0.00E+00  6.44E-01
 
 ETA3
+        0.00E+00  0.00E+00  2.91E-01
 
 ETA4
+        0.00E+00  0.00E+00  0.00E+00  3.82E-01
 
 ETA5
+        0.00E+00  0.00E+00  0.00E+00  0.00E+00  4.77E-01
 


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
 
         7.68E-02  1.56E-01  3.19E-02  1.66E-01  6.49E-02  2.79E-03
 


 OMEGA - COV MATRIX FOR RANDOM EFFECTS - ETAS  ********


         ETA1      ETA2      ETA3      ETA4      ETA5     
 
 ETA1
+        1.89E-02
 
 ETA2
+       .........  9.43E-02
 
 ETA3
+       ......... .........  1.09E-02
 
 ETA4
+       ......... ......... .........  8.48E-02
 
 ETA5
+       ......... ......... ......... .........  6.25E-02
 


 SIGMA - COV MATRIX FOR RANDOM EFFECTS - EPSILONS  ****


         EPS1     
 
 EPS1
+       .........
 
1


 OMEGA - CORR MATRIX FOR RANDOM EFFECTS - ETAS  *******


         ETA1      ETA2      ETA3      ETA4      ETA5     
 
 ETA1
+        5.71E-02
 
 ETA2
+       .........  7.32E-02
 
 ETA3
+       ......... .........  1.88E-02
 
 ETA4
+       ......... ......... .........  1.11E-01
 
 ETA5
+       ......... ......... ......... .........  6.55E-02
 


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
+        5.90E-03
 
 TH 2
+        1.07E-02  2.42E-02
 
 TH 3
+        3.66E-04  5.33E-04  1.02E-03
 
 TH 4
+        1.56E-03  2.65E-03 -1.72E-03  2.75E-02
 
 TH 5
+       -1.12E-03 -2.52E-03 -7.27E-04  2.82E-03  4.21E-03
 
 TH 6
+        3.22E-05  8.78E-05  4.50E-06 -3.70E-05 -2.55E-05  7.77E-06
 
 OM11
+       -3.44E-04 -9.17E-04 -7.68E-05 -2.11E-04  1.93E-04 -1.63E-05  3.56E-04
 
 OM12
+       ......... ......... ......... ......... ......... ......... ......... .........
 
 OM13
+       ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 OM14
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 OM15
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 OM22
+        3.54E-03  8.95E-03  1.38E-04 -4.11E-04  9.33E-05  8.17E-05 -7.61E-04 ......... ......... ......... .........  8.90E-03
 
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
+       -2.03E-04 -4.01E-04 -3.20E-05  1.97E-04  4.40E-05  2.55E-06  1.33E-05 ......... ......... ......... ......... -1.92E-04
         ......... ......... .........  1.20E-04
 
 OM34
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
         ......... ......... ......... ......... .........
 
 OM35
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
         ......... ......... ......... ......... ......... .........
 
 OM44
+       -7.84E-04 -1.62E-03 -5.79E-04  4.89E-03  7.37E-04 -3.98E-05  1.12E-04 ......... ......... ......... ......... -1.38E-03
         ......... ......... .........  1.12E-04 ......... .........  7.20E-03
 
1

            TH 1      TH 2      TH 3      TH 4      TH 5      TH 6      OM11      OM12      OM13      OM14      OM15      OM22  
             OM23      OM24      OM25      OM33      OM34      OM35      OM44      OM45      OM55      SG11  
 
 OM45
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
         ......... ......... ......... ......... ......... ......... ......... .........
 
 OM55
+        9.56E-04  2.46E-03  7.04E-04 -1.69E-03 -2.12E-03  4.43E-05 -4.21E-04 ......... ......... ......... .........  1.43E-03
         ......... ......... ......... -9.78E-05 ......... .........  2.64E-04 .........  3.90E-03
 
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
+        7.68E-02
 
 TH 2
+        8.95E-01  1.56E-01
 
 TH 3
+        1.49E-01  1.07E-01  3.19E-02
 
 TH 4
+        1.22E-01  1.03E-01 -3.25E-01  1.66E-01
 
 TH 5
+       -2.25E-01 -2.49E-01 -3.51E-01  2.62E-01  6.49E-02
 
 TH 6
+        1.51E-01  2.03E-01  5.06E-02 -8.00E-02 -1.41E-01  2.79E-03
 
 OM11
+       -2.37E-01 -3.12E-01 -1.27E-01 -6.74E-02  1.57E-01 -3.09E-01  1.89E-02
 
 OM12
+       ......... ......... ......... ......... ......... ......... ......... .........
 
 OM13
+       ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 OM14
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 OM15
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 OM22
+        4.88E-01  6.10E-01  4.57E-02 -2.63E-02  1.52E-02  3.11E-01 -4.27E-01 ......... ......... ......... .........  9.43E-02
 
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
+       -2.41E-01 -2.36E-01 -9.16E-02  1.08E-01  6.20E-02  8.36E-02  6.43E-02 ......... ......... ......... ......... -1.86E-01
         ......... ......... .........  1.09E-02
 
 OM34
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
         ......... ......... ......... ......... .........
 
 OM35
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
         ......... ......... ......... ......... ......... .........
 
 OM44
+       -1.20E-01 -1.23E-01 -2.14E-01  3.47E-01  1.34E-01 -1.68E-01  6.99E-02 ......... ......... ......... ......... -1.72E-01
         ......... ......... .........  1.21E-01 ......... .........  8.48E-02
 
1

            TH 1      TH 2      TH 3      TH 4      TH 5      TH 6      OM11      OM12      OM13      OM14      OM15      OM22  
             OM23      OM24      OM25      OM33      OM34      OM35      OM44      OM45      OM55      SG11  
 
 OM45
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
         ......... ......... ......... ......... ......... ......... ......... .........
 
 OM55
+        1.99E-01  2.53E-01  3.53E-01 -1.63E-01 -5.22E-01  2.54E-01 -3.57E-01 ......... ......... ......... .........  2.43E-01
         ......... ......... ......... -1.43E-01 ......... .........  4.98E-02 .........  6.25E-02
 
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
+        9.12E+02
 
 TH 2
+       -4.20E+02  2.76E+02
 
 TH 3
+       -1.75E+02  6.25E+01  1.33E+03
 
 TH 4
+       -2.37E+01 -7.10E+00  5.90E+01  5.20E+01
 
 TH 5
+       -8.10E+00  6.70E+01  7.62E+01 -2.90E+01  4.18E+02
 
 TH 6
+       -7.64E+01 -8.80E+00  1.24E+03  1.24E+02  1.80E+02  1.62E+05
 
 OM11
+       -1.10E+02  4.29E+01  1.53E+02  8.05E+01 -5.07E+01  3.94E+03  3.98E+03
 
 OM12
+       ......... ......... ......... ......... ......... ......... ......... .........
 
 OM13
+       ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 OM14
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 OM15
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 OM22
+        5.50E+01 -1.07E+02  2.92E+01  1.69E+01 -1.11E+02 -9.42E+02  2.57E+02 ......... ......... ......... .........  2.44E+02
 
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
+        2.48E+02  3.83E+01 -7.16E+01 -7.49E+01  1.42E+02 -7.35E+03  3.30E+01 ......... ......... ......... .........  7.16E+01
         ......... ......... .........  9.56E+03
 
 OM34
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
         ......... ......... ......... ......... .........
 
 OM35
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
         ......... ......... ......... ......... ......... .........
 
 OM44
+        1.42E+01 -2.33E+00  7.23E+01 -2.83E+01 -3.17E+01  8.05E+02 -4.10E+01 ......... ......... ......... .........  2.25E+01
         ......... ......... ......... -1.21E+02 ......... .........  1.82E+02
 
1

            TH 1      TH 2      TH 3      TH 4      TH 5      TH 6      OM11      OM12      OM13      OM14      OM15      OM22  
             OM23      OM24      OM25      OM33      OM34      OM35      OM44      OM45      OM55      SG11  
 
 OM45
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
         ......... ......... ......... ......... ......... ......... ......... .........
 
 OM55
+        3.22E+01 -3.60E+00 -1.85E+02  7.64E+00  1.99E+02 -1.35E+03  2.75E+02 ......... ......... ......... ......... -5.48E+01
         ......... ......... .........  2.81E+02 ......... ......... -8.18E+01 .........  4.73E+02
 
 SG11
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
         ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 Elapsed finaloutput time in seconds:     0.36
1THERE ARE ERROR MESSAGES IN FILE PRDERR                                                                  
 #CPUT: Total CPU Time in Seconds,     1846.922
