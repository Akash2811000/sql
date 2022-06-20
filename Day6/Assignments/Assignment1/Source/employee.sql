

CREATE TABLE "employees" (
	"empid"	INTEGER NOT NULL,
	"firstname"	TEXT NOT NULL,
	"lastname"	TEXT NOT NULL,
	"salary"	NUMERIC NOT NULL,
	"joindate"	date NOT NULL,
	"department"	TEXT NOT NULL,
	"managerid"	INTEGER,
	PRIMARY KEY("empid" AUTOINCREMENT),
	FOREIGN KEY("managerid") REFERENCES "employees"("empid")
)

INSERT INTO "main"."employees" ("empid", "firstname", "lastname", "salary", "joindate", "department", "managerid") VALUES ('1', 'akash', 'gupta', '5000', '2022-05-12', 'mobile', '1');
INSERT INTO "main"."employees" ("empid", "firstname", "lastname", "salary", "joindate", "department", "managerid") VALUES ('2', 'pavan', 'kumar', '8000', '2020-01-01', 'mobile', '1');
INSERT INTO "main"."employees" ("empid", "firstname", "lastname", "salary", "joindate", "department", "managerid") VALUES ('3', 'mahesh', 'Rao', '18000', '2016-02-11', 'php', '4');
INSERT INTO "main"."employees" ("empid", "firstname", "lastname", "salary", "joindate", "department", "managerid") VALUES ('4', 'neha', 'sharama', '10000', '2006-02-11', 'php', '4');
INSERT INTO "main"."employees" ("empid", "firstname", "lastname", "salary", "joindate", "department", "managerid") VALUES ('5', 'bhuvneshavar', 'kumar', '15000', '2018-12-21', 'node', '');




CREATE TABLE "incentive" (
	"empid"	INTEGER,
	"incdate"	date NOT NULL,
	"incamount"	NUMERIC NOT NULL,
	FOREIGN KEY("empid") REFERENCES "employees"("empid")
);
INSERT INTO "main"."incentive" ("empid", "incdate", "incamount") VALUES ('1', '2022-07-12', '2000');
INSERT INTO "main"."incentive" ("empid", "incdate", "incamount") VALUES ('3', '2017-02-01', '5000');
INSERT INTO "main"."incentive" ("empid", "incdate", "incamount") VALUES ('1', '2022-08-12', '4000');


INSERT INTO employees 
(empid,firstname,lastname,salary,joindate,department)
VALUES (1 , 'roy' , 'gupta', 5000, date('2022-05-12') , 'mobile'),
(2,'pavan','kumar',8000,date('2020-01-01') ,'mobile'),
(3,'mahesh','Rao',18000,date('2016-02-11') ,'php'),
(4,'neha','sharama',10000,date('2006-02-11') ,'php'),
(5,'bhuvneshavar','kumar',15000,date('2018-12-21') ,'node');

-- Refer existing employee Table Select employee details from employee table if data exists in incentive table ? 

SELECT * from employees e   INNER JOIN incentive i  on e.empid = i.empid

-- Find Salary of the employee whose salary is more than Roy Salary 

SELECT * from employees WHERE salary > ( SELECT salary FROM employees WHERE firstname = 'roy')

--Create a view to select FirstName,LastName,Salary,JoiningDate,IncentiveDate and IncentiveAmount 


CREATE VIEW empinc as 
SELECT firstname , lastname ,salary , joindate , incdate ,incamount FROM employees e LEFT JOIN
incentive i on e.empid = i.empid


SELECT * from empinc

/*Create a view to select Select first_name, incentive amount from employee and incentives table for those employees 
who have incentives and incentive amount greater than 3000*/

CREATE VIEW incg3k as 
SELECT firstname , lastname ,incamount  from employees e INNER JOIN incentive i on
e.empid = i.empid WHERE incamount > 3000

SELECT * from incg3k

