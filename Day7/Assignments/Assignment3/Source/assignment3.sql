--   Tables Used:=
    
    --	student  (studentid, name)

    --   studentdetail (studentdetailid, studentid, standard, gender)

    --   studentpresent (studentpresentid, studentid, month, present)

    --   studenthours (studenthoursid, studentid, datex, hours)

    --   product (productid, name)

    --   productprice (productpriceid, productid, code, effdt, price)


--   Write queries for following requirements:=
    
    --   Insertion requirement:
        
        -- Insert appropriate records in all the tables so that their relationships with each other are maintained properly. 
       -- Insert only first name as 'student.name' in "student" table.


            CREATE TABLE product (
            productid INTEGER ,
            name TEXT NOT NULL,
            PRIMARY KEY(productid)
            )

            INSERT INTO "main"."product" ("productid", "name") VALUES ('51', 'pencil');
            INSERT INTO "main"."product" ("productid", "name") VALUES ('52', 'eracer');
            INSERT INTO "main"."product" ("productid", "name") VALUES ('53', 'shapner');

       CREATE TABLE productprice (
        productpriceid INTEGER ,
        productid INTEGER NOT NULL,
        code INTEGER NOT NULL,
        effdt TEXT NOT NULL CHECK (effdt like '____-__-__'),
        price NUMERIC NOT NULL,
		  PRIMARY KEY  (productpriceid),
        FOREIGN KEY (productid) REFERENCES     product(productid)
			on DELETE CASCADE
      
	
        );

        INSERT INTO "main"."productprice" ("productpriceid", "productid", "code", "effdt", "price") VALUES ('501', '51', '601', '2022-05-01', '25');
        INSERT INTO "main"."productprice" ("productpriceid", "productid", "code", "effdt", "price") VALUES ('502', '52', '602', '2022-01-01', '45');
        INSERT INTO "main"."productprice" ("productpriceid", "productid", "code", "effdt", "price") VALUES ('503', '53', '603', '2022-06-01', '100');

    
    --   Modification requirement:
        
        --   Change value of 'student.name' with any other value for student.studentid = 3.

        UPDATE student set name = 'asdf' WHERE studentid = 3
        
        --   Update all "student" records to append character " A." as the middle name for "student.name" field.
        UPDATE student set name = printf('%s %s' ,name , 'A.') 

        --   Update all "productprice" records to add 25.00 in "price" field.
        UPDATE  productprice set  price =  (price + 25) 

        --   Update "product" table to add "A" in 'product.name' where related 'product.code = AB'.
        UPDATE product set
        name=name||'A' where productid=(select productid from productprice where code='601');

        --   Update all "studentpresent" records to add 2 in 'studentpresentpresent' where related 'studenthours.hours >= 8'.

            UPDATE studentpresent set present = present + 2 
            WHERE stdid = (
            SELECT stdid  from studenthours WHERE hour > 5)



    --   Delete requirement:
        
        --   Remove a record from "product" table where 'product.productid = 5'
        DELETE from product WHERE productid = 51

        
        --   Remove all "student" records where the 'student.name' starts with character "A".
            DELETE FROM student WHERE name like 'a%'

        --   Remove all "studentdetails" record where related 'studenthours.hours <= 3'.
        DELETE FROM studetdetails WHERE stdid =  ( SELECT stdid from studenthours WHERE hour  <= 3)