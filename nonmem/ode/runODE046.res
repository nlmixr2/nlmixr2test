Run Start Date:  29/08/2019 
Run Start Time: 18:03:48.57 
Run Stop Date:   29/08/2019 
Run Stop Time:  18:05:57.32 
  
************************************************************************************************************************ 
********************                            CONTROL STREAM                                      ******************** 
************************************************************************************************************************ 
  
$PROB    INFUSION_2CPT_CLV1QV2 SINGLE DOSE FOCEI (120 Ind/2280 Obs) runODE046
$INPUT   ID TIME DV LNDV MDV AMT RATE EVID DOSE V1I CLI QI V2I SSX IIX SD CMT
$DATA    INFUSION_2CPT.csv IGNORE=@ IGNORE (SD.EQ.0)
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
        ONEHEADER NOPRINT FILE=runODE046.csv   
   
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
 INFUSION_2CPT_CLV1QV2 SINGLE DOSE FOCEI (120 Ind/2280 Obs) runODE046
0DATA CHECKOUT RUN:              NO
 DATA SET LOCATED ON UNIT NO.:    2
 THIS UNIT TO BE REWOUND:        NO
 NO. OF DATA RECS IN DATA SET:     2400
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

 TOT. NO. OF OBS RECS:     2280
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
 RAW OUTPUT FILE (FILE): runODE046.ext
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

 
0ITERATION NO.:    0    OBJECTIVE VALUE:   20308.7560861754        NO. OF FUNC. EVALS.:   7
 CUMULATIVE NO. OF FUNC. EVALS.:        7
 NPARAMETR:  1.6000E+00  4.5000E+00  1.6000E+00  4.0000E+00  3.0000E-01  1.5000E-01  1.5000E-01  1.5000E-01  1.5000E-01
 PARAMETER:  1.0000E-01  1.0000E-01  1.0000E-01  1.0000E-01  1.0000E-01  1.0000E-01  1.0000E-01  1.0000E-01  1.0000E-01
 GRADIENT:   4.6083E+03  1.8778E+04  1.9496E+03  2.0590E+03  1.3281E+03  5.4652E+01  9.9048E+00  1.5439E+01  5.6646E+01
 
0ITERATION NO.:    5    OBJECTIVE VALUE:   20213.6689000687        NO. OF FUNC. EVALS.:  50
 CUMULATIVE NO. OF FUNC. EVALS.:       57
 NPARAMETR:  1.2698E+00  4.2786E+00  1.2111E+00  4.0597E+00  2.9435E-01  1.4960E-01  1.4954E-01  1.4987E-01  1.4967E-01
 PARAMETER:  7.9365E-02  9.5080E-02  7.5694E-02  1.0149E-01  7.2925E-02  9.8671E-02  9.8476E-02  9.9554E-02  9.8908E-02
 GRADIENT:  -2.8330E+03  2.5543E+03 -3.9710E+02  2.3852E+03  1.4010E+03  5.2289E+01  8.7913E+01  3.0908E+01  4.1604E+01
 
0ITERATION NO.:   10    OBJECTIVE VALUE:   19744.9267319691        NO. OF FUNC. EVALS.:  41
 CUMULATIVE NO. OF FUNC. EVALS.:       98
 NPARAMETR:  1.2553E+00  4.2230E+00  1.3194E+00  3.9517E+00  2.1147E-01  1.0389E-01  9.0016E-02  1.8690E-01  4.1389E-02
 PARAMETER:  7.8457E-02  9.3845E-02  8.2465E-02  9.8792E-02 -3.6877E-01 -8.3652E-02 -1.5533E-01  2.0997E-01 -5.4381E-01
 GRADIENT:  -3.6057E+03  3.7455E+03 -2.2995E+01  1.3505E+03  4.0705E+02 -1.7014E+01 -4.0319E+00  1.5390E+01 -1.3380E+01
 
0ITERATION NO.:   15    OBJECTIVE VALUE:   19700.8800849287        NO. OF FUNC. EVALS.:  63
 CUMULATIVE NO. OF FUNC. EVALS.:      161
 NPARAMETR:  1.3699E+00  4.2103E+00  1.3311E+00  3.9025E+00  1.9608E-01  8.6535E-02  9.5474E-02  1.0766E-01  8.3715E-02
 PARAMETER:  8.5620E-02  9.3561E-02  8.3194E-02  9.7564E-02 -4.6367E-01 -1.7505E-01 -1.2589E-01 -6.5831E-02 -1.9161E-01
 GRADIENT:  -1.9705E+02  6.4812E+01  2.7684E+01 -5.1983E+02  2.9134E+00 -1.0112E+01  6.1268E+00  8.8715E-01 -1.6114E+00
 
0ITERATION NO.:   20    OBJECTIVE VALUE:   19699.9597104960        NO. OF FUNC. EVALS.:  99
 CUMULATIVE NO. OF FUNC. EVALS.:      260             RESET HESSIAN, TYPE I
 NPARAMETR:  1.3907E+00  4.2279E+00  1.3280E+00  3.9102E+00  1.9600E-01  9.0557E-02  9.2761E-02  1.0455E-01  8.6439E-02
 PARAMETER:  8.6916E-02  9.3954E-02  8.3002E-02  9.7755E-02 -4.6416E-01 -1.5233E-01 -1.4030E-01 -8.0473E-02 -1.7560E-01
 GRADIENT:   1.5488E+03  5.6598E+03  5.1384E+01  5.4178E+02 -4.1283E+00  6.4425E-01  8.2977E-01  1.5381E-01  8.3103E-02
 
0ITERATION NO.:   25    OBJECTIVE VALUE:   19699.9270151568        NO. OF FUNC. EVALS.:  80
 CUMULATIVE NO. OF FUNC. EVALS.:      340
 NPARAMETR:  1.3861E+00  4.2281E+00  1.3270E+00  3.9092E+00  1.9617E-01  9.0303E-02  9.2369E-02  1.0409E-01  8.6380E-02
 PARAMETER:  8.6634E-02  9.3957E-02  8.2940E-02  9.7729E-02 -4.6313E-01 -1.5373E-01 -1.4242E-01 -8.2671E-02 -1.7594E-01
 GRADIENT:   5.1308E+02  1.9315E+03  4.9191E+00 -7.4855E+01 -3.9261E-01  5.2261E-02 -6.7317E-02  1.9926E-01  1.9809E-02
 
 #TERM:
0MINIMIZATION SUCCESSFUL
 NO. OF FUNCTION EVALUATIONS USED:      340
 NO. OF SIG. DIGITS IN FINAL EST.:  2.4

 ETABAR IS THE ARITHMETIC MEAN OF THE ETA-ESTIMATES,
 AND THE P-VALUE IS GIVEN FOR THE NULL HYPOTHESIS THAT THE TRUE MEAN IS 0.
 
 ETABAR:         3.6946E-03 -5.5986E-03  1.6036E-02 -4.8158E-03
 SE:             2.6753E-02  2.7022E-02  1.7596E-02  1.9361E-02
 N:                     120         120         120         120
 
 P VAL.:         8.9016E-01  8.3586E-01  3.6211E-01  8.0357E-01
 
 ETASHRINKSD(%)  2.0660E+00  2.1948E+00  4.0006E+01  2.7533E+01
 ETASHRINKVR(%)  4.0894E+00  4.3414E+00  6.4007E+01  4.7486E+01
 EBVSHRINKSD(%)  2.0247E+00  2.8279E+00  3.9641E+01  2.7968E+01
 EBVSHRINKVR(%)  4.0085E+00  5.5759E+00  6.3568E+01  4.8114E+01
 EPSSHRINKSD(%)  7.0575E+00
 EPSSHRINKVR(%)  1.3617E+01
 
  
 TOTAL DATA POINTS NORMALLY DISTRIBUTED (N):         2280
 N*LOG(2PI) CONSTANT TO OBJECTIVE FUNCTION:    4190.35971141331     
 OBJECTIVE FUNCTION VALUE WITHOUT CONSTANT:    19699.9270151568     
 OBJECTIVE FUNCTION VALUE WITH CONSTANT:       23890.2867265701     
 REPORTED OBJECTIVE FUNCTION DOES NOT CONTAIN CONSTANT
  
 TOTAL EFFECTIVE ETAS (NIND*NETA):                           480
  
 #TERE:
 Elapsed estimation  time in seconds:    88.18
 Elapsed covariance  time in seconds:    31.22
 Elapsed postprocess time in seconds:     0.47
1
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 ************************************************************************************************************************
 ********************                                                                                ********************
 ********************               FIRST ORDER CONDITIONAL ESTIMATION WITH INTERACTION              ********************
 #OBJT:**************                       MINIMUM VALUE OF OBJECTIVE FUNCTION                      ********************
 ********************                                                                                ********************
 ************************************************************************************************************************
 





 #OBJV:********************************************    19699.927       **************************************************
1
 ************************************************************************************************************************
 ********************                                                                                ********************
 ********************               FIRST ORDER CONDITIONAL ESTIMATION WITH INTERACTION              ********************
 ********************                             FINAL PARAMETER ESTIMATE                           ********************
 ********************                                                                                ********************
 ************************************************************************************************************************
 


 THETA - VECTOR OF FIXED EFFECTS PARAMETERS   *********


         TH 1      TH 2      TH 3      TH 4      TH 5     
 
         1.39E+00  4.23E+00  1.33E+00  3.91E+00  1.96E-01
 


 OMEGA - COV MATRIX FOR RANDOM EFFECTS - ETAS  ********


         ETA1      ETA2      ETA3      ETA4     
 
 ETA1
+        9.03E-02
 
 ETA2
+        0.00E+00  9.24E-02
 
 ETA3
+        0.00E+00  0.00E+00  1.04E-01
 
 ETA4
+        0.00E+00  0.00E+00  0.00E+00  8.64E-02
 


 SIGMA - COV MATRIX FOR RANDOM EFFECTS - EPSILONS  ****


         EPS1     
 
 EPS1
+        1.00E+00
 
1


 OMEGA - CORR MATRIX FOR RANDOM EFFECTS - ETAS  *******


         ETA1      ETA2      ETA3      ETA4     
 
 ETA1
+        3.01E-01
 
 ETA2
+        0.00E+00  3.04E-01
 
 ETA3
+        0.00E+00  0.00E+00  3.23E-01
 
 ETA4
+        0.00E+00  0.00E+00  0.00E+00  2.94E-01
 


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
 
         2.85E-02  2.90E-02  6.06E-02  4.19E-02  3.41E-03
 


 OMEGA - COV MATRIX FOR RANDOM EFFECTS - ETAS  ********


         ETA1      ETA2      ETA3      ETA4     
 
 ETA1
+        1.10E-02
 
 ETA2
+       .........  1.45E-02
 
 ETA3
+       ......... .........  7.66E-02
 
 ETA4
+       ......... ......... .........  2.68E-02
 


 SIGMA - COV MATRIX FOR RANDOM EFFECTS - EPSILONS  ****


         EPS1     
 
 EPS1
+       .........
 
1


 OMEGA - CORR MATRIX FOR RANDOM EFFECTS - ETAS  *******


         ETA1      ETA2      ETA3      ETA4     
 
 ETA1
+        1.83E-02
 
 ETA2
+       .........  2.38E-02
 
 ETA3
+       ......... .........  1.19E-01
 
 ETA4
+       ......... ......... .........  4.55E-02
 


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
+        8.13E-04
 
 TH 2
+        4.61E-05  8.39E-04
 
 TH 3
+        3.79E-04 -3.58E-04  3.68E-03
 
 TH 4
+       -8.24E-05 -1.21E-04  4.55E-05  1.76E-03
 
 TH 5
+        7.56E-06 -8.01E-06 -3.20E-05 -1.69E-05  1.17E-05
 
 OM11
+        4.00E-05  4.30E-05  7.44E-05  2.08E-05 -3.89E-06  1.21E-04
 
 OM12
+       ......... ......... ......... ......... ......... ......... .........
 
 OM13
+       ......... ......... ......... ......... ......... ......... ......... .........
 
 OM14
+       ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 OM22
+        1.75E-05  6.29E-05 -8.10E-05 -1.02E-04 -1.44E-06 -5.48E-06 ......... ......... .........  2.10E-04
 
 OM23
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 OM24
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 OM33
+       -1.72E-04  4.38E-05  4.40E-04  1.25E-03 -7.60E-05  1.48E-04 ......... ......... ......... -1.95E-04 ......... .........
          5.87E-03
 
 OM34
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
         ......... .........
 
 OM44
+        6.61E-06  4.76E-05 -2.63E-04 -1.56E-04  2.32E-05 -1.49E-05 ......... ......... .........  4.78E-06 ......... .........
         -1.13E-03 .........  7.16E-04
 
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
+        2.85E-02
 
 TH 2
+        5.58E-02  2.90E-02
 
 TH 3
+        2.19E-01 -2.04E-01  6.06E-02
 
 TH 4
+       -6.90E-02 -9.99E-02  1.79E-02  4.19E-02
 
 TH 5
+        7.77E-02 -8.10E-02 -1.55E-01 -1.18E-01  3.41E-03
 
 OM11
+        1.27E-01  1.35E-01  1.11E-01  4.51E-02 -1.03E-01  1.10E-02
 
 OM12
+       ......... ......... ......... ......... ......... ......... .........
 
 OM13
+       ......... ......... ......... ......... ......... ......... ......... .........
 
 OM14
+       ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 OM22
+        4.25E-02  1.50E-01 -9.21E-02 -1.68E-01 -2.91E-02 -3.43E-02 ......... ......... .........  1.45E-02
 
 OM23
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 OM24
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 OM33
+       -7.87E-02  1.98E-02  9.47E-02  3.89E-01 -2.91E-01  1.76E-01 ......... ......... ......... -1.75E-01 ......... .........
          7.66E-02
 
 OM34
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
         ......... .........
 
 OM44
+        8.66E-03  6.15E-02 -1.62E-01 -1.39E-01  2.54E-01 -5.06E-02 ......... ......... .........  1.23E-02 ......... .........
         -5.50E-01 .........  2.68E-02
 
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
+        1.36E+03
 
 TH 2
+       -1.31E+02  1.36E+03
 
 TH 3
+       -1.60E+02  1.53E+02  3.22E+02
 
 TH 4
+        1.44E+01  1.12E+02  1.77E+01  6.96E+02
 
 TH 5
+       -1.32E+03  1.31E+03  9.25E+02  3.20E+02  9.98E+04
 
 OM11
+       -4.07E+02 -4.68E+02 -1.59E+02  2.82E+01  1.43E+03  8.96E+03
 
 OM12
+       ......... ......... ......... ......... ......... ......... .........
 
 OM13
+       ......... ......... ......... ......... ......... ......... ......... .........
 
 OM14
+       ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 OM22
+       -1.04E+02 -3.38E+02  1.02E+02  1.64E+02  1.75E+03  1.34E+02 ......... ......... .........  5.20E+03
 
 OM23
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 OM24
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 OM33
+        4.97E+01 -6.15E+01  1.33E+00 -1.64E+02  8.25E+02 -2.62E+02 ......... ......... .........  2.15E+02 ......... .........
          3.14E+02
 
 OM34
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
         ......... .........
 
 OM44
+        5.36E+01 -1.55E+02  8.18E+01 -1.18E+02 -1.59E+03 -2.90E+02 ......... ......... .........  3.47E+02 ......... .........
          4.29E+02 .........  2.13E+03
 
 SG11
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
         ......... ......... ......... .........
 
 Elapsed finaloutput time in seconds:     0.17
 #CPUT: Total CPU Time in Seconds,      120.578
