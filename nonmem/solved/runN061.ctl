$PROB    ORAL1_2CPT_KACLV1QV2 MULTIPLE DOSE FOCEI (120 Ind/4680 Obs) runN061
$INPUT   ID TIME DV LNDV MDV AMT EVID DOSE V1I CLI QI V2I KAI SSX IIX SD CMT
$DATA    ORAL_2CPT.csv IGNORE=@ IGNORE (SD.EQ.1)
$SUBR    ADVAN4,TRANS4
$PK
         CL=EXP(THETA(1)+ETA(1))
         V=EXP(THETA(2)+ETA(2))
         Q=EXP(THETA(3)+ETA(3))
         V3=EXP(THETA(4)+ETA(4))
         KA=EXP(THETA(5)+ETA(5))
         V2=V
         S2=V
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
$EST     NSIG=3 PRINT=5 MAX=9999 NOABORT POSTHOC METHOD=COND INTER NOOBT
$COV
$TABLE  ID TIME LNDV MDV AMT EVID DOSE V1I CLI CL V Q V3 KA ETA1 ETA2 ETA3 ETA4 ETA5
        IPRED IRES IWRES CWRESI
        ONEHEADER NOPRINT FILE=runN061.csv