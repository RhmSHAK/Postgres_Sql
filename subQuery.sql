CREATE TABLE employees(
    employee_id SERIAL PRIMARY KEY,
    employee_name VARCHAR(50) NOT NULL,
    department_name VARCHAR(50),
    salary DECIMAL(10, 2),
    hire_date DATE
)


INSERT INTO employees(employee_name, department_name, salary, hire_date)
VALUES  
     ('John Doe', 'Engineering', 75000.00, '2020-01-15'),
     ('Jane Smith', 'Marketing', 65000.00, '2019-03-22'),
     ('Emily Johnson', 'HR', 60000.00, '2021-07-30'),
     ('Michael Brown', 'Engineering', 80000.00, '2018-11-12'),
     ('Jessica Davis', 'Marketing', 70000.00, '2020-05-18'),
     ('Daniel Wilson', 'HR', 62000.00, '2019-09-25'),
     ('Sarah Miller', 'Engineering', 78000.00, '2021-02-10'),
     ('David Garcia', 'Marketing', 68000.00, '2018-06-05'),
     ('Laura Martinez', 'HR', 61000.00, '2020-10-14'),
     ('James Rodriguez', 'Engineering', 82000.00, '2019-12-01'),    
     ('Linda Hernandez', 'Marketing', 69000.00, '2021-04-20'),
     ('Robert Lopez', 'HR', 63000.00, '2018-08-30'),
     ('Patricia Gonzalez', 'Engineering', 77000.00, '2020-09-09'),
     ('Charles Wilson', 'Marketing', 66000.00, '2019-11-11'),
     ('Barbara Anderson', 'HR', 64000.00, '2021-01-25');


------------Retrieve all employees whose is greater than the highest salary of the 'HR' department------------------

     SELECT max(salary) FROM employees
     WHERE
          department_name = 'HR'
     ;


--------where (use grater then) clause with subquery returning single value---------
     SELECT * FROM employees
     WHERE
          salary > (SELECT max(salary) FROM employees
                       WHERE
                          department_name = 'HR'
                  )-- single value subquery
         ;         

SELECT * FROM employees;

------  Can return a single value   ---------- 
------  Can return multiple rows    ---------- 
------ Can return multiple columns  ----------

     SELECT *, (SELECT sum(salary) as total_salary FROM employees) from employees;

     SELECT department_name, sum(salary) from employees GROUP BY department_name;

     ---subquery in WHERE clause---
     SELECT * FROM --outer query/main query
      (SELECT department_name, sum(salary) from employees GROUP BY department_name) as sum_dept_salary ----subquery
      WHERE
         sum_dept_salary.sum > 320000
     ;

-------- where (use IN) clause with subquery returning single column multiple rows But not returning multiple column ---------
SELECT department_name FROM employees WHERE department_name LIKE '___k%';

SELECT employee_name,salary FROM employees
WHERE
      department_name IN
            (SELECT department_name FROM employees WHERE department_name LIKE '___k%') --single column subquery
;


                      