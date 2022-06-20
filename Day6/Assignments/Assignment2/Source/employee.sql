CREATE TABLE "emp" (
	"empid"	INTEGER,
	"firstname"	TEXT NOT NULL,
	"lastname"	TEXT NOT NULL,
	"hiredate"	date NOT NULL,
	"salary"	NUMERIC NOT NULL,
	"depid"	INTEGER NOT NULL,
	"jobid"	INTEGER,
	"countryid"	INTEGER,
	PRIMARY KEY("empid"),
	FOREIGN KEY("countryid") REFERENCES "country"("countryid"),
	FOREIGN KEY("depid") REFERENCES "departments"("depid"),
	FOREIGN KEY("jobid") REFERENCES "job"("jobid")
);

INSERT INTO "main"."emp" ("empid", "firstname", "lastname", "hiredate", "salary", "depid", "jobid", "countryid") VALUES 
('1', 'lex', 'mavrik', '2022-01-01', '5000', '10', '101', '1');
INSERT INTO "main"."emp" ("empid", "firstname", "lastname", "hiredate", "salary", "depid", "jobid", "countryid") VALUES 
('2', 'roy', 'patel', '2020-05-01', '10000', '11', '102', '2');
INSERT INTO "main"."emp" ("empid", "firstname", "lastname", "hiredate", "salary", "depid", "jobid", "countryid") VALUES 
('3', 'steven', 'op', '2015-05-12', '50000', '90', '103', '1');

CREATE TABLE job(
jobid INTEGER ,
jobname TEXT NOT NULL,
FOREIGN KEY (jobid) REFERENCES emp(jobid)
)
INSERT INTO "main"."job" ("jobid", "jobname") VALUES ('101', 'manger');
INSERT INTO "main"."job" ("jobid", "jobname") VALUES ('102', 'sr_tech_lead');
INSERT INTO "main"."job" ("jobid", "jobname") VALUES ('103', 'sales');

CREATE TABLE jobhistory (
empid INTEGER,
startdate date NOT NULL,
enddate date,
FOREIGN KEY (empid) REFERENCES emp(empid)
)

INSERT INTO jobhistory (empid,startdate,enddate) VALUES
(1,'2022-02-01' ,'2022-12-31'),
(2,'2020-07-01' ,'2022-12-31'),
(3,'2015-08-01' ,'2022-12-31');


CREATE TABLE departments (
depid INTEGER, 
depname TEXT NULL,
PRIMARY KEY (depid)
);
INSERT INTO "main"."departments" ("depid", "depname") VALUES ('10', 'mobile');
INSERT INTO "main"."departments" ("depid", "depname") VALUES ('11', 'php');
INSERT INTO "main"."departments" ("depid", "depname") VALUES ('90', 'accountant');

CREATE TABLE country (
countryid INTEGER, 
countryname TEXT NULL,
PRIMARY KEY (countryid)
);
INSERT INTO "main"."country" ("countryid", "countryname") VALUES ('1', 'london');
INSERT INTO "main"."country" ("countryid", "countryname") VALUES ('2', 'india');

/* Create a View to Find the names (first_name, last_name), job, department number, 
and department name of the employees who work in London */ 
CREATE view londonemp as
SELECT e.firstname || ' ' || e.lastname as name , e.jobid , j.jobname  ,e.depid , d.depname  , e.countryid , c.countryname from emp e
INNER JOIN job  j on e.jobid = j.jobid
INNER JOIN departments d on e.depid = d.depid
INNER JOIN country c on e.countryid = c.countryid
WHERE c.countryname = 'london'
SELECT * from londonemp



/*Create a View to get the department name and number of employees in the department. */

CREATE view countdep as
SELECT d.depname ,count(*) FROM emp e
INNER JOIN departments d on e.depid=d.depid
GROUP by depname
SELECT * from countdep


/* Find the employee ID, job title, number of days between ending date and starting date for all jobs in department 90 from job history.*/


CREATE view dep90 as
SELECT  e.empid  , j.jobname , d.depid,
(julianday(h.enddate) - julianday(h.startdate)) as diffrence from emp e 
INNER JOIN job j on e.jobid = j.jobid
INNER JOIN departments d on e.depid = d.depid
INNER JOIN jobhistory h on e.empid = h.empid
WHERE d.depid = 90;

