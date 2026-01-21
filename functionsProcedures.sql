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


--------------------------------------------------#### Procedure ####--------------------------------------------
SELECT * FROM employees;

CREATE Procedure remove_emp()
LANGUAGE plpgsql
AS
$$
  BEGIN
    
        DELETE FROM employees WHERE employee_id = 14;     

  END
$$

CALL remove_emp();


------------------------------------- Procedure with parameter 

CREATE Procedure remove_emp_by_id(emp_id INT)
LANGUAGE plpgsql
AS
$$

  BEGIN
    
        DELETE FROM employees WHERE employee_id = emp_id;     

        RAISE NOTICE 'Employee with ID % has been removed.', emp_id;
  END
$$  

CALL remove_emp_by_id(13);



CREATE Procedure remove_emp_by_id_var(emp_id INT)
LANGUAGE plpgsql
AS
$$

    DECLARE
    test_variable int;

   BEGIN
        
        SELECT employee_id INTO test_variable FROM employees WHERE employee_id = emp_id;
        DELETE FROM employees WHERE employee_id = test_variable;     

        RAISE NOTICE 'Employee with ID % has been removed.', test_variable;
  END
$$  

CALL remove_emp_by_id_var(7);


------------------------------------- Procedure with variable
CREATE Procedure remove_emp_variable1()
LANGUAGE plpgsql
AS
$$

    DECLARE
    test_variable1 int;

   BEGIN
        
        SELECT employee_id INTO test_variable1 FROM employees WHERE employee_id = 5;
        DELETE FROM employees WHERE employee_id = test_variable1;     

  END
$$  


CALL remove_emp_variable1();

SELECT * FROM employees;