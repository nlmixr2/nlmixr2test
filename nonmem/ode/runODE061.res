Run Start Date:  29/08/2019 
Run Start Time: 19:44:27.39 
Run Stop Date:   29/08/2019 
Run Stop Time:  20:04:21.88 
  
************************************************************************************************************************ 
********************                            CONTROL STREAM                                      ******************** 
************************************************************************************************************************ 
  
$PROB    ORAL1_2CPT_KACLV1QV2 MULTIPLE DOSE FOCEI (120 Ind/4680 Obs) runODE061
$INPUT   ID TIME DV LNDV MDV AMT EVID DOSE V1I CLI QI V2I KAI SSX IIX SD CMT
$DATA    ORAL_2CPT.csv IGNORE=@ IGNORE (SD.EQ.1)
$SUBR    ADVAN13 TOL=6
$MODEL
         COMP=(ABS,DEFDOSE)
         COMP=(CENTRAL,DEFOBS)
         COMP=(PERI)
$PK
         CL=EXP(THETA(1)+ETA(1))
         V=EXP(THETA(2)+ETA(2))
         Q=EXP(THETA(3)+ETA(3))
         V3=EXP(THETA(4)+ETA(4))
		 KA=EXP(THETA(5)+ETA(5))
         V2=V
         S2=V
		 K32=Q/V3
		 K23=Q/V
$DES
         DADT(1)= -KA*A(1)
         DADT(2)=  KA*A(1)+K32*A(3)-K23*A(2)-CL*A(2)/V2
         DADT(3)=         -K32*A(3)+K23*A(2)  		 
$ERROR   
         IPRED = F     
         RESCV = THETA(6) 
         W     = IPRED*RESCV
         IRES  = DV-IPRED
         IWRES = IRES/W
         Y     = IPRED+W*EPS(1)
$THETA   1.6       ;log Cl
$THETA   4.5       ;log Vc
$THETA   1.6       ;log Q
$THETA   4         ;log Vp
$THETA   0.2       ;log KA
$THETA   (0,0.3,1) ;RSV
$OMEGA   0.15 0.15 0.15 0.15 0.15
$SIGMA   1 FIX
$EST     NSIG=2 SIGL=6 PRINT=5 MAX=9999 NOABORT POSTHOC METHOD=COND INTER NOOBT
$COV
$TABLE  ID TIME LNDV MDV AMT EVID DOSE V1I CLI CL V Q V3 KA ETA1 ETA2 ETA3 ETA4 ETA5
        IPRED IRES IWRES CWRESI
        ONEHEADER NOPRINT FILE=runODE061.csv   
   
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
 ORAL1_2CPT_KACLV1QV2 MULTIPLE DOSE FOCEI (120 Ind/4680 Obs) runODE061
0DATA CHECKOUT RUN:              NO
 DATA SET LOCATED ON UNIT NO.:    2
 THIS UNIT TO BE REWOUND:        NO
 NO. OF DATA RECS IN DATA SET:     5520
 NO. OF DATA ITEMS IN DATA SET:  17
 ID DATA ITEM IS DATA ITEM NO.:   1
 DEP VARIABLE IS DATA ITEM NO.:   3
 MDV DATA ITEM IS DATA ITEM NO.:  5
0INDICES PASSED TO SUBROUTINE PRED:
   7   2   6   0   0   0  17   0   0   0   0
0LABELS FOR DATA ITEMS:
 ID TIME DV LNDV MDV AMT EVID DOSE V1I CLI QI V2I KAI SSX IIX SD CMT
0(NONBLANK) LABELS FOR PRED-DEFINED ITEMS:
 CL V Q V3 KA IPRED IRES IWRES
0FORMAT FOR DATA:
 (E3.0,3E6.0,E1.0,E6.0,E1.0,E6.0,2E5.0,E4.0,2E5.0,2E2.0,2E1.0)

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
 -0.1000E+07     0.1600E+01     0.1000E+07
 -0.1000E+07     0.4500E+01     0.1000E+07
 -0.1000E+07     0.1600E+01     0.1000E+07
 -0.1000E+07     0.4000E+01     0.1000E+07
 -0.1000E+07     0.2000E+00     0.1000E+07
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
 ID TIME LNDV MDV AMT EVID DOSE V1I CLI CL V Q V3 KA ETA1 ETA2 ETA3 ETA4 ETA5 IPRED IRES IWRES CWRESI
1DOUBLE PRECISION PREDPP VERSION 7.4.3

 GENERAL NONLINEAR KINETICS MODEL WITH STIFF/NONSTIFF EQUATIONS (LSODA, ADVAN13)
0MODEL SUBROUTINE USER-SUPPLIED - ID NO. 9999
0MAXIMUM NO. OF BASIC PK PARAMETERS:   5
0COMPARTMENT ATTRIBUTES
 COMPT. NO.   FUNCTION   INITIAL    ON/OFF      DOSE      DEFAULT    DEFAULT
                         STATUS     ALLOWED    ALLOWED    FOR DOSE   FOR OBS.
    1         ABS          ON         YES        YES        YES        NO
    2         CENTRAL      ON         YES        YES        NO         YES
    3         PERI         ON         YES        YES        NO         NO
    4         OUTPUT       OFF        YES        NO         NO         NO
 INITIAL (BASE) TOLERANCE SETTINGS:
 NRD (RELATIVE) VALUE(S) OF TOLERANCE:   6
 ANRD (ABSOLUTE) VALUE(S) OF TOLERANCE:  12
1
 ADDITIONAL PK PARAMETERS - ASSIGNMENT OF ROWS IN GG
 COMPT. NO.                             INDICES
              SCALE      BIOAVAIL.   ZERO-ORDER  ZERO-ORDER  ABSORB
                         FRACTION    RATE        DURATION    LAG
    1            *           *           *           *           *
    2            6           *           *           *           *
    3            *           *           *           *           *
    4            *           -           -           -           -
             - PARAMETER IS NOT ALLOWED FOR THIS MODEL
             * PARAMETER IS NOT SUPPLIED BY PK SUBROUTINE;
               WILL DEFAULT TO ONE IF APPLICABLE
0DATA ITEM INDICES USED BY PRED ARE:
   EVENT ID DATA ITEM IS DATA ITEM NO.:      7
   TIME DATA ITEM IS DATA ITEM NO.:          2
   DOSE AMOUNT DATA ITEM IS DATA ITEM NO.:   6
   COMPT. NO. DATA ITEM IS DATA ITEM NO.:   17

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
 RAW OUTPUT FILE (FILE): runODE061.ext
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

 
0ITERATION NO.:    0    OBJECTIVE VALUE:   46609.0970117758        NO. OF FUNC. EVALS.:   8
 CUMULATIVE NO. OF FUNC. EVALS.:        8
 NPARAMETR:  1.6000E+00  4.5000E+00  1.6000E+00  4.0000E+00  2.0000E-01  3.0000E-01  1.5000E-01  1.5000E-01  1.5000E-01  1.5000E-01
             1.5000E-01
 PARAMETER:  1.0000E-01  1.0000E-01  1.0000E-01  1.0000E-01  1.0000E-01  1.0000E-01  1.0000E-01  1.0000E-01  1.0000E-01  1.0000E-01
             1.0000E-01
 GRADIENT:   7.1757E+03  1.3246E+04  6.1475E+02  1.0201E+04  3.7374E+02  2.9124E+03  1.0154E+01  7.3314E+01  2.9559E+00  2.3959E+01
             2.1794E+01
 
0ITERATION NO.:    5    OBJECTIVE VALUE:   45919.1068473656        NO. OF FUNC. EVALS.:  53
 CUMULATIVE NO. OF FUNC. EVALS.:       61
 NPARAMETR:  1.1611E+00  4.3540E+00  5.4804E-02  3.2844E+00  1.2985E-01  2.4805E-01  1.4957E-01  1.4728E-01  1.4996E-01  1.4875E-01
             1.4953E-01
 PARAMETER:  7.2569E-02  9.6754E-02  3.4252E-03  8.2111E-02  6.4925E-02 -1.6172E-01  9.8581E-02  9.0841E-02  9.9858E-02  9.5824E-02
             9.8434E-02
 GRADIENT:  -1.2604E+03 -1.0604E+03 -1.9974E+03 -6.5915E+03 -8.2889E+01  2.0692E+03  3.4090E+01  1.1480E+02 -1.5435E+01 -4.7504E+01
             3.5950E+01
 
0ITERATION NO.:   10    OBJECTIVE VALUE:   45468.4747751598        NO. OF FUNC. EVALS.:  48
 CUMULATIVE NO. OF FUNC. EVALS.:      109
 NPARAMETR:  1.1273E+00  4.1399E+00  1.6599E+00  3.8261E+00 -1.8790E-01  1.9417E-01  1.3719E-01  7.3038E-02  2.9828E-01  7.2472E-02
             1.2685E-01
 PARAMETER:  7.0458E-02  9.1998E-02  1.0375E-01  9.5652E-02 -9.3950E-02 -4.7587E-01  5.5369E-02 -2.5983E-01  4.4370E-01 -2.6372E-01
             1.6180E-02
 GRADIENT:  -1.3108E+03 -8.8177E+02  2.1401E+02 -8.6575E+02 -6.0003E+01 -2.1702E+02 -1.5122E+01  1.4903E+01  8.2946E+00  1.3402E+01
             2.3774E+00
 
0ITERATION NO.:   15    OBJECTIVE VALUE:   45416.4378194720        NO. OF FUNC. EVALS.: 108
 CUMULATIVE NO. OF FUNC. EVALS.:      217
 NPARAMETR:  1.3081E+00  4.2338E+00  1.4277E+00  3.7533E+00 -7.9350E-02  1.9877E-01  8.8278E-02  6.3648E-02  2.0350E-01  7.5925E-02
             1.1020E-01
 PARAMETER:  8.1755E-02  9.4085E-02  8.9230E-02  9.3832E-02 -3.9675E-02 -4.4671E-01 -1.6507E-01 -3.2863E-01  2.5251E-01 -2.4044E-01
            -5.4153E-02
 GRADIENT:   1.4170E+02 -1.8124E+03 -4.5386E+01 -1.0070E+03 -7.6060E+00  3.8398E+01 -3.6130E+01  1.4277E+00  2.7532E-01 -1.1475E+00
            -7.6943E+00
 
0ITERATION NO.:   20    OBJECTIVE VALUE:   45415.4279765019        NO. OF FUNC. EVALS.: 102
 CUMULATIVE NO. OF FUNC. EVALS.:      319
 NPARAMETR:  1.3022E+00  4.2435E+00  1.4658E+00  3.7752E+00 -8.2470E-02  1.9793E-01  1.0393E-01  6.3068E-02  2.1278E-01  7.4988E-02
             1.2339E-01
 PARAMETER:  8.1388E-02  9.4300E-02  9.1615E-02  9.4379E-02 -4.1235E-02 -4.5196E-01 -8.3456E-02 -3.3321E-01  2.7481E-01 -2.4665E-01
             2.3534E-03
 GRADIENT:   1.0079E+02  5.3090E+02  5.2614E+01  1.5752E+01 -1.0287E+00 -1.4303E+01  3.0014E+00  6.2997E-01 -1.6361E-01  3.1454E-01
             2.2936E+00
 
0ITERATION NO.:   25    OBJECTIVE VALUE:   45413.6307027426        NO. OF FUNC. EVALS.: 125
 CUMULATIVE NO. OF FUNC. EVALS.:      444             RESET HESSIAN, TYPE I
 NPARAMETR:  1.3378E+00  4.2362E+00  1.4566E+00  3.7697E+00 -8.1504E-02  1.9811E-01  1.0277E-01  6.2839E-02  2.1202E-01  7.5024E-02
             1.2096E-01
 PARAMETER:  8.3612E-02  9.4138E-02  9.1036E-02  9.4242E-02 -4.0752E-02 -4.5082E-01 -8.9054E-02 -3.3503E-01  2.7301E-01 -2.4641E-01
            -7.6003E-03
 GRADIENT:   4.3481E+03  4.6169E+03  1.3748E+01  1.0410E+03  1.9280E+00 -2.9478E+00  3.7186E+00  2.2721E-01  3.3210E-01  1.4106E-01
             4.3985E-01
 
0ITERATION NO.:   29    OBJECTIVE VALUE:   45413.6072197901        NO. OF FUNC. EVALS.: 101
 CUMULATIVE NO. OF FUNC. EVALS.:      545
 NPARAMETR:  1.3392E+00  4.2352E+00  1.4590E+00  3.7694E+00 -8.1601E-02  1.9820E-01  1.0114E-01  6.2733E-02  2.0948E-01  7.4825E-02
             1.2030E-01
 PARAMETER:  8.3703E-02  9.4115E-02  9.1189E-02  9.4235E-02 -4.0801E-02 -4.5026E-01 -9.7062E-02 -3.3587E-01  2.6700E-01 -2.4774E-01
            -1.0318E-02
 GRADIENT:  -3.0058E+00  1.6289E+01 -2.0453E+00 -5.5900E+01  1.7028E+00 -4.8626E-01  4.3116E-02 -1.6333E-01 -4.8089E-02 -3.2274E-02
            -5.7525E-02
 
 #TERM:
0MINIMIZATION SUCCESSFUL
 HOWEVER, PROBLEMS OCCURRED WITH THE MINIMIZATION.
 REGARD THE RESULTS OF THE ESTIMATION STEP CAREFULLY, AND ACCEPT THEM ONLY
 AFTER CHECKING THAT THE COVARIANCE STEP PRODUCES REASONABLE OUTPUT.
 NO. OF FUNCTION EVALUATIONS USED:      545
 NO. OF SIG. DIGITS IN FINAL EST.:  2.5

 ETABAR IS THE ARITHMETIC MEAN OF THE ETA-ESTIMATES,
 AND THE P-VALUE IS GIVEN FOR THE NULL HYPOTHESIS THAT THE TRUE MEAN IS 0.
 
 ETABAR:         2.5860E-04 -1.6685E-02  7.8292E-03  1.3249E-02 -1.3938E-02
 SE:             2.8797E-02  2.0018E-02  2.2943E-02  1.8440E-02  2.4653E-02
 N:                     120         120         120         120         120
 
 P VAL.:         9.9284E-01  4.0455E-01  7.3292E-01  4.7244E-01  5.7182E-01
 
 ETASHRINKSD(%)  3.9122E-01  1.2083E+01  4.4859E+01  2.5843E+01  2.1811E+01
 ETASHRINKVR(%)  7.8090E-01  2.2706E+01  6.9594E+01  4.5008E+01  3.8865E+01
 EBVSHRINKSD(%)  6.2590E-01  1.2431E+01  4.2971E+01  2.6418E+01  2.1892E+01
 EBVSHRINKVR(%)  1.2479E+00  2.3316E+01  6.7477E+01  4.5858E+01  3.8992E+01
 EPSSHRINKSD(%)  3.8853E+00
 EPSSHRINKVR(%)  7.6196E+00
 
  
 TOTAL DATA POINTS NORMALLY DISTRIBUTED (N):         4680
 N*LOG(2PI) CONSTANT TO OBJECTIVE FUNCTION:    8601.26467079574     
 OBJECTIVE FUNCTION VALUE WITHOUT CONSTANT:    45413.6072197901     
 OBJECTIVE FUNCTION VALUE WITH CONSTANT:       54014.8718905858     
 REPORTED OBJECTIVE FUNCTION DOES NOT CONTAIN CONSTANT
  
 TOTAL EFFECTIVE ETAS (NIND*NETA):                           600
  
 #TERE:
 Elapsed estimation  time in seconds:   904.52
 Elapsed covariance  time in seconds:   275.66
 Elapsed postprocess time in seconds:     2.91
1
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 ************************************************************************************************************************
 ********************                                                                                ********************
 ********************               FIRST ORDER CONDITIONAL ESTIMATION WITH INTERACTION              ********************
 #OBJT:**************                       MINIMUM VALUE OF OBJECTIVE FUNCTION                      ********************
 ********************                                                                                ********************
 ************************************************************************************************************************
 





 #OBJV:********************************************    45413.607       **************************************************
1
 ************************************************************************************************************************
 ********************                                                                                ********************
 ********************               FIRST ORDER CONDITIONAL ESTIMATION WITH INTERACTION              ********************
 ********************                             FINAL PARAMETER ESTIMATE                           ********************
 ********************                                                                                ********************
 ************************************************************************************************************************
 


 THETA - VECTOR OF FIXED EFFECTS PARAMETERS   *********


         TH 1      TH 2      TH 3      TH 4      TH 5      TH 6     
 
         1.34E+00  4.24E+00  1.46E+00  3.77E+00 -8.16E-02  1.98E-01
 


 OMEGA - COV MATRIX FOR RANDOM EFFECTS - ETAS  ********


         ETA1      ETA2      ETA3      ETA4      ETA5     
 
 ETA1
+        1.01E-01
 
 ETA2
+        0.00E+00  6.27E-02
 
 ETA3
+        0.00E+00  0.00E+00  2.09E-01
 
 ETA4
+        0.00E+00  0.00E+00  0.00E+00  7.48E-02
 
 ETA5
+        0.00E+00  0.00E+00  0.00E+00  0.00E+00  1.20E-01
 


 SIGMA - COV MATRIX FOR RANDOM EFFECTS - EPSILONS  ****


         EPS1     
 
 EPS1
+        1.00E+00
 
1


 OMEGA - CORR MATRIX FOR RANDOM EFFECTS - ETAS  *******


         ETA1      ETA2      ETA3      ETA4      ETA5     
 
 ETA1
+        3.18E-01
 
 ETA2
+        0.00E+00  2.50E-01
 
 ETA3
+        0.00E+00  0.00E+00  4.58E-01
 
 ETA4
+        0.00E+00  0.00E+00  0.00E+00  2.74E-01
 
 ETA5
+        0.00E+00  0.00E+00  0.00E+00  0.00E+00  3.47E-01
 


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
 
         2.98E-02  4.01E-02  1.74E-01  6.38E-02  6.29E-02  2.02E-03
 


 OMEGA - COV MATRIX FOR RANDOM EFFECTS - ETAS  ********


         ETA1      ETA2      ETA3      ETA4      ETA5     
 
 ETA1
+        1.70E-02
 
 ETA2
+       .........  9.69E-03
 
 ETA3
+       ......... .........  7.95E-02
 
 ETA4
+       ......... ......... .........  1.91E-02
 
 ETA5
+       ......... ......... ......... .........  2.36E-02
 


 SIGMA - COV MATRIX FOR RANDOM EFFECTS - EPSILONS  ****


         EPS1     
 
 EPS1
+       .........
 
1


 OMEGA - CORR MATRIX FOR RANDOM EFFECTS - ETAS  *******


         ETA1      ETA2      ETA3      ETA4      ETA5     
 
 ETA1
+        2.67E-02
 
 ETA2
+       .........  1.93E-02
 
 ETA3
+       ......... .........  8.69E-02
 
 ETA4
+       ......... ......... .........  3.50E-02
 
 ETA5
+       ......... ......... ......... .........  3.40E-02
 


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
+        8.86E-04
 
 TH 2
+       -1.86E-04  1.61E-03
 
 TH 3
+        1.23E-03 -4.93E-03  3.02E-02
 
 TH 4
+        4.42E-04 -1.84E-03  9.20E-03  4.07E-03
 
 TH 5
+       -2.13E-04  1.64E-03 -8.02E-03 -2.83E-03  3.96E-03
 
 TH 6
+       -5.78E-06  9.03E-06 -1.14E-05 -6.96E-06 -7.72E-08  4.07E-06
 
 OM11
+        1.34E-04 -1.96E-04  1.13E-03  3.59E-04 -3.75E-04  1.58E-06  2.88E-04
 
 OM12
+       ......... ......... ......... ......... ......... ......... ......... .........
 
 OM13
+       ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 OM14
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 OM15
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 OM22
+       -7.45E-06  2.66E-06  2.10E-05 -2.43E-05  1.63E-06  2.98E-06 -7.77E-06 ......... ......... ......... .........  9.39E-05
 
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
+        2.68E-04 -1.45E-03  8.08E-03  2.50E-03 -1.88E-03 -1.26E-05  4.90E-04 ......... ......... ......... .........  4.50E-05
         ......... ......... .........  6.33E-03
 
 OM34
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
         ......... ......... ......... ......... .........
 
 OM35
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
         ......... ......... ......... ......... ......... .........
 
 OM44
+       -5.38E-05  3.89E-04 -1.94E-03 -5.66E-04  5.53E-04 -4.67E-07 -1.03E-04 ......... ......... ......... ......... -3.13E-05
         ......... ......... ......... -6.44E-04 ......... .........  3.66E-04
 
1

            TH 1      TH 2      TH 3      TH 4      TH 5      TH 6      OM11      OM12      OM13      OM14      OM15      OM22  
             OM23      OM24      OM25      OM33      OM34      OM35      OM44      OM45      OM55      SG11  
 
 OM45
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
         ......... ......... ......... ......... ......... ......... ......... .........
 
 OM55
+       -4.43E-05  5.41E-05 -6.84E-04 -1.90E-04  1.64E-04 -2.58E-06 -1.18E-05 ......... ......... ......... ......... -1.56E-05
         ......... ......... ......... -1.37E-04 ......... .........  1.28E-05 .........  5.58E-04
 
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
+        2.98E-02
 
 TH 2
+       -1.56E-01  4.01E-02
 
 TH 3
+        2.38E-01 -7.08E-01  1.74E-01
 
 TH 4
+        2.33E-01 -7.21E-01  8.30E-01  6.38E-02
 
 TH 5
+       -1.14E-01  6.50E-01 -7.34E-01 -7.04E-01  6.29E-02
 
 TH 6
+       -9.62E-02  1.12E-01 -3.26E-02 -5.40E-02 -6.08E-04  2.02E-03
 
 OM11
+        2.65E-01 -2.89E-01  3.84E-01  3.32E-01 -3.52E-01  4.62E-02  1.70E-02
 
 OM12
+       ......... ......... ......... ......... ......... ......... ......... .........
 
 OM13
+       ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 OM14
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 OM15
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 OM22
+       -2.58E-02  6.85E-03  1.25E-02 -3.93E-02  2.67E-03  1.52E-01 -4.73E-02 ......... ......... ......... .........  9.69E-03
 
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
+        1.13E-01 -4.55E-01  5.85E-01  4.92E-01 -3.76E-01 -7.83E-02  3.64E-01 ......... ......... ......... .........  5.84E-02
         ......... ......... .........  7.95E-02
 
 OM34
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
         ......... ......... ......... ......... .........
 
 OM35
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
         ......... ......... ......... ......... ......... .........
 
 OM44
+       -9.45E-02  5.08E-01 -5.85E-01 -4.63E-01  4.60E-01 -1.21E-02 -3.18E-01 ......... ......... ......... ......... -1.69E-01
         ......... ......... ......... -4.24E-01 ......... .........  1.91E-02
 
1

            TH 1      TH 2      TH 3      TH 4      TH 5      TH 6      OM11      OM12      OM13      OM14      OM15      OM22  
             OM23      OM24      OM25      OM33      OM34      OM35      OM44      OM45      OM55      SG11  
 
 OM45
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
         ......... ......... ......... ......... ......... ......... ......... .........
 
 OM55
+       -6.31E-02  5.71E-02 -1.67E-01 -1.26E-01  1.10E-01 -5.42E-02 -2.95E-02 ......... ......... ......... ......... -6.82E-02
         ......... ......... ......... -7.28E-02 ......... .........  2.84E-02 .........  2.36E-02
 
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
+        1.30E+03
 
 TH 2
+       -1.71E+01  1.57E+03
 
 TH 3
+       -5.89E+01  5.47E+01  1.66E+02
 
 TH 4
+       -9.88E+01  3.59E+02 -1.96E+02  9.44E+02
 
 TH 5
+       -1.24E+02 -2.09E+02  1.02E+02  1.45E+02  6.44E+02
 
 TH 6
+        2.02E+03 -2.52E+03 -2.10E+02 -1.18E+02  5.15E+02  2.64E+05
 
 OM11
+       -5.80E+02 -8.35E+01 -9.90E+00  3.65E+01  2.63E+02 -3.68E+03  4.67E+03
 
 OM12
+       ......... ......... ......... ......... ......... ......... ......... .........
 
 OM13
+       ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 OM14
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 OM15
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 OM22
+       -8.40E+01 -4.70E+01  3.32E+01  2.16E+02  2.19E+01 -8.36E+03  7.56E+02 ......... ......... ......... .........  1.16E+04
 
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
+        5.45E+01  4.25E+01 -6.24E+01 -1.71E+01 -6.25E+01  7.80E+02 -2.37E+02 ......... ......... ......... ......... -1.29E+02
         ......... ......... .........  2.63E+02
 
 OM34
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
         ......... ......... ......... ......... .........
 
 OM35
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
         ......... ......... ......... ......... ......... .........
 
 OM44
+       -1.42E+02 -4.67E+02  2.43E+02 -2.02E+02 -3.50E+01  8.26E+02  5.71E+02 ......... ......... ......... .........  1.47E+03
         ......... ......... .........  8.57E+01 ......... .........  4.67E+03
 
1

            TH 1      TH 2      TH 3      TH 4      TH 5      TH 6      OM11      OM12      OM13      OM14      OM15      OM22  
             OM23      OM24      OM25      OM33      OM34      OM35      OM44      OM45      OM55      SG11  
 
 OM45
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
         ......... ......... ......... ......... ......... ......... ......... .........
 
 OM55
+        4.71E+01  1.04E+02  7.52E+01  2.55E+00 -9.56E+00  1.04E+03 -8.32E+01 ......... ......... ......... .........  3.43E+02
         ......... ......... ......... -6.40E+00 ......... .........  2.44E+02 .........  1.89E+03
 
 SG11
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
         ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 Elapsed finaloutput time in seconds:     0.40
1THERE ARE ERROR MESSAGES IN FILE PRDERR                                                                  
 #CPUT: Total CPU Time in Seconds,     1185.609
