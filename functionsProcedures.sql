SELECT * FROM employees;


SELECT COUNT(*) FROM employees;

------------------------------------------------- Function to count employees --------------------------------------------
CREATE Function emp_count()
RETURNS INT
LANGUAGE SQL
AS
$$
    SELECT COUNT(*) FROM employees; 
$$;


SELECT emp_count() ;

------------------------------------------------- Function to delete an employee --------------------------------------------
CREATE Function delete_emp1()
RETURNS VOID
LANGUAGE SQL
AS
$$
   DELETE FROM employees WHERE employee_id = 2;
$$

SELECT delete_emp();


-------------------------------------------------- Function with parameter --------------------------------------------
CREATE Function delete_emp_by_id(p_emp_id INT)
RETURNS VOID
LANGUAGE SQL
AS
$$
    DELETE FROM employees WHERE employee_id = emp_id;
$$

SELECT delete_emp_by_id(15)