-- Active: 1767694221158@@127.0.0.1@5432@ph
CREATE TABLE student (
    student_id SERIAL PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    age INT,
    grade CHAR(10),
    course VARCHAR(50),
    email VARCHAR(100),
    dob DATE,
    blood_group VARCHAR(5),
    country VARCHAR(50)

);

-- DROP TABLE  students;

INSERT INTO student (first_name, last_name, age, grade, course, email, dob, blood_group, country)
VALUES
('John', 'Doe', 20, 'A', 'Mathematics', 'john@gmail.com', '01-01-2004', 'O+', 'USA'),
('Jane', 'Smith', 22, 'B', 'Physics', 'jane@gmail.com', '02-02-2002', 'A+', 'Canada'),
('Alice', 'Johnson', 19, 'A', 'Chemistry', 'alice@gmail.com', '03-03-2005', 'B+', 'UK'),
('Bob', 'Brown', 21, 'C', 'Biology', 'bob@gmail.com', '04-04-2003', 'AB+', 'Australia'),
('Charlie', 'Davis', 23, 'B', 'Computer Science', 'charli@gmail.com', '05-05-2001', 'O-', 'India'),
('Diana', 'Miller', 20, 'A', 'Mathematics', 'dina@gmail.com', '06-06-2004', 'A-', 'USA'),
('Ethan', 'Wilson', 22, 'C', 'Physics', 'ethan@gmail.com', '07-07-2002', 'B-', 'Canada'),
('Fiona', 'Moore', 19, 'B', 'Chemistry', 'fiona@gmail.com', '08-08-2005', 'AB-', 'UK'),
('George', 'Taylor', 21, 'A', 'Biology', 'george@gmail.com', '09-09-2003', 'O+', 'Australia'),
('Hannah', 'Anderson', 23, 'C', 'Computer Science', 'hanna@gmail.com', '10-10-2001', 'A+', 'India'),
('Ian', 'Thomas', 20, 'B', 'Mathematics', NULL, '11-11-2004', 'B+', 'USA'),
('Jenna', 'Jackson', 22, 'A', 'Physics', NULL, '12-12-2002', 'AB+', 'Canada');



TRUNCATE TABLE student;

SELECT * FROM student;

SELECT email as student_email, age FROM student ; 


SELECT email as "student email", age FROM student; 



---order by clause use kora hoyeche---
SELECT * FROM student ORDER BY first_name ASC;

SELECT * FROM student ORDER BY first_name DESC;


SELECT country FROM student ORDER BY country ASC;

---unique country list----
SELECT DISTINCT country FROM student ORDER BY country ASC;

--unique blood group list----
SELECT DISTINCT blood_group FROM student ;

SELECT DISTINCT blood_group FROM student ORDER BY blood_group ASC;


---aggregate function use kora hoyeche---
SELECT COUNT(*) AS total_students FROM student;

SELECT COUNT(DISTINCT country) AS unique_country_count FROM student;






SELECT * FROM student;

--filtering data------

----condition er jonne (WHERE) clause use kora hoy----

------select student from (the USA)------
SELECT * FROM student 
    WHERE 
         country= 'USA';

------select student with 'A' grade in Physics------
SELECT * FROM student
 WHERE 
    grade= 'C' AND course= 'Physics';

------select student with 'A+' blood group------
SELECT * FROM student
 WHERE 
    blood_group= 'A+';    


------select student from (Australia or USA)------
SELECT * FROM student 
 WHERE 
         country= 'Australia' OR country= 'USA';

SELECT * FROM student 
 WHERE 
         country IN ('Australia', 'USA');


SELECT * FROM student
 WHERE
      country NOT IN ('Australia', 'USA');


SELECT * FROM student
 WHERE
      age BETWEEN 20 AND 22 ORDER BY age ASC;      

------select student from (Canada or USA) and age greater than or equal 20------
 SELECT * FROM student
 WHERE
      (country = 'Canada' OR country = 'USA') AND age >= 20;


------select student whose age is not 21------
SELECT * FROM student
WHERE
     age != 21;

SELECT * FROM student
WHERE
     age <> 21; 

 SELECT * FROM student
WHERE
     NOT age = 21;       


 
SELECT * FROM student;
------select student whose name is include with 'a'------
SELECT * FROM student
 WHERE
      country LIKE 'A%';

SELECT * FROM student
 WHERE
      country LIKE '%a'; 

SELECT * FROM student
 WHERE
      country LIKE '%n%';

SELECT * FROM student
 WHERE
      country LIKE '_n_i%';

 SELECT * FROM student
 WHERE
      country NOT LIKE 'A%';

SELECT * FROM student
 WHERE
      country ILIKE 'a%';                            


/*

@Scalar Functions-->poti row akbar check koire multiple output dei

1. LOWER() - Converts a string to lowercase.
2. UPPER() - Converts a string to uppercase.
3. LENGTH() - Returns the length of a string.
4.LENGTH() - Returns the length of a string.

@Aggregate Functions--->sob gulu row ak koire akta data dibe

1. COUNT() - Returns the number of rows that match a specified condition.
2. SUM() - Returns the total sum of a numeric column.
3. AVG() - Returns the average value of a numeric column.
4. MAX() - Returns the maximum value in a set of values.
5. MIN() - Returns the minimum value in a set of values.

*/

---full name banano hoyeche---
SELECT first_name || ' ' || last_name AS full_name FROM student;

--- (scalar function) use---
SELECT UPPER(first_name || ' ' || last_name) AS full_name, course FROM student;


SELECT concat(first_name , ' ' , last_name) AS full_name FROM student;  

SELECT UPPER(first_name) AS upper_first_name, LOWER(last_name) AS lower_last_name FROM student;

SELECT LENGTH(first_name) AS first_name_length FROM student;


---(aggregate function) use kora hoyeche---
SELECT COUNT(*) AS total_students FROM student;

SELECT COUNT(DISTINCT country) AS unique_country_count FROM student;

SELECT AVG(age) AS average_age FROM student;

SELECT SUM(age) AS total_age FROM student;

SELECT MAX(age) AS oldest_student_age FROM student;

SELECT MIN(age) AS youngest_student_age FROM student;


---find the maximum length of first names among all students---
SELECT MAX(LENGTH(first_name)) AS max_first_name_length FROM student;



-------------------------------------null value check kora hoyeche-----------------------
SELECT * FROM student
WHERE
     email IS NOT NULL;

SELECT * FROM student
WHERE
     email IS NULL;

SELECT email FROM student


SELECT COALESCE(email, 'Email not provide') AS "Email", age FROM student;


------------------------------------limit and offset use kora hoyeche---------------------
SELECT * FROM student
LIMIT 5 ;

select * from student
OFFSET 5;


SELECT * FROM student
 WHERE
      country NOT IN ('Australia', 'USA') LIMIT 3;



SELECT * FROM student;
------------------------------------pagination example-----------------------------------

SELECT * FROM student
LIMIT 2 OFFSET 2 *0;  --page 1;

SELECT * FROM student
LIMIT 2 OFFSET 2 *1;  --page 2;

SELECT * FROM student
LIMIT 2 OFFSET 2 * 2;  --page 3;

-------------------------------------delete data from table------------------------------
DELETE FROM student
WHERE
     student_id = 59;

DELETE FROM student
WHERE
      grade= 'C'; 

DELETE FROM student
WHERE
      email IS NULL AND country= 'USA'
      ;           


-------------------------------------update data in table----------------------------------
UPDATE student
SET
    email = 'default@gmail.com'  
    WHERE
        email IS NULL;

UPDATE student
SET
    grade = 'B' ,blood_group= 'O-'
    WHERE
        course = 'Physics' AND age > 21;        

