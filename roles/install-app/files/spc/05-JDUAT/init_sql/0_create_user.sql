create tablespace SPC datafile '/data01/gaussdb/data/SPC.dbf' SIZE 50G AUTOEXTEND ON NEXT 50M MAXSIZE 200G extent autoallocate;
alter tablespace SPC ADD DATAFILE '/data01/gaussdb/data/SPC_01.dbf' SIZE 50G AUTOEXTEND ON NEXT 50M MAXSIZE 200G;
alter tablespace SPC ADD DATAFILE '/data01/gaussdb/data/SPC_02.dbf' SIZE 50G AUTOEXTEND ON NEXT 50M MAXSIZE 200G;
alter tablespace SPC ADD DATAFILE '/data01/gaussdb/data/SPC_03.dbf' SIZE 50G AUTOEXTEND ON NEXT 50M MAXSIZE 200G;
alter tablespace SPC ADD DATAFILE '/data01/gaussdb/data/SPC_04.dbf' SIZE 50G AUTOEXTEND ON NEXT 50M MAXSIZE 200G;
alter tablespace SPC ADD DATAFILE '/data01/gaussdb/data/SPC_05.dbf' SIZE 50G AUTOEXTEND ON NEXT 50M MAXSIZE 200G;
alter tablespace SPC ADD DATAFILE '/data01/gaussdb/data/SPC_06.dbf' SIZE 50G AUTOEXTEND ON NEXT 50M MAXSIZE 200G;

CREATE USER "SPCUSER" IDENTIFIED BY 'Spcuser@123' DEFAULT TABLESPACE "SPC";
GRANT CONNECT TO "SPCUSER";
GRANT RESOURCE TO "SPCUSER";
GRANT DS_Role TO "SPCUSER";

create tablespace SPCXXL datafile '/data01/gaussdb/data/SPCXXL.dbf' SIZE 50G AUTOEXTEND ON NEXT 50M MAXSIZE 200G extent autoallocate;
-- xxl-job
CREATE USER "XXL_JOB" IDENTIFIED BY 'Spcuser@123' DEFAULT TABLESPACE "SPCXXL";
GRANT CONNECT TO "XXL_JOB";
GRANT RESOURCE TO "XXL_JOB";
GRANT DS_Role TO "XXL_JOB";

create tablespace SPCAI datafile '/data01/gaussdb/data/SPCAI.dbf' SIZE 50G AUTOEXTEND ON NEXT 50M MAXSIZE 200G extent autoallocate;
-- spcai
CREATE USER "SPCAI" IDENTIFIED BY 'Spcuser@123' DEFAULT TABLESPACE "SPCAI";
GRANT CONNECT TO "SPCAI";
GRANT RESOURCE TO "SPCAI";
GRANT DS_Role TO "SPCAI";

-- 创建dual
CREATE OR REPLACE SYNONYM "SPCUSER".DUAL FOR SYS.SYS_DUMMY;
CREATE OR REPLACE SYNONYM "XXL_JOB".DUAL FOR SYS.SYS_DUMMY;
CREATE OR REPLACE SYNONYM "SPCAI".DUAL FOR SYS.SYS_DUMMY;