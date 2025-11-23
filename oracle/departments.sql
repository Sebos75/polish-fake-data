--------------------------------------------------------
--  File created - niedziela-listopada-23-2025   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table EXAMPLE_DEPARTMENTS
--------------------------------------------------------

  CREATE TABLE "EXAMPLE_DEPARTMENTS" 
   (	"ID" NUMBER, 
	"NAME" VARCHAR2(100)
   ) ;
REM INSERTING into EXAMPLE_DEPARTMENTS
SET DEFINE OFF;
Insert into EXAMPLE_DEPARTMENTS (ID,NAME) values ('1','Information Technology');
Insert into EXAMPLE_DEPARTMENTS (ID,NAME) values ('2','Human Resources');
Insert into EXAMPLE_DEPARTMENTS (ID,NAME) values ('3','Sales');
Insert into EXAMPLE_DEPARTMENTS (ID,NAME) values ('4','Marketing');
Insert into EXAMPLE_DEPARTMENTS (ID,NAME) values ('5','Finance');
Insert into EXAMPLE_DEPARTMENTS (ID,NAME) values ('6','Customer Service');
Insert into EXAMPLE_DEPARTMENTS (ID,NAME) values ('7','Research and Development');
Insert into EXAMPLE_DEPARTMENTS (ID,NAME) values ('8','Operations');
Insert into EXAMPLE_DEPARTMENTS (ID,NAME) values ('9','Legal');
Insert into EXAMPLE_DEPARTMENTS (ID,NAME) values ('10','Administration');
--------------------------------------------------------
--  DDL for Index SYS_C0047942455
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_C0047942455" ON "EXAMPLE_DEPARTMENTS" ("ID") 
  ;
--------------------------------------------------------
--  Constraints for Table EXAMPLE_DEPARTMENTS
--------------------------------------------------------

  ALTER TABLE "EXAMPLE_DEPARTMENTS" ADD PRIMARY KEY ("ID")
  USING INDEX  ENABLE;
