PROC IMPORT OUT= WORK.X19GW_2en 
            DATAFILE= "C:\Users\yutingq2\Desktop\1819GossWilt\data_inexc
el\AUDPC\x19gw_audpc.xlsx" 
            DBMS=EXCEL REPLACE;
     RANGE="nocheck$"; 
     GETNAMES=YES;
     MIXED=NO;
     SCANTEXT=YES;
     USEDATE=YES;
     SCANTIME=YES;
RUN;

proc mixed data=x19gw_2en plots=all method=REML covtest cl;
class line rep block environment;
model AUDPC=line / ddfm=kr;
random environment environment*line rep(environment) block(rep environment);
lsmeans line / pdiff=control('Oh7B') adjust=dunnett;
run;



