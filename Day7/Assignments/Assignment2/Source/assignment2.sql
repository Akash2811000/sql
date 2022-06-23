--   Tables Used
    
    --   student  (studentid, name)

    --   studentdetail (studentdetailid, studentid, standard, gender)

    --   studentpresent (studentpresentid, studentid, month, present)

    --   studenthours (studenthoursid, studentid, datex, hours)

-- Create above mentioned tables.


CREATE table student (
studentid INTEGER,
name TEXT NOT NULL,
PRIMARY KEY (studentid)
)

INSERT INTO student (studentid,name)
VALUES 
(1,'akash'),
(2,'sky'),
(3,'xyz'),
(4,'lex'),
(5,'steven');


CREATE TABLE studetdetails (
studentdetid INTEGER,
stdid INTEGER NOT NULL,
standard INTEGER NOT NULL,
gender TEXT CHECK (gender IN ('M','F')),
PRIMARY KEY(studentdetid),
FOREIGN KEY (stdid) REFERENCES student(studentid)
)

INSERT INTO studetdetails (studentdetid,stdid,standard,gender) VALUES
(11,1,1,'M'),
(12,2,2,'M'),
(13,3,5,'F'),
(14,4,10,'F'),
(15,5,6,'M');


CREATE TABLE studentpresent (
studentpreid INTEGER,
stdid INTEGER NOT NULL,
month NUMERIC NOT NULL,
present NUMERIC  NOT NULL,
PRIMARY KEY(studentpreid),
FOREIGN KEY (stdid) REFERENCES student(studentid)
)

INSERT INTO studentpresent (studentpreid,stdid,month,present) VALUES
(21,1,'01',25),
(22,2,'01',24),
(23,3,'01',22),
(24,4,'02',22),
(25,5,'02',24);
INSERT INTO studentpresent (studentpreid,stdid,month,present) VALUES
(26,1,'01',20),
(27,2,'01',22),
(28,3,'01',21),
(29,4,'02',23),
(30,5,'02',28);

CREATE TABLE studenthours (
studenthourid INTEGER,
stdid INTEGER NOT NULL,
datex TEXT NOT NULL CHECK (datex like '____-__-__'),
hour NUMERIC  NOT NULL ,
PRIMARY KEY(studenthourid),
FOREIGN KEY (stdid) REFERENCES student(studentid)
)

INSERT INTO studenthours (studenthourid,stdid,datex,hour) VALUES
(31,1,'2022-01-01','05'),
(32,2,'2022-01-01','06'),
(33,3,'2022-01-01','04'),
(34,4,'2022-02-01','05'),
(35,5,'2022-02-01','05');
INSERT INTO studenthours (studenthourid,stdid,datex,hour) VALUES
(36,1,'2022-01-02','05'),
(37,2,'2022-01-02','06'),
(38,3,'2022-01-02','04'),
(39,4,'2022-02-02','05'),
(40,5,'2022-02-02','05');


-- Insert appropriate records in the above tables.

-- Write queries for the following requirements.
    
    --  Display following details for each student:
        
        --   Name

        --   Standard

        --   Sex

SELECT s.name , st.standard , st.gender from student s
INNER JOIN studetdetails st on
s.studentid = st.stdid


   --NOTE : The same above headers should be displayed in the query & apply sorting on Name.

   SELECT s.name , st.standard , st.gender from student s
    INNER JOIN studetdetails st on
    s.studentid = st.stdid ORDER by s.name
    
    --   Find SUM of student hours.
        SELECT s.name , sum(sth.hour) as hour from student s
        INNER JOIN studenthours sth on
        s.studentid = sth.stdid GROUP By sth.stdid
        

    --   Find Average Present of each student.

        SELECT s.name , avg(stp.present) as avgpresent from student s
        INNER JOIN studentpresent stp on
        s.studentid = stp.stdid GROUP By stp.stdid


    --   Find Minimum present among all students.

    SELECT s.name , min(stp.present) as avgpresent from student s
        INNER JOIN studentpresent stp on
        s.studentid = stp.stdid 

    --   Find Maximum present among all students.

    SELECT s.name , max(stp.present) as avgpresent from student s
        INNER JOIN studentpresent stp on
        s.studentid = stp.stdid 


    --   Display fields like Name, Date, Hours from "studenthours" table where Date should be in following format :
        
        --   DD/MM/YY

            SELECT s.name , strftime('%d/%m/%Y',sth.datex ),sth.hour from student s 
            INNER JOIN studenthours sth on
            s.studentid = sth.stdid GROUP by s.name
        --   MM/DD/YY
                SELECT s.name , strftime('%m/%d/%Y',sth.datex ),sth.hour from student s 
                INNER JOIN studenthours sth on
                s.studentid = sth.stdid GROUP by s.name

        --   YYYY--MM--DD
        SELECT s.name , sth.datex ,sth.hour from student s 
        INNER JOIN studenthours sth on
        s.studentid = sth.stdid GROUP by s.name

        --   MM/DD Day   
        	SELECT s.name , strftime('%m/%d',sth.datex ),sth.hour from student s 
            INNER JOIN studenthours sth on
            s.studentid = sth.stdid GROUP by s.name
   
