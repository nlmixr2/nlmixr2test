$PROB    ORAL1_1CPT_KAVCL MULTIPLE DOSE FOCEI (120 Ind/4674 Obs) runN024
$INPUT   ID TIME DV LNDV MDV AMT EVID DOSE VI CLI KAI SSX IIX SD CMT
$DATA    ORAL_1CPT.csv IGNORE=@ IGNORE (SD.EQ.1)
$SUBR    ADVAN2,TRANS2
$PK
         CL=EXP(THETA(1)+ETA(1))
         V=EXP(THETA(2)+ETA(2))
         KA=EXP(THETA(3)+ETA(3))
         S2=V
$ERROR   
         IPRED = F     
         RESCV = THETA(4) 
         W     = IPRED*RESCV
         IRES  = DV-IPRED
         IWRES = IRES/W
         Y     = IPRED+W*EPS(1)
$THETA   1.6       ;log Cl
$THETA   4.5       ;log Vc
$THETA   0.2       ;log KA
$THETA   (0,0.3,1) ;RSV
$OMEGA   0.15 0.15 0.15
$SIGMA   1 FIX
$EST     NSIG=3 PRINT=5 MAX=9999 NOABORT POSTHOC METHOD=COND INTER NOOBT
$COV
$TABLE  ID TIME LNDV MDV AMT EVID DOSE VI CLI CL V KA ETA1 ETA2 ETA3
        IPRED IRES IWRES CWRESI
        ONEHEADER NOPRINT FILE=runN024.csv