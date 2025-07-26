Run Start Date:  29/08/2019 
Run Start Time: 21:33:54.65 
Run Stop Date:   29/08/2019 
Run Stop Time:  23:24:29.79 
  
************************************************************************************************************************ 
********************                            CONTROL STREAM                                      ******************** 
************************************************************************************************************************ 
  
$PROB    ORAL1_2CPT_KAV1QV2VMKM MULTIPLE DOSE FOCEI (120 Ind/2280 Obs) runODE069
$INPUT   ID TIME DV LNDV MDV AMT EVID DOSE VI VMI KMI QI V2I KAI SD CMT
$DATA    ORAL_2CPTMM.csv IGNORE=@ IGNORE(SD.EQ.1)
$SUBR    ADVAN13 TOL=6
$MODEL
         COMP=(ABS,DEFDOSE)
         COMP=(CENTRAL,DEFOBS)
         COMP=(PERI)
$PK
         VM=EXP(THETA(1)+ETA(1))
         KM=EXP(THETA(2)+ETA(2))
         V2=EXP(THETA(3)+ETA(3))
         Q =EXP(THETA(4)+ETA(4))
         V3=EXP(THETA(5)+ETA(5))
         K12=EXP(THETA(6)+ETA(6))
         K23=Q/V2
         K32=Q/V3
         S2=V2
$DES
         C2     =  A(2)/V2
         DADT(1)= -K12*A(1)
         DADT(2)=  K12*A(1)+K32*A(3)-K23*A(2)-VM*C2/(KM+C2)  
         DADT(3)=         -K32*A(3)+K23*A(2)
$ERROR   
         IPRED = F     
         RESCV = THETA(7) 
         W     = IPRED*RESCV
         IRES  = DV-IPRED
         IWRES = IRES/W
         Y     = IPRED+W*EPS(1)

$THETA   7.1       ;log VM
$THETA   5.7       ;log KM 
$THETA   4.5       ;log Vc
$THETA   1.6       ;log Q
$THETA   4.1       ;log Vp
$THETA   0.22      ;log KA
$THETA   (0,0.3,1) ;RSV
$OMEGA   0.15 0.15 0.15 0.15 0.15 0.15
$SIGMA   1 FIX
$EST     NSIG=2 SIGL=6 PRINT=5 MAX=9999 NOABORT POSTHOC METHOD=COND INTER NOOBT
$COV
$TABLE  ID TIME LNDV MDV AMT EVID DOSE VI VMI KMI V2I V2 VM KM Q V3 K12 ETA1 ETA2 ETA3 ETA4 ETA5 ETA6
        IPRED IRES IWRES CWRESI
        ONEHEADER NOPRINT FILE=runODE069.csv   
   
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
 ORAL1_2CPT_KAV1QV2VMKM MULTIPLE DOSE FOCEI (120 Ind/2280 Obs) runODE069
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
 ID TIME DV LNDV MDV AMT EVID DOSE VI VMI KMI QI V2I KAI SD CMT
0(NONBLANK) LABELS FOR PRED-DEFINED ITEMS:
 VM KM V2 Q V3 K12 IPRED IRES IWRES
0FORMAT FOR DATA:
 (E3.0,3E6.0,E1.0,E5.0,E1.0,2E5.0,E6.0,E5.0,E4.0,2E5.0,2E1.0)

 TOT. NO. OF OBS RECS:     4680
 TOT. NO. OF INDIVIDUALS:      120
0LENGTH OF THETA:   7
0DEFAULT THETA BOUNDARY TEST OMITTED:    NO
0OMEGA HAS SIMPLE DIAGONAL FORM WITH DIMENSION:   6
0DEFAULT OMEGA BOUNDARY TEST OMITTED:   YES
0SIGMA HAS SIMPLE DIAGONAL FORM WITH DIMENSION:   1
0DEFAULT SIGMA BOUNDARY TEST OMITTED:    NO
0INITIAL ESTIMATE OF THETA:
 LOWER BOUND    INITIAL EST    UPPER BOUND
 -0.1000E+07     0.7100E+01     0.1000E+07
 -0.1000E+07     0.5700E+01     0.1000E+07
 -0.1000E+07     0.4500E+01     0.1000E+07
 -0.1000E+07     0.1600E+01     0.1000E+07
 -0.1000E+07     0.4100E+01     0.1000E+07
 -0.1000E+07     0.2200E+00     0.1000E+07
  0.0000E+00     0.3000E+00     0.1000E+01
0INITIAL ESTIMATE OF OMEGA:
 0.1500E+00
 0.0000E+00   0.1500E+00
 0.0000E+00   0.0000E+00   0.1500E+00
 0.0000E+00   0.0000E+00   0.0000E+00   0.1500E+00
 0.0000E+00   0.0000E+00   0.0000E+00   0.0000E+00   0.1500E+00
 0.0000E+00   0.0000E+00   0.0000E+00   0.0000E+00   0.0000E+00   0.1500E+00
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
 ID TIME LNDV MDV AMT EVID DOSE VI VMI KMI V2I V2 VM KM Q V3 K12 ETA1 ETA2 ETA3 ETA4 ETA5 ETA6 IPRED IRES IWRES CWRESI
1DOUBLE PRECISION PREDPP VERSION 7.4.3

 GENERAL NONLINEAR KINETICS MODEL WITH STIFF/NONSTIFF EQUATIONS (LSODA, ADVAN13)
0MODEL SUBROUTINE USER-SUPPLIED - ID NO. 9999
0MAXIMUM NO. OF BASIC PK PARAMETERS:   6
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
    2            7           *           *           *           *
    3            *           *           *           *           *
    4            *           -           -           -           -
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
 RAW OUTPUT FILE (FILE): runODE069.ext
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

 
0ITERATION NO.:    0    OBJECTIVE VALUE:   52057.2298448817        NO. OF FUNC. EVALS.:   9
 CUMULATIVE NO. OF FUNC. EVALS.:        9
 NPARAMETR:  7.1000E+00  5.7000E+00  4.5000E+00  1.6000E+00  4.1000E+00  2.2000E-01  3.0000E-01  1.5000E-01  1.5000E-01  1.5000E-01
             1.5000E-01  1.5000E-01  1.5000E-01
 PARAMETER:  1.0000E-01  1.0000E-01  1.0000E-01  1.0000E-01  1.0000E-01  1.0000E-01  1.0000E-01  1.0000E-01  1.0000E-01  1.0000E-01
             1.0000E-01  1.0000E-01  1.0000E-01
 GRADIENT:   3.8380E+04 -4.1659E+03  1.7273E+04  6.2803E+02  1.5643E+04  2.8409E+02  2.7904E+03  4.3825E+01 -8.4377E+00  1.4874E+01
            -5.3327E-01 -4.6979E+01  1.8813E+01
 
0ITERATION NO.:    5    OBJECTIVE VALUE:   51126.5570880539        NO. OF FUNC. EVALS.: 124
 CUMULATIVE NO. OF FUNC. EVALS.:      133
 NPARAMETR:  6.7204E+00  5.5249E+00  4.2869E+00  1.5838E+00  3.8327E+00  3.8102E-02  1.9178E-01  1.5500E-01  1.4527E-01  1.3329E-01
             1.5018E-01  1.3647E-01  1.4986E-01
 PARAMETER:  9.4653E-02  9.6929E-02  9.5265E-02  9.8986E-02  9.3480E-02  1.7319E-02 -4.9117E-01  1.1639E-01  8.3996E-02  4.0935E-02
             1.0059E-01  5.2718E-02  9.9549E-02
 GRADIENT:   1.0611E+05 -2.1631E+04  5.9911E+03  7.4021E+02  7.0911E+03  2.2106E+02 -9.5234E+02  3.9308E+01 -1.1855E+01  5.2077E+01
            -2.2340E+01  1.7029E-01 -5.6471E-01
 
0ITERATION NO.:   10    OBJECTIVE VALUE:   50909.8608802766        NO. OF FUNC. EVALS.: 133
 CUMULATIVE NO. OF FUNC. EVALS.:      266
 NPARAMETR:  6.9600E+00  5.8948E+00  4.2388E+00  5.4459E-01  3.8069E+00  5.0766E-02  1.9265E-01  6.2365E-02  1.1850E-01  8.9915E-02
             1.7777E-01  1.0661E-01  1.3014E-01
 PARAMETER:  9.8029E-02  1.0342E-01  9.4196E-02  3.4037E-02  9.2850E-02  2.3075E-02 -4.8559E-01 -3.3881E-01 -1.7868E-02 -1.5589E-01
             1.8492E-01 -7.0729E-02  2.8989E-02
 GRADIENT:   5.2093E+04  1.0931E+04  3.7174E+02  1.2581E+03  4.6129E+02  6.9733E+01 -6.4742E+02 -3.4083E+01 -2.0043E+01 -5.7763E+00
            -3.0273E+01  4.4798E+00 -9.1182E+00
 
0ITERATION NO.:   15    OBJECTIVE VALUE:   50871.3335791088        NO. OF FUNC. EVALS.:  98
 CUMULATIVE NO. OF FUNC. EVALS.:      364
 NPARAMETR:  6.9310E+00  5.8908E+00  4.3097E+00  2.6279E-01  3.8314E+00  1.2281E-02  2.0341E-01  8.6182E-02  1.6179E-01  9.1259E-02
             1.7872E-01  1.0288E-01  1.6172E-01
 PARAMETER:  9.7619E-02  1.0335E-01  9.5771E-02  1.6424E-02  9.3448E-02  5.5823E-03 -4.1783E-01 -1.7709E-01  1.3782E-01 -1.4847E-01
             1.8760E-01 -8.8529E-02  1.3763E-01
 GRADIENT:   4.6734E+04  1.0619E+04  3.7402E+03 -9.2515E+01  6.1866E+02 -7.9337E+01  1.0653E+02 -2.6681E+00  8.6592E-01  7.2448E+00
            -9.1369E+00  3.2543E+00  3.6782E+00
 
0ITERATION NO.:   20    OBJECTIVE VALUE:   50867.0117498788        NO. OF FUNC. EVALS.: 141
 CUMULATIVE NO. OF FUNC. EVALS.:      505
 NPARAMETR:  6.9347E+00  5.9183E+00  4.3323E+00  2.8010E-01  3.8564E+00  7.4668E-02  2.0170E-01  9.2657E-02  1.6452E-01  8.9245E-02
             2.5693E-01  1.0181E-01  1.5929E-01
 PARAMETER:  9.7671E-02  1.0383E-01  9.6274E-02  1.7507E-02  9.4058E-02  3.3940E-02 -4.2839E-01 -1.4087E-01  1.4621E-01 -1.5962E-01
             3.6909E-01 -9.3782E-02  1.3003E-01
 GRADIENT:   7.8246E+04 -1.2537E+04  1.1571E+03 -8.5524E+00  9.2256E+02  4.6480E+00  6.3327E+00 -3.7261E-02  7.5047E-01  4.2938E+00
            -1.1100E+00  2.3749E+00  6.2038E+00
 
0ITERATION NO.:   25    OBJECTIVE VALUE:   50864.6713094513        NO. OF FUNC. EVALS.: 154
 CUMULATIVE NO. OF FUNC. EVALS.:      659             RESET HESSIAN, TYPE I
 NPARAMETR:  6.9851E+00  5.9915E+00  4.3478E+00  2.7691E-01  3.7962E+00  1.0368E-01  2.0169E-01  9.1812E-02  1.4037E-01  8.7208E-02
             3.0245E-01  1.0059E-01  1.4933E-01
 PARAMETER:  9.8381E-02  1.0511E-01  9.6617E-02  1.7307E-02  9.2589E-02  4.7129E-02 -4.2850E-01 -1.4544E-01  6.6813E-02 -1.7117E-01
             4.5063E-01 -9.9800E-02  9.7749E-02
 GRADIENT:   4.7061E+04  1.1994E+04  6.7516E+03  1.5051E+00  1.4048E+03  4.1333E+01  3.4355E+00 -1.7110E+00 -4.1159E+00  2.3703E-01
             9.9048E-01  3.8535E+00  4.6910E+00
 
0ITERATION NO.:   30    OBJECTIVE VALUE:   50864.2901207344        NO. OF FUNC. EVALS.: 138
 CUMULATIVE NO. OF FUNC. EVALS.:      797
 NPARAMETR:  6.9958E+00  6.0028E+00  4.3511E+00  2.8540E-01  3.7817E+00  4.7993E-02  2.0164E-01  9.4095E-02  1.5801E-01  8.7102E-02
             2.8804E-01  1.0019E-01  1.4871E-01
 PARAMETER:  9.8533E-02  1.0531E-01  9.6690E-02  1.7838E-02  9.2238E-02  2.1815E-02 -4.2877E-01 -1.3316E-01  1.2602E-01 -1.7178E-01
             4.2624E-01 -1.0180E-01  9.5696E-02
 GRADIENT:   7.7895E+04 -1.3319E+04  2.8803E+03 -4.6378E+01  2.7436E+02 -4.3858E+01 -7.7978E-01  4.5551E+00 -2.0780E-01 -4.0273E-01
            -1.9196E+00  4.6764E+00  2.6755E+00
 
0ITERATION NO.:   35    OBJECTIVE VALUE:   50863.6469486450        NO. OF FUNC. EVALS.: 155
 CUMULATIVE NO. OF FUNC. EVALS.:      952             RESET HESSIAN, TYPE I
 NPARAMETR:  7.0029E+00  6.0318E+00  4.3462E+00  2.9878E-01  3.7783E+00  1.0481E-01  2.0166E-01  9.0880E-02  1.6341E-01  8.7507E-02
             3.0518E-01  9.3396E-02  1.2566E-01
 PARAMETER:  9.8632E-02  1.0582E-01  9.6583E-02  1.8674E-02  9.2155E-02  4.7641E-02 -4.2867E-01 -1.5055E-01  1.4281E-01 -1.6946E-01
             4.5513E-01 -1.3689E-01  1.1475E-02
 GRADIENT:   4.6804E+04  1.2375E+04  6.5497E+03  3.3089E+01  1.1548E+03  4.3331E+01 -2.0085E+00  1.1918E+00 -1.8005E+00 -5.8544E-01
            -3.0558E-01  2.7703E+00 -1.6546E+00
 
0ITERATION NO.:   40    OBJECTIVE VALUE:   50863.1299952571        NO. OF FUNC. EVALS.: 154
 CUMULATIVE NO. OF FUNC. EVALS.:     1106
 NPARAMETR:  7.0199E+00  6.0514E+00  4.3456E+00  3.1727E-01  3.7614E+00  1.0491E-01  2.0172E-01  8.7470E-02  1.7198E-01  8.8230E-02
             3.1824E-01  8.4032E-02  1.2667E-01
 PARAMETER:  9.8871E-02  1.0616E-01  9.6569E-02  1.9830E-02  9.1741E-02  4.7688E-02 -4.2825E-01 -1.6967E-01  1.6836E-01 -1.6534E-01
             4.7609E-01 -1.8972E-01  1.5475E-02
 GRADIENT:   7.7238E+04 -1.3280E+04  1.8492E+03  4.0409E+01  3.5824E+02  4.7616E+01 -5.3163E-01  6.7554E-01 -1.4388E+00 -2.0581E-01
            -5.0470E-01  1.2112E+00 -1.1640E+00
 
0ITERATION NO.:   45    OBJECTIVE VALUE:   50862.8453342273        NO. OF FUNC. EVALS.: 150
 CUMULATIVE NO. OF FUNC. EVALS.:     1256
 NPARAMETR:  7.0319E+00  6.0784E+00  4.3449E+00  3.3841E-01  3.7545E+00  1.0178E-01  2.0168E-01  8.5106E-02  1.8175E-01  8.8621E-02
             3.2650E-01  8.2753E-02  1.3268E-01
 PARAMETER:  9.9041E-02  1.0664E-01  9.6554E-02  2.1150E-02  9.1574E-02  4.6262E-02 -4.2852E-01 -1.8337E-01  1.9599E-01 -1.6313E-01
             4.8890E-01 -1.9739E-01  3.8646E-02
 GRADIENT:   7.6861E+04 -1.3311E+04  1.9320E+03  8.5148E+01  2.9717E+02  4.8126E+01  6.9447E-02  1.7743E-01 -1.2247E+00 -7.1149E-02
            -4.6297E-01  1.1969E+00  6.3927E-01
 
0ITERATION NO.:   50    OBJECTIVE VALUE:   50862.2484532239        NO. OF FUNC. EVALS.: 164
 CUMULATIVE NO. OF FUNC. EVALS.:     1420             RESET HESSIAN, TYPE I
 NPARAMETR:  7.0461E+00  6.0935E+00  4.3464E+00  3.2646E-01  3.7423E+00  6.8816E-02  2.0168E-01  8.3403E-02  1.9063E-01  8.9112E-02
             3.3350E-01  7.7720E-02  1.3238E-01
 PARAMETER:  9.9241E-02  1.0690E-01  9.6587E-02  2.0404E-02  9.1276E-02  3.1280E-02 -4.2852E-01 -1.9348E-01  2.1984E-01 -1.6037E-01
             4.9950E-01 -2.2876E-01  3.7518E-02
 GRADIENT:   4.7649E+04  1.2777E+04  6.9372E+03  6.2129E+00  9.1749E+02 -3.9761E+00  3.5376E+00  1.0617E+00  3.7668E-01  2.9888E-02
            -2.2834E-01  3.8093E-01 -3.0818E-01
 
0ITERATION NO.:   55    OBJECTIVE VALUE:   50862.1429566637        NO. OF FUNC. EVALS.: 149
 CUMULATIVE NO. OF FUNC. EVALS.:     1569
 NPARAMETR:  7.0549E+00  6.1080E+00  4.3459E+00  3.3619E-01  3.7358E+00  7.2193E-02  2.0167E-01  8.1832E-02  1.8988E-01  8.9178E-02
             3.3763E-01  7.7529E-02  1.3248E-01
 PARAMETER:  9.9365E-02  1.0716E-01  9.6576E-02  2.1012E-02  9.1116E-02  3.2815E-02 -4.2857E-01 -2.0298E-01  2.1788E-01 -1.6000E-01
             5.0565E-01 -2.2999E-01  3.7889E-02
 GRADIENT:   7.7417E+04 -1.3628E+04  2.2132E+03  3.8563E+00  1.6423E+02  3.1310E+00  3.0026E-01 -2.7978E-02 -5.9166E-01 -1.1514E-01
            -3.5864E-01  4.7404E-01 -4.8644E-02
 
0ITERATION NO.:   60    OBJECTIVE VALUE:   50862.0911077392        NO. OF FUNC. EVALS.: 138
 CUMULATIVE NO. OF FUNC. EVALS.:     1707
 NPARAMETR:  7.0610E+00  6.1236E+00  4.3458E+00  3.4099E-01  3.7312E+00  7.0678E-02  2.0166E-01  8.1045E-02  1.9326E-01  8.9570E-02
             3.3977E-01  7.7360E-02  1.3313E-01
 PARAMETER:  9.9451E-02  1.0743E-01  9.6573E-02  2.1312E-02  9.1005E-02  3.2126E-02 -4.2864E-01 -2.0781E-01  2.2669E-01 -1.5781E-01
             5.0882E-01 -2.3108E-01  4.0350E-02
 GRADIENT:   7.7032E+04 -1.3600E+04  2.1931E+03  6.2394E+00  9.0518E+01  2.0372E+00  4.6676E-01 -1.9948E-01 -6.8062E-01  3.6689E-01
            -3.9161E-01  5.7249E-01  1.8182E-01
 
0ITERATION NO.:   65    OBJECTIVE VALUE:   50862.0510385080        NO. OF FUNC. EVALS.: 147
 CUMULATIVE NO. OF FUNC. EVALS.:     1854
 NPARAMETR:  7.0667E+00  6.1278E+00  4.3457E+00  3.4257E-01  3.7318E+00  6.9315E-02  2.0165E-01  8.0835E-02  1.9633E-01  8.9576E-02
             3.4130E-01  7.4822E-02  1.3334E-01
 PARAMETER:  9.9532E-02  1.0751E-01  9.6572E-02  2.1410E-02  9.1019E-02  3.1507E-02 -4.2873E-01 -2.0911E-01  2.3459E-01 -1.5777E-01
             5.1106E-01 -2.4776E-01  4.1130E-02
 GRADIENT:   7.7407E+04 -1.3755E+04  2.2548E+03 -2.6612E+00  2.1266E+02  1.2628E+00 -6.0651E-01  1.1243E-01 -2.2183E-01  3.1945E-02
            -3.0765E-01 -1.3673E-01  2.0404E-01
 
0ITERATION NO.:   70    OBJECTIVE VALUE:   50862.0302546534        NO. OF FUNC. EVALS.: 162
 CUMULATIVE NO. OF FUNC. EVALS.:     2016             RESET HESSIAN, TYPE I
 NPARAMETR:  7.0712E+00  6.1376E+00  4.3452E+00  3.4576E-01  3.7277E+00  6.7629E-02  2.0166E-01  8.0016E-02  1.9916E-01  8.9699E-02
             3.4666E-01  7.5053E-02  1.3345E-01
 PARAMETER:  9.9595E-02  1.0768E-01  9.6559E-02  2.1610E-02  9.0919E-02  3.0740E-02 -4.2868E-01 -2.1420E-01  2.4173E-01 -1.5709E-01
             5.1885E-01 -2.4622E-01  4.1543E-02
 GRADIENT:   4.7732E+04  1.3202E+04  6.8526E+03  1.9635E+01  8.5305E+02  2.8854E-01  3.2909E+00 -1.9374E-02 -1.2773E-01  8.9985E-02
             1.0460E-02  5.4788E-02  2.6014E-01
 
0ITERATION NO.:   75    OBJECTIVE VALUE:   50862.0260187996        NO. OF FUNC. EVALS.: 141
 CUMULATIVE NO. OF FUNC. EVALS.:     2157
 NPARAMETR:  7.0727E+00  6.1411E+00  4.3452E+00  3.4758E-01  3.7269E+00  6.7934E-02  2.0166E-01  7.9724E-02  1.9995E-01  8.9749E-02
             3.4722E-01  7.4951E-02  1.3163E-01
 PARAMETER:  9.9616E-02  1.0774E-01  9.6559E-02  2.1724E-02  9.0901E-02  3.0879E-02 -4.2866E-01 -2.1603E-01  2.4370E-01 -1.5681E-01
             5.1966E-01 -2.4690E-01  3.4698E-02
 GRADIENT:   7.7202E+04 -1.3762E+04  2.1898E+03 -2.5904E+00  1.4064E+02 -4.6856E-02  4.6699E-01 -1.8233E-01 -2.0064E-01  8.8480E-02
            -2.5635E-02  4.5455E-02 -2.2283E-01
 
0ITERATION NO.:   80    OBJECTIVE VALUE:   50862.0215661216        NO. OF FUNC. EVALS.: 153
 CUMULATIVE NO. OF FUNC. EVALS.:     2310
 NPARAMETR:  7.0744E+00  6.1417E+00  4.3453E+00  3.4800E-01  3.7271E+00  6.7865E-02  2.0165E-01  7.9813E-02  1.9963E-01  8.9749E-02
             3.4728E-01  7.4615E-02  1.3202E-01
 PARAMETER:  9.9640E-02  1.0775E-01  9.6562E-02  2.1750E-02  9.0906E-02  3.0848E-02 -4.2869E-01 -2.1547E-01  2.4293E-01 -1.5681E-01
             5.1975E-01 -2.4915E-01  3.6173E-02
 GRADIENT:  -7.9941E+01 -9.4016E+00  5.3882E+00 -1.2831E+00  1.2068E+01  4.7339E-01  2.1441E-04 -3.3726E-02 -1.2734E-01 -1.2729E-02
            -1.3414E-02 -1.1261E-01 -4.0519E-02
 
 #TERM:
0MINIMIZATION SUCCESSFUL
 HOWEVER, PROBLEMS OCCURRED WITH THE MINIMIZATION.
 REGARD THE RESULTS OF THE ESTIMATION STEP CAREFULLY, AND ACCEPT THEM ONLY
 AFTER CHECKING THAT THE COVARIANCE STEP PRODUCES REASONABLE OUTPUT.
 NO. OF FUNCTION EVALUATIONS USED:     2310
 NO. OF SIG. DIGITS IN FINAL EST.:  2.3

 ETABAR IS THE ARITHMETIC MEAN OF THE ETA-ESTIMATES,
 AND THE P-VALUE IS GIVEN FOR THE NULL HYPOTHESIS THAT THE TRUE MEAN IS 0.
 
 ETABAR:         6.9304E-03 -2.2323E-02 -2.0340E-02 -1.3585E-03  8.3360E-03 -1.1124E-02
 SE:             1.8064E-02  2.4282E-02  2.5023E-02  2.9882E-02  1.0992E-02  2.0658E-02
 N:                     120         120         120         120         120         120
 
 P VAL.:         7.0124E-01  3.5792E-01  4.1631E-01  9.6374E-01  4.4825E-01  5.9025E-01
 
 ETASHRINKSD(%)  2.9661E+01  4.0219E+01  8.1183E+00  4.4221E+01  5.5732E+01  3.7459E+01
 ETASHRINKVR(%)  5.0524E+01  6.4262E+01  1.5577E+01  6.8887E+01  8.0403E+01  6.0887E+01
 EBVSHRINKSD(%)  2.7993E+01  4.1350E+01  9.5356E+00  4.5709E+01  5.5821E+01  3.7549E+01
 EBVSHRINKVR(%)  4.8149E+01  6.5601E+01  1.8162E+01  7.0525E+01  8.0482E+01  6.0999E+01
 EPSSHRINKSD(%)  3.1078E+00
 EPSSHRINKVR(%)  6.1191E+00
 
  
 TOTAL DATA POINTS NORMALLY DISTRIBUTED (N):         4680
 N*LOG(2PI) CONSTANT TO OBJECTIVE FUNCTION:    8601.26467079574     
 OBJECTIVE FUNCTION VALUE WITHOUT CONSTANT:    50862.0215661216     
 OBJECTIVE FUNCTION VALUE WITH CONSTANT:       59463.2862369173     
 REPORTED OBJECTIVE FUNCTION DOES NOT CONTAIN CONSTANT
  
 TOTAL EFFECTIVE ETAS (NIND*NETA):                           720
  
 #TERE:
 Elapsed estimation  time in seconds:  6125.71
 Elapsed covariance  time in seconds:   493.17
 Elapsed postprocess time in seconds:     3.99
1
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 ************************************************************************************************************************
 ********************                                                                                ********************
 ********************               FIRST ORDER CONDITIONAL ESTIMATION WITH INTERACTION              ********************
 #OBJT:**************                       MINIMUM VALUE OF OBJECTIVE FUNCTION                      ********************
 ********************                                                                                ********************
 ************************************************************************************************************************
 





 #OBJV:********************************************    50862.022       **************************************************
1
 ************************************************************************************************************************
 ********************                                                                                ********************
 ********************               FIRST ORDER CONDITIONAL ESTIMATION WITH INTERACTION              ********************
 ********************                             FINAL PARAMETER ESTIMATE                           ********************
 ********************                                                                                ********************
 ************************************************************************************************************************
 


 THETA - VECTOR OF FIXED EFFECTS PARAMETERS   *********


         TH 1      TH 2      TH 3      TH 4      TH 5      TH 6      TH 7     
 
         7.07E+00  6.14E+00  4.35E+00  3.48E-01  3.73E+00  6.79E-02  2.02E-01
 


 OMEGA - COV MATRIX FOR RANDOM EFFECTS - ETAS  ********


         ETA1      ETA2      ETA3      ETA4      ETA5      ETA6     
 
 ETA1
+        7.98E-02
 
 ETA2
+        0.00E+00  2.00E-01
 
 ETA3
+        0.00E+00  0.00E+00  8.97E-02
 
 ETA4
+        0.00E+00  0.00E+00  0.00E+00  3.47E-01
 
 ETA5
+        0.00E+00  0.00E+00  0.00E+00  0.00E+00  7.46E-02
 
 ETA6
+        0.00E+00  0.00E+00  0.00E+00  0.00E+00  0.00E+00  1.32E-01
 


 SIGMA - COV MATRIX FOR RANDOM EFFECTS - EPSILONS  ****


         EPS1     
 
 EPS1
+        1.00E+00
 
1


 OMEGA - CORR MATRIX FOR RANDOM EFFECTS - ETAS  *******


         ETA1      ETA2      ETA3      ETA4      ETA5      ETA6     
 
 ETA1
+        2.83E-01
 
 ETA2
+        0.00E+00  4.47E-01
 
 ETA3
+        0.00E+00  0.00E+00  3.00E-01
 
 ETA4
+        0.00E+00  0.00E+00  0.00E+00  5.89E-01
 
 ETA5
+        0.00E+00  0.00E+00  0.00E+00  0.00E+00  2.73E-01
 
 ETA6
+        0.00E+00  0.00E+00  0.00E+00  0.00E+00  0.00E+00  3.63E-01
 


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


         TH 1      TH 2      TH 3      TH 4      TH 5      TH 6      TH 7     
 
         7.31E-02  1.32E-01  3.50E-02  1.07E-01  8.48E-02  5.86E-02  2.29E-03
 


 OMEGA - COV MATRIX FOR RANDOM EFFECTS - ETAS  ********


         ETA1      ETA2      ETA3      ETA4      ETA5      ETA6     
 
 ETA1
+        2.61E-02
 
 ETA2
+       .........  8.00E-02
 
 ETA3
+       ......... .........  1.52E-02
 
 ETA4
+       ......... ......... .........  1.08E-01
 
 ETA5
+       ......... ......... ......... .........  3.07E-02
 
 ETA6
+       ......... ......... ......... ......... .........  4.85E-02
 


 SIGMA - COV MATRIX FOR RANDOM EFFECTS - EPSILONS  ****


         EPS1     
 
 EPS1
+       .........
 
1


 OMEGA - CORR MATRIX FOR RANDOM EFFECTS - ETAS  *******


         ETA1      ETA2      ETA3      ETA4      ETA5      ETA6     
 
 ETA1
+        4.63E-02
 
 ETA2
+       .........  8.96E-02
 
 ETA3
+       ......... .........  2.54E-02
 
 ETA4
+       ......... ......... .........  9.13E-02
 
 ETA5
+       ......... ......... ......... .........  5.61E-02
 
 ETA6
+       ......... ......... ......... ......... .........  6.68E-02
 


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
 

            TH 1      TH 2      TH 3      TH 4      TH 5      TH 6      TH 7      OM11      OM12      OM13      OM14      OM15  
             OM16      OM22      OM23      OM24      OM25      OM26      OM33      OM34      OM35      OM36      OM44      OM45  
            OM46      OM55      OM56      OM66      SG11  
 
 TH 1
+        5.34E-03
 
 TH 2
+        7.47E-03  1.75E-02
 
 TH 3
+        1.32E-04  4.34E-04  1.22E-03
 
 TH 4
+        2.09E-03  1.13E-03 -1.98E-03  1.16E-02
 
 TH 5
+       -2.97E-03 -1.68E-03 -5.22E-04  1.02E-03  7.19E-03
 
 TH 6
+       -1.31E-04 -5.46E-04  7.36E-04 -2.15E-03 -9.43E-04  3.43E-03
 
 TH 7
+        1.96E-05  4.35E-05 -6.57E-06  1.26E-05  2.19E-05 -1.15E-05  5.26E-06
 
 OM11
+       -1.46E-04 -2.20E-04 -5.57E-05  2.96E-04  3.92E-04  4.58E-05  1.47E-05  6.84E-04
 
 OM12
+       ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 OM13
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 OM14
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 OM15
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 OM16
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
         .........
 
 OM22
+        1.40E-03  5.38E-03  3.07E-04 -1.88E-04  7.38E-05 -3.27E-04  1.55E-07 -1.01E-03 ......... ......... ......... .........
         .........  6.40E-03
 
 OM23
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
         ......... ......... .........
 
 OM24
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
         ......... ......... ......... .........
 
 OM25
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
         ......... ......... ......... ......... .........
 
 OM26
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
         ......... ......... ......... ......... ......... .........
 
 OM33
+        2.25E-04  2.42E-04 -1.18E-04  1.69E-04 -3.08E-04 -7.34E-05 -1.48E-06 -3.51E-05 ......... ......... ......... .........
         ......... -6.31E-05 ......... ......... ......... .........  2.31E-04
 
1

            TH 1      TH 2      TH 3      TH 4      TH 5      TH 6      TH 7      OM11      OM12      OM13      OM14      OM15  
             OM16      OM22      OM23      OM24      OM25      OM26      OM33      OM34      OM35      OM36      OM44      OM45  
            OM46      OM55      OM56      OM66      SG11  
 
 OM34
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
         ......... ......... ......... ......... ......... ......... ......... .........
 
 OM35
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
         ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 OM36
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
         ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 OM44
+        1.74E-03 -2.32E-04 -2.78E-04  2.90E-03 -4.05E-03 -3.41E-04  3.19E-07  1.53E-04 ......... ......... ......... .........
         ......... -4.36E-04 ......... ......... ......... .........  3.82E-04 ......... ......... .........  1.16E-02
 
 OM45
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
         ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 OM46
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
         ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
        .........
 
 OM55
+       -5.21E-04 -4.47E-05 -3.88E-05 -5.29E-04  1.48E-03  5.71E-05  3.81E-07 -3.92E-05 ......... ......... ......... .........
         .........  1.46E-04 ......... ......... ......... .........  1.17E-05 ......... ......... ......... -1.33E-03 .........
        .........  9.40E-04
 
 OM56
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
         ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
        ......... ......... .........
 
 OM66
+       -1.75E-04  1.11E-04  6.37E-05 -7.51E-04  1.85E-05  1.20E-04 -2.65E-05 -2.77E-04 ......... ......... ......... .........
         .........  4.91E-05 ......... ......... ......... ......... -6.00E-05 ......... ......... ......... -1.51E-03 .........
        .........  1.32E-04 .........  2.35E-03
 
 SG11
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
         ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
        ......... ......... ......... ......... .........
 
1
 ************************************************************************************************************************
 ********************                                                                                ********************
 ********************               FIRST ORDER CONDITIONAL ESTIMATION WITH INTERACTION              ********************
 ********************                          CORRELATION MATRIX OF ESTIMATE                        ********************
 ********************                                                                                ********************
 ************************************************************************************************************************
 

            TH 1      TH 2      TH 3      TH 4      TH 5      TH 6      TH 7      OM11      OM12      OM13      OM14      OM15  
             OM16      OM22      OM23      OM24      OM25      OM26      OM33      OM34      OM35      OM36      OM44      OM45  
            OM46      OM55      OM56      OM66      SG11  
 
 TH 1
+        7.31E-02
 
 TH 2
+        7.73E-01  1.32E-01
 
 TH 3
+        5.18E-02  9.39E-02  3.50E-02
 
 TH 4
+        2.66E-01  7.98E-02 -5.27E-01  1.07E-01
 
 TH 5
+       -4.79E-01 -1.50E-01 -1.76E-01  1.11E-01  8.48E-02
 
 TH 6
+       -3.06E-02 -7.06E-02  3.60E-01 -3.42E-01 -1.90E-01  5.86E-02
 
 TH 7
+        1.17E-01  1.43E-01 -8.20E-02  5.12E-02  1.13E-01 -8.58E-02  2.29E-03
 
 OM11
+       -7.63E-02 -6.36E-02 -6.10E-02  1.05E-01  1.77E-01  2.99E-02  2.45E-01  2.61E-02
 
 OM12
+       ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 OM13
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 OM14
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 OM15
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 OM16
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
         .........
 
 OM22
+        2.39E-01  5.08E-01  1.10E-01 -2.19E-02  1.09E-02 -6.97E-02  8.46E-04 -4.82E-01 ......... ......... ......... .........
         .........  8.00E-02
 
 OM23
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
         ......... ......... .........
 
 OM24
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
         ......... ......... ......... .........
 
 OM25
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
         ......... ......... ......... ......... .........
 
 OM26
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
         ......... ......... ......... ......... ......... .........
 
 OM33
+        2.03E-01  1.21E-01 -2.23E-01  1.03E-01 -2.39E-01 -8.24E-02 -4.26E-02 -8.83E-02 ......... ......... ......... .........
         ......... -5.19E-02 ......... ......... ......... .........  1.52E-02
 
1

            TH 1      TH 2      TH 3      TH 4      TH 5      TH 6      TH 7      OM11      OM12      OM13      OM14      OM15  
             OM16      OM22      OM23      OM24      OM25      OM26      OM33      OM34      OM35      OM36      OM44      OM45  
            OM46      OM55      OM56      OM66      SG11  
 
 OM34
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
         ......... ......... ......... ......... ......... ......... ......... .........
 
 OM35
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
         ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 OM36
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
         ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 OM44
+        2.21E-01 -1.63E-02 -7.40E-02  2.51E-01 -4.44E-01 -5.41E-02  1.29E-03  5.43E-02 ......... ......... ......... .........
         ......... -5.06E-02 ......... ......... ......... .........  2.33E-01 ......... ......... .........  1.08E-01
 
 OM45
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
         ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 OM46
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
         ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
        .........
 
 OM55
+       -2.33E-01 -1.10E-02 -3.62E-02 -1.61E-01  5.68E-01  3.18E-02  5.42E-03 -4.89E-02 ......... ......... ......... .........
         .........  5.95E-02 ......... ......... ......... .........  2.51E-02 ......... ......... ......... -4.02E-01 .........
        .........  3.07E-02
 
 OM56
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
         ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
        ......... ......... .........
 
 OM66
+       -4.94E-02  1.73E-02  3.76E-02 -1.44E-01  4.49E-03  4.23E-02 -2.39E-01 -2.18E-01 ......... ......... ......... .........
         .........  1.26E-02 ......... ......... ......... ......... -8.13E-02 ......... ......... ......... -2.89E-01 .........
        .........  8.91E-02 .........  4.85E-02
 
 SG11
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
         ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
        ......... ......... ......... ......... .........
 
1
 ************************************************************************************************************************
 ********************                                                                                ********************
 ********************               FIRST ORDER CONDITIONAL ESTIMATION WITH INTERACTION              ********************
 ********************                      INVERSE COVARIANCE MATRIX OF ESTIMATE                     ********************
 ********************                                                                                ********************
 ************************************************************************************************************************
 

            TH 1      TH 2      TH 3      TH 4      TH 5      TH 6      TH 7      OM11      OM12      OM13      OM14      OM15  
             OM16      OM22      OM23      OM24      OM25      OM26      OM33      OM34      OM35      OM36      OM44      OM45  
            OM46      OM55      OM56      OM66      SG11  
 
 TH 1
+        1.09E+03
 
 TH 2
+       -4.65E+02  2.99E+02
 
 TH 3
+       -1.99E+02  2.70E+01  1.38E+03
 
 TH 4
+       -2.33E+02  7.42E+01  2.51E+02  1.99E+02
 
 TH 5
+        3.92E+02 -1.14E+02 -4.43E+01 -1.37E+02  4.81E+02
 
 TH 6
+       -1.59E+01  2.45E+01 -1.45E+02  3.10E+01  7.35E+01  3.73E+02
 
 TH 7
+       -2.11E+03  1.54E+02  2.07E+03  9.23E+02 -1.31E+03  4.52E+02  2.27E+05
 
 OM11
+        3.05E+02 -2.87E+02 -5.18E+01 -5.83E+01 -1.62E+02 -1.08E+02 -4.39E+03  2.66E+03
 
 OM12
+       ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 OM13
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 OM14
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 OM15
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 OM16
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
         .........
 
 OM22
+        2.03E+02 -1.92E+02 -5.18E+01 -2.98E+01  1.35E+00 -3.70E+00 -4.15E+02  5.81E+02 ......... ......... ......... .........
         .........  3.66E+02
 
 OM23
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
         ......... ......... .........
 
 OM24
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
         ......... ......... ......... .........
 
 OM25
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
         ......... ......... ......... ......... .........
 
 OM26
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
         ......... ......... ......... ......... ......... .........
 
 OM33
+        1.20E+02 -1.84E+02  6.16E+02  1.03E+00  3.57E+02  7.91E+01  1.75E+03  4.55E+02 ......... ......... ......... .........
         .........  2.33E+02 ......... ......... ......... .........  5.67E+03
 
1

            TH 1      TH 2      TH 3      TH 4      TH 5      TH 6      TH 7      OM11      OM12      OM13      OM14      OM15  
             OM16      OM22      OM23      OM24      OM25      OM26      OM33      OM34      OM35      OM36      OM44      OM45  
            OM46      OM55      OM56      OM66      SG11  
 
 OM34
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
         ......... ......... ......... ......... ......... ......... ......... .........
 
 OM35
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
         ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 OM36
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
         ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 OM44
+        1.45E+00  1.84E+01 -1.92E+01 -3.53E+01  7.68E+01  1.33E+01  7.14E+01 -6.44E+01 ......... ......... ......... .........
         ......... -1.96E+01 ......... ......... ......... ......... -1.32E+02 ......... ......... .........  1.41E+02
 
 OM45
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
         ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
 
 OM46
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
         ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
        .........
 
 OM55
+       -1.97E+02  2.95E+01  1.31E+02  1.61E+02 -5.37E+02 -1.21E+02  1.04E+03  2.75E+02 ......... ......... ......... .........
         .........  1.04E+01 ......... ......... ......... ......... -7.80E+02 ......... ......... .........  5.10E+01 .........
        .........  2.00E+03
 
 OM56
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
         ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
        ......... ......... .........
 
 OM66
+        5.48E+01 -4.86E+01  4.85E+01  7.84E+00  3.92E+01  1.70E+00  2.15E+03  2.31E+02 ......... ......... ......... .........
         .........  6.51E+01 ......... ......... ......... .........  1.67E+02 ......... ......... .........  6.51E+01 .........
        ......... -1.35E+01 .........  5.29E+02
 
 SG11
+       ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
         ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... ......... .........
        ......... ......... ......... ......... .........
 
 Elapsed finaloutput time in seconds:     0.43
1THERE ARE ERROR MESSAGES IN FILE PRDERR                                                                  
 #CPUT: Total CPU Time in Seconds,     6624.766
