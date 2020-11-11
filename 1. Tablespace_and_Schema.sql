--Data Tablespace
CREATE TABLESPACE PB_Data
    DATAFILE 'C:\app\esteb\oradata\BDCURSO\PBdata.dbf'
    SIZE 10M
    REUSE
    AUTOEXTEND ON
    NEXT 512k
    MAXSIZE 200M;

--Index Tablespace
CREATE TABLESPACE PB_Ind
    DATAFILE 'C:\app\esteb\oradata\BDCURSO\PBInd.dbf'
    SIZE 10M
    REUSE
    AUTOEXTEND ON
    NEXT 512k
    MAXSIZE 200M;
