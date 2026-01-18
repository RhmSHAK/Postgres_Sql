CREATE TABLE employee(
    id SERIAL PRIMARY KEY,
    emp_name VARCHAR(50),
    dept_id INTEGER 
)

CREATE TABLE department(
    dept_name VARCHAR(50),
    dept_id INTEGER
)


INSERT INTO department(dept_name, dept_id)
VALUES
   ('HR', 1),
   ('Engineering', 2),
   ('Marketing', 3);


INSERT INTO employee(emp_name, dept_id)
VALUES
   ('Alice', 1),
   ('Bob', 2),
   ('Charlie', 3);


-- Cross Join Example
SELECT * FROM
    employee CROSS JOIN department;

 ---- natural join example (common column takta hbe-->(dept_id common column))----------------------------
 SELECT * FROM
    employee NATURAL JOIN department;   