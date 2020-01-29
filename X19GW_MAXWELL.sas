PROC IMPORT OUT= WORK.X19GW_MAXWELL 
            DATAFILE= "C:\Users\yutingq2\Desktop\1819GossWilt\data_inexc
el\AUDPC\x19gw_audpc.xlsx" 
            DBMS=EXCEL REPLACE;
     RANGE="x19gw_mf$"; 
     GETNAMES=YES;
     MIXED=NO;
     SCANTEXT=YES;
     USEDATE=YES;
     SCANTIME=YES;
RUN;
PROC MIXED data = x19gw_maxwell plots=all method = REML covtest cl;
class line rep block;
model AUDPC = line;
random rep block(rep);
lsmeans line / pdiff=control('Oh7B') adjust=dunnett alpha = 0.1; 
run;
