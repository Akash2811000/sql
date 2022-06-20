CREATE TABLE caremp (
empid INTEGER ,
name TEXT NOT NULL,
designation TEXT NOT NULL,
salary NUMERIC NOT NULL,
PRIMARY KEY (empid)
)

INSERT INTO caremp (empid,name, designation,salary) VALUES
(1,'akash','salesperson',4000),
(2,'sky','manager',8000),
(3,'lex','salesperson',5000),
(4,'raj','salesperson',6000);



CREATE TABLE carinventory (
carid INTEGER ,
carname TEXT NOT NULL,
price NUMERIC NOT NULL,
PRIMARY KEY(carid)
)
INSERT INTO "main"."carinventory" ("carid", "carname", "price") VALUES ('12', 'alto', '100000');
INSERT INTO "main"."carinventory" ("carid", "carname", "price") VALUES ('13', 'nano', '60000');
INSERT INTO "main"."carinventory" ("carid", "carname", "price") VALUES ('14', 'swift', '200000');
INSERT INTO "main"."carinventory" ("carid", "carname", "price") VALUES ('15', 'wegonar', '120000');

CREATE TABLE carcompsales (
carid INTEGER ,
salprice NUMERIC NOT NULL ,	
empid INTEGER NOT NULL,
FOREIGN KEY (carid) REFERENCES carinventory(carid),
FOREIGN KEY (empid) REFERENCES caremp(empid)
)

INSERT INTO "main"."carcompsales" ("carid", "salprice", "empid") VALUES ('12', '100000', '1');

CREATE TABLE caraccount(
empid INTEGER NOT NULL,
commision  NUMERIC NOT NULL,
FOREIGN key (empid) REFERENCES caremp(empid)
)

INSERT INTO "main"."caraccount" ("empid", "commision") VALUES ('1', '0.25');
INSERT INTO "main"."caraccount" ("empid", "commision") VALUES ('4', '0.25');