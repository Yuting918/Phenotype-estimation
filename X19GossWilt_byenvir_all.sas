title X18GR_GossWilt;
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
model num_value = line / ddfm=kr;
random rep block(rep);
lsmeans line / pdiff=control('Oh7B') adjust=dunnett;
run;

title X19GR_GossWilt;
PROC IMPORT OUT= WORK.x19gr_gw 
            DATAFILE= "C:\Users\yutingq2\Desktop\1819GossWilt\data_inexc
el\AUDPC\x19gr_audpc.xlsx" 
            DBMS=EXCEL REPLACE;
     RANGE="nocheck$"; 
     GETNAMES=YES;
     MIXED=NO;
     SCANTEXT=YES;
     USEDATE=YES;
     SCANTIME=YES;
RUN;
PROC MIXED data = x19gr_gw plots=all method = REML covtest cl;
class line rep block;
model AUDPC = line ddfm=kr;
random rep block(rep);
lsmeans line / pdiff=control('Oh7B') adjust=dunnett; 
run;

proc glm data=x19gr_gw;
class range;
model AUDPC=range;
means range;
lsmeans range / stderr pdiff;
run;


title X19GW_GossWilt_CFAR;
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
model AUDPC=line ddfm=kr;
random rep block(rep);
lsmeans line / pdiff=control('Oh7B') adjust=dunnett; 
*conroll wheather the non-control lines are significantly smaller than the control; 
run;


TITLE X19GW_GossWilt_MAXWELL;
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
model AUDPC = line ddfm=kr;
random rep block(rep);
lsmeans line / pdiff=control('Oh7B') adjust=dunnett; 
run;


TITLE X19GY_GossWilt_CFAR;
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
model AUDPC = line ddfm=kr;
random rep block(rep);
lsmeans line / pdiff=control('Oh7B') adjust=dunnett; 
run;


TITLE X19GY_GossWilt_MAXWELL;
PROC IMPORT OUT= WORK.X19GY_MAXWELL 
            DATAFILE= "C:\Users\yutingq2\Desktop\1819GossWilt\data_inexc
el\AUDPC\x19gy_audpc.xlsx" 
            DBMS=EXCEL REPLACE;
     RANGE="x19gy_mf$"; 
     GETNAMES=YES;
     MIXED=NO;
     SCANTEXT=YES;
     USEDATE=YES;
     SCANTIME=YES;
RUN;
PROC MIXED data = x19gy_maxwell plots=all method = REML covtest cl;
class line rep block;
model AUDPC = line ddfm=kr;
random rep block(rep);
lsmeans line / pdiff=control('Oh7B') adjust=dunnett; 
run;


