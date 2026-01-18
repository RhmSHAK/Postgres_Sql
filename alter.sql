-- Active: 1767694221158@@127.0.0.1@5432@ph
SELECT * FROM person2;

----- column add--------
ALTER TABLE person2
    ADD COLUMN email VARCHAR(25) NOT NULL DEFAULT 'default@gmail.com';

 INSERT INTO person2
 VALUES
    (6, 'Alice', 25);

INSERT INTO person2
VALUES
   (7, 'Bob', 30,'Bob@gmail.com');  

--------column remove--------
ALTER TABLE person2
    DROP COLUMN email;        

-----rename column--------
ALTER TABLE person2
    RENAME COLUMN age TO user_age;

-----change column data type--------   
ALTER TABLE person2
    ALTER COLUMN user_name TYPE VARCHAR(50); 

-----set constraint --------  
ALTER TABLE person2
    ALTER COLUMN user_age SET NOT NULL; 

-----drop constraint --------  
ALTER TABLE person2
    ALTER COLUMN user_age DROP NOT NULL;  

-----add unique constraint--------  
ALTER TABLE person2
    ADD CONSTRAINT unique_user_age UNIQUE (user_age);

-----drop unique constraint--------  
ALTER TABLE person2
    DROP CONSTRAINT unique_user_age;        

-----set default value--------  
ALTER TABLE person2
    ALTER COLUMN user_age SET DEFAULT 18; 

-----drop default value--------  
ALTER TABLE person2
    ALTER COLUMN user_age DROP DEFAULT;    

---truncate(table data delete) table--------
TRUNCATE TABLE person2; 

--------------------------------------drop tab (Full table delete)------------
 DROP TABLE person2;