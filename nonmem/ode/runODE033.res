Run Start Date:  29/08/2019 
Run Start Time: 16:41:52.47 
Run Stop Date:   29/08/2019 
Run Stop Time:  16:47:11.51 
  
************************************************************************************************************************ 
********************                            CONTROL STREAM                                      ******************** 
************************************************************************************************************************ 
  
$PROB    BOLUS_2CPT_CLV1QV2 MULTIPLE DOSE FOCEI (120 Ind/4680 Obs) runODE033
$INPUT   ID TIME DV LNDV MDV AMT EVID DOSE V1I CLI QI V2I SSX IIX SD CMT
$DATA    BOLUS_2CPT.csv IGNORE=@ IGNORE (SD.EQ.1)
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
$THETA   1.4       ;log Q
$THETA   3.9       ;log Vp
$THETA   (0,0.3,1) ;RSV
$OMEGA   0.15 0.15 0.15 0.15
$SIGMA   1 FIX
$EST     NSIG=2 SIGL=6 PRINT=5 MAX=9999 NOABORT POSTHOC METHOD=COND INTER NOOBT
$COV
$TABLE  ID TIME LNDV MDV AMT EVID DOSE V1I CLI QI V2I CL V Q V2 ETA1 ETA2 ETA3 ETA4
        IPRED IRES IWRES CWRESI
        ONEHEADER NOPRINT FILE=runODE033.csv   
   
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
 BOLUS_2CPT_CLV1QV2 MULTIPLE DOSE FOCEI (120 Ind/4680 Obs) runODE033
0DATA CHECKOUT RUN:              NO
 DATA SET LOCATED ON UNIT NO.:    2
 THIS UNIT TO BE REWOUND:        NO
 NO. OF DATA RECS IN DATA SET:     5520
 NO. OF DATA ITEMS IN DATA SET:  16
 ID DATA ITEM IS DATA ITEM NO.:   1
 DEP VARIABLE IS DATA ITEM NO.:   3
 MDV DATA ITEM IS DATA ITEM NO.:  5
0INDICES PASSED TO SUBROUTINE PRED:
   7   2   6   0   0   0  16   0   0   0   0
0LABELS FOR DATA ITEMS:
 ID TIME DV LNDV MDV AMT EVID DOSE V1I CLI QI V2I SSX IIX SD CMT
0(NONBLANK) LABELS FOR PRED-DEFINED ITEMS:
 CL V Q V2 IPRED IRES IWRES
0FORMAT FOR DATA:
 (E4.0,3E7.0,E2.0,E7.0,E2.0,E7.0,E6.0,2E5.0,E6.0,2E3.0,2E2.0)

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
 -0.1000E+07     0.1600E+01     0.1000E+07
 -0.1000E+07     0.4500E+01     0.1000E+07
 -0.1000E+07     0.1400E+01     0.1000E+07
 -0.1000E+07     0.3900E+01     0.1000E+07
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
 ID TIME LNDV MDV AMT EVID DOSE V1I CLI QI V2I CL V Q V2 ETA1 ETA2 ETA3 ETA4 IPRED IRES IWRES CWRESI
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
   EVENT ID DATA ITEM IS DATA ITEM NO.:      7
   TIME DATA ITEM IS DATA ITEM NO.:          2
   DOSE AMOUNT DATA ITEM IS DATA ITEM NO.:   6
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
 RAW OUTPUT FILE (FILE): runODE033.ext
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

 
0ITERATION NO.:    0    OBJECTIVE VALUE:   47439.4469977451        NO. OF FUNC. EVALS.:   7
 CUMULATIVE NO. OF FUNC. EVALS.:        7
 NPARAMETR:  1.6000E+00  4.5000E+00  1.4000E+00  3.9000E+00  3.0000E-01  1.5000E-01  1.5000E-01  1.5000E-01  1.5000E-01
 PARAMETER:  1.0000E-01  1.0000E-01  1.0000E-01  1.0000E-01  1.0000E-01  1.0000E-01  1.0000E-01  1.0000E-01  1.0000E-01
 GRADIENT:   7.6671E+03  1.9898E+04 -1.1767E+02  3.3159E+03  2.8594E+03 -2.3083E+01 -1.2092E+01  1.9768E+01  6.8437E+01
 
0ITERATION NO.:    5    OBJECTIVE VALUE:   46458.7757140943        NO. OF FUNC. EVALS.:  49
 CUMULATIVE NO. OF FUNC. EVALS.:       56
 NPARAMETR:  1.2674E+00  4.1695E+00  1.4611E+00  3.9631E+00  2.1818E-01  1.4784E-01  1.4647E-01  1.4915E-01  1.4698E-01
 PARAMETER:  7.9214E-02  9.2655E-02  1.0436E-01  1.0162E-01 -3.2898E-01  9.2746E-02  8.8092E-02  9.7154E-02  8.9820E-02
 GRADIENT:   1.5861E+03  3.0812E+03 -1.7985E+02  7.0164E+03  8.5483E+02  3.8123E+01  7.5733E+01  6.9468E+00  6.0728E+01
 
0ITERATION NO.:   10    OBJECTIVE VALUE:   46425.8379587665        NO. OF FUNC. EVALS.:  43
 CUMULATIVE NO. OF FUNC. EVALS.:       99
 NPARAMETR:  1.2618E+00  4.1636E+00  1.4538E+00  3.8585E+00  2.1400E-01  1.4524E-01  7.5869E-02  2.9769E-01  2.7750E-02
 PARAMETER:  7.8864E-02  9.2525E-02  1.0384E-01  9.8936E-02 -3.5370E-01  8.3861E-02 -2.4081E-01  4.4272E-01 -7.4370E-01
 GRADIENT:   1.6315E+03  1.8900E+03 -3.0842E+02  8.0065E+02  6.1474E+02  3.6777E+01 -4.6642E+01  2.4956E+01 -4.2273E+01
 
0ITERATION NO.:   15    OBJECTIVE VALUE:   46378.7215775052        NO. OF FUNC. EVALS.:  73
 CUMULATIVE NO. OF FUNC. EVALS.:      172
 NPARAMETR:  1.3042E+00  4.1842E+00  1.4672E+00  3.8442E+00  2.0327E-01  1.1575E-01  9.3630E-02  1.4140E-01  6.9853E-02
 PARAMETER:  8.1515E-02  9.2983E-02  1.0480E-01  9.8569E-02 -4.1866E-01 -2.9581E-02 -1.3564E-01  7.0485E-02 -2.8212E-01
 GRADIENT:   2.0615E+02 -7.6057E+01  3.4098E+01 -1.7072E+02  2.3107E+01 -4.2248E+00 -4.0040E+00 -8.1196E-01  2.3287E+00
 
0ITERATION NO.:   20    OBJECTIVE VALUE:   46377.3991980410        NO. OF FUNC. EVALS.:  83
 CUMULATIVE NO. OF FUNC. EVALS.:      255
 NPARAMETR:  1.3363E+00  4.1787E+00  1.4618E+00  3.8403E+00  2.0287E-01  1.1764E-01  9.5541E-02  1.4375E-01  6.8081E-02
 PARAMETER:  8.3517E-02  9.2861E-02  1.0442E-01  9.8470E-02 -4.2117E-01 -2.1516E-02 -1.2554E-01  7.8735E-02 -2.9497E-01
 GRADIENT:   1.2794E+03 -7.0247E+02 -2.9342E+01 -5.1507E+02 -5.0521E+00  2.3011E+00  1.0544E-01  1.6566E-02 -2.8065E-01
 
0ITERATION NO.:   25    OBJECTIVE VALUE:   46377.3479897405        NO. OF FUNC. EVALS.: 100
 CUMULATIVE NO. OF FUNC. EVALS.:      355
 NPARAMETR:  1.3396E+00  4.1836E+00  1.4655E+00  3.8414E+00  2.0296E-01  1.1651E-01  9.5441E-02  1.4418E-01  6.8291E-02
 PARAMETER:  8.3728E-02  9.2968E-02  1.0468E-01  9.8497E-02 -4.2061E-01 -2.6340E-02 -1.2606E-01  8.0204E-02 -2.9343E-01
 GRADIENT:   1.3822E+03 -1.7635E+02 -3.1902E+00 -4.4122E+02 -4.8959E-01  5.6000E-02 -8.6662E-02 -3.6904E-02  1.2811E-01
 
 #TERM:
0MINIMIZATION SUCCESSFUL
 HOWEVER, PROBLEMS OCCURRED WITH THE MINIMIZATION.
 REGARD THE RESULTS OF THE ESTIMATION STEP CAREFULLY, AND ACCEPT THEM ONLY
 AFTER CHECKING THAT THE COVARIANCE STEP PRODUCES REASONABLE OUTPUT.
 NO. OF FUNCTION EVALUATIONS USED:      355
 NO. OF SIG. DIGITS IN FINAL EST.:  2.3

 ETABAR IS THE ARITHMETIC MEAN OF THE ETA-ESTIMATES,
 AND THE P-VALUE IS GIVEN FOR THE NULL HYPOTHESIS THAT THE TRUE MEAN IS 0.
 
 ETABAR:         1.0558E-03 -8.3550E-03  6.6726E-03  6.7503E-03
 SE:             3.0952E-02  2.7084E-02  2.0265E-02  1.8259E-02
 N:                     120         120         120         120
 
 P VAL.:         9.7279E-01  7.5772E-01  7.4196E-01  7.1161E-01
 
 ETASHRINKSD(%)  2.4929E-01  3.5598E+00  4.1290E+01  2.3140E+01
 ETASHRINKVR(%)  4.9796E-01  6.9928E+00  6.5531E+01  4.0926E+01
 EBVSHRINKSD(%)  5.1602E-01  3.8986E+00  4.0379E+01  2.3332E+01
 EBVSHRINKVR(%)  1.0294E+00  7.6453E+00  6.4454E+01  4.1220E+01
 EPSSHRINKSD(%)  3.4260E+00
 EPSSHRINKVR(%)  6.7347E+00
 
  
 TOTAL DATA POINTS NORMALLY DISTRIBUTED (N):         4680
 N*LOG(2PI) CONSTANT TO OBJECTIVE FUNCTION:    8601.26467079574     
 OBJECTIVE FUNCTION VALUE WITHOUT CONSTANT:    46377.3479897405     
 OBJECTIVE FUNCTION VALUE WITH CONSTANT:       54978.6126605362     
 REPORTED OBJECTIVE FUNCTION DOES NOT CONTAIN CONSTANT
  
 TOTAL EFFECTIVE ETAS (NIND*NETA):                           480
  
 #TERE:
 Elapsed estimation  time in seconds:   229.28
 Elapsed covariance  time in seconds:    78.77
 Elapsed postprocess time in seconds:     1.20
1
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 ************************************************************************************************************************
 ********************                                                                                ********************
 ********************               FIRST ORDER CONDITIONAL ESTIMATION WITH INTERACTION              ********************
 #OBJT:**************                       MINIMUM VALUE OF OBJECTIVE FUNCTION                      ********************
 ********************                                                                                ********************
 ************************************************************************************************************************
 





 #OBJV:********************************************    46377.348       **************************************************
1
 ************************************************************************************************************************
 ********************                                                                                ********************
 ********************               FIRST ORDER CONDITIONAL ESTIMATION WITH INTERACTION              ********************
 ********************                             FINAL PARAMETER ESTIMATE                           ********************
 ********************                                                                                ********************
 ************************************************************************************************************************
 


 THETA - VECTOR OF FIXED EFFECTS PARAMETERS   *********


         TH 1      TH 2      TH 3      TH 4      TH 5     
 
         1.34E+00  4.18E+00  1.47E+00  3.84E+00  2.03E-01
 


 OMEGA - COV MATRIX FOR RANDOM EFFECTS - ETAS  ********


         ETA1      ETA2      ETA3      ETA4     
 
 ETA1
+        1.17E-01
 
 ETA2
+        0.00E+00  9.54E-02
 
 ETA3
+        0.00E+00  0.00E+00  1.44E-01
 
 ETA4
+        0.00E+00  0.00E+00  0.00E+00  6.83E-02
 


 SIGMA - COV MATRIX FOR RANDOM EFFECTS - EPSILONS  ****


         EPS1     
 
 EPS1
+        1.00E+00
 
1


 OMEGA - CORR MATRIX FOR RANDOM EFFECTS - ETAS  *******


         ETA1      ETA2      ETA3      ETA4     
 
 ETA1
+        3.41E-01
 
 ETA2
+        0.00E+00  3.09E-01
 
 ETA3
+        0.00E+00  0.00E+00  3.80E-01
 
 ETA4
+        0.00E+00  0.00E+00  0.00E+00  2.61E-01
 


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
 
         3.10E-02  2.97E-02  7.74E-02  3.48E-02  2.12E-03
 


 OMEGA - COV MATRIX FOR RANDOM EFFECTS - ETAS  ********


         ETA1      ETA2      ETA3      ETA4     
 
 ETA1
+        1.54E-02
 
 ETA2
+       .........  1.19E-02
 
 ETA3
+       ......... .........  6.10E-02
 
 ETA4
+       ......... ......... .........  1.48E-02
 


 SIGMA - COV MATRIX FOR RANDOM EFFECTS - EPSILONS  ****


         EPS1     
 
 EPS1
+       .........
 
1


 OMEGA - CORR MATRIX FOR RANDOM EFFECTS - ETAS  *******


         ETA1      ETA2      ETA3      ETA4     
 
 ETA1
+        2.26E-02
 
 ETA2
+       .........  1.92E-02
 
 ETA3
+       ......... .........  8.04E-02
 
 ETA4
+       ......... ......... .........  2.82E-02
 


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
+        9.61E-04
 
 TH 2
+       -1.13E-04  8.82E-04
 
 TH 3
+       -2.81E-04 -1.36E-04  5.99E-03
 
 TH 4
+        6.09E-05 -2.40E-04  1.18E-03  1.21E-03
 
 TH 5
+       -7.02E-06  3.01E-07 -1.92E-05 -1.51E-05  4.48E-06
 
 OM11
+       -1.03E-04  2.75E-05 -1.86E-04  1.11E-05  5.11E-06  2.38E-04
 
 OM12
+       ......... ......... ......... ......... ......... ......... .........
 
 OM13
+       ......... ......... ......... ......... ......... ......... ......... .........
 
 OM14
+       ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 OM22
+       -2.92E-05  4.42E-05 -1.86E-04 -8.19E-05  2.91E-06 -2.38E-05 ......... ......... .........  1.41E-04
 
 OM23
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 OM24
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 OM33
+       -1.22E-04 -7.48E-05  1.99E-03  5.40E-04 -2.20E-05 -9.08E-05 ......... ......... ......... -1.02E-04 ......... .........
          3.73E-03
 
 OM34
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
         ......... .........
 
 OM44
+       -4.57E-06  3.15E-05 -5.40E-05 -5.53E-05  7.74E-07  2.61E-05 ......... ......... ......... -7.37E-06 ......... .........
          9.71E-05 .........  2.18E-04
 
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
+        3.10E-02
 
 TH 2
+       -1.23E-01  2.97E-02
 
 TH 3
+       -1.17E-01 -5.93E-02  7.74E-02
 
 TH 4
+        5.63E-02 -2.32E-01  4.36E-01  3.48E-02
 
 TH 5
+       -1.07E-01  4.79E-03 -1.17E-01 -2.05E-01  2.12E-03
 
 OM11
+       -2.14E-01  5.99E-02 -1.56E-01  2.07E-02  1.57E-01  1.54E-02
 
 OM12
+       ......... ......... ......... ......... ......... ......... .........
 
 OM13
+       ......... ......... ......... ......... ......... ......... ......... .........
 
 OM14
+       ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 OM22
+       -7.94E-02  1.26E-01 -2.02E-01 -1.98E-01  1.16E-01 -1.30E-01 ......... ......... .........  1.19E-02
 
 OM23
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 OM24
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 OM33
+       -6.43E-02 -4.13E-02  4.21E-01  2.54E-01 -1.70E-01 -9.64E-02 ......... ......... ......... -1.41E-01 ......... .........
          6.10E-02
 
 OM34
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
         ......... .........
 
 OM44
+       -9.98E-03  7.18E-02 -4.73E-02 -1.08E-01  2.48E-02  1.14E-01 ......... ......... ......... -4.21E-02 ......... .........
          1.08E-01 .........  1.48E-02
 
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
+        1.18E+03
 
 TH 2
+        1.01E+02  1.24E+03
 
 TH 3
+        1.04E+02 -3.22E+01  2.58E+02
 
 TH 4
+       -1.27E+02  2.60E+02 -2.08E+02  1.17E+03
 
 TH 5
+        1.10E+03  1.27E+03 -3.39E+02  2.88E+03  2.47E+05
 
 OM11
+        6.22E+02 -1.81E+02  2.49E+02 -3.98E+02 -5.36E+03  5.04E+03
 
 OM12
+       ......... ......... ......... ......... ......... ......... .........
 
 OM13
+       ......... ......... ......... ......... ......... ......... ......... .........
 
 OM14
+       ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 OM22
+        3.83E+02 -3.19E+02  2.33E+02  1.46E+02 -4.22E+03  1.28E+03 ......... ......... .........  8.06E+03
 
 OM23
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 OM24
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 OM33
+        3.76E+01  4.98E+00 -9.51E+01 -5.32E+01  1.04E+03  8.27E+01 ......... ......... .........  8.06E+01 ......... .........
          3.44E+02
 
 OM34
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
         ......... .........
 
 OM44
+       -7.82E+01 -1.15E+02  3.96E+01  2.71E+02 -3.57E+02 -5.77E+02 ......... ......... .........  2.48E+02 ......... .........
         -2.01E+02 .........  4.85E+03
 
 SG11
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
         ......... ......... ......... .........
 
 Elapsed finaloutput time in seconds:     0.41
 #CPUT: Total CPU Time in Seconds,      310.703
