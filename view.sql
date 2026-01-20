------------------------------------------------ create view (non-materialized) ---------------------------
CREATE VIEW dept_avg_salary 
AS
SELECT department_name, AVG(salary) AS average_salary FROM employees GROUP BY department_name;


SELECT department_name, AVG(salary) AS average_salary FROM employees GROUP BY department_name;

SELECT * FROM dept_avg_salary;


----------------------------------------------- use view in a query ---------------------------------------
---Simplifying complex queries
CREATE VIEW test
AS
SELECT employee_name,salary FROM employees
WHERE
      department_name IN
            (SELECT department_name FROM employees WHERE department_name LIKE '___k%') --single column subquery
;
---Improved security (test view er maddhome sensitive data gula ke hide kora jay)
SELECT * FROM test;
---Enhanced data abstraction

----------------------------------------------- types of view --------------------------------------------
--- meterialized view (result physically store koire rakhe) 
--- non-materialized view
