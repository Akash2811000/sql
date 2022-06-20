CREATE TABLE empl ( 
empid  INTEGER,
firstname TEXT NOT NULL,
lastname TEXT NOT NULL,
city TEXT NOT NULL,
hiredate  TEXT NOT NULL,
depname  TEXT NOT NULL, 
managerid INTEGER ,
salary NUMERIC,
PRIMARY key (empid),
FOREIGN KEY (managerid) REFERENCES empl(empid)
)

INSERT INTO "main"."empl" ("empid", "firstname", "lastname", "city", "hiredate", "depname", "managerid", "salary") VALUES ('1', 'lex', 'mavriv', 'ahmedabad', '2000-01-01', 'mobile', '8', '50000');
INSERT INTO "main"."empl" ("empid", "firstname", "lastname", "city", "hiredate", "depname", "managerid", "salary") VALUES ('2', 'steven', 'xyz', 'surat', '2005-02-01', 'mobile', '1', '40000');
INSERT INTO "main"."empl" ("empid", "firstname", "lastname", "city", "hiredate", "depname", "managerid", "salary") VALUES ('3', 'neena', 'kocher', 'vadodara', '2012-02-01', 'hr', '', '30000');
INSERT INTO "main"."empl" ("empid", "firstname", "lastname", "city", "hiredate", "depname", "managerid", "salary") VALUES ('4', 'david', 'austin', 'gandhinagar', '2013-05-01', 'php', '5', '50000');
INSERT INTO "main"."empl" ("empid", "firstname", "lastname", "city", "hiredate", "depname", "managerid", "salary") VALUES ('5', 'joy', 'xys', 'bhavnagar', '2006-12-01', 'php', '', '45000');
INSERT INTO "main"."empl" ("empid", "firstname", "lastname", "city", "hiredate", "depname", "managerid", "salary") VALUES ('6', 'luiss', 'popp', 'ahmedabad', '2007-11-28', 'php', '5', '100000');
INSERT INTO "main"."empl" ("empid", "firstname", "lastname", "city", "hiredate", "depname", "managerid", "salary") VALUES ('7', 'guy', 'himuro', 'gandhinagar', '2015-11-24', 'hr', '3', '45000');
INSERT INTO "main"."empl" ("empid", "firstname", "lastname", "city", "hiredate", "depname", "managerid", "salary") VALUES ('8', 'pavan', 'kumar', 'ahmedabad', '2020-05-04', 'mobile', '', '50000');


/*Write a View to display the department name, manager name, and city. */

CREATE view mangemp as
SELECT e.depname , e.firstname, m.firstname,e.city from empl e
INNER join empl m on
m.empid = e.managerid

SELECT * FROM mangemp

/*Create a View to display department name, name (first_name, last_name), 
hire date, salary of the manager for all managers whose experience is more than 15 years.*/

CREATE VIEW mgexp as
SELECT d.depname , d.firstname || ' ' || d.lastname as mangername , 
e.hiredate,e.salary
 FROM empl e  INNER JOIN empl d
 on d.empid = e.managerid 
 WHERE  (julianday('now') - julianday(d.hiredate)) / 365  >  15

SELECT * from mgexp

