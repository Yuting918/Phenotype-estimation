PROC IMPORT OUT= WORK.X19GW_CFAR 
            DATAFILE= "C:\Users\yutingq2\Desktop\1819GossWilt\data_inexc
el\AUDPC\x19gw_audpc.xlsx" 
            DBMS=EXCEL REPLACE;
     RANGE="x19gw_cfar$"; 
     GETNAMES=YES;
     MIXED=NO;
     SCANTEXT=YES;
     USEDATE=YES;
     SCANTIME=YES;
RUN;

PROC CONTENTS data=x19gw_cfar;
run;

proc mixed data=x19gw_cfar plots=all method=REML covtest cl;
class line rep block;
model AUDPC=line;
random rep block(rep);
lsmeans line / pdiff=control('Oh7B') adjust=dunnett alpha=0.05; 
*conroll wheather the non-control lines are significantly smaller than the control; 
run;


