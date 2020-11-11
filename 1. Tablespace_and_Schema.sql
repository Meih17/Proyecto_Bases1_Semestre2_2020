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

--PB Schema
CREATE USER PB
    IDENTIFIED BY PB
    DEFAULT TABLESPACE pb_data
    TEMPORARY TABLESPACE temp
    QUOTA 5M ON system;
    --PROFILE esteb
    --PASSWORD EXPIRE;

GRANT connect TO PB;
GRANT create session to PB;
GRANT create table to PB;
grant create view to PB;
