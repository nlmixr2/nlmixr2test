Run Start Date:  29/08/2019 
Run Start Time: 18:20:14.43 
Run Stop Date:   29/08/2019 
Run Stop Time:  18:45:55.18 
  
************************************************************************************************************************ 
********************                            CONTROL STREAM                                      ******************** 
************************************************************************************************************************ 
  
$PROB    INFUSION_2CPT_V1QV2VMKM SINGLE DOSE FOCEI (120 Ind/2280 Obs) runODE054
$INPUT   ID TIME DV LNDV MDV AMT RATE EVID DOSE VI VMI KMI QI V2I SD CMT
$DATA    INFUSION_2CPTMM.csv IGNORE=@ IGNORE(SD.EQ.0)
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
        ONEHEADER NOPRINT FILE=runODE054.csv   
   
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
 INFUSION_2CPT_V1QV2VMKM SINGLE DOSE FOCEI (120 Ind/2280 Obs) runODE054
0DATA CHECKOUT RUN:              NO
 DATA SET LOCATED ON UNIT NO.:    2
 THIS UNIT TO BE REWOUND:        NO
 NO. OF DATA RECS IN DATA SET:     2400
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
 RAW OUTPUT FILE (FILE): runODE054.ext
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

 
0ITERATION NO.:    0    OBJECTIVE VALUE:   21572.1714369286        NO. OF FUNC. EVALS.:   8
 CUMULATIVE NO. OF FUNC. EVALS.:        8
 NPARAMETR:  7.0000E+00  5.7000E+00  4.5000E+00  1.5000E+00  4.0000E+00  3.0000E-01  1.5000E-01  1.5000E-01  1.5000E-01  1.5000E-01
             1.5000E-01
 PARAMETER:  1.0000E-01  1.0000E-01  1.0000E-01  1.0000E-01  1.0000E-01  1.0000E-01  1.0000E-01  1.0000E-01  1.0000E-01  1.0000E-01
             1.0000E-01
 GRADIENT:   2.1958E+03  5.1905E+03  1.6979E+04  1.2486E+03  2.2509E+03  1.3468E+03  4.2000E+01  1.4718E+01  3.6526E+01  1.9483E+01
             3.7719E+01
 
0ITERATION NO.:    5    OBJECTIVE VALUE:   21064.6703738139        NO. OF FUNC. EVALS.: 102
 CUMULATIVE NO. OF FUNC. EVALS.:      110
 NPARAMETR:  6.8431E+00  5.3529E+00  4.2582E+00  1.4226E+00  3.9591E+00  1.9133E-01  1.3101E-01  1.1853E-01  1.2462E-01  1.4982E-01
             1.3341E-01
 PARAMETER:  9.7759E-02  9.3911E-02  9.4627E-02  9.4843E-02  9.8978E-02 -4.9408E-01  3.2331E-02 -1.7724E-02  7.3100E-03  9.9402E-02
             4.1396E-02
 GRADIENT:   1.5661E+04  4.1461E+03  7.3325E+03  3.4383E+02  1.5633E+03 -2.3171E+02  1.8524E+01  9.4418E+00  6.4393E+01  2.1379E+01
             1.4549E+01
 
0ITERATION NO.:   10    OBJECTIVE VALUE:   21049.6281332813        NO. OF FUNC. EVALS.: 113
 CUMULATIVE NO. OF FUNC. EVALS.:      223
 NPARAMETR:  6.8094E+00  5.2981E+00  4.2543E+00  1.3850E+00  3.9587E+00  2.0362E-01  1.2130E-01  1.0778E-01  9.6626E-02  4.5543E-02
             1.1408E-01
 PARAMETER:  9.7278E-02  9.2948E-02  9.4540E-02  9.2332E-02  9.8967E-02 -4.1653E-01 -6.2025E-03 -6.5266E-02 -1.1990E-01 -4.9599E-01
            -3.6875E-02
 GRADIENT:   2.7253E+04 -5.1358E+03  1.9227E+03  4.5895E+02  2.3936E+02  1.0091E+02  8.1632E+00  5.6131E+00  1.7631E+01 -2.6427E+00
             4.9525E+00
 
0ITERATION NO.:   15    OBJECTIVE VALUE:   21045.1124795925        NO. OF FUNC. EVALS.: 136
 CUMULATIVE NO. OF FUNC. EVALS.:      359             RESET HESSIAN, TYPE I
 NPARAMETR:  6.8566E+00  5.3608E+00  4.2661E+00  1.3574E+00  3.9445E+00  2.0122E-01  1.1551E-01  7.8813E-02  8.5600E-02  5.6729E-02
             1.0715E-01
 PARAMETER:  9.7952E-02  9.4049E-02  9.4803E-02  9.0496E-02  9.8611E-02 -4.3141E-01 -3.0630E-02 -2.2178E-01 -1.8048E-01 -3.8617E-01
            -6.8215E-02
 GRADIENT:   1.4541E+04  3.5378E+03  6.8989E+03  1.0166E+02  1.0129E+03  3.3701E+01 -2.6542E+00  3.8882E-01 -7.4249E+00 -2.2492E-01
            -8.6607E-01
 
0ITERATION NO.:   20    OBJECTIVE VALUE:   21044.2869622571        NO. OF FUNC. EVALS.: 121
 CUMULATIVE NO. OF FUNC. EVALS.:      480
 NPARAMETR:  6.8657E+00  5.3919E+00  4.2629E+00  1.3501E+00  3.9346E+00  1.9928E-01  1.1878E-01  7.6760E-02  8.8582E-02  5.7561E-02
             1.0965E-01
 PARAMETER:  9.8081E-02  9.4595E-02  9.4732E-02  9.0005E-02  9.8365E-02 -4.4350E-01 -1.6694E-02 -2.3498E-01 -1.6336E-01 -3.7890E-01
            -5.6649E-02
 GRADIENT:   2.8438E+04 -5.6458E+03  2.9160E+03  2.4140E-01  3.0053E+02 -2.0403E+01  7.9042E-01  9.1817E-01 -7.2854E-02 -5.0807E-01
            -5.1723E-01
 
0ITERATION NO.:   25    OBJECTIVE VALUE:   21042.9346910571        NO. OF FUNC. EVALS.: 131
 CUMULATIVE NO. OF FUNC. EVALS.:      611
 NPARAMETR:  6.9095E+00  5.4451E+00  4.2628E+00  1.3493E+00  3.9182E+00  1.9883E-01  1.1973E-01  7.2057E-02  8.8475E-02  5.9655E-02
             1.0881E-01
 PARAMETER:  9.8707E-02  9.5529E-02  9.4729E-02  8.9955E-02  9.7955E-02 -4.4630E-01 -1.2685E-02 -2.6659E-01 -1.6396E-01 -3.6103E-01
            -6.0514E-02
 GRADIENT:   2.9832E+04 -6.2484E+03  2.9607E+03 -2.1002E+01  3.0293E+02 -3.3338E+01  3.6849E+00  5.9330E-01 -3.7439E-01 -9.0868E-01
            -9.8556E-01
 
0ITERATION NO.:   30    OBJECTIVE VALUE:   21042.0860495443        NO. OF FUNC. EVALS.: 128
 CUMULATIVE NO. OF FUNC. EVALS.:      739
 NPARAMETR:  6.9285E+00  5.4843E+00  4.2625E+00  1.3514E+00  3.9093E+00  1.9940E-01  1.1675E-01  7.1926E-02  8.8520E-02  6.1629E-02
             1.0930E-01
 PARAMETER:  9.8979E-02  9.6215E-02  9.4721E-02  9.0094E-02  9.7733E-02 -4.4272E-01 -2.5305E-02 -2.6750E-01 -1.6370E-01 -3.4475E-01
            -5.8258E-02
 GRADIENT:   2.9033E+04 -5.9748E+03  2.9097E+03  1.6080E+01  2.4929E+02 -1.5305E+01  1.6757E+00  4.7980E-03 -2.2783E-01 -7.7460E-01
            -4.9566E-01
 
0ITERATION NO.:   35    OBJECTIVE VALUE:   21041.0447219772        NO. OF FUNC. EVALS.: 145
 CUMULATIVE NO. OF FUNC. EVALS.:      884             RESET HESSIAN, TYPE I
 NPARAMETR:  6.9663E+00  5.5416E+00  4.2611E+00  1.3514E+00  3.8947E+00  2.0044E-01  1.1307E-01  7.5992E-02  8.8625E-02  6.8011E-02
             1.1401E-01
 PARAMETER:  9.9519E-02  9.7221E-02  9.4690E-02  9.0095E-02  9.7368E-02 -4.3625E-01 -4.1306E-02 -2.4000E-01 -1.6311E-01 -2.9548E-01
            -3.7166E-02
 GRADIENT:   1.4855E+04  4.3108E+03  6.3987E+03  3.3670E+01  6.3171E+02  2.0005E+01  1.7748E+00 -7.7273E-02  1.9474E-01  5.9669E-01
             2.4276E+00
 
0ITERATION NO.:   40    OBJECTIVE VALUE:   21040.4274806363        NO. OF FUNC. EVALS.: 128
 CUMULATIVE NO. OF FUNC. EVALS.:     1012
 NPARAMETR:  6.9906E+00  5.5781E+00  4.2608E+00  1.3493E+00  3.8856E+00  2.0038E-01  1.1042E-01  8.1702E-02  8.8671E-02  6.9636E-02
             1.1168E-01
 PARAMETER:  9.9865E-02  9.7862E-02  9.4684E-02  8.9955E-02  9.7141E-02 -4.3665E-01 -5.3162E-02 -2.0378E-01 -1.6285E-01 -2.8368E-01
            -4.7491E-02
 GRADIENT:   2.9048E+04 -6.1557E+03  2.6531E+03 -2.0032E+01  1.1266E+02  1.6661E+01  2.2944E+00  1.8373E-01  2.9609E-01  6.5681E-01
             1.0917E+00
 
0ITERATION NO.:   45    OBJECTIVE VALUE:   21039.9654393374        NO. OF FUNC. EVALS.: 128
 CUMULATIVE NO. OF FUNC. EVALS.:     1140
 NPARAMETR:  7.0105E+00  5.6134E+00  4.2611E+00  1.3474E+00  3.8780E+00  2.0017E-01  1.0886E-01  8.6898E-02  8.8665E-02  7.2016E-02
             1.1275E-01
 PARAMETER:  1.0015E-01  9.8481E-02  9.4690E-02  8.9826E-02  9.6950E-02 -4.3796E-01 -6.0283E-02 -1.7295E-01 -1.6288E-01 -2.6687E-01
            -4.2725E-02
 GRADIENT:   2.8970E+04 -6.0831E+03  2.6941E+03 -3.1233E+01  5.9826E+01  1.1823E+01  3.4623E+00  6.6540E-01  2.7119E-01  9.3400E-01
             1.4391E+00
 
0ITERATION NO.:   50    OBJECTIVE VALUE:   21039.6498827432        NO. OF FUNC. EVALS.: 130
 CUMULATIVE NO. OF FUNC. EVALS.:     1270
 NPARAMETR:  7.0287E+00  5.6425E+00  4.2606E+00  1.3478E+00  3.8700E+00  2.0001E-01  1.0727E-01  9.6936E-02  8.8632E-02  7.2990E-02
             1.1131E-01
 PARAMETER:  1.0041E-01  9.8992E-02  9.4681E-02  8.9856E-02  9.6749E-02 -4.3893E-01 -6.7642E-02 -1.1829E-01 -1.6307E-01 -2.6016E-01
            -4.9169E-02
 GRADIENT:   2.9190E+04 -6.1014E+03  2.6657E+03 -2.6313E+01 -7.9777E+01  7.6609E+00  6.0460E+00  2.1424E+00  1.1459E-01  8.1230E-01
             6.4015E-01
 
0ITERATION NO.:   55    OBJECTIVE VALUE:   21039.3711422213        NO. OF FUNC. EVALS.: 131
 CUMULATIVE NO. OF FUNC. EVALS.:     1401
 NPARAMETR:  7.0405E+00  5.6599E+00  4.2612E+00  1.3489E+00  3.8674E+00  1.9985E-01  1.0396E-01  9.8154E-02  8.8590E-02  7.1238E-02
             1.1079E-01
 PARAMETER:  1.0058E-01  9.9297E-02  9.4692E-02  8.9930E-02  9.6686E-02 -4.3991E-01 -8.3291E-02 -1.1205E-01 -1.6331E-01 -2.7230E-01
            -5.1494E-02
 GRADIENT:   2.9371E+04 -6.1151E+03  2.7619E+03  7.2655E-01 -9.2693E-01  1.8901E+00  3.7287E+00  1.3450E+00 -4.7444E-02  6.1210E-02
             1.5326E-01
 
0ITERATION NO.:   60    OBJECTIVE VALUE:   21039.1046518027        NO. OF FUNC. EVALS.: 143
 CUMULATIVE NO. OF FUNC. EVALS.:     1544             RESET HESSIAN, TYPE I
 NPARAMETR:  7.0628E+00  5.6879E+00  4.2612E+00  1.3482E+00  3.8639E+00  1.9978E-01  9.8536E-02  8.8034E-02  8.8609E-02  7.2284E-02
             1.1055E-01
 PARAMETER:  1.0090E-01  9.9788E-02  9.4694E-02  8.9880E-02  9.6597E-02 -4.4040E-01 -1.1011E-01 -1.6646E-01 -1.6320E-01 -2.6502E-01
            -5.2583E-02
 GRADIENT:   1.5648E+04  4.7332E+03  6.5524E+03  1.8570E+01  7.2582E+02 -3.4262E-01 -4.5447E+00 -2.4792E+00  6.6970E-02 -1.4204E-01
            -2.9433E-01
 
0ITERATION NO.:   65    OBJECTIVE VALUE:   21038.9923449000        NO. OF FUNC. EVALS.: 118
 CUMULATIVE NO. OF FUNC. EVALS.:     1662
 NPARAMETR:  7.0673E+00  5.6941E+00  4.2610E+00  1.3480E+00  3.8593E+00  1.9982E-01  1.0301E-01  9.6477E-02  8.8574E-02  7.2878E-02
             1.1139E-01
 PARAMETER:  1.0096E-01  9.9896E-02  9.4688E-02  8.9866E-02  9.6482E-02 -4.4009E-01 -8.7885E-02 -1.2067E-01 -1.6340E-01 -2.6093E-01
            -4.8801E-02
 GRADIENT:   3.0166E+04 -6.4027E+03  2.7544E+03 -7.3844E+00  4.6488E+01  1.1685E+00  3.6856E+00  8.1354E-01 -7.4320E-02 -2.3793E-02
             4.1359E-01
 
0ITERATION NO.:   70    OBJECTIVE VALUE:   21038.8364569397        NO. OF FUNC. EVALS.: 130
 CUMULATIVE NO. OF FUNC. EVALS.:     1792
 NPARAMETR:  7.0783E+00  5.7152E+00  4.2608E+00  1.3491E+00  3.8543E+00  1.9984E-01  1.0182E-01  1.0056E-01  8.8601E-02  7.3427E-02
             1.1087E-01
 PARAMETER:  1.0112E-01  1.0027E-01  9.4685E-02  8.9942E-02  9.6357E-02 -4.4000E-01 -9.3720E-02 -9.9937E-02 -1.6325E-01 -2.5717E-01
            -5.1128E-02
 GRADIENT:   2.9974E+04 -6.3069E+03  2.7482E+03  1.1622E+01 -3.0374E+01  1.8902E+00  4.2951E+00  1.2856E+00 -5.0844E-02 -1.7474E-01
             1.4920E-01
 
0ITERATION NO.:   75    OBJECTIVE VALUE:   21038.6807849886        NO. OF FUNC. EVALS.: 123
 CUMULATIVE NO. OF FUNC. EVALS.:     1915
 NPARAMETR:  7.0892E+00  5.7307E+00  4.2609E+00  1.3484E+00  3.8529E+00  1.9980E-01  9.7761E-02  1.0608E-01  8.8603E-02  7.4042E-02
             1.1177E-01
 PARAMETER:  1.0127E-01  1.0054E-01  9.4686E-02  8.9895E-02  9.6322E-02 -4.4022E-01 -1.1406E-01 -7.3228E-02 -1.6323E-01 -2.5300E-01
            -4.7098E-02
 GRADIENT:   3.0161E+04 -6.3796E+03  2.7599E+03  7.4775E+00  4.4084E+01  9.5018E-01  2.5018E+00  1.0649E+00 -3.7499E-02 -6.5334E-02
             4.2124E-01
 
0ITERATION NO.:   80    OBJECTIVE VALUE:   21038.5653697591        NO. OF FUNC. EVALS.: 142
 CUMULATIVE NO. OF FUNC. EVALS.:     2057             RESET HESSIAN, TYPE I
 NPARAMETR:  7.1002E+00  5.7502E+00  4.2609E+00  1.3478E+00  3.8508E+00  1.9978E-01  9.4037E-02  1.0127E-01  8.8598E-02  7.4267E-02
             1.1130E-01
 PARAMETER:  1.0143E-01  1.0088E-01  9.4687E-02  8.9851E-02  9.6269E-02 -4.4038E-01 -1.3347E-01 -9.6418E-02 -1.6326E-01 -2.5149E-01
            -4.9225E-02
 GRADIENT:   1.5542E+04  5.1096E+03  6.5313E+03  3.4119E+01  6.1266E+02  8.3312E-01 -2.5632E+00 -1.4707E+00 -2.8690E-02 -2.4878E-01
            -6.7564E-02
 
0ITERATION NO.:   85    OBJECTIVE VALUE:   21038.4934983271        NO. OF FUNC. EVALS.: 132
 CUMULATIVE NO. OF FUNC. EVALS.:     2189             RESET HESSIAN, TYPE I
 NPARAMETR:  7.1069E+00  5.7583E+00  4.2610E+00  1.3470E+00  3.8488E+00  1.9976E-01  9.4021E-02  1.0320E-01  8.8613E-02  7.5210E-02
             1.1134E-01
 PARAMETER:  1.0153E-01  1.0102E-01  9.4688E-02  8.9799E-02  9.6221E-02 -4.4048E-01 -1.3356E-01 -8.7007E-02 -1.6318E-01 -2.4518E-01
            -4.9031E-02
 GRADIENT:   1.5753E+04  5.0607E+03  6.5327E+03  2.3352E+01  6.0471E+02  5.8683E-01 -1.5657E+00 -1.0121E+00  1.8138E-02 -8.7798E-02
            -4.0105E-02
 
0ITERATION NO.:   90    OBJECTIVE VALUE:   21038.4413127309        NO. OF FUNC. EVALS.: 122
 CUMULATIVE NO. OF FUNC. EVALS.:     2311
 NPARAMETR:  7.1120E+00  5.7670E+00  4.2609E+00  1.3472E+00  3.8465E+00  1.9977E-01  9.3902E-02  1.0420E-01  8.8614E-02  7.5848E-02
             1.1102E-01
 PARAMETER:  1.0160E-01  1.0118E-01  9.4686E-02  8.9813E-02  9.6161E-02 -4.4044E-01 -1.3419E-01 -8.2181E-02 -1.6317E-01 -2.4095E-01
            -5.0442E-02
 GRADIENT:   3.0217E+04 -6.4259E+03  2.7771E+03 -1.7849E-01  1.2235E+02 -3.9556E-01 -1.1167E+00 -8.0633E-01  1.1457E-02 -5.8773E-02
            -1.7681E-01
 
0ITERATION NO.:   95    OBJECTIVE VALUE:   21038.3828820010        NO. OF FUNC. EVALS.: 138
 CUMULATIVE NO. OF FUNC. EVALS.:     2449             RESET HESSIAN, TYPE I
 NPARAMETR:  7.1201E+00  5.7769E+00  4.2607E+00  1.3468E+00  3.8436E+00  1.9978E-01  9.3983E-02  1.1081E-01  8.8615E-02  7.6264E-02
             1.1126E-01
 PARAMETER:  1.0172E-01  1.0135E-01  9.4683E-02  8.9790E-02  9.6090E-02 -4.4040E-01 -1.3376E-01 -5.1393E-02 -1.6317E-01 -2.3822E-01
            -4.9367E-02
 GRADIENT:   1.5986E+04  5.0479E+03  6.5063E+03  2.2463E+01  5.0217E+02  1.5047E+00  1.6179E+00  8.1423E-01 -9.5589E-03 -1.9745E-02
            -1.0349E-02
 
0ITERATION NO.:  100    OBJECTIVE VALUE:   21038.3413328914        NO. OF FUNC. EVALS.: 127
 CUMULATIVE NO. OF FUNC. EVALS.:     2576             RESET HESSIAN, TYPE I
 NPARAMETR:  7.1237E+00  5.7860E+00  4.2608E+00  1.3471E+00  3.8419E+00  1.9978E-01  9.3097E-02  1.0986E-01  8.8599E-02  7.6435E-02
             1.1139E-01
 PARAMETER:  1.0177E-01  1.0151E-01  9.4683E-02  8.9805E-02  9.6048E-02 -4.4038E-01 -1.3850E-01 -5.5695E-02 -1.6326E-01 -2.3710E-01
            -4.8789E-02
 GRADIENT:   1.5734E+04  5.2158E+03  6.5120E+03  3.0754E+01  4.9209E+02  1.7128E+00  5.3903E-01  2.2385E-01 -5.7026E-02 -9.4860E-02
            -1.7083E-03
 
0ITERATION NO.:  105    OBJECTIVE VALUE:   21038.3061781653        NO. OF FUNC. EVALS.: 130
 CUMULATIVE NO. OF FUNC. EVALS.:     2706             RESET HESSIAN, TYPE I
 NPARAMETR:  7.1299E+00  5.7939E+00  4.2610E+00  1.3461E+00  3.8411E+00  1.9976E-01  9.2443E-02  1.1297E-01  8.8616E-02  7.7209E-02
             1.1139E-01
 PARAMETER:  1.0186E-01  1.0165E-01  9.4688E-02  8.9739E-02  9.6029E-02 -4.4049E-01 -1.4202E-01 -4.1744E-02 -1.6316E-01 -2.3206E-01
            -4.8807E-02
 GRADIENT:   1.5918E+04  5.1758E+03  6.5373E+03  2.0329E+01  5.2236E+02  1.2476E+00  1.1469E+00  6.9642E-01 -2.1759E-03  6.3027E-02
            -3.2676E-02
 
0ITERATION NO.:  110    OBJECTIVE VALUE:   21038.2936448433        NO. OF FUNC. EVALS.: 128
 CUMULATIVE NO. OF FUNC. EVALS.:     2834
 NPARAMETR:  7.1342E+00  5.7986E+00  4.2607E+00  1.3463E+00  3.8386E+00  1.9978E-01  9.2832E-02  1.1420E-01  8.8608E-02  7.7324E-02
             1.1169E-01
 PARAMETER:  1.0192E-01  1.0173E-01  9.4682E-02  8.9751E-02  9.5965E-02 -4.4040E-01 -1.3992E-01 -3.6352E-02 -1.6320E-01 -2.3132E-01
            -4.7472E-02
 GRADIENT:   3.0693E+04 -6.6424E+03  2.7491E+03 -3.6212E+00  1.8573E+01  5.9195E-01  2.1859E+00  1.2323E+00 -3.8950E-02  1.4088E-02
             1.5229E-01
 
0ITERATION NO.:  115    OBJECTIVE VALUE:   21038.2584507745        NO. OF FUNC. EVALS.: 127
 CUMULATIVE NO. OF FUNC. EVALS.:     2961
 NPARAMETR:  7.1368E+00  5.8063E+00  4.2607E+00  1.3465E+00  3.8378E+00  1.9978E-01  9.1358E-02  1.1339E-01  8.8622E-02  7.7267E-02
             1.1172E-01
 PARAMETER:  1.0195E-01  1.0187E-01  9.4682E-02  8.9769E-02  9.5946E-02 -4.4039E-01 -1.4792E-01 -3.9900E-02 -1.6313E-01 -2.3168E-01
            -4.7298E-02
 GRADIENT:   3.0405E+04 -6.5168E+03  2.7579E+03  5.2252E+00  3.7578E+01  5.8305E-01  5.2871E-01  3.9162E-01 -1.2555E-02 -8.3004E-02
             8.7954E-02
 
0ITERATION NO.:  120    OBJECTIVE VALUE:   21038.2304510164        NO. OF FUNC. EVALS.: 138
 CUMULATIVE NO. OF FUNC. EVALS.:     3099             RESET HESSIAN, TYPE I
 NPARAMETR:  7.1429E+00  5.8119E+00  4.2607E+00  1.3461E+00  3.8370E+00  1.9975E-01  9.0907E-02  1.1271E-01  8.8611E-02  7.7904E-02
             1.1163E-01
 PARAMETER:  1.0204E-01  1.0196E-01  9.4682E-02  8.9740E-02  9.5925E-02 -4.4054E-01 -1.5040E-01 -4.2899E-02 -1.6319E-01 -2.2758E-01
            -4.7717E-02
 GRADIENT:   1.6098E+04  5.2049E+03  6.5130E+03  2.2330E+01  5.3207E+02  1.0027E+00  1.4732E-01  6.6054E-02 -1.8661E-02 -2.2175E-02
             2.4512E-02
 
0ITERATION NO.:  125    OBJECTIVE VALUE:   21038.2166415907        NO. OF FUNC. EVALS.: 124
 CUMULATIVE NO. OF FUNC. EVALS.:     3223
 NPARAMETR:  7.1483E+00  5.8170E+00  4.2606E+00  1.3460E+00  3.8356E+00  1.9975E-01  9.0876E-02  1.1355E-01  8.8623E-02  7.8164E-02
             1.1184E-01
 PARAMETER:  1.0212E-01  1.0205E-01  9.4681E-02  8.9733E-02  9.5891E-02 -4.4055E-01 -1.5057E-01 -3.9205E-02 -1.6312E-01 -2.2591E-01
            -4.6784E-02
 GRADIENT:   3.1045E+04 -6.8062E+03  2.7588E+03 -4.8826E+00  1.0071E+02 -3.7668E-01  6.6877E-01  3.0053E-01  8.4352E-03 -3.7219E-02
             1.4329E-01
 
0ITERATION NO.:  129    OBJECTIVE VALUE:   21038.2055435159        NO. OF FUNC. EVALS.: 100
 CUMULATIVE NO. OF FUNC. EVALS.:     3323
 NPARAMETR:  7.1497E+00  5.8201E+00  4.2606E+00  1.3452E+00  3.8351E+00  1.9975E-01  9.0481E-02  1.1288E-01  8.8624E-02  7.8496E-02
             1.1163E-01
 PARAMETER:  1.0214E-01  1.0211E-01  9.4681E-02  8.9682E-02  9.5879E-02 -4.4054E-01 -1.5275E-01 -4.2164E-02 -1.6312E-01 -2.2380E-01
            -4.7715E-02
 GRADIENT:   1.1369E+02 -1.9796E+02 -3.1448E+00 -1.1680E+01  5.4582E+01 -3.3293E-01  6.2593E-02 -1.4209E-02  5.5293E-02  4.7070E-02
             2.3753E-03
 
 #TERM:
0MINIMIZATION SUCCESSFUL
 HOWEVER, PROBLEMS OCCURRED WITH THE MINIMIZATION.
 REGARD THE RESULTS OF THE ESTIMATION STEP CAREFULLY, AND ACCEPT THEM ONLY
 AFTER CHECKING THAT THE COVARIANCE STEP PRODUCES REASONABLE OUTPUT.
 NO. OF FUNCTION EVALUATIONS USED:     3323
 NO. OF SIG. DIGITS IN FINAL EST.:  2.2

 ETABAR IS THE ARITHMETIC MEAN OF THE ETA-ESTIMATES,
 AND THE P-VALUE IS GIVEN FOR THE NULL HYPOTHESIS THAT THE TRUE MEAN IS 0.
 
 ETABAR:         7.6258E-03 -8.5230E-03 -5.4262E-03  1.4606E-02 -1.2902E-02
 SE:             2.0952E-02  1.6842E-02  2.6512E-02  1.2157E-02  2.1188E-02
 N:                     120         120         120         120         120
 
 P VAL.:         7.1589E-01  6.1281E-01  8.3783E-01  2.2956E-01  5.4256E-01
 
 ETASHRINKSD(%)  2.3377E+01  4.4857E+01  2.0356E+00  5.2269E+01  3.0241E+01
 ETASHRINKVR(%)  4.1290E+01  6.9593E+01  4.0298E+00  7.7218E+01  5.1337E+01
 EBVSHRINKSD(%)  2.2547E+01  4.5204E+01  2.6250E+00  5.2207E+01  3.0064E+01
 EBVSHRINKVR(%)  4.0011E+01  6.9974E+01  5.1812E+00  7.7159E+01  5.1089E+01
 EPSSHRINKSD(%)  6.4409E+00
 EPSSHRINKVR(%)  1.2467E+01
 
  
 TOTAL DATA POINTS NORMALLY DISTRIBUTED (N):         2280
 N*LOG(2PI) CONSTANT TO OBJECTIVE FUNCTION:    4190.35971141331     
 OBJECTIVE FUNCTION VALUE WITHOUT CONSTANT:    21038.2055435159     
 OBJECTIVE FUNCTION VALUE WITH CONSTANT:       25228.5652549292     
 REPORTED OBJECTIVE FUNCTION DOES NOT CONTAIN CONSTANT
  
 TOTAL EFFECTIVE ETAS (NIND*NETA):                           600
  
 #TERE:
 Elapsed estimation  time in seconds:  1468.80
 Elapsed covariance  time in seconds:    62.05
 Elapsed postprocess time in seconds:     0.66
1
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 ************************************************************************************************************************
 ********************                                                                                ********************
 ********************               FIRST ORDER CONDITIONAL ESTIMATION WITH INTERACTION              ********************
 #OBJT:**************                       MINIMUM VALUE OF OBJECTIVE FUNCTION                      ********************
 ********************                                                                                ********************
 ************************************************************************************************************************
 





 #OBJV:********************************************    21038.206       **************************************************
1
 ************************************************************************************************************************
 ********************                                                                                ********************
 ********************               FIRST ORDER CONDITIONAL ESTIMATION WITH INTERACTION              ********************
 ********************                             FINAL PARAMETER ESTIMATE                           ********************
 ********************                                                                                ********************
 ************************************************************************************************************************
 


 THETA - VECTOR OF FIXED EFFECTS PARAMETERS   *********


         TH 1      TH 2      TH 3      TH 4      TH 5      TH 6     
 
         7.15E+00  5.82E+00  4.26E+00  1.35E+00  3.84E+00  2.00E-01
 


 OMEGA - COV MATRIX FOR RANDOM EFFECTS - ETAS  ********


         ETA1      ETA2      ETA3      ETA4      ETA5     
 
 ETA1
+        9.05E-02
 
 ETA2
+        0.00E+00  1.13E-01
 
 ETA3
+        0.00E+00  0.00E+00  8.86E-02
 
 ETA4
+        0.00E+00  0.00E+00  0.00E+00  7.85E-02
 
 ETA5
+        0.00E+00  0.00E+00  0.00E+00  0.00E+00  1.12E-01
 


 SIGMA - COV MATRIX FOR RANDOM EFFECTS - EPSILONS  ****


         EPS1     
 
 EPS1
+        1.00E+00
 
1


 OMEGA - CORR MATRIX FOR RANDOM EFFECTS - ETAS  *******


         ETA1      ETA2      ETA3      ETA4      ETA5     
 
 ETA1
+        3.01E-01
 
 ETA2
+        0.00E+00  3.36E-01
 
 ETA3
+        0.00E+00  0.00E+00  2.98E-01
 
 ETA4
+        0.00E+00  0.00E+00  0.00E+00  2.80E-01
 
 ETA5
+        0.00E+00  0.00E+00  0.00E+00  0.00E+00  3.34E-01
 


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
 
         1.57E-01  2.41E-01  2.79E-02  6.71E-02  7.07E-02  3.66E-03
 


 OMEGA - COV MATRIX FOR RANDOM EFFECTS - ETAS  ********


         ETA1      ETA2      ETA3      ETA4      ETA5     
 
 ETA1
+        2.84E-02
 
 ETA2
+       .........  5.93E-02
 
 ETA3
+       ......... .........  1.20E-02
 
 ETA4
+       ......... ......... .........  3.74E-02
 
 ETA5
+       ......... ......... ......... .........  3.28E-02
 


 SIGMA - COV MATRIX FOR RANDOM EFFECTS - EPSILONS  ****


         EPS1     
 
 EPS1
+       .........
 
1


 OMEGA - CORR MATRIX FOR RANDOM EFFECTS - ETAS  *******


         ETA1      ETA2      ETA3      ETA4      ETA5     
 
 ETA1
+        4.71E-02
 
 ETA2
+       .........  8.82E-02
 
 ETA3
+       ......... .........  2.02E-02
 
 ETA4
+       ......... ......... .........  6.68E-02
 
 ETA5
+       ......... ......... ......... .........  4.91E-02
 


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
+        2.47E-02
 
 TH 2
+        3.68E-02  5.81E-02
 
 TH 3
+       -7.02E-04 -1.11E-03  7.78E-04
 
 TH 4
+        2.84E-03  3.27E-03 -1.35E-04  4.51E-03
 
 TH 5
+       -8.27E-03 -1.22E-02  4.46E-05 -1.47E-03  5.00E-03
 
 TH 6
+       -5.23E-05 -5.34E-05 -1.05E-05 -1.50E-05  1.24E-05  1.34E-05
 
 OM11
+       -1.60E-03 -2.77E-03  1.38E-04  7.96E-05  1.17E-04  2.19E-06  8.04E-04
 
 OM12
+       ......... ......... ......... ......... ......... ......... ......... .........
 
 OM13
+       ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 OM14
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 OM15
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 OM22
+        2.79E-03  5.14E-03 -1.61E-04 -3.38E-04  3.56E-04 -1.26E-05 -1.17E-03 ......... ......... ......... .........  3.51E-03
 
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
+       -3.57E-04 -5.74E-04  5.13E-05 -6.45E-05  2.01E-04  5.46E-07 -9.33E-06 ......... ......... ......... .........  4.82E-05
         ......... ......... .........  1.44E-04
 
 OM34
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
         ......... ......... ......... ......... .........
 
 OM35
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
         ......... ......... ......... ......... ......... .........
 
 OM44
+        2.76E-03  3.69E-03 -7.85E-05  1.26E-03 -1.41E-03 -1.67E-05  7.09E-05 ......... ......... ......... ......... -2.85E-04
         ......... ......... ......... -6.93E-05 ......... .........  1.40E-03
 
1

            TH 1      TH 2      TH 3      TH 4      TH 5      TH 6      OM11      OM12      OM13      OM14      OM15      OM22  
             OM23      OM24      OM25      OM33      OM34      OM35      OM44      OM45      OM55      SG11  
 
 OM45
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
         ......... ......... ......... ......... ......... ......... ......... .........
 
 OM55
+       -2.91E-04  1.13E-04  9.19E-05 -7.03E-04 -1.18E-04 -1.29E-05 -9.62E-05 ......... ......... ......... .........  1.27E-04
         ......... ......... ......... -9.27E-06 ......... ......... -3.20E-04 .........  1.07E-03
 
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
+        1.57E-01
 
 TH 2
+        9.71E-01  2.41E-01
 
 TH 3
+       -1.60E-01 -1.65E-01  2.79E-02
 
 TH 4
+        2.69E-01  2.02E-01 -7.22E-02  6.71E-02
 
 TH 5
+       -7.44E-01 -7.18E-01  2.26E-02 -3.09E-01  7.07E-02
 
 TH 6
+       -9.09E-02 -6.05E-02 -1.03E-01 -6.12E-02  4.80E-02  3.66E-03
 
 OM11
+       -3.60E-01 -4.05E-01  1.75E-01  4.18E-02  5.84E-02  2.11E-02  2.84E-02
 
 OM12
+       ......... ......... ......... ......... ......... ......... ......... .........
 
 OM13
+       ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 OM14
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 OM15
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 OM22
+        3.00E-01  3.60E-01 -9.76E-02 -8.50E-02  8.49E-02 -5.81E-02 -6.98E-01 ......... ......... ......... .........  5.93E-02
 
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
+       -1.89E-01 -1.98E-01  1.53E-01 -8.00E-02  2.36E-01  1.24E-02 -2.74E-02 ......... ......... ......... .........  6.77E-02
         ......... ......... .........  1.20E-02
 
 OM34
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
         ......... ......... ......... ......... .........
 
 OM35
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
         ......... ......... ......... ......... ......... .........
 
 OM44
+        4.70E-01  4.09E-01 -7.52E-02  5.02E-01 -5.32E-01 -1.22E-01  6.68E-02 ......... ......... ......... ......... -1.28E-01
         ......... ......... ......... -1.54E-01 ......... .........  3.74E-02
 
1

            TH 1      TH 2      TH 3      TH 4      TH 5      TH 6      OM11      OM12      OM13      OM14      OM15      OM22  
             OM23      OM24      OM25      OM33      OM34      OM35      OM44      OM45      OM55      SG11  
 
 OM45
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
         ......... ......... ......... ......... ......... ......... ......... .........
 
 OM55
+       -5.65E-02  1.42E-02  1.01E-01 -3.19E-01 -5.08E-02 -1.07E-01 -1.03E-01 ......... ......... ......... .........  6.51E-02
         ......... ......... ......... -2.35E-02 ......... ......... -2.61E-01 .........  3.28E-02
 
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
+        9.31E+02
 
 TH 2
+       -5.50E+02  3.86E+02
 
 TH 3
+        2.67E+01  2.80E+01  1.44E+03
 
 TH 4
+       -6.29E+01  4.75E+01  2.37E+01  3.24E+02
 
 TH 5
+        1.55E+02  5.43E+01  1.48E+02  5.03E+01  6.90E+02
 
 TH 6
+        1.44E+03 -8.12E+02  1.21E+03  1.36E+02  6.10E+02  8.14E+04
 
 OM11
+        5.15E+01  3.50E+01 -2.55E+02  1.73E+01  1.95E+01  4.08E+02  2.65E+03
 
 OM12
+       ......... ......... ......... ......... ......... ......... ......... .........
 
 OM13
+       ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 OM14
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 OM15
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 OM22
+        5.08E+01 -1.14E+02 -7.56E+01 -8.13E+00 -2.41E+02  5.27E+02  7.63E+02 ......... ......... ......... .........  6.94E+02
 
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
+       -1.85E+02  1.56E+02 -5.06E+02  1.09E+01 -1.96E+02 -5.99E+02  2.00E+02 ......... ......... ......... ......... -1.21E+02
         ......... ......... .........  7.65E+03
 
 OM34
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
         ......... ......... ......... ......... .........
 
 OM35
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
         ......... ......... ......... ......... ......... .........
 
 OM44
+       -9.61E+01  2.09E+01  5.13E+01 -2.10E+02  2.06E+02  1.31E+03 -1.32E+02 ......... ......... ......... .........  6.68E+01
         ......... ......... .........  7.16E+01 ......... .........  1.34E+03
 
1

            TH 1      TH 2      TH 3      TH 4      TH 5      TH 6      OM11      OM12      OM13      OM14      OM15      OM22  
             OM23      OM24      OM25      OM33      OM34      OM35      OM44      OM45      OM55      SG11  
 
 OM45
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
         ......... ......... ......... ......... ......... ......... ......... .........
 
 OM55
+        2.69E+02 -1.40E+02 -7.55E+01  1.35E+02  2.29E+02  1.86E+03  1.60E+02 ......... ......... ......... .........  1.21E+01
         ......... ......... .........  7.47E+01 ......... .........  2.49E+02 .........  1.25E+03
 
 SG11
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
         ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 Elapsed finaloutput time in seconds:     0.20
1THERE ARE ERROR MESSAGES IN FILE PRDERR                                                                  
 #CPUT: Total CPU Time in Seconds,     1532.172
