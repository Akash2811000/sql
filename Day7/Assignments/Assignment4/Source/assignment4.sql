Implement following queries:

Q--1 Write a query which will return value '5.0' for input value of '4.1' as well as '4.8'.

SELECT round(4.1)
SELECT round(4.8)


Q--2 Write a query which will return value '4.0' for input value of '4.1' as well as '4.8'.
SELECT round(4.1)
SELECT round(4.8)

Q--3 What will be the output of following query:
	SELECT MOD(11,3);
	SELECT 11 % 3 = 2


Q--4 Write a query to find 2 raise to power 3.



Q--5 Write a query to generate random number using MS SQL function.
SELECT random()


Q--6 Write a query to supply seed to the function generating random number.
SELECT random()

Q--7 Write a query which will return value '4' for '3.5' and '3' for '3.4'.
SELECT round(3.5)

Q--8 Write a query so that output will be '15.75' for the value '15.7463847'.
SELECT round(15.7463847 , 2)

Q--9 Write a query to find square root of given value. What will be the output if the provided value is negative?


Q--10 Write a query so that output will be '15.74' for the value '15.7463847'.
SELECT round(15.7463847 , 2)

Q--11 Write a query which will output '15.2500' for provided value '15.25'.
SELECT round(15.2500 , 2)

--   Tables Used:=
    
    --	student  (studentid, name)

    --   studentdetail (studentdetailid, studentid, standard, gender)

    --   studentpresent (studentpresentid, studentid, month, present)

    --   studenthours (studenthoursid, studentid, datex, hours)

    --   product (productid, name)

    --   productprice (productpriceid, productid, code, effdt, price)


	-- Write a query to display all the product names with code in bracket in one column and 2 decimal significant price in second column, 
	e.g. : MS Sql book (MS09210) | 10.99

	Here 'MS Sql book' is product name and 'MSSQL09210' is the product code while '10.99' is the 2 decimal significant price.

        SELECT  p.name,printf('%s%d%s','(',pr.code,')') as productcode , 
        round(pr.price,2)  as price from product p INNER JOIN
        productprice pr on p.productid = pr.productid

        SELECT  p.name ||' ' || printf('%s%d%s','(',pr.code,')') as productname  ,
        round(pr.price,2)  as price from product p INNER JOIN
        productprice pr on p.productid = pr.productid



	
	-- Write a query to display following information separated by comma in a single row for the students who have atleast one 'a' in their name. 
	The column heading should be STUDENTINFO.
	
	student name, standard, gender

    SELECT s.name || ' , ' || st.standard || ' , ' || st.gender  as student_details from student s
    INNER JOIN studetdetails st on
    s.studentid = st.stdid