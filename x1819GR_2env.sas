PROC IMPORT  DBMS=xlsx OUT=WORK.X1819Gr_2en 
            DATAFILE='C:\Users\yutingq2\Desktop\1819GossWilt\data_inexcel\AUDPC\x1819gr.xlsx' replace;
            sheet='all';
			run;

proc mixed data=X1819Gr_2en plots=all method=REML covtest cl;
class line rep block environment;
model AUDPC=line / ddfm=kr;
random environment environment*line rep(environment) block(rep environment);
lsmeans line / pdiff=control('Oh7B') adjust=dunnett;
run;
