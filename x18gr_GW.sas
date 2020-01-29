PROC IMPORT OUT= WORK.x18gr_gw 
            DATAFILE= "C:\Users\yutingq2\Desktop\1819GossWilt\data_inexc
el\AUDPC\x18gr_pct1.xlsx" 
            DBMS=EXCEL REPLACE;
     RANGE="no_checks$"; 
     GETNAMES=YES;
     MIXED=NO;
     SCANTEXT=YES;
     USEDATE=YES;
     SCANTIME=YES;
RUN;

proc contents data=x18gr_gw; 
run;

data x18gr_gw;
set x18gr_gw;
num_value=input(DiseasePCTRating1,best.);
run; 

proc contents data=x18gr_gw;
run;


proc mixed data=x18gr_gw plots=all method=REML covtest cl;
class line rep block;
model num_value = line;
random rep block(rep);
lsmeans line / pdiff=control('Oh7B') adjust=dunnett alpha=0.05;
run;

