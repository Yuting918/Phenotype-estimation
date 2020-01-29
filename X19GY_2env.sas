PROC IMPORT OUT= WORK.X19GY_2env 
            DATAFILE= "C:\Users\yutingq2\Desktop\1819GossWilt\data_inexc
el\AUDPC\x19gy_audpc.xlsx" 
            DBMS=EXCEL REPLACE;
     RANGE="nocheck$"; 
     GETNAMES=YES;
     MIXED=NO;
     SCANTEXT=YES;
     USEDATE=YES;
     SCANTIME=YES;
RUN;

proc mixed data=x19gy_2env plots=all covtest cl method=REML;
class line rep block environment;
model audpc=line / ddfm=kr;
random environment environment*line rep(environment) block(rep environment);
lsmeans line / pdiff=control('Oh7B') adjust=dunnett;
run;

proc mixed data=x19gy_2env plots=all covtest cl method=TYPE3;
class line rep block environment;
model audpc=line / ddfm=kr;
random environment rep(environment) block(rep environment);
lsmeans line / pdiff=control('Oh7B') adjust=dunnett;
run;
