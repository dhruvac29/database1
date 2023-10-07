CREATE TABLE EMPLOYEE (
  FNAME VARCHAR(50),
  MINIT VARCHAR(50),
  LNAME VARCHAR(50),
  SSN NUMBER(10) NOT NULL,
  BDATE DATE,
  STREET_NAME VARCHAR(50),
  STATENAME VARCHAR(50),
  STATECODE VARCHAR(50),
  SEX VARCHAR(10),
  SALARY NUMBER(10),
  SUPER_SSN NUMBER(10),
  DNO NUMBER(10),
  OVERTIME NUMBER(10),
  CONSTRAINT EMPLOYEE_PK PRIMARY KEY (SSN));

CREATE TABLE DEPARTMENT (
  DNAME VARCHAR2(50),
  DNUMBER NUMBER(10) NOT NULL,
  MGR_SSN NUMBER(10),
  MGR_START_DATE DATE,
  CONSTRAINT DEPARTMENT_PK PRIMARY KEY (DNUMBER)
);

CREATE TABLE DEPT_LOCATIONS (
  DNUMBER NUMBER(10) NOT NULL,
  DLOCATIONS VARCHAR(50) NOT NULL,
  CONSTRAINT DEPT_LOCATIONS_PK PRIMARY KEY (DNUMBER, DLOCATIONS)
  );


CREATE TABLE PROJECT (
  PNAME VARCHAR2(50),
  PNUMBER NUMBER(10) NOT NULL,
  PLOCATION VARCHAR(50),
  DNUMBER NUMBER(10) NOT NULL,
  CONSTRAINT PROJECT_PK PRIMARY KEY (PNUMBER)
);

CREATE TABLE WORKS_ON (
  ESSN NUMBER(10) NOT NULL,
  PNO NUMBER(10) NOT NULL,
  HOURS_WORKED NUMBER(10) NOT NULL,
  CONSTRAINT WORKS_ON_PK PRIMARY KEY (ESSN, PNO)
); 

CREATE TABLE DEPENDENTON (
  ESSN NUMBER(10) NOT NULL,
  DEPENDENT_NAME VARCHAR(50) NOT NULL,
  SEX VARCHAR(50),
  BDATE DATE,
  RELATIONSHIP VARCHAR(50),
  CONSTRAINT DEPENDENT_PK PRIMARY KEY (ESSN,DEPENDENT_NAME)
);

ALTER TABLE EMPLOYEE ADD CONSTRAINT EMPLOYEE_FK FOREIGN KEY (DNO) REFERENCES DEPARTMENT (DNUMBER);
ALTER TABLE DEPARTMENT ADD CONSTRAINT DEPARTMENT_FK FOREIGN KEY (MGR_SSN) REFERENCES EMPLOYEE (SSN);
ALTER TABLE DEPT_LOCATIONS ADD CONSTRAINT DEPT_LOCATIONS_FK FOREIGN KEY (DNUMBER) REFERENCES DEPARTMENT (DNUMBER);
ALTER TABLE PROJECT ADD CONSTRAINT PROJECT_FK FOREIGN KEY (DNUMBER) REFERENCES DEPARTMENT (DNUMBER);
ALTER TABLE WORKS_ON ADD CONSTRAINT WORKS_ON_FK1 FOREIGN KEY (ESSN) REFERENCES EMPLOYEE (SSN);
ALTER TABLE WORKS_ON ADD CONSTRAINT WORKS_ON_FK2 FOREIGN KEY (PNO) REFERENCES PROJECT (PNUMBER);
ALTER TABLE DEPENDENTON ADD CONSTRAINT DEPENDENT_FK FOREIGN KEY (ESSN) REFERENCES EMPLOYEE (SSN);
