Run Start Date:  29/08/2019 
Run Start Time: 17:36:19.63 
Run Stop Date:   29/08/2019 
Run Stop Time:  18:03:47.26 
  
************************************************************************************************************************ 
********************                            CONTROL STREAM                                      ******************** 
************************************************************************************************************************ 
  
$PROB    BOLUS_2CPT_V1QV2VMKM ALL DOSES FOCEI (120 Ind/6960 Obs) runODE042
$INPUT   ID TIME DV LNDV MDV AMT EVID DOSE VI VMI KMI QI V2I SD CMT
$DATA    BOLUS_2CPTMM.csv IGNORE=@
$SUBR    ADVAN13 TOL=6
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
        ONEHEADER NOPRINT FILE=runODE042.csv   
   
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
 BOLUS_2CPT_V1QV2VMKM ALL DOSES FOCEI (120 Ind/6960 Obs) runODE042
0DATA CHECKOUT RUN:              NO
 DATA SET LOCATED ON UNIT NO.:    2
 THIS UNIT TO BE REWOUND:        NO
 NO. OF DATA RECS IN DATA SET:     7920
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
 NRD (RELATIVE) VALUE(S) OF TOLERANCE:   6
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
 RAW OUTPUT FILE (FILE): runODE042.ext
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

 
0ITERATION NO.:    0    OBJECTIVE VALUE:   71864.2623448390        NO. OF FUNC. EVALS.:   8
 CUMULATIVE NO. OF FUNC. EVALS.:        8
 NPARAMETR:  7.0000E+00  5.7000E+00  4.5000E+00  1.5000E+00  4.0000E+00  3.0000E-01  1.5000E-01  1.5000E-01  1.5000E-01  1.5000E-01
             1.5000E-01
 PARAMETER:  1.0000E-01  1.0000E-01  1.0000E-01  1.0000E-01  1.0000E-01  1.0000E-01  1.0000E-01  1.0000E-01  1.0000E-01  1.0000E-01
             1.0000E-01
 GRADIENT:   4.3914E+04  1.9049E+04  2.0301E+04  1.2916E+03  3.9936E+03  4.4363E+03  7.5494E+01  1.3898E+01  3.9495E+01  1.5049E+01
             4.5638E+01
 
0ITERATION NO.:    5    OBJECTIVE VALUE:   70410.6181345680        NO. OF FUNC. EVALS.: 111
 CUMULATIVE NO. OF FUNC. EVALS.:      119
 NPARAMETR:  6.8091E+00  5.4659E+00  4.3600E+00  1.3973E+00  3.9834E+00  1.8981E-01  6.8361E-02  1.4000E-01  6.1573E-02  9.9414E-02
             1.4985E-01
 PARAMETER:  9.7273E-02  9.5893E-02  9.6889E-02  9.3154E-02  9.9585E-02 -5.0398E-01 -2.9292E-01  6.5496E-02 -3.4521E-01 -1.0567E-01
             9.9516E-02
 GRADIENT:   1.7164E+05 -1.9144E+04  2.2381E+04  8.7143E+02  3.8439E+03 -1.3368E+03 -6.1000E+01  1.6386E+01 -1.1876E+02 -2.0259E+01
             2.8179E+01
 
0ITERATION NO.:   10    OBJECTIVE VALUE:   70317.7940861902        NO. OF FUNC. EVALS.: 123
 CUMULATIVE NO. OF FUNC. EVALS.:      242
 NPARAMETR:  6.8674E+00  5.4272E+00  4.2689E+00  1.3905E+00  3.9124E+00  1.9921E-01  1.0119E-01  1.1711E-01  9.2967E-02  1.2472E-01
             1.2168E-01
 PARAMETER:  9.8105E-02  9.5213E-02  9.4864E-02  9.2698E-02  9.7811E-02 -4.4395E-01 -9.6818E-02 -2.3755E-02 -1.3920E-01  7.7098E-03
            -4.6400E-03
 GRADIENT:   8.5697E+04  1.9168E+04  1.3786E+04  2.8661E+02  1.9635E+03 -2.6426E+02  1.7110E+01  1.0673E+01  1.9167E+01 -3.8148E+00
             1.7590E+01
 
0ITERATION NO.:   15    OBJECTIVE VALUE:   70313.3794582544        NO. OF FUNC. EVALS.: 102
 CUMULATIVE NO. OF FUNC. EVALS.:      344
 NPARAMETR:  6.8708E+00  5.4259E+00  4.2596E+00  1.3600E+00  3.9144E+00  2.0272E-01  9.5293E-02  1.0941E-01  8.4060E-02  1.2822E-01
             1.0941E-01
 PARAMETER:  9.8155E-02  9.5191E-02  9.4659E-02  9.0666E-02  9.7861E-02 -4.2209E-01 -1.2684E-01 -5.7745E-02 -1.8955E-01  2.1555E-02
            -5.7777E-02
 GRADIENT:   1.6533E+05 -2.1218E+04  4.0241E+03 -5.9314E+01  1.6368E+02  6.8098E+01  9.0418E+00  7.2905E+00 -1.4700E+00 -2.1890E+00
             8.9555E+00
 
0ITERATION NO.:   20    OBJECTIVE VALUE:   70312.9711386997        NO. OF FUNC. EVALS.:  95
 CUMULATIVE NO. OF FUNC. EVALS.:      439
 NPARAMETR:  6.8734E+00  5.4256E+00  4.2597E+00  1.3645E+00  3.9154E+00  2.0240E-01  8.4601E-02  1.0672E-01  8.4269E-02  1.2919E-01
             1.0716E-01
 PARAMETER:  9.8192E-02  9.5186E-02  9.4660E-02  9.0964E-02  9.7884E-02 -4.2408E-01 -1.8634E-01 -7.0214E-02 -1.8831E-01  2.5327E-02
            -6.8146E-02
 GRADIENT:   1.6589E+05 -2.1252E+04  4.1230E+03 -3.0542E+01  3.0974E+02  3.3748E+01 -7.7935E+00  5.5293E+00 -9.4898E-01 -2.6565E+00
             6.1320E+00
 
0ITERATION NO.:   25    OBJECTIVE VALUE:   70312.3423252436        NO. OF FUNC. EVALS.: 151
 CUMULATIVE NO. OF FUNC. EVALS.:      590             RESET HESSIAN, TYPE I
 NPARAMETR:  6.8877E+00  5.4392E+00  4.2610E+00  1.3532E+00  3.9164E+00  2.0205E-01  8.9804E-02  1.0575E-01  8.4827E-02  1.3037E-01
             9.9097E-02
 PARAMETER:  9.8396E-02  9.5425E-02  9.4689E-02  9.0213E-02  9.7909E-02 -4.2623E-01 -1.5650E-01 -7.4767E-02 -1.8501E-01  2.9880E-02
            -1.0727E-01
 GRADIENT:   8.5737E+04  1.9050E+04  1.2271E+04 -8.4318E+00  1.8769E+03  6.3917E+00  8.8903E-01  3.4183E+00  4.3965E-01 -8.3648E+00
             1.3730E+00
 
0ITERATION NO.:   30    OBJECTIVE VALUE:   70312.0767446302        NO. OF FUNC. EVALS.:  86
 CUMULATIVE NO. OF FUNC. EVALS.:      676
 NPARAMETR:  6.8856E+00  5.4380E+00  4.2616E+00  1.3618E+00  3.9168E+00  2.0202E-01  8.9170E-02  9.9817E-02  8.4647E-02  1.4203E-01
             9.7532E-02
 PARAMETER:  9.8366E-02  9.5403E-02  9.4702E-02  9.0789E-02  9.7920E-02 -4.2642E-01 -1.6005E-01 -1.0365E-01 -1.8607E-01  7.2714E-02
            -1.1523E-01
 GRADIENT:   8.5493E+04  1.9078E+04  1.2430E+04 -5.8240E+00  1.9555E+03  3.8023E+00 -4.9950E-01 -5.1887E-01 -2.1530E-01 -2.1506E+00
            -1.8266E+00
 
0ITERATION NO.:   35    OBJECTIVE VALUE:   70312.0147124303        NO. OF FUNC. EVALS.: 124
 CUMULATIVE NO. OF FUNC. EVALS.:      800
 NPARAMETR:  6.8890E+00  5.4411E+00  4.2606E+00  1.3663E+00  3.9171E+00  2.0201E-01  8.8783E-02  1.0114E-01  8.4796E-02  1.4870E-01
             9.9455E-02
 PARAMETER:  9.8414E-02  9.5458E-02  9.4681E-02  9.1089E-02  9.7928E-02 -4.2650E-01 -1.6222E-01 -9.7048E-02 -1.8519E-01  9.5651E-02
            -1.0547E-01
 GRADIENT:   8.5838E+04  1.9173E+04  1.2354E+04  2.6718E+01  2.0049E+03  5.7660E+00 -6.6265E-01  1.3978E-01  1.0597E-01 -2.4004E-01
             1.2036E-01
 
0ITERATION NO.:   40    OBJECTIVE VALUE:   70312.0123734105        NO. OF FUNC. EVALS.: 126
 CUMULATIVE NO. OF FUNC. EVALS.:      926             RESET HESSIAN, TYPE I
 NPARAMETR:  6.8899E+00  5.4409E+00  4.2608E+00  1.3679E+00  3.9169E+00  2.0199E-01  8.9481E-02  1.0094E-01  8.5001E-02  1.5014E-01
             9.8969E-02
 PARAMETER:  9.8427E-02  9.5455E-02  9.4684E-02  9.1192E-02  9.7921E-02 -4.2661E-01 -1.5830E-01 -9.8064E-02 -1.8399E-01  1.0045E-01
            -1.0791E-01
 GRADIENT:   8.6015E+04  1.9146E+04  1.2388E+04  3.7729E+01  1.9862E+03  4.2708E+00  4.9353E-01 -3.0957E-02  6.0636E-01  1.6395E-01
            -2.6608E-01
 
0ITERATION NO.:   45    OBJECTIVE VALUE:   70312.0111114862        NO. OF FUNC. EVALS.: 125
 CUMULATIVE NO. OF FUNC. EVALS.:     1051
 NPARAMETR:  6.8899E+00  5.4408E+00  4.2607E+00  1.3681E+00  3.9169E+00  2.0199E-01  8.9024E-02  1.0120E-01  8.4697E-02  1.5029E-01
             9.9123E-02
 PARAMETER:  9.8428E-02  9.5453E-02  9.4683E-02  9.1205E-02  9.7923E-02 -4.2663E-01 -1.6087E-01 -9.6784E-02 -1.8577E-01  1.0096E-01
            -1.0714E-01
 GRADIENT:   1.6827E+05 -2.0903E+04  4.3966E+03 -5.0426E+00  3.6392E+02  1.9100E-01 -2.2413E-01  1.5333E-01 -1.6759E-01  2.0466E-01
            -1.6170E-01
 
0ITERATION NO.:   46    OBJECTIVE VALUE:   70312.0111114862        NO. OF FUNC. EVALS.:  25
 CUMULATIVE NO. OF FUNC. EVALS.:     1076
 NPARAMETR:  6.8899E+00  5.4408E+00  4.2607E+00  1.3681E+00  3.9169E+00  2.0199E-01  8.9024E-02  1.0120E-01  8.4697E-02  1.5029E-01
             9.9123E-02
 PARAMETER:  9.8428E-02  9.5453E-02  9.4683E-02  9.1205E-02  9.7923E-02 -4.2663E-01 -1.6087E-01 -9.6784E-02 -1.8577E-01  1.0096E-01
            -1.0714E-01
 GRADIENT:  -9.1045E+00 -4.6262E+00 -3.7768E-02 -2.8620E+00 -9.9084E-01  1.5898E-01 -1.2749E-01  5.0941E-02 -8.3433E-02 -2.5154E-01
            -1.7767E-01
 
 #TERM:
0MINIMIZATION SUCCESSFUL
 HOWEVER, PROBLEMS OCCURRED WITH THE MINIMIZATION.
 REGARD THE RESULTS OF THE ESTIMATION STEP CAREFULLY, AND ACCEPT THEM ONLY
 AFTER CHECKING THAT THE COVARIANCE STEP PRODUCES REASONABLE OUTPUT.
 NO. OF FUNCTION EVALUATIONS USED:     1076
 NO. OF SIG. DIGITS IN FINAL EST.:  2.3

 ETABAR IS THE ARITHMETIC MEAN OF THE ETA-ESTIMATES,
 AND THE P-VALUE IS GIVEN FOR THE NULL HYPOTHESIS THAT THE TRUE MEAN IS 0.
 
 ETABAR:         2.7097E-03 -1.1988E-02 -7.4392E-03  2.1990E-02 -5.4361E-03
 SE:             2.3880E-02  2.0725E-02  2.5932E-02  2.3260E-02  2.2889E-02
 N:                     120         120         120         120         120
 
 P VAL.:         9.0966E-01  5.6295E-01  7.7421E-01  3.4446E-01  8.1227E-01
 
 ETASHRINKSD(%)  1.1957E+01  2.8334E+01  1.9828E+00  3.3998E+01  2.0025E+01
 ETASHRINKVR(%)  2.2483E+01  4.8639E+01  3.9263E+00  5.6438E+01  3.6039E+01
 EBVSHRINKSD(%)  1.1020E+01  2.9251E+01  2.5059E+00  3.4355E+01  2.0725E+01
 EBVSHRINKVR(%)  2.0825E+01  4.9945E+01  4.9491E+00  5.6908E+01  3.7154E+01
 EPSSHRINKSD(%)  2.6771E+00
 EPSSHRINKVR(%)  5.2826E+00
 
  
 TOTAL DATA POINTS NORMALLY DISTRIBUTED (N):         6960
 N*LOG(2PI) CONSTANT TO OBJECTIVE FUNCTION:    12791.6243822090     
 OBJECTIVE FUNCTION VALUE WITHOUT CONSTANT:    70312.0111114862     
 OBJECTIVE FUNCTION VALUE WITH CONSTANT:       83103.6354936952     
 REPORTED OBJECTIVE FUNCTION DOES NOT CONTAIN CONSTANT
  
 TOTAL EFFECTIVE ETAS (NIND*NETA):                           600
  
 #TERE:
 Elapsed estimation  time in seconds:  1465.25
 Elapsed covariance  time in seconds:   169.83
 Elapsed postprocess time in seconds:     1.91
1
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 ************************************************************************************************************************
 ********************                                                                                ********************
 ********************               FIRST ORDER CONDITIONAL ESTIMATION WITH INTERACTION              ********************
 #OBJT:**************                       MINIMUM VALUE OF OBJECTIVE FUNCTION                      ********************
 ********************                                                                                ********************
 ************************************************************************************************************************
 





 #OBJV:********************************************    70312.011       **************************************************
1
 ************************************************************************************************************************
 ********************                                                                                ********************
 ********************               FIRST ORDER CONDITIONAL ESTIMATION WITH INTERACTION              ********************
 ********************                             FINAL PARAMETER ESTIMATE                           ********************
 ********************                                                                                ********************
 ************************************************************************************************************************
 


 THETA - VECTOR OF FIXED EFFECTS PARAMETERS   *********


         TH 1      TH 2      TH 3      TH 4      TH 5      TH 6     
 
         6.89E+00  5.44E+00  4.26E+00  1.37E+00  3.92E+00  2.02E-01
 


 OMEGA - COV MATRIX FOR RANDOM EFFECTS - ETAS  ********


         ETA1      ETA2      ETA3      ETA4      ETA5     
 
 ETA1
+        8.90E-02
 
 ETA2
+        0.00E+00  1.01E-01
 
 ETA3
+        0.00E+00  0.00E+00  8.47E-02
 
 ETA4
+        0.00E+00  0.00E+00  0.00E+00  1.50E-01
 
 ETA5
+        0.00E+00  0.00E+00  0.00E+00  0.00E+00  9.91E-02
 


 SIGMA - COV MATRIX FOR RANDOM EFFECTS - EPSILONS  ****


         EPS1     
 
 EPS1
+        1.00E+00
 
1


 OMEGA - CORR MATRIX FOR RANDOM EFFECTS - ETAS  *******


         ETA1      ETA2      ETA3      ETA4      ETA5     
 
 ETA1
+        2.98E-01
 
 ETA2
+        0.00E+00  3.18E-01
 
 ETA3
+        0.00E+00  0.00E+00  2.91E-01
 
 ETA4
+        0.00E+00  0.00E+00  0.00E+00  3.88E-01
 
 ETA5
+        0.00E+00  0.00E+00  0.00E+00  0.00E+00  3.15E-01
 


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
 
         3.59E-02  5.09E-02  2.78E-02  5.52E-02  3.87E-02  1.93E-03
 


 OMEGA - COV MATRIX FOR RANDOM EFFECTS - ETAS  ********


         ETA1      ETA2      ETA3      ETA4      ETA5     
 
 ETA1
+        1.87E-02
 
 ETA2
+       .........  2.33E-02
 
 ETA3
+       ......... .........  1.03E-02
 
 ETA4
+       ......... ......... .........  4.41E-02
 
 ETA5
+       ......... ......... ......... .........  1.73E-02
 


 SIGMA - COV MATRIX FOR RANDOM EFFECTS - EPSILONS  ****


         EPS1     
 
 EPS1
+       .........
 
1


 OMEGA - CORR MATRIX FOR RANDOM EFFECTS - ETAS  *******


         ETA1      ETA2      ETA3      ETA4      ETA5     
 
 ETA1
+        3.14E-02
 
 ETA2
+       .........  3.66E-02
 
 ETA3
+       ......... .........  1.78E-02
 
 ETA4
+       ......... ......... .........  5.69E-02
 
 ETA5
+       ......... ......... ......... .........  2.75E-02
 


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
+        1.29E-03
 
 TH 2
+        1.01E-03  2.59E-03
 
 TH 3
+       -3.19E-05 -8.28E-05  7.73E-04
 
 TH 4
+       -1.97E-04 -6.23E-04 -2.86E-04  3.04E-03
 
 TH 5
+       -2.64E-04 -5.11E-04 -2.56E-05  2.95E-05  1.50E-03
 
 TH 6
+       -1.10E-05 -1.18E-06  1.34E-06  8.37E-06 -1.26E-06  3.72E-06
 
 OM11
+       -8.57E-06 -1.58E-05  2.06E-05 -3.54E-05  1.27E-05  2.33E-06  3.51E-04
 
 OM12
+       ......... ......... ......... ......... ......... ......... ......... .........
 
 OM13
+       ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 OM14
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 OM15
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 OM22
+        8.25E-05  1.99E-04  6.30E-05 -1.44E-04  9.96E-05  9.53E-07 -1.18E-05 ......... ......... ......... .........  5.43E-04
 
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
+       -3.77E-06 -2.68E-05 -1.06E-05  7.21E-06 -1.25E-05  2.74E-06 -2.44E-05 ......... ......... ......... ......... -1.09E-06
         ......... ......... .........  1.07E-04
 
 OM34
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
         ......... ......... ......... ......... .........
 
 OM35
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
         ......... ......... ......... ......... ......... .........
 
 OM44
+        1.26E-04 -4.36E-05 -9.38E-05  4.77E-04  1.74E-04 -1.66E-05  5.46E-06 ......... ......... ......... ......... -5.98E-05
         ......... ......... ......... -4.63E-05 ......... .........  1.94E-03
 
1

            TH 1      TH 2      TH 3      TH 4      TH 5      TH 6      OM11      OM12      OM13      OM14      OM15      OM22  
             OM23      OM24      OM25      OM33      OM34      OM35      OM44      OM45      OM55      SG11  
 
 OM45
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
         ......... ......... ......... ......... ......... ......... ......... .........
 
 OM55
+       -3.12E-06 -4.89E-05  4.09E-05 -2.57E-04  8.84E-05 -9.36E-07  1.62E-05 ......... ......... ......... .........  3.61E-05
         ......... ......... .........  3.30E-05 ......... .........  4.37E-05 .........  2.99E-04
 
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
+        3.59E-02
 
 TH 2
+        5.51E-01  5.09E-02
 
 TH 3
+       -3.20E-02 -5.86E-02  2.78E-02
 
 TH 4
+       -9.95E-02 -2.22E-01 -1.87E-01  5.52E-02
 
 TH 5
+       -1.90E-01 -2.59E-01 -2.38E-02  1.38E-02  3.87E-02
 
 TH 6
+       -1.59E-01 -1.20E-02  2.50E-02  7.87E-02 -1.68E-02  1.93E-03
 
 OM11
+       -1.28E-02 -1.66E-02  3.96E-02 -3.42E-02  1.75E-02  6.44E-02  1.87E-02
 
 OM12
+       ......... ......... ......... ......... ......... ......... ......... .........
 
 OM13
+       ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 OM14
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 OM15
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 OM22
+        9.86E-02  1.68E-01  9.72E-02 -1.12E-01  1.10E-01  2.12E-02 -2.70E-02 ......... ......... ......... .........  2.33E-02
 
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
+       -1.01E-02 -5.09E-02 -3.67E-02  1.26E-02 -3.12E-02  1.37E-01 -1.26E-01 ......... ......... ......... ......... -4.50E-03
         ......... ......... .........  1.03E-02
 
 OM34
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
         ......... ......... ......... ......... .........
 
 OM35
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
         ......... ......... ......... ......... ......... .........
 
 OM44
+        7.94E-02 -1.94E-02 -7.66E-02  1.96E-01  1.02E-01 -1.95E-01  6.61E-03 ......... ......... ......... ......... -5.82E-02
         ......... ......... ......... -1.02E-01 ......... .........  4.41E-02
 
1

            TH 1      TH 2      TH 3      TH 4      TH 5      TH 6      OM11      OM12      OM13      OM14      OM15      OM22  
             OM23      OM24      OM25      OM33      OM34      OM35      OM44      OM45      OM55      SG11  
 
 OM45
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
         ......... ......... ......... ......... ......... ......... ......... .........
 
 OM55
+       -5.03E-03 -5.56E-02  8.50E-02 -2.69E-01  1.32E-01 -2.81E-02  5.01E-02 ......... ......... ......... .........  8.95E-02
         ......... ......... .........  1.85E-01 ......... .........  5.74E-02 .........  1.73E-02
 
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
+        1.17E+03
 
 TH 2
+       -4.47E+02  6.38E+02
 
 TH 3
+       -1.44E+01  1.09E+02  1.38E+03
 
 TH 4
+       -2.33E+01  1.20E+02  1.33E+02  4.19E+02
 
 TH 5
+        6.88E+01  1.43E+02  6.99E+01  1.86E+01  7.61E+02
 
 TH 6
+        3.25E+03 -1.48E+03 -7.62E+02 -1.38E+03  3.29E+01  2.99E+05
 
 OM11
+       -2.62E+01  2.64E+01 -4.87E+01  2.51E+01 -8.77E+00 -2.67E+03  2.95E+03
 
 OM12
+       ......... ......... ......... ......... ......... ......... ......... .........
 
 OM13
+       ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 OM14
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 OM15
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 OM22
+       -4.14E+01 -1.80E+02 -1.66E+02  1.71E+01 -2.01E+02 -5.92E+02  9.29E+01 ......... ......... ......... .........  2.00E+03
 
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
+       -1.62E+02  1.55E+02  2.07E+02 -1.10E+02  1.52E+02 -7.57E+03  8.06E+02 ......... ......... ......... .........  5.87E+01
         ......... ......... .........  1.03E+04
 
 OM34
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
         ......... ......... ......... ......... .........
 
 OM35
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
         ......... ......... ......... ......... ......... .........
 
 OM44
+       -6.28E+01 -1.16E+01  2.67E+01 -1.16E+02 -6.86E+01  2.42E+03 -9.21E+00 ......... ......... ......... .........  6.64E+01
         ......... ......... .........  2.50E+02 ......... .........  5.88E+02
 
1

            TH 1      TH 2      TH 3      TH 4      TH 5      TH 6      OM11      OM12      OM13      OM14      OM15      OM22  
             OM23      OM24      OM25      OM33      OM34      OM35      OM44      OM45      OM55      SG11  
 
 OM45
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
         ......... ......... ......... ......... ......... ......... ......... .........
 
 OM55
+       -5.55E+01  1.46E+02 -8.45E+01  3.78E+02 -1.77E+02  3.38E+02 -2.32E+02 ......... ......... ......... ......... -1.97E+02
         ......... ......... ......... -1.40E+03 ......... ......... -2.00E+02 .........  3.98E+03
 
 SG11
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
         ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 Elapsed finaloutput time in seconds:     0.50
 #CPUT: Total CPU Time in Seconds,     1638.641
