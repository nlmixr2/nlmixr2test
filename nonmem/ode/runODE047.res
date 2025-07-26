Run Start Date:  29/08/2019 
Run Start Time: 18:05:58.62 
Run Stop Date:   29/08/2019 
Run Stop Time:  18:12:31.16 
  
************************************************************************************************************************ 
********************                            CONTROL STREAM                                      ******************** 
************************************************************************************************************************ 
  
$PROB    INFUSION_2CPT_CLV1QV2 MULTIPLE DOSE FOCEI (120 Ind/4680 Obs) runODE047
$INPUT   ID TIME DV LNDV MDV AMT RATE EVID DOSE V1I CLI QI V2I SSX IIX SD CMT
$DATA    INFUSION_2CPT.csv IGNORE=@ IGNORE (SD.EQ.1)
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
        ONEHEADER NOPRINT FILE=runODE047.csv   
   
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
 INFUSION_2CPT_CLV1QV2 MULTIPLE DOSE FOCEI (120 Ind/4680 Obs) runODE047
0DATA CHECKOUT RUN:              NO
 DATA SET LOCATED ON UNIT NO.:    2
 THIS UNIT TO BE REWOUND:        NO
 NO. OF DATA RECS IN DATA SET:     5520
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
 RAW OUTPUT FILE (FILE): runODE047.ext
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

 
0ITERATION NO.:    0    OBJECTIVE VALUE:   46971.3080847225        NO. OF FUNC. EVALS.:   7
 CUMULATIVE NO. OF FUNC. EVALS.:        7
 NPARAMETR:  1.6000E+00  4.5000E+00  1.6000E+00  4.0000E+00  3.0000E-01  1.5000E-01  1.5000E-01  1.5000E-01  1.5000E-01
 PARAMETER:  1.0000E-01  1.0000E-01  1.0000E-01  1.0000E-01  1.0000E-01  1.0000E-01  1.0000E-01  1.0000E-01  1.0000E-01
 GRADIENT:   7.0744E+03  1.8008E+04  5.0760E+02  5.5833E+03  2.7752E+03  3.2732E+01  1.0418E+01  1.1121E+01  4.0281E+01
 
0ITERATION NO.:    5    OBJECTIVE VALUE:   46296.6555307810        NO. OF FUNC. EVALS.:  47
 CUMULATIVE NO. OF FUNC. EVALS.:       54
 NPARAMETR:  1.2607E+00  4.1095E+00  2.2850E+00  3.9830E+00  1.8555E-01  1.4441E-01  1.4374E-01  1.5007E-01  1.4760E-01
 PARAMETER:  7.8793E-02  9.1323E-02  1.4281E-01  9.9575E-02 -5.3192E-01  8.1012E-02  7.8691E-02  1.0022E-01  9.1928E-02
 GRADIENT:   2.0120E+03  2.2947E+02  7.0476E+03  3.4730E+03 -1.6319E+03  6.9549E+01  7.8597E+01 -2.1820E+02  4.2591E+01
 
0ITERATION NO.:   10    OBJECTIVE VALUE:   46086.5600840487        NO. OF FUNC. EVALS.:  44
 CUMULATIVE NO. OF FUNC. EVALS.:       98
 NPARAMETR:  1.2583E+00  4.1359E+00  2.1908E+00  3.9214E+00  1.9473E-01  1.1981E-01  1.1335E-01  8.3865E-01  1.1735E-01
 PARAMETER:  7.8643E-02  9.1909E-02  1.3692E-01  9.8034E-02 -4.7226E-01 -1.2371E-02 -4.0067E-02  9.6058E-01 -2.2736E-02
 GRADIENT:   1.3683E+03 -2.2341E+02  2.0825E+03  1.9766E+03 -6.7375E+02  3.9195E+01  4.4355E+01 -3.2956E+01  2.1651E+01
 
0ITERATION NO.:   15    OBJECTIVE VALUE:   45997.2970131373        NO. OF FUNC. EVALS.:  45
 CUMULATIVE NO. OF FUNC. EVALS.:      143
 NPARAMETR:  1.2442E+00  4.1868E+00  1.4193E+00  3.8128E+00  2.0667E-01  1.0014E-01  8.9635E-02  1.3095E-01  1.1357E-01
 PARAMETER:  7.7759E-02  9.3040E-02  8.8708E-02  9.5319E-02 -3.9780E-01 -1.0203E-01 -1.5744E-01  3.2101E-02 -3.9094E-02
 GRADIENT:  -1.5850E+02 -1.4353E+01  2.4962E+02 -3.2729E+02  7.2518E+01 -2.4402E+00 -2.6384E+00 -8.8355E+00 -1.0823E+00
 
0ITERATION NO.:   20    OBJECTIVE VALUE:   45995.8842937467        NO. OF FUNC. EVALS.:  40
 CUMULATIVE NO. OF FUNC. EVALS.:      183
 NPARAMETR:  1.2440E+00  4.1859E+00  1.3840E+00  3.8151E+00  2.0517E-01  1.0123E-01  9.0896E-02  1.9970E-01  1.1561E-01
 PARAMETER:  7.7748E-02  9.3019E-02  8.6498E-02  9.5378E-02 -4.0701E-01 -9.6622E-02 -1.5046E-01  2.4308E-01 -3.0194E-02
 GRADIENT:   8.8199E+00 -1.3617E+00 -1.4748E+00  1.3580E+01 -3.5064E+00  2.2829E-01  1.6206E-01  5.4739E-02  2.5191E-01
 
0ITERATION NO.:   25    OBJECTIVE VALUE:   45980.5216326933        NO. OF FUNC. EVALS.:  79
 CUMULATIVE NO. OF FUNC. EVALS.:      262
 NPARAMETR:  1.3208E+00  4.2322E+00  1.4043E+00  3.8365E+00  2.0563E-01  9.0815E-02  8.9124E-02  1.9590E-01  1.1326E-01
 PARAMETER:  8.2550E-02  9.4048E-02  8.7770E-02  9.5913E-02 -4.0415E-01 -1.5090E-01 -1.6030E-01  2.3348E-01 -4.0465E-02
 GRADIENT:   9.1869E-01  6.7551E+01 -1.8478E-01  1.5252E+01  9.9368E-01  2.3914E-01 -2.7649E-01  7.0762E-02 -8.2748E-02
 
0ITERATION NO.:   30    OBJECTIVE VALUE:   45979.1526956092        NO. OF FUNC. EVALS.:  98
 CUMULATIVE NO. OF FUNC. EVALS.:      360
 NPARAMETR:  1.3522E+00  4.2266E+00  1.4079E+00  3.8314E+00  2.0568E-01  8.9771E-02  8.9283E-02  1.9288E-01  1.1352E-01
 PARAMETER:  8.4514E-02  9.3924E-02  8.7996E-02  9.5784E-02 -4.0389E-01 -1.5669E-01 -1.5941E-01  2.2571E-01 -3.9310E-02
 GRADIENT:   1.3112E+03 -5.9055E+02 -4.5205E+00 -3.6748E+02 -5.0184E-01  2.6517E-01  5.4978E-02 -2.9774E-02  3.1290E-01
 
0ITERATION NO.:   31    OBJECTIVE VALUE:   45979.1526956092        NO. OF FUNC. EVALS.:  10
 CUMULATIVE NO. OF FUNC. EVALS.:      370
 NPARAMETR:  1.3522E+00  4.2266E+00  1.4079E+00  3.8314E+00  2.0568E-01  8.9771E-02  8.9283E-02  1.9288E-01  1.1352E-01
 PARAMETER:  8.4514E-02  9.3924E-02  8.7996E-02  9.5784E-02 -4.0389E-01 -1.5669E-01 -1.5941E-01  2.2571E-01 -3.9310E-02
 GRADIENT:   1.3112E+03 -5.9055E+02 -4.5205E+00 -3.6748E+02 -5.0184E-01  2.6517E-01  5.4978E-02 -2.9774E-02  3.1290E-01
 
 #TERM:
0MINIMIZATION SUCCESSFUL
 NO. OF FUNCTION EVALUATIONS USED:      370
 NO. OF SIG. DIGITS IN FINAL EST.:  2.1

 ETABAR IS THE ARITHMETIC MEAN OF THE ETA-ESTIMATES,
 AND THE P-VALUE IS GIVEN FOR THE NULL HYPOTHESIS THAT THE TRUE MEAN IS 0.
 
 ETABAR:         1.5387E-03 -1.1508E-02  1.6037E-02  1.3004E-02
 SE:             2.7126E-02  2.5941E-02  2.3276E-02  2.4839E-02
 N:                     120         120         120         120
 
 P VAL.:         9.5476E-01  6.5732E-01  4.9082E-01  6.0060E-01
 
 ETASHRINKSD(%)  4.0898E-01  4.4999E+00  4.1698E+01  1.8903E+01
 ETASHRINKVR(%)  8.1630E-01  8.7974E+00  6.6009E+01  3.4233E+01
 EBVSHRINKSD(%)  7.0816E-01  4.5701E+00  4.0118E+01  1.8399E+01
 EBVSHRINKVR(%)  1.4113E+00  8.9314E+00  6.4142E+01  3.3412E+01
 EPSSHRINKSD(%)  3.4761E+00
 EPSSHRINKVR(%)  6.8314E+00
 
  
 TOTAL DATA POINTS NORMALLY DISTRIBUTED (N):         4680
 N*LOG(2PI) CONSTANT TO OBJECTIVE FUNCTION:    8601.26467079574     
 OBJECTIVE FUNCTION VALUE WITHOUT CONSTANT:    45979.1526956092     
 OBJECTIVE FUNCTION VALUE WITH CONSTANT:       54580.4173664049     
 REPORTED OBJECTIVE FUNCTION DOES NOT CONTAIN CONSTANT
  
 TOTAL EFFECTIVE ETAS (NIND*NETA):                           480
  
 #TERE:
 Elapsed estimation  time in seconds:   287.35
 Elapsed covariance  time in seconds:    94.02
 Elapsed postprocess time in seconds:     1.41
1
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 ************************************************************************************************************************
 ********************                                                                                ********************
 ********************               FIRST ORDER CONDITIONAL ESTIMATION WITH INTERACTION              ********************
 #OBJT:**************                       MINIMUM VALUE OF OBJECTIVE FUNCTION                      ********************
 ********************                                                                                ********************
 ************************************************************************************************************************
 





 #OBJV:********************************************    45979.153       **************************************************
1
 ************************************************************************************************************************
 ********************                                                                                ********************
 ********************               FIRST ORDER CONDITIONAL ESTIMATION WITH INTERACTION              ********************
 ********************                             FINAL PARAMETER ESTIMATE                           ********************
 ********************                                                                                ********************
 ************************************************************************************************************************
 


 THETA - VECTOR OF FIXED EFFECTS PARAMETERS   *********


         TH 1      TH 2      TH 3      TH 4      TH 5     
 
         1.35E+00  4.23E+00  1.41E+00  3.83E+00  2.06E-01
 


 OMEGA - COV MATRIX FOR RANDOM EFFECTS - ETAS  ********


         ETA1      ETA2      ETA3      ETA4     
 
 ETA1
+        8.98E-02
 
 ETA2
+        0.00E+00  8.93E-02
 
 ETA3
+        0.00E+00  0.00E+00  1.93E-01
 
 ETA4
+        0.00E+00  0.00E+00  0.00E+00  1.14E-01
 


 SIGMA - COV MATRIX FOR RANDOM EFFECTS - EPSILONS  ****


         EPS1     
 
 EPS1
+        1.00E+00
 
1


 OMEGA - CORR MATRIX FOR RANDOM EFFECTS - ETAS  *******


         ETA1      ETA2      ETA3      ETA4     
 
 ETA1
+        3.00E-01
 
 ETA2
+        0.00E+00  2.99E-01
 
 ETA3
+        0.00E+00  0.00E+00  4.39E-01
 
 ETA4
+        0.00E+00  0.00E+00  0.00E+00  3.37E-01
 


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
 
         2.83E-02  2.92E-02  8.76E-02  4.13E-02  2.31E-03
 


 OMEGA - COV MATRIX FOR RANDOM EFFECTS - ETAS  ********


         ETA1      ETA2      ETA3      ETA4     
 
 ETA1
+        1.04E-02
 
 ETA2
+       .........  1.27E-02
 
 ETA3
+       ......... .........  8.28E-02
 
 ETA4
+       ......... ......... .........  2.30E-02
 


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
+       .........  2.13E-02
 
 ETA3
+       ......... .........  9.43E-02
 
 ETA4
+       ......... ......... .........  3.42E-02
 


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
+        8.03E-04
 
 TH 2
+       -7.18E-05  8.52E-04
 
 TH 3
+        8.31E-04 -4.15E-04  7.68E-03
 
 TH 4
+        3.89E-04 -2.72E-04  1.38E-03  1.71E-03
 
 TH 5
+        1.83E-06 -6.06E-07  2.69E-05  2.81E-06  5.32E-06
 
 OM11
+        5.57E-05  1.45E-05  1.26E-04  2.04E-06 -4.65E-06  1.08E-04
 
 OM12
+       ......... ......... ......... ......... ......... ......... .........
 
 OM13
+       ......... ......... ......... ......... ......... ......... ......... .........
 
 OM14
+       ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 OM22
+       -1.20E-06 -5.18E-05  1.89E-05  5.57E-05  1.04E-06 -8.09E-06 ......... ......... .........  1.61E-04
 
 OM23
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 OM24
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 OM33
+        2.44E-04  1.84E-04  6.77E-04  1.27E-04 -3.05E-05  2.32E-04 ......... ......... ......... -1.97E-04 ......... .........
          6.86E-03
 
 OM34
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
         ......... .........
 
 OM44
+       -1.39E-04  5.88E-05 -4.64E-04 -2.72E-04 -4.55E-06 -2.24E-05 ......... ......... ......... -1.18E-05 ......... .........
         -2.01E-04 .........  5.30E-04
 
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
+        2.83E-02
 
 TH 2
+       -8.68E-02  2.92E-02
 
 TH 3
+        3.35E-01 -1.62E-01  8.76E-02
 
 TH 4
+        3.32E-01 -2.25E-01  3.80E-01  4.13E-02
 
 TH 5
+        2.80E-02 -8.99E-03  1.33E-01  2.95E-02  2.31E-03
 
 OM11
+        1.89E-01  4.76E-02  1.38E-01  4.74E-03 -1.94E-01  1.04E-02
 
 OM12
+       ......... ......... ......... ......... ......... ......... .........
 
 OM13
+       ......... ......... ......... ......... ......... ......... ......... .........
 
 OM14
+       ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 OM22
+       -3.34E-03 -1.40E-01  1.69E-02  1.06E-01  3.56E-02 -6.12E-02 ......... ......... .........  1.27E-02
 
 OM23
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 OM24
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 OM33
+        1.04E-01  7.59E-02  9.32E-02  3.71E-02 -1.60E-01  2.69E-01 ......... ......... ......... -1.87E-01 ......... .........
          8.28E-02
 
 OM34
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
         ......... .........
 
 OM44
+       -2.14E-01  8.75E-02 -2.30E-01 -2.86E-01 -8.56E-02 -9.33E-02 ......... ......... ......... -4.03E-02 ......... .........
         -1.06E-01 .........  2.30E-02
 
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
+        1.55E+03
 
 TH 2
+        1.05E+01  1.27E+03
 
 TH 3
+       -1.01E+02  4.51E+01  1.71E+02
 
 TH 4
+       -2.44E+02  1.52E+02 -9.76E+01  7.89E+02
 
 TH 5
+       -3.98E+02 -5.90E+02 -9.27E+02  6.43E+02  2.06E+05
 
 OM11
+       -6.22E+02 -1.76E+02 -1.58E+02  2.79E+02  8.93E+03  1.08E+04
 
 OM12
+       ......... ......... ......... ......... ......... ......... .........
 
 OM13
+       ......... ......... ......... ......... ......... ......... ......... .........
 
 OM14
+       ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 OM22
+        7.56E+01  3.06E+02  1.76E+01 -1.92E+02 -1.05E+02  2.67E+01 ......... ......... .........  6.59E+03
 
 OM23
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 OM24
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 OM33
+       -1.48E+01 -3.08E+01 -9.45E+00 -5.09E+00  7.78E+02 -2.78E+02 ......... ......... .........  1.82E+02 ......... .........
          1.68E+02
 
 OM34
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
         ......... .........
 
 OM44
+        1.59E+02 -3.88E+01  5.00E+01  2.49E+02  1.92E+03  2.87E+02 ......... ......... .........  1.19E+02 ......... .........
          5.14E+01 .........  2.16E+03
 
 SG11
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
         ......... ......... ......... .........
 
 Elapsed finaloutput time in seconds:     0.35
 #CPUT: Total CPU Time in Seconds,      384.281
