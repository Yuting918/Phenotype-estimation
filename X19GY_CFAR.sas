PROC IMPORT OUT= WORK.X19GY_CFAR 
            DATAFILE= "C:\Users\yutingq2\Desktop\1819GossWilt\data_inexc
el\AUDPC\x19gy_audpc.xlsx" 
            DBMS=EXCEL REPLACE;
     RANGE="x19gy_cfar$"; 
     GETNAMES=YES;
     MIXED=NO;
     SCANTEXT=YES;
     USEDATE=YES;
     SCANTIME=YES;
RUN;

PROC MIXED data = x19gy_cfar plots=all method = REML covtest cl;
class line rep block;
model AUDPC = line;
random rep block(rep);
lsmeans line / pdiff=control('Oh7B') adjust=dunnett alpha = 0.1; 
run;
