Run Start Date:  29/08/2019 
Run Start Time: 20:04:23.16 
Run Stop Date:   29/08/2019 
Run Stop Time:  20:33:22.53 
  
************************************************************************************************************************ 
********************                            CONTROL STREAM                                      ******************** 
************************************************************************************************************************ 
  
$PROB    ORAL1_2CPT_KACLV1QV2 ALL DOSES FOCEI (120 Ind/6960 Obs) runODE063
$INPUT   ID TIME DV LNDV MDV AMT EVID DOSE V1I CLI QI V2I KAI SSX IIX SD CMT
$DATA    ORAL_2CPT.csv IGNORE=@ 
$SUBR    ADVAN13 TOL=7
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
        ONEHEADER NOPRINT FILE=runODE063.csv   
   
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
 ORAL1_2CPT_KACLV1QV2 ALL DOSES FOCEI (120 Ind/6960 Obs) runODE063
0DATA CHECKOUT RUN:              NO
 DATA SET LOCATED ON UNIT NO.:    2
 THIS UNIT TO BE REWOUND:        NO
 NO. OF DATA RECS IN DATA SET:     7920
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
 NRD (RELATIVE) VALUE(S) OF TOLERANCE:   7
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
 RAW OUTPUT FILE (FILE): runODE063.ext
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

 
0ITERATION NO.:    0    OBJECTIVE VALUE:   65917.7189612083        NO. OF FUNC. EVALS.:   8
 CUMULATIVE NO. OF FUNC. EVALS.:        8
 NPARAMETR:  1.6000E+00  4.5000E+00  1.6000E+00  4.0000E+00  2.0000E-01  3.0000E-01  1.5000E-01  1.5000E-01  1.5000E-01  1.5000E-01
             1.5000E-01
 PARAMETER:  1.0000E-01  1.0000E-01  1.0000E-01  1.0000E-01  1.0000E-01  1.0000E-01  1.0000E-01  1.0000E-01  1.0000E-01  1.0000E-01
             1.0000E-01
 GRADIENT:   7.8056E+03  1.8059E+04  2.1437E+03  7.2116E+03  5.7204E+02  4.4511E+03  1.6277E+01  6.5170E+01 -3.4969E-02  4.8628E+01
             4.5595E+00
 
0ITERATION NO.:    5    OBJECTIVE VALUE:   64429.3846058752        NO. OF FUNC. EVALS.:  49
 CUMULATIVE NO. OF FUNC. EVALS.:       57
 NPARAMETR:  9.8603E-01  4.1361E+00  1.5106E+00  3.8352E+00  5.2742E-02  1.8605E-01  1.5190E-01  1.4557E-01  1.5013E-01  1.4795E-01
             1.4973E-01
 PARAMETER:  6.1627E-02  9.1914E-02  9.4415E-02  9.5881E-02  2.6371E-02 -5.2856E-01  1.0630E-01  8.4998E-02  1.0045E-01  9.3122E-02
             9.9087E-02
 GRADIENT:  -2.6211E+03  4.9906E+03  1.4151E+03  5.9458E+02  3.8505E+02 -1.3596E+03 -1.2304E+02  9.7743E+01 -7.9573E+00  5.9004E+01
             1.9803E+01
 
0ITERATION NO.:   10    OBJECTIVE VALUE:   64376.5096508497        NO. OF FUNC. EVALS.:  48
 CUMULATIVE NO. OF FUNC. EVALS.:      105
 NPARAMETR:  1.0063E+00  4.0936E+00  1.5476E+00  3.8600E+00 -1.3220E-01  1.8833E-01  1.3935E-01  8.6278E-02  3.3434E-01  8.4536E-02
             1.2849E-01
 PARAMETER:  6.2895E-02  9.0968E-02  9.6726E-02  9.6500E-02 -6.6099E-02 -5.1357E-01  6.3169E-02 -1.7653E-01  5.0077E-01 -1.8673E-01
             2.2613E-02
 GRADIENT:  -2.9906E+03 -8.2622E+02  7.8536E+01 -2.3589E+03 -3.4381E+01 -1.0593E+03 -1.3107E+02  9.8178E+00  3.9763E+01  1.2334E+01
             2.8000E+01
 
0ITERATION NO.:   15    OBJECTIVE VALUE:   64280.2002523477        NO. OF FUNC. EVALS.:  48
 CUMULATIVE NO. OF FUNC. EVALS.:      153
 NPARAMETR:  1.1194E+00  4.1102E+00  1.4498E+00  3.8580E+00 -1.1957E-01  1.9862E-01  1.6097E-01  8.5753E-02  1.3371E-01  5.4221E-02
             1.1538E-01
 PARAMETER:  6.9963E-02  9.1339E-02  9.0614E-02  9.6450E-02 -5.9786E-02 -4.4763E-01  1.3529E-01 -1.7958E-01  4.2514E-02 -4.0879E-01
            -3.1198E-02
 GRADIENT:   2.7024E+02 -1.9947E+03 -5.6713E+02 -1.4725E+03 -5.0971E+01 -1.1094E+01  1.1649E+01  9.1796E+00 -1.1935E+01 -4.0940E+01
             7.4060E+00
 
0ITERATION NO.:   20    OBJECTIVE VALUE:   64266.3983840563        NO. OF FUNC. EVALS.:  62
 CUMULATIVE NO. OF FUNC. EVALS.:      215
 NPARAMETR:  1.1265E+00  4.1310E+00  1.4936E+00  3.8614E+00 -1.0844E-01  1.9877E-01  1.5071E-01  7.7958E-02  1.6262E-01  7.3922E-02
             1.0826E-01
 PARAMETER:  7.0406E-02  9.1800E-02  9.3347E-02  9.6535E-02 -5.4222E-02 -4.4673E-01  1.0236E-01 -2.2723E-01  1.4040E-01 -2.5381E-01
            -6.3030E-02
 GRADIENT:  -3.7163E+03 -8.8139E+03 -5.8721E+01 -3.2256E+03 -1.5971E+01  1.2134E+01  5.8082E-01  3.8638E+00 -1.0871E+00 -6.4660E+00
             1.4501E+00
 
0ITERATION NO.:   25    OBJECTIVE VALUE:   64208.5870935746        NO. OF FUNC. EVALS.: 116
 CUMULATIVE NO. OF FUNC. EVALS.:      331             RESET HESSIAN, TYPE I
 NPARAMETR:  1.3948E+00  4.2241E+00  1.4489E+00  3.8630E+00 -7.6824E-02  1.9898E-01  1.0305E-01  6.8152E-02  1.5218E-01  8.3439E-02
             1.0662E-01
 PARAMETER:  8.7177E-02  9.3869E-02  9.0557E-02  9.6574E-02 -3.8412E-02 -4.4541E-01 -8.7702E-02 -2.9445E-01  1.0723E-01 -1.9326E-01
            -7.0665E-02
 GRADIENT:   7.3555E+03  9.6842E+03  7.8882E+01  1.5453E+03 -8.2620E+00 -1.0180E+01  2.0562E+00  8.1017E-02  6.4691E-01 -1.7765E-01
             4.3836E-01
 
0ITERATION NO.:   30    OBJECTIVE VALUE:   64206.2867927503        NO. OF FUNC. EVALS.:  95
 CUMULATIVE NO. OF FUNC. EVALS.:      426             RESET HESSIAN, TYPE I
 NPARAMETR:  1.3506E+00  4.2258E+00  1.4490E+00  3.8636E+00 -7.5054E-02  1.9902E-01  1.0016E-01  6.8386E-02  1.5023E-01  8.3507E-02
             1.0651E-01
 PARAMETER:  8.4415E-02  9.3908E-02  9.0562E-02  9.6591E-02 -3.7527E-02 -4.4511E-01 -1.0193E-01 -2.9273E-01  1.0076E-01 -1.9285E-01
            -7.1177E-02
 GRADIENT:   5.7106E+03  9.9188E+03  1.2429E+02  1.6601E+03 -1.4964E+00 -3.8106E-01 -1.7571E-01  7.7836E-01 -3.8520E-02 -5.2458E-01
             1.5287E-01
 
0ITERATION NO.:   35    OBJECTIVE VALUE:   64206.2267260548        NO. OF FUNC. EVALS.: 127
 CUMULATIVE NO. OF FUNC. EVALS.:      553
 NPARAMETR:  1.3507E+00  4.2286E+00  1.4375E+00  3.8583E+00 -7.0688E-02  1.9906E-01  1.0021E-01  6.8044E-02  1.4600E-01  8.4810E-02
             1.0642E-01
 PARAMETER:  8.4416E-02  9.3968E-02  8.9845E-02  9.6456E-02 -3.5344E-02 -4.4486E-01 -1.0167E-01 -2.9524E-01  8.6480E-02 -1.8511E-01
            -7.1617E-02
 GRADIENT:   1.9492E+03  1.0957E+03  2.6748E+01 -6.1002E+02 -2.8554E+00 -1.3349E+00  7.8787E-03  7.5510E-02 -3.3746E-01 -2.6092E-01
            -1.4318E-01
 
0ITERATION NO.:   36    OBJECTIVE VALUE:   64206.2267260548        NO. OF FUNC. EVALS.:  12
 CUMULATIVE NO. OF FUNC. EVALS.:      565
 NPARAMETR:  1.3507E+00  4.2286E+00  1.4375E+00  3.8583E+00 -7.0688E-02  1.9906E-01  1.0021E-01  6.8044E-02  1.4600E-01  8.4810E-02
             1.0642E-01
 PARAMETER:  8.4416E-02  9.3968E-02  8.9845E-02  9.6456E-02 -3.5344E-02 -4.4486E-01 -1.0167E-01 -2.9524E-01  8.6480E-02 -1.8511E-01
            -7.1617E-02
 GRADIENT:   1.9492E+03  1.0957E+03  2.6748E+01 -6.1002E+02 -2.8554E+00 -1.3349E+00  7.8787E-03  7.5510E-02 -3.3746E-01 -2.6092E-01
            -1.4318E-01
 
 #TERM:
0MINIMIZATION SUCCESSFUL
 HOWEVER, PROBLEMS OCCURRED WITH THE MINIMIZATION.
 REGARD THE RESULTS OF THE ESTIMATION STEP CAREFULLY, AND ACCEPT THEM ONLY
 AFTER CHECKING THAT THE COVARIANCE STEP PRODUCES REASONABLE OUTPUT.
 NO. OF FUNCTION EVALUATIONS USED:      565
 NO. OF SIG. DIGITS IN FINAL EST.:  2.0

 ETABAR IS THE ARITHMETIC MEAN OF THE ETA-ESTIMATES,
 AND THE P-VALUE IS GIVEN FOR THE NULL HYPOTHESIS THAT THE TRUE MEAN IS 0.
 
 ETABAR:         1.1718E-04 -9.5307E-03  4.6596E-03  9.8910E-03 -1.0529E-02
 SE:             2.8749E-02  2.1967E-02  2.2918E-02  2.1961E-02  2.5950E-02
 N:                     120         120         120         120         120
 
 P VAL.:         9.9675E-01  6.6438E-01  8.3889E-01  6.5243E-01  6.8494E-01
 
 ETASHRINKSD(%)  9.8647E-02  7.3638E+00  3.4021E+01  1.7046E+01  1.2495E+01
 ETASHRINKVR(%)  1.9720E-01  1.4185E+01  5.6467E+01  3.1186E+01  2.3429E+01
 EBVSHRINKSD(%)  4.5498E-01  7.5394E+00  3.4098E+01  1.7349E+01  1.2648E+01
 EBVSHRINKVR(%)  9.0789E-01  1.4510E+01  5.6569E+01  3.1688E+01  2.3696E+01
 EPSSHRINKSD(%)  3.0092E+00
 EPSSHRINKVR(%)  5.9278E+00
 
  
 TOTAL DATA POINTS NORMALLY DISTRIBUTED (N):         6960
 N*LOG(2PI) CONSTANT TO OBJECTIVE FUNCTION:    12791.6243822090     
 OBJECTIVE FUNCTION VALUE WITHOUT CONSTANT:    64206.2267260548     
 OBJECTIVE FUNCTION VALUE WITH CONSTANT:       76997.8511082638     
 REPORTED OBJECTIVE FUNCTION DOES NOT CONTAIN CONSTANT
  
 TOTAL EFFECTIVE ETAS (NIND*NETA):                           600
  
 #TERE:
 Elapsed estimation  time in seconds:  1311.22
 Elapsed covariance  time in seconds:   411.42
 Elapsed postprocess time in seconds:     4.38
1
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 ************************************************************************************************************************
 ********************                                                                                ********************
 ********************               FIRST ORDER CONDITIONAL ESTIMATION WITH INTERACTION              ********************
 #OBJT:**************                       MINIMUM VALUE OF OBJECTIVE FUNCTION                      ********************
 ********************                                                                                ********************
 ************************************************************************************************************************
 





 #OBJV:********************************************    64206.227       **************************************************
1
 ************************************************************************************************************************
 ********************                                                                                ********************
 ********************               FIRST ORDER CONDITIONAL ESTIMATION WITH INTERACTION              ********************
 ********************                             FINAL PARAMETER ESTIMATE                           ********************
 ********************                                                                                ********************
 ************************************************************************************************************************
 


 THETA - VECTOR OF FIXED EFFECTS PARAMETERS   *********


         TH 1      TH 2      TH 3      TH 4      TH 5      TH 6     
 
         1.35E+00  4.23E+00  1.44E+00  3.86E+00 -7.07E-02  1.99E-01
 


 OMEGA - COV MATRIX FOR RANDOM EFFECTS - ETAS  ********


         ETA1      ETA2      ETA3      ETA4      ETA5     
 
 ETA1
+        1.00E-01
 
 ETA2
+        0.00E+00  6.80E-02
 
 ETA3
+        0.00E+00  0.00E+00  1.46E-01
 
 ETA4
+        0.00E+00  0.00E+00  0.00E+00  8.48E-02
 
 ETA5
+        0.00E+00  0.00E+00  0.00E+00  0.00E+00  1.06E-01
 


 SIGMA - COV MATRIX FOR RANDOM EFFECTS - EPSILONS  ****


         EPS1     
 
 EPS1
+        1.00E+00
 
1


 OMEGA - CORR MATRIX FOR RANDOM EFFECTS - ETAS  *******


         ETA1      ETA2      ETA3      ETA4      ETA5     
 
 ETA1
+        3.17E-01
 
 ETA2
+        0.00E+00  2.61E-01
 
 ETA3
+        0.00E+00  0.00E+00  3.82E-01
 
 ETA4
+        0.00E+00  0.00E+00  0.00E+00  2.91E-01
 
 ETA5
+        0.00E+00  0.00E+00  0.00E+00  0.00E+00  3.26E-01
 


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
 
         2.92E-02  3.12E-02  8.18E-02  3.85E-02  3.95E-02  1.66E-03
 


 OMEGA - COV MATRIX FOR RANDOM EFFECTS - ETAS  ********


         ETA1      ETA2      ETA3      ETA4      ETA5     
 
 ETA1
+        1.71E-02
 
 ETA2
+       .........  9.70E-03
 
 ETA3
+       ......... .........  4.63E-02
 
 ETA4
+       ......... ......... .........  1.74E-02
 
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
+        2.70E-02
 
 ETA2
+       .........  1.86E-02
 
 ETA3
+       ......... .........  6.06E-02
 
 ETA4
+       ......... ......... .........  2.98E-02
 
 ETA5
+       ......... ......... ......... .........  2.66E-02
 


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
+        8.53E-04
 
 TH 2
+       -6.58E-05  9.72E-04
 
 TH 3
+        5.40E-04 -1.27E-03  6.70E-03
 
 TH 4
+        6.80E-05 -4.61E-04  1.57E-03  1.48E-03
 
 TH 5
+       -4.83E-05  5.02E-04 -1.38E-03 -6.02E-04  1.56E-03
 
 TH 6
+       -4.14E-06  1.02E-05 -3.33E-06 -3.22E-06  1.99E-06  2.77E-06
 
 OM11
+        1.32E-04 -4.76E-05  4.43E-04  1.31E-04 -1.18E-04  1.82E-06  2.92E-04
 
 OM12
+       ......... ......... ......... ......... ......... ......... ......... .........
 
 OM13
+       ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 OM14
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 OM15
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 OM22
+       -1.54E-05 -1.60E-05  1.89E-06  2.41E-06  2.69E-06  1.97E-06 -1.48E-05 ......... ......... ......... .........  9.40E-05
 
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
+        2.05E-04 -4.95E-04  1.94E-03  4.77E-04 -4.35E-04 -3.97E-06  2.97E-04 ......... ......... ......... .........  1.52E-06
         ......... ......... .........  2.14E-03
 
 OM34
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
         ......... ......... ......... ......... .........
 
 OM35
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
         ......... ......... ......... ......... ......... .........
 
 OM44
+       -2.96E-05  1.61E-04 -4.90E-04 -1.26E-04  1.97E-04 -3.16E-07 -5.92E-05 ......... ......... ......... ......... -8.80E-06
         ......... ......... ......... -2.28E-04 ......... .........  3.01E-04
 
1

            TH 1      TH 2      TH 3      TH 4      TH 5      TH 6      OM11      OM12      OM13      OM14      OM15      OM22  
             OM23      OM24      OM25      OM33      OM34      OM35      OM44      OM45      OM55      SG11  
 
 OM45
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
         ......... ......... ......... ......... ......... ......... ......... .........
 
 OM55
+       -4.29E-05  1.36E-05 -1.10E-04  3.87E-05 -5.50E-05  2.05E-06 -3.11E-05 ......... ......... ......... ......... -2.70E-06
         ......... ......... ......... -1.10E-04 ......... ......... -2.37E-05 .........  3.01E-04
 
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
+        2.92E-02
 
 TH 2
+       -7.23E-02  3.12E-02
 
 TH 3
+        2.26E-01 -4.99E-01  8.18E-02
 
 TH 4
+        6.05E-02 -3.84E-01  4.99E-01  3.85E-02
 
 TH 5
+       -4.19E-02  4.07E-01 -4.27E-01 -3.95E-01  3.95E-02
 
 TH 6
+       -8.52E-02  1.96E-01 -2.44E-02 -5.02E-02  3.03E-02  1.66E-03
 
 OM11
+        2.65E-01 -8.95E-02  3.17E-01  1.99E-01 -1.75E-01  6.40E-02  1.71E-02
 
 OM12
+       ......... ......... ......... ......... ......... ......... ......... .........
 
 OM13
+       ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 OM14
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 OM15
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 OM22
+       -5.42E-02 -5.31E-02  2.38E-03  6.45E-03  7.02E-03  1.22E-01 -8.96E-02 ......... ......... ......... .........  9.70E-03
 
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
+        1.52E-01 -3.43E-01  5.12E-01  2.67E-01 -2.37E-01 -5.15E-02  3.75E-01 ......... ......... ......... .........  3.39E-03
         ......... ......... .........  4.63E-02
 
 OM34
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
         ......... ......... ......... ......... .........
 
 OM35
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
         ......... ......... ......... ......... ......... .........
 
 OM44
+       -5.83E-02  2.98E-01 -3.45E-01 -1.88E-01  2.87E-01 -1.09E-02 -2.00E-01 ......... ......... ......... ......... -5.23E-02
         ......... ......... ......... -2.84E-01 ......... .........  1.74E-02
 
1

            TH 1      TH 2      TH 3      TH 4      TH 5      TH 6      OM11      OM12      OM13      OM14      OM15      OM22  
             OM23      OM24      OM25      OM33      OM34      OM35      OM44      OM45      OM55      SG11  
 
 OM45
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
         ......... ......... ......... ......... ......... ......... ......... .........
 
 OM55
+       -8.46E-02  2.52E-02 -7.72E-02  5.78E-02 -8.02E-02  7.11E-02 -1.05E-01 ......... ......... ......... ......... -1.61E-02
         ......... ......... ......... -1.37E-01 ......... ......... -7.88E-02 .........  1.73E-02
 
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
+        1.32E+03
 
 TH 2
+       -3.03E+01  1.63E+03
 
 TH 3
+       -1.10E+02  1.81E+02  3.08E+02
 
 TH 4
+        6.54E+01  1.67E+02 -1.69E+02  9.82E+02
 
 TH 5
+       -5.03E+01 -2.45E+02  8.51E+01  1.72E+02  8.97E+02
 
 TH 6
+        2.32E+03 -5.27E+03 -9.27E+02  5.69E+02  2.90E+02  3.96E+05
 
 OM11
+       -5.17E+02 -3.20E+02 -8.87E+01 -1.67E+02  1.22E+02 -4.31E+03  4.52E+03
 
 OM12
+       ......... ......... ......... ......... ......... ......... ......... .........
 
 OM13
+       ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 OM14
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 OM15
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 OM22
+        7.93E+01  2.99E+02  3.28E+01 -4.09E+01 -8.52E+01 -9.48E+03  7.21E+02 ......... ......... ......... .........  1.11E+04
 
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
+        1.46E+01  1.27E+02 -1.41E+02  5.68E+00 -1.74E+01  6.53E+02 -4.55E+02 ......... ......... ......... ......... -4.85E+01
         ......... ......... .........  7.09E+02
 
 OM34
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
         ......... ......... ......... ......... .........
 
 OM35
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
         ......... ......... ......... ......... ......... .........
 
 OM44
+       -5.31E+01 -3.20E+02  1.50E+02 -1.04E+02 -2.29E+02  1.16E+03  4.11E+02 ......... ......... ......... .........  3.77E+02
         ......... ......... .........  1.76E+02 ......... .........  4.10E+03
 
1

            TH 1      TH 2      TH 3      TH 4      TH 5      TH 6      OM11      OM12      OM13      OM14      OM15      OM22  
             OM23      OM24      OM25      OM33      OM34      OM35      OM44      OM45      OM55      SG11  
 
 OM45
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
         ......... ......... ......... ......... ......... ......... ......... .........
 
 OM55
+        6.47E+01 -5.17E+01  8.35E+01 -1.82E+02  1.62E+02 -2.69E+03  3.20E+02 ......... ......... ......... .........  2.50E+02
         ......... ......... .........  1.63E+02 ......... .........  4.59E+02 .........  3.57E+03
 
 SG11
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
         ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 Elapsed finaloutput time in seconds:     0.55
1THERE ARE ERROR MESSAGES IN FILE PRDERR                                                                  
 #CPUT: Total CPU Time in Seconds,     1730.609
