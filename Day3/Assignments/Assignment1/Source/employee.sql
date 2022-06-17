CREATE TABLE "employees" (
	"empis"	INTEGER NOT NULL,
	"firstname"	TEXT NOT NULL,
	"lastname"	TEXT NOT NULL,
	"salary"	NUMERIC NOT NULL,
	"hiredate"	date NOT NULL,
	"phone"	INTEGER NOT NULL,
	"dob"	date NOT NULL,
	PRIMARY KEY("empis" AUTOINCREMENT)
);

INSERT INTO "main"."employees" ("empis", "firstname", "lastname", "salary", "hiredate", "phone", "dob") VALUES ('1', 'akash', 'sharma', '5000', '2022-06-17', '878856565', '2001-06-17');
INSERT INTO "main"."employees" ("empis", "firstname", "lastname", "salary", "hiredate", "phone", "dob") VALUES ('2', 'lex', 'musk', '6000', '2021-06-21', '65656565', '2001-03-17');
INSERT INTO "main"."employees" ("empis", "firstname", "lastname", "salary", "hiredate", "phone", "dob") VALUES ('3', 'joy', 'qw', '7000', '2017-05-30', '4567891212', '2001-03-10');
INSERT INTO "main"."employees" ("empis", "firstname", "lastname", "salary", "hiredate", "phone", "dob") VALUES ('4', 'sk', 'singh', '6000', '2017-04-30', '5656565', '2001-04-07');
INSERT INTO "main"."employees" ("empis", "firstname", "lastname", "salary", "hiredate", "phone", "dob") VALUES ('5', 'mayank', 'jadeja', '10000', '2017-05-07', '5484878', '1997-03-10');
INSERT INTO "main"."employees" ("empis", "firstname", "lastname", "salary", "hiredate", "phone", "dob") VALUES ('6', 'kash', 'jadeja', '15000', '2017-07-07', '788445', '1994-03-14');



/* Write a query that displays the FirstName and the length of the FirstName for all employees whose name starts with the letters ‘A’, ‘J’ or ‘M’. Give each column an appropriate label. Sort the results by the employees’ FirstName*/


select firstname as name , length("firstname") as lengthofname from employees
WHERE firstname like  'a%' or firstname  like 'j%' 
or firstname  like 'm%' ORDER by firstname ASC


/* Write a query to display the FirstName and Salary for all employees. Format the salary to be 10 characters long, left-padded with the $ symbol. Label the column SALARY.*/

SELECT firstname , salary , printf('%s%d','$',salary) from employees 

/* Write a query to display the employees with their code, first name, last name and hire date who hired either on seventh day of any month or seventh month in any year.*/

SELECT empis,firstname,hiredate from employees 
WHERE hiredate = date(hiredate,'start of month','+6 day') or
strftime(' %m',hiredate)  = strftime(' %m','2022-07-21') 

/*Write a query to display the length of first name for employees where last name contains character ‘c’ after 2nd position.*/

select length(firstname) , lastname from employees WHERE instr(lastname, 'a') > 2

/* Write a query to extract the last 4 character of PhoneNumber.*/

SELECT substr(phone, LENGTH(phone)-3) as 'Ph.No.' FROM employees;

/* Write a query to update the portion of the PhoneNumber in the employees table, within the phone number the substring ‘124’ will be replaced by ‘999’.*/

update employees set  phone = (replace("phone", "123","999"))

/*Write a query to calculate the age in year.*/

SELECT dob ,strftime('%Y','now') - strftime('%Y',dob) as age from employees

/* Write a query to get the distinct Mondays from HireDate in employees tables.*/

select * from employees where strftime('%w',hiredate) = strftime('%w','2021-06-21') 

/*Write a query to get the FirstName and HireDate from Employees table where HireDate between ‘1987-06-01’ and ‘1987-07-30’*/

select * from employees where hiredate BETWEEN '1987-06-01' and '1987-07-01'


/*Write a query to display the current date in the following format. Sample output : 12:00 AM Sep 5, 2014*/

SELECT
CASE WHEN
StrFTime('%H', 'now') % 12 = 0 THEN 12
ELSE StrFTime('%H', 'now') % 12 END
|| ':' ||
StrFTime('%M', 'now')
|| ' ' ||
CASE WHEN
StrFTime('%H', 'now') > 12 THEN 'PM'
ELSE 'AM' END
||' '||strftime('%m-%d-%Y','now')
`currentTime`

/*Write a query to get the FirstName, LastName who joined in the month of June.*/

SELECT empis,firstname,lastname , hiredate from employees 
WHERE strftime(' %m',hiredate)  = strftime(' %m','2022-06-21') 

/*Write a query to get first name, hire date and experience of the employees.*/

SELECT firstname , hiredate , strftime('%Y' , 'now' ) - strftime('%Y',hiredate) as Experiance
FROM employees

/*Write a query to get first name of employees who joined in 1987.*/

SELECT firstname FROM employees WHERE strftime('%Y',hiredate) = strftime('%Y','1987-01-01')