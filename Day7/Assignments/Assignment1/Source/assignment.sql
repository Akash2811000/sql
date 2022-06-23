----   Please create following tables:
    
    --   Student_Details		
        --   Name
        --   Standard
        --   Sex
        --   Monthly Present
        --   Daily Hours
    
    --   PRODUCTS      
        --   Name
        --   Price
    
    --   Materials        
        --   Name
        --   Price (allow to insert value like "Rs. 100")

-- Insert appropriate records in each tables.
CREATE TABLE "student_details" (
	"name"	TEXT NOT NULL,
	"standard"	INTEGER NOT NULL,
	"sex"	TEXT NOT NULL CHECK(sex IN ('M', 'F')),
	"Monthly_present"	INTEGER,
	"dailyhours"	TEXT NOT NULL
)

INSERT INTO "main"."student_details" ("name", "standard", "sex", "Monthly_present", "dailyhours") VALUES ('akash', '1', 'M', '25', '08:30');
INSERT INTO "main"."student_details" ("name", "standard", "sex", "Monthly_present", "dailyhours") VALUES ('sky', '2', 'M', '20', '05:30');
INSERT INTO "main"."student_details" ("name", "standard", "sex", "Monthly_present", "dailyhours") VALUES ('xyz', '3', 'F', '26', '09:30');

CREATE TABLE "products" (
	"name"	TEXT NOT NULL,
	"quantity"	NUMERIC,
	"price"	NUMERIC NOT NULL
)

INSERT INTO "main"."products" ("name", "quantity", "price") VALUES ('pencil', '4', '20');
INSERT INTO "main"."products" ("name", "quantity", "price") VALUES ('rubber', '5', '10');
INSERT INTO "main"."products" ("name", "quantity", "price") VALUES ('shapner', '1', '5');

CREATE TABLE "material" (
	"name"	TEXT NOT NULL,
	"price"	NUMERIC CHECK(price Like 'Rs.%')
);

INSERT 	INTO material  (name , price) VALUES
('wood','Rs.500'),
('ion','Rs.400');

-- Display all the records for each tables separately.

SELECT * from student_details
SELECT * from products
SELECT * from material

-- Remove all the records from each tables (with and without using DELETE statement).
DELETE from material WHERE name = 'wood'
DELETE from material 
DELETE  from student_details
DELETE from products

-- Delete all the above tables.
DROP TABLE material
DROP TABLE student_details
DROP TABLE products



