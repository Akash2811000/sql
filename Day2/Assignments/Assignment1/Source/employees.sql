
CREATE TABLE "jobs" (
	"jobid"	TEXT NOT NULL,
	"jobtitle"	TEXT NOT NULL,
	"min_salary"	NUMERIC NOT NULL,
	"max_salary"	NUMERIC NOT NULL,
	PRIMARY KEY("jobid")
);



INSERT INTO "main"."jobs" ("jobid", "jobtitle", "min_salary", "max_salary") VALUES ('AD_PRES', 'preseident', '20000', '40000');
INSERT INTO "main"."jobs" ("jobid", "jobtitle", "min_salary", "max_salary") VALUES ('AD_VP', 'vice preseident', '15000', '30000');
INSERT INTO "main"."jobs" ("jobid", "jobtitle", "min_salary", "max_salary") VALUES ('FI_MGR', 'Finance manager', '8200', '16000');
INSERT INTO "main"."jobs" ("jobid", "jobtitle", "min_salary", "max_salary") VALUES ('ST_MAN', 'Stock manger', '5500', '8500');
INSERT INTO "main"."jobs" ("jobid", "jobtitle", "min_salary", "max_salary") VALUES ('ST_CLERK', 'Stock clark', '2000', '5000');
INSERT INTO "main"."jobs" ("jobid", "jobtitle", "min_salary", "max_salary") VALUES ('SH_CLERK', 'Shopping clark', '2500', '5500');

CREATE TABLE "departments" (
	"department_id"	INTEGER NOT NULL,
	"departmentname"	TEXT NOT NULL,
	PRIMARY KEY("department_id")
);

INSERT INTO "main"."departments" ("department_id", "departmentname") VALUES ('10', 'admin');
INSERT INTO "main"."departments" ("department_id", "departmentname") VALUES ('20', 'marketing');
INSERT INTO "main"."departments" ("department_id", "departmentname") VALUES ('40', 'sales');
INSERT INTO "main"."departments" ("department_id", "departmentname") VALUES ('80', 'mobile');
INSERT INTO "main"."departments" ("department_id", "departmentname") VALUES ('90', 'hr');
INSERT INTO "main"."departments" ("department_id", "departmentname") VALUES ('100', 'Accouning');
INSERT INTO "main"."departments" ("department_id", "departmentname") VALUES ('110', 'qa');




CREATE TABLE "employees" (
	"empid"	INTEGER NOT NULL,
	"firstname"	TEXT NOT NULL,
	"lastname"	TEXT NOT NULL,
	"email"	TEXT NOT NULL,
	"phone"	INTEGER NOT NULL,
	"hire_date"	date NOT NULL,
	"jobid"	TEXT NOT NULL,
	"salary"	NUMERIC NOT NULL,
	"commission_pct"	NUMERIC NOT NULL,
	"managerid"	INTEGER NOT NULL,
	"departmentid"	INTEGER NOT NULL,
	PRIMARY KEY("empid"),
	FOREIGN KEY("departmentid") REFERENCES "departments"("department_id"),
	FOREIGN KEY("jobid") REFERENCES "jobs"("jobid")
);

INSERT INTO "main"."employees" ("empid", "firstname", "lastname", "email", "phone", "hire_date", "jobid", "salary", "commission_pct", "managerid", "departmentid") VALUES ('78', 'roy', 'sa', 'rogmail.com', '55545454566', '04/04/2016', 'SH_CLERK', '3540', '0', '100', '40');
INSERT INTO "main"."employees" ("empid", "firstname", "lastname", "email", "phone", "hire_date", "jobid", "salary", "commission_pct", "managerid", "departmentid") VALUES ('100', 'steven', 'king', 'st@gmail.com', '456789123', '02/02/2000', 'AD_PRES', '24000', '0', '0', '100');
INSERT INTO "main"."employees" ("empid", "firstname", "lastname", "email", "phone", "hire_date", "jobid", "salary", "commission_pct", "managerid", "departmentid") VALUES ('101', 'Neena', 'Patel', 'ne@gmail.com', '564564566', '08/05/2016', 'AD_VP', '17000', '0', '100', '90');
INSERT INTO "main"."employees" ("empid", "firstname", "lastname", "email", "phone", "hire_date", "jobid", "salary", "commission_pct", "managerid", "departmentid") VALUES ('102', 'Lex', 'Patel', 'LE@gmail.com', '5554566', '04/04/2016', 'AD_VP', '18000', '0', '100', '90');
INSERT INTO "main"."employees" ("empid", "firstname", "lastname", "email", "phone", "hire_date", "jobid", "salary", "commission_pct", "managerid", "departmentid") VALUES ('103', 'alex', 'Patel', 'sE@gmail.com', '5554566', '04/04/2016', 'SH_CLERK', '3200', '0', '100', '90');
INSERT INTO "main"."employees" ("empid", "firstname", "lastname", "email", "phone", "hire_date", "jobid", "salary", "commission_pct", "managerid", "departmentid") VALUES ('104', 'jao', 'acd', 'jo@gmail.com', '5554566', '04/04/2016', 'AD_VP', '18000', '0', '100', '90');
INSERT INTO "main"."employees" ("empid", "firstname", "lastname", "email", "phone", "hire_date", "jobid", "salary", "commission_pct", "managerid", "departmentid") VALUES ('105', 'aks', 'ra', 'akgmail.com', '45454566', '04/04/2016', 'ST_CLERK', '3540', '0', '100', '90');
INSERT INTO "main"."employees" ("empid", "firstname", "lastname", "email", "phone", "hire_date", "jobid", "salary", "commission_pct", "managerid", "departmentid") VALUES ('106', 'aksash', 'ra', 'akagmail.com', '445454566', '04/04/2016', 'ST_MAN', '5500', '0', '100', '90');
INSERT INTO "main"."employees" ("empid", "firstname", "lastname", "email", "phone", "hire_date", "jobid", "salary", "commission_pct", "managerid", "departmentid") VALUES ('107', 'akash', 'ra', 'akashgmail.com', '45454566', '04/04/2016', 'SH_CLERK', '3540', '0', '100', '90');
INSERT INTO "main"."employees" ("empid", "firstname", "lastname", "email", "phone", "hire_date", "jobid", "salary", "commission_pct", "managerid", "departmentid") VALUES ('404', 'roy', 'sa', 'Not  ', '55545454566', '04/04/2016', 'SH_CLERK', '3540', '0', '100', '80');
INSERT INTO "main"."employees" ("empid", "firstname", "lastname", "email", "phone", "hire_date", "jobid", "salary", "commission_pct", "managerid", "departmentid") VALUES ('410', 'xyz', 'sa', 'Not Available ', '55545454566', '04/04/2016', 'SH_CLERK', '3540', '0.1', '100', '110');


/* Write a SQL statement to change the Email column of Employees table with ‘not available’ for all employees.*/



update employees set email = "Not avilabel" 


/* Write a SQL statement to change the Email and CommissionPct column of employees table with ‘not available’ and 0.10 for all employees.*/

UPDATE employees SET email = "Not Available " , commission_pct = 0.10 


/* Write a SQL statement to change the Email and CommissionPct column of employees table with ‘not available’ and 0.10 for those employees whose DepartmentID is 110.*/

UPDATE employees SET email = "Not Available " , commission_pct = 0.10 WHERE departmentid = 110

/* Write a SQL statement to change the Email column of employees table with ‘not available’ for those employees whose DepartmentID is 80 and gets a commission is less than 20%*/
UPDATE employees SET email = "Not Available "  WHERE departmentid = 80 AND commission_pct <= 0.2


/*Write a SQL statement to change the Email column of employees table with ‘not available’ for those employees who belongs to the ‘Accouning’ department.*/

update employees set email = 'not avilable'  WHERE departmentid = ( SELECT department_id FROM departments WHERE departmentname =  "Accouning");


/* Write a SQL statement to change salary of employee to 8000 whose ID is 105, if the existing salary is less than 5000*/

UPDATE employees set salary = 8000 WHERE empid = 105 AND salary < 5000


/* Write a SQL statement to change job ID of employee which ID is 118, to SH_CLERK if the employee belongs to department, which ID is 30 and the existing job ID does not start with SH. */ 

update employees set jobid = "SH_CLERK" WHERE  empid = 118 AND departmentid = 30 AND    jobid  not like ' ST%'


/* Write a SQL statement to increase the salary of employees under the department 40, 90 and 110 according to the company rules that, salary will be increased by 25% for the department 40, 15% for department 90 and 10% for the department 110 and the rest of the departments will remain same.*/

update employees set salary = CASE departmentid 
	WHEN 40 THEN salary + (salary * 0.25) 
	WHEN 90 THEN salary + (salary * 0.90)
	WHEN 110 THEN salary + (salary * 0.10)
	ELSE salary
	END
	WHERE departmentid IN (40,90,110);


/* Write a SQL statement to increase the minimum and maximum salary of PU_CLERK by 2000 as well as the salary for those employees by 20% and commission by 10% */

UPDATE  jobs,employees set jobs.min_salary =  (jobs.min_salary + 2000) , jobs.max_salary = 
(jobs.max_salary + 2000) , employees.salary = employees.salary + (employees.salary *0.20) ,
employees.commission_pct = employees.commission_pct + (employees.commission_pct  * 0.10)
WHERE jobs.jobid = 'PU_CLERK' AND employees.jobid = 'PU_CLERK' ;

UPDATE jobs  set min_salary =  (min_salary + 2000) , max_salary = (max_salary + 2000) WHERE jobid = 'PU_CLERK' 

update employees set    salary = salary + (salary *0.20) , commission_pct   = commission_pct + (commission_pct  * 0.10) WHERE jobid = 'PU_CLERK'









