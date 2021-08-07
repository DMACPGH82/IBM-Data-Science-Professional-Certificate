-----------------------------------------
--DDL statement for table 'HR' database--
-----------------------------------------

-- Drop the tables in case they exist

DROP TABLE EMPLOYEES;
DROP TABLE JOB_HISTORY;
DROP TABLE JOBS;
DROP TABLE DEPARTMENTS;
DROP TABLE LOCATIONS;

-- Create the tables

CREATE TABLE EMPLOYEES
(
  EMP_ID CHAR(9) NOT NULL,
  F_NAME VARCHAR(15) NOT NULL,
  L_NAME VARCHAR(15) NOT NULL,
  SSN CHAR(9),
  B_DATE DATE,
  SEX CHAR,
  ADDRESS VARCHAR(30),
  JOB_ID CHAR(9),
  SALARY DECIMAL(10,2),
  MANAGER_ID CHAR(9),
  DEP_ID CHAR(9) NOT NULL,
  PRIMARY KEY (EMP_ID)
);

CREATE TABLE JOB_HISTORY
(
  EMPL_ID CHAR(9) NOT NULL,
  START_DATE DATE,
  JOBS_ID CHAR(9) NOT NULL,
  DEPT_ID CHAR(9),
  PRIMARY KEY (EMPL_ID,JOBS_ID)
);

CREATE TABLE JOBS
(
  JOB_IDENT CHAR(9) NOT NULL,
  JOB_TITLE VARCHAR(15) ,
  MIN_SALARY DECIMAL(10,2),
  MAX_SALARY DECIMAL(10,2),
  PRIMARY KEY (JOB_IDENT)
);

CREATE TABLE DEPARTMENTS
(
  DEPT_ID_DEP CHAR(9) NOT NULL,
  DEP_NAME VARCHAR(15) ,
  MANAGER_ID CHAR(9),
  LOC_ID CHAR(9),
  PRIMARY KEY (DEPT_ID_DEP)
);

CREATE TABLE LOCATIONS
(
  LOCT_ID CHAR(9) NOT NULL,
  DEP_ID_LOC CHAR(9) NOT NULL,
  PRIMARY KEY (LOCT_ID,DEP_ID_LOC)
);

SELECT F_NAME , L_NAME
FROM EMPLOYEES
WHERE ADDRESS LIKE '%Elgin,IL%';

SELECT F_NAME , L_NAME
FROM EMPLOYEES
WHERE B_DATE LIKE '197%';

SELECT *
FROM EMPLOYEES
WHERE (SALARY BETWEEN 60000 AND 70000) AND DEP_ID = 5;

SELECT F_NAME, L_NAME, DEP_ID 
FROM EMPLOYEES
ORDER BY DEP_ID;

SELECT F_NAME, L_NAME, DEP_ID 
FROM EMPLOYEES
ORDER BY DEP_ID DESC, L_NAME DESC;

SELECT D.DEP_NAME , E.F_NAME, E.L_NAME
FROM EMPLOYEES as E, DEPARTMENTS as D
WHERE E.DEP_ID = D.DEPT_ID_DEP
ORDER BY D.DEP_NAME, E.L_NAME DESC;

SELECT DEP_ID, COUNT(*)
FROM EMPLOYEES
GROUP BY DEP_ID;

SELECT DEP_ID, COUNT(*), AVG(SALARY)
FROM EMPLOYEES
GROUP BY DEP_ID;

SELECT DEP_ID, COUNT(*) AS "NUM_EMPLOYEES", AVG(SALARY) AS "AVG_SALARY"
FROM EMPLOYEES
GROUP BY DEP_ID;

SELECT DEP_ID, COUNT(*) AS "NUM_EMPLOYEES", AVG(SALARY) AS "AVG_SALARY"
FROM EMPLOYEES
GROUP BY DEP_ID
ORDER BY AVG_SALARY;

SELECT DEP_ID, COUNT(*) AS "NUM_EMPLOYEES", AVG(SALARY) AS "AVG_SALARY"
FROM EMPLOYEES
GROUP BY DEP_ID
HAVING count(*) < 4
ORDER BY AVG_SALARY;

-- Execute a failing query (i.e. one which gives an error) to retrieve all employees records whose salary is lower than the average salary.
select * 
from employees 
where salary < AVG(salary);

-- Execute a working query using a sub-select to retrieve all employees records whose salary is lower than the average salary.
select EMP_ID, F_NAME, L_NAME, SALARY 
from employees 
where SALARY < (select AVG(SALARY) 
                from employees);

-- Execute a failing query (i.e. one which gives an error) to retrieve all employees records with EMP_ID, SALARY and maximum salary as MAX_SALARY in every row.
select EMP_ID, SALARY, MAX(SALARY) AS MAX_SALARY 
from employees;	

-- Execute a Column Expression that retrieves all employees records with EMP_ID, SALARY and maximum salary as MAX_SALARY in every row.
select EMP_ID, SALARY, ( select MAX(SALARY) from employees ) AS MAX_SALARY 
from employees;

-- Execute a Table Expression for the EMPLOYEES table that excludes columns with sensitive employee data (i.e. does not include columns: SSN, B_DATE, SEX, ADDRESS, SALARY).
select * from ( select EMP_ID, F_NAME, L_NAME, DEP_ID from employees) AS EMP4ALL;


-- Retrieve only the EMPLOYEES records that correspond to jobs in the JOBS table.
select * from employees where JOB_ID IN (select JOB_IDENT from jobs);

-- Retrieve only the list of employees whose JOB_TITLE is Jr. Designer.
select * from employees where JOB_ID IN (select JOB_IDENT from jobs where JOB_TITLE= 'Jr. Designer');

-- Retrieve JOB information and list of employees who earn more than $70,000.
select JOB_TITLE, MIN_SALARY,MAX_SALARY,JOB_IDENT from jobs where JOB_IDENT IN (select JOB_ID from employees where SALARY > 70000 );

-- Retrieve JOB information and list of employees whose birth year is after 1976.
select JOB_TITLE, MIN_SALARY,MAX_SALARY,JOB_IDENT from jobs where JOB_IDENT IN (select JOB_ID from employees where YEAR(B_DATE)>1976 );

-- Retrieve JOB information and list of female employees whose birth year is after 1976.
select JOB_TITLE, MIN_SALARY,MAX_SALARY,JOB_IDENT from jobs where JOB_IDENT IN (select JOB_ID from employees where YEAR(B_DATE)>1976 and SEX='F' );

-- Perform an implicit cartesian/cross join between EMPLOYEES and JOBS tables.
select * from employees, jobs;

-- Retrieve only the EMPLOYEES records that correspond to jobs in the JOBS table.
select * from employees, jobs where employees.JOB_ID = jobs.JOB_IDENT;

-- Redo the previous query, using shorter aliases for table names.
select * from employees E, jobs J where E.JOB_ID = J.JOB_IDENT;

-- Redo the previous query, but retrieve only the Employee ID, Employee Name and Job Title.
select EMP_ID,F_NAME,L_NAME, JOB_TITLE from employees E, jobs J where E.JOB_ID = J.JOB_IDENT;

-- Redo the previous query, but specify the fully qualified column names with aliases in the SELECT clause.
select E.EMP_ID,E.F_NAME,E.L_NAME, J.JOB_TITLE from employees E, jobs J where E.JOB_ID = J.JOB_IDENT;