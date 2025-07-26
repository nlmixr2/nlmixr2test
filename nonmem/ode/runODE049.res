Run Start Date:  29/08/2019 
Run Start Time: 18:12:32.47 
Run Stop Date:   29/08/2019 
Run Stop Time:  18:20:13.14 
  
************************************************************************************************************************ 
********************                            CONTROL STREAM                                      ******************** 
************************************************************************************************************************ 
  
$PROB    INFUSION_2CPT_CLV1QV2 ALL DOSES FOCDEI (120 Ind/6960 Obs) runN049
$INPUT   ID TIME DV LNDV MDV AMT RATE EVID DOSE V1I CLI QI V2I SSX IIX SD CMT
$DATA    INFUSION_2CPT.csv IGNORE=@
$SUBR    ADVAN13 TOL=6
$MODEL
         COMP=(CENTRAL,DEFOBS,DEFDOSE)
         COMP=(PERI)
$PK
         CL=EXP(THETA(1)+ETA(1))
         V=EXP(THETA(2)+ETA(2))
         Q=EXP(THETA(3)+ETA(3))
         V2=EXP(THETA(4)+ETA(4))
         V1=V
         S1=V
		 K21=Q/V2
		 K12=Q/V
$DES
         DADT(1)= K21*A(2)-K12*A(1)-CL*A(1)/V1
         DADT(2)=-K21*A(2)+K12*A(1)  		 
$ERROR   
         IPRED = F     
         RESCV = THETA(5) 
         W     = IPRED*RESCV
         IRES  = DV-IPRED
         IWRES = IRES/W
         Y     = IPRED+W*EPS(1)
$THETA   1.6       ;log Cl
$THETA   4.5       ;log Vc
$THETA   1.6       ;log Q
$THETA   4         ;log Vp
$THETA   (0,0.3,1) ;RSV
$OMEGA   0.15 0.15 0.15 0.15
$SIGMA   1 FIX
$EST     NSIG=2 SIGL=6 PRINT=5 MAX=9999 NOABORT POSTHOC METHOD=COND INTER NOOBT
$COV
$TABLE  ID TIME LNDV MDV AMT EVID DOSE V1I CLI CL V Q V2 ETA1 ETA2 ETA3 ETA4
        IPRED IRES IWRES CWRESI
        ONEHEADER NOPRINT FILE=runODE049.csv   
   
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
 INFUSION_2CPT_CLV1QV2 ALL DOSES FOCDEI (120 Ind/6960 Obs) runN049
0DATA CHECKOUT RUN:              NO
 DATA SET LOCATED ON UNIT NO.:    2
 THIS UNIT TO BE REWOUND:        NO
 NO. OF DATA RECS IN DATA SET:     7920
 NO. OF DATA ITEMS IN DATA SET:  17
 ID DATA ITEM IS DATA ITEM NO.:   1
 DEP VARIABLE IS DATA ITEM NO.:   3
 MDV DATA ITEM IS DATA ITEM NO.:  5
0INDICES PASSED TO SUBROUTINE PRED:
   8   2   6   7   0   0  17   0   0   0   0
0LABELS FOR DATA ITEMS:
 ID TIME DV LNDV MDV AMT RATE EVID DOSE V1I CLI QI V2I SSX IIX SD CMT
0(NONBLANK) LABELS FOR PRED-DEFINED ITEMS:
 CL V Q V2 IPRED IRES IWRES
0FORMAT FOR DATA:
 (E3.0,3E6.0,E1.0,2E6.0,E1.0,E6.0,E5.0,2E4.0,E5.0,2E2.0,2E1.0)

 TOT. NO. OF OBS RECS:     6960
 TOT. NO. OF INDIVIDUALS:      120
0LENGTH OF THETA:   5
0DEFAULT THETA BOUNDARY TEST OMITTED:    NO
0OMEGA HAS SIMPLE DIAGONAL FORM WITH DIMENSION:   4
0DEFAULT OMEGA BOUNDARY TEST OMITTED:   YES
0SIGMA HAS SIMPLE DIAGONAL FORM WITH DIMENSION:   1
0DEFAULT SIGMA BOUNDARY TEST OMITTED:    NO
0INITIAL ESTIMATE OF THETA:
 LOWER BOUND    INITIAL EST    UPPER BOUND
 -0.1000E+07     0.1600E+01     0.1000E+07
 -0.1000E+07     0.4500E+01     0.1000E+07
 -0.1000E+07     0.1600E+01     0.1000E+07
 -0.1000E+07     0.4000E+01     0.1000E+07
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
 ID TIME LNDV MDV AMT EVID DOSE V1I CLI CL V Q V2 ETA1 ETA2 ETA3 ETA4 IPRED IRES IWRES CWRESI
1DOUBLE PRECISION PREDPP VERSION 7.4.3

 GENERAL NONLINEAR KINETICS MODEL WITH STIFF/NONSTIFF EQUATIONS (LSODA, ADVAN13)
0MODEL SUBROUTINE USER-SUPPLIED - ID NO. 9999
0MAXIMUM NO. OF BASIC PK PARAMETERS:   4
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
    1            5           *           *           *           *
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
 RAW OUTPUT FILE (FILE): runODE049.ext
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

 
0ITERATION NO.:    0    OBJECTIVE VALUE:   66518.6816865952        NO. OF FUNC. EVALS.:   7
 CUMULATIVE NO. OF FUNC. EVALS.:        7
 NPARAMETR:  1.6000E+00  4.5000E+00  1.6000E+00  4.0000E+00  3.0000E-01  1.5000E-01  1.5000E-01  1.5000E-01  1.5000E-01
 PARAMETER:  1.0000E-01  1.0000E-01  1.0000E-01  1.0000E-01  1.0000E-01  1.0000E-01  1.0000E-01  1.0000E-01  1.0000E-01
 GRADIENT:   7.5561E+03  2.1729E+04  2.2845E+03  1.9579E+03  4.3626E+03  4.0260E+01  3.0028E+00  1.8986E+01  5.9931E+01
 
0ITERATION NO.:    5    OBJECTIVE VALUE:   65103.6185810837        NO. OF FUNC. EVALS.:  44
 CUMULATIVE NO. OF FUNC. EVALS.:       51
 NPARAMETR:  1.1621E+00  4.1402E+00  1.3010E+00  4.0580E+00  1.8948E-01  1.4847E-01  1.4645E-01  1.4982E-01  1.4789E-01
 PARAMETER:  7.2628E-02  9.2006E-02  8.1314E-02  1.0145E-01 -5.0607E-01  9.4876E-02  8.8018E-02  9.9403E-02  9.2926E-02
 GRADIENT:   1.0511E+03  5.3774E+03 -5.5490E+02  8.6631E+03 -1.4017E+03  3.2190E+01  7.4286E+01  6.6536E+00  1.6228E+01
 
0ITERATION NO.:   10    OBJECTIVE VALUE:   65031.4501874047        NO. OF FUNC. EVALS.:  55
 CUMULATIVE NO. OF FUNC. EVALS.:      106
 NPARAMETR:  1.1843E+00  4.1204E+00  1.3630E+00  3.9255E+00  1.9753E-01  1.1465E-01  1.0153E-01  1.2773E-01  7.7347E-02
 PARAMETER:  7.4017E-02  9.1564E-02  8.5186E-02  9.8137E-02 -4.5448E-01 -3.4359E-02 -9.5126E-02  1.9627E-02 -2.3117E-01
 GRADIENT:  -4.0090E+03 -8.8614E+03  1.2571E+02 -1.0788E+03 -5.0950E+02 -1.2897E+01 -2.6802E+00  2.6095E-01 -4.9477E+01
 
0ITERATION NO.:   15    OBJECTIVE VALUE:   64973.0599644542        NO. OF FUNC. EVALS.:  90
 CUMULATIVE NO. OF FUNC. EVALS.:      196
 NPARAMETR:  1.3211E+00  4.2127E+00  1.3490E+00  3.9269E+00  2.0298E-01  9.3472E-02  9.3784E-02  1.1166E-01  1.1345E-01
 PARAMETER:  8.2567E-02  9.3615E-02  8.4314E-02  9.8173E-02 -4.2047E-01 -1.3648E-01 -1.3482E-01 -4.7601E-02 -3.9641E-02
 GRADIENT:   1.0563E+02  4.2185E+01  1.0115E+02 -3.4543E+02  1.4139E+01  5.7129E+00  2.1372E+00 -2.2171E-01  4.5404E+00
 
0ITERATION NO.:   20    OBJECTIVE VALUE:   64970.7235565869        NO. OF FUNC. EVALS.:  82
 CUMULATIVE NO. OF FUNC. EVALS.:      278
 NPARAMETR:  1.3609E+00  4.2129E+00  1.3420E+00  3.9241E+00  2.0282E-01  9.0510E-02  9.2936E-02  1.1202E-01  1.0970E-01
 PARAMETER:  8.5054E-02  9.3619E-02  8.3876E-02  9.8103E-02 -4.2144E-01 -1.5259E-01 -1.3936E-01 -4.5976E-02 -5.6450E-02
 GRADIENT:   1.7320E+03  3.3480E+01 -5.1973E+01 -5.0383E+02 -7.5893E+00  2.7865E+00  5.9454E-02  8.2685E-02  2.6701E-02
 
0ITERATION NO.:   23    OBJECTIVE VALUE:   64970.5732794099        NO. OF FUNC. EVALS.:  54
 CUMULATIVE NO. OF FUNC. EVALS.:      332
 NPARAMETR:  1.3623E+00  4.2233E+00  1.3451E+00  3.9250E+00  2.0290E-01  8.9431E-02  9.2906E-02  1.1196E-01  1.0964E-01
 PARAMETER:  8.5144E-02  9.3850E-02  8.4068E-02  9.8126E-02 -4.2095E-01 -1.5859E-01 -1.3952E-01 -4.6253E-02 -5.6695E-02
 GRADIENT:   1.7859E+03  1.2126E+03  8.3798E+00 -4.3377E+02 -2.3038E+00 -2.8162E-02  2.7384E-01  5.5177E-02  3.3229E-02
 
 #TERM:
0MINIMIZATION SUCCESSFUL
 NO. OF FUNCTION EVALUATIONS USED:      332
 NO. OF SIG. DIGITS IN FINAL EST.:  2.1

 ETABAR IS THE ARITHMETIC MEAN OF THE ETA-ESTIMATES,
 AND THE P-VALUE IS GIVEN FOR THE NULL HYPOTHESIS THAT THE TRUE MEAN IS 0.
 
 ETABAR:         9.9392E-04 -5.0720E-03  8.9039E-03  7.8924E-03
 SE:             2.7155E-02  2.7288E-02  2.1213E-02  2.6281E-02
 N:                     120         120         120         120
 
 P VAL.:         9.7080E-01  8.5255E-01  6.7468E-01  7.6394E-01
 
 ETASHRINKSD(%)  1.1120E-01  1.5167E+00  3.0259E+01  1.2691E+01
 ETASHRINKVR(%)  2.2227E-01  3.0104E+00  5.1361E+01  2.3771E+01
 EBVSHRINKSD(%)  5.1367E-01  1.7989E+00  3.0224E+01  1.2306E+01
 EBVSHRINKVR(%)  1.0247E+00  3.5654E+00  5.1313E+01  2.3097E+01
 EPSSHRINKSD(%)  2.5737E+00
 EPSSHRINKVR(%)  5.0811E+00
 
  
 TOTAL DATA POINTS NORMALLY DISTRIBUTED (N):         6960
 N*LOG(2PI) CONSTANT TO OBJECTIVE FUNCTION:    12791.6243822090     
 OBJECTIVE FUNCTION VALUE WITHOUT CONSTANT:    64970.5732794099     
 OBJECTIVE FUNCTION VALUE WITH CONSTANT:       77762.1976616190     
 REPORTED OBJECTIVE FUNCTION DOES NOT CONTAIN CONSTANT
  
 TOTAL EFFECTIVE ETAS (NIND*NETA):                           480
  
 #TERE:
 Elapsed estimation  time in seconds:   327.62
 Elapsed covariance  time in seconds:   120.88
 Elapsed postprocess time in seconds:     1.85
1
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 ************************************************************************************************************************
 ********************                                                                                ********************
 ********************               FIRST ORDER CONDITIONAL ESTIMATION WITH INTERACTION              ********************
 #OBJT:**************                       MINIMUM VALUE OF OBJECTIVE FUNCTION                      ********************
 ********************                                                                                ********************
 ************************************************************************************************************************
 





 #OBJV:********************************************    64970.573       **************************************************
1
 ************************************************************************************************************************
 ********************                                                                                ********************
 ********************               FIRST ORDER CONDITIONAL ESTIMATION WITH INTERACTION              ********************
 ********************                             FINAL PARAMETER ESTIMATE                           ********************
 ********************                                                                                ********************
 ************************************************************************************************************************
 


 THETA - VECTOR OF FIXED EFFECTS PARAMETERS   *********


         TH 1      TH 2      TH 3      TH 4      TH 5     
 
         1.36E+00  4.22E+00  1.35E+00  3.93E+00  2.03E-01
 


 OMEGA - COV MATRIX FOR RANDOM EFFECTS - ETAS  ********


         ETA1      ETA2      ETA3      ETA4     
 
 ETA1
+        8.94E-02
 
 ETA2
+        0.00E+00  9.29E-02
 
 ETA3
+        0.00E+00  0.00E+00  1.12E-01
 
 ETA4
+        0.00E+00  0.00E+00  0.00E+00  1.10E-01
 


 SIGMA - COV MATRIX FOR RANDOM EFFECTS - EPSILONS  ****


         EPS1     
 
 EPS1
+        1.00E+00
 
1


 OMEGA - CORR MATRIX FOR RANDOM EFFECTS - ETAS  *******


         ETA1      ETA2      ETA3      ETA4     
 
 ETA1
+        2.99E-01
 
 ETA2
+        0.00E+00  3.05E-01
 
 ETA3
+        0.00E+00  0.00E+00  3.35E-01
 
 ETA4
+        0.00E+00  0.00E+00  0.00E+00  3.31E-01
 


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
 
         2.78E-02  2.85E-02  5.15E-02  3.43E-02  1.81E-03
 


 OMEGA - COV MATRIX FOR RANDOM EFFECTS - ETAS  ********


         ETA1      ETA2      ETA3      ETA4     
 
 ETA1
+        1.04E-02
 
 ETA2
+       .........  1.38E-02
 
 ETA3
+       ......... .........  4.26E-02
 
 ETA4
+       ......... ......... .........  2.01E-02
 


 SIGMA - COV MATRIX FOR RANDOM EFFECTS - EPSILONS  ****


         EPS1     
 
 EPS1
+       .........
 
1


 OMEGA - CORR MATRIX FOR RANDOM EFFECTS - ETAS  *******


         ETA1      ETA2      ETA3      ETA4     
 
 ETA1
+        1.74E-02
 
 ETA2
+       .........  2.27E-02
 
 ETA3
+       ......... .........  6.36E-02
 
 ETA4
+       ......... ......... .........  3.04E-02
 


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
+        7.75E-04
 
 TH 2
+       -1.77E-06  8.15E-04
 
 TH 3
+        4.04E-04 -2.12E-04  2.65E-03
 
 TH 4
+        4.94E-05 -8.67E-05  1.48E-04  1.18E-03
 
 TH 5
+        4.45E-06 -3.85E-06 -7.28E-06  2.05E-06  3.26E-06
 
 OM11
+        5.88E-05  2.95E-05  9.88E-05 -1.88E-05 -2.88E-06  1.08E-04
 
 OM12
+       ......... ......... ......... ......... ......... ......... .........
 
 OM13
+       ......... ......... ......... ......... ......... ......... ......... .........
 
 OM14
+       ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 OM22
+        9.79E-07  2.82E-05 -6.62E-05 -6.20E-06 -1.04E-06 -4.08E-06 ......... ......... .........  1.91E-04
 
 OM23
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 OM24
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 OM33
+        2.43E-04 -1.06E-05  8.84E-04 -1.10E-04 -4.13E-06  1.41E-04 ......... ......... ......... -6.25E-05 ......... .........
          1.81E-03
 
 OM34
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
         ......... .........
 
 OM44
+       -8.04E-05  3.85E-05 -2.17E-04 -1.63E-06  3.11E-06 -2.85E-05 ......... ......... ......... -3.40E-06 ......... .........
         -2.24E-04 .........  4.04E-04
 
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
+        2.78E-02
 
 TH 2
+       -2.23E-03  2.85E-02
 
 TH 3
+        2.82E-01 -1.44E-01  5.15E-02
 
 TH 4
+        5.17E-02 -8.85E-02  8.40E-02  3.43E-02
 
 TH 5
+        8.85E-02 -7.47E-02 -7.84E-02  3.31E-02  1.81E-03
 
 OM11
+        2.04E-01  9.95E-02  1.85E-01 -5.28E-02 -1.54E-01  1.04E-02
 
 OM12
+       ......... ......... ......... ......... ......... ......... .........
 
 OM13
+       ......... ......... ......... ......... ......... ......... ......... .........
 
 OM14
+       ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 OM22
+        2.55E-03  7.14E-02 -9.31E-02 -1.31E-02 -4.19E-02 -2.84E-02 ......... ......... .........  1.38E-02
 
 OM23
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 OM24
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 OM33
+        2.05E-01 -8.72E-03  4.04E-01 -7.53E-02 -5.37E-02  3.19E-01 ......... ......... ......... -1.06E-01 ......... .........
          4.26E-02
 
 OM34
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
         ......... .........
 
 OM44
+       -1.44E-01  6.71E-02 -2.10E-01 -2.37E-03  8.56E-02 -1.37E-01 ......... ......... ......... -1.22E-02 ......... .........
         -2.62E-01 .........  2.01E-02
 
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
+        1.49E+03
 
 TH 2
+       -4.76E+01  1.30E+03
 
 TH 3
+       -1.85E+02  1.21E+02  5.03E+02
 
 TH 4
+       -5.26E+01  6.98E+01 -6.80E+01  8.75E+02
 
 TH 5
+       -3.27E+03  1.51E+03  1.17E+03 -3.47E+02  3.26E+05
 
 OM11
+       -6.15E+02 -3.90E+02 -8.26E+01  1.05E+02  8.81E+03  1.10E+04
 
 OM12
+       ......... ......... ......... ......... ......... ......... .........
 
 OM13
+       ......... ......... ......... ......... ......... ......... ......... .........
 
 OM14
+       ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 OM22
+       -1.14E+02 -1.58E+02  9.62E+01  2.37E+01  2.03E+03  9.92E+01 ......... ......... .........  5.37E+03
 
 OM23
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 OM24
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 OM33
+       -5.79E+01 -2.79E+01 -2.00E+02  8.67E+01 -2.91E+02 -6.80E+02 ......... ......... .........  1.73E+02 ......... .........
          7.52E+02
 
 OM34
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
         ......... .........
 
 OM44
+        1.50E+02 -1.24E+02  9.69E+01  8.20E+00 -2.19E+03  2.02E+02 ......... ......... .........  1.77E+02 ......... .........
          2.57E+02 .........  2.74E+03
 
 SG11
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
         ......... ......... ......... .........
 
 Elapsed finaloutput time in seconds:     0.48
 #CPUT: Total CPU Time in Seconds,      452.250
