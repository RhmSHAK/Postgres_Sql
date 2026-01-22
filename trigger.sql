/*
A trigger is a database object is postgresSql that is automatically executed or fired when certain events occur. Triggers can be set to execute before or after insert, update, or delete operations on a table.
*/

----Table-Level events:
    -- BEFORE INSERT
    -- AFTER INSERT
    -- BEFORE UPDATE
    -- AFTER UPDATE
    -- BEFORE DELETE
    -- AFTER DELETE
    -- After TRUNCATE
    
-- Database-Level events:
    -- Database startup
    -- Database shutdown
    -- User login
    -- User logout
    -- connection start and etc



------ create trigger syntax:
-- CREATE TRIGGER trigger_name
-- {BEFORE | AFTER | INSTEAD OF} {INSERT | UPDATE | DELETE | TRUNCATE}
-- ON table_name        
-- FOR EACH ROW
-- EXECUTE FUNCTION function_name();   

CREATE  TABLE my_users (
    
    username VARCHAR(50) ,
    email VARCHAR(100)
);

INSERT into my_users (username, email) 
VALUES 
   ('john_doe', 'johan@gmail.com'),
   ('jane_smith', 'jane@gmail.com');


SELECT * FROM my_users;


CREATE TABLE delete_user_audit(
    username VARCHAR(50),
    deleted_at TIMESTAMP 
);


SELECT * FROM delete_user_audit;


CREATE OR REPLACE FUNCTION save_deleted_user()
RETURNS TRIGGER
LANGUAGE plpgsql
AS
$$
   BEGIN
         INSERT INTO delete_user_audit (username, deleted_at)
         VALUES (OLD.username, NOW());
         
         RETURN OLD;
    END
$$


CREATE or REPLACE TRIGGER Before_user_delete
BEFORE DELETE
ON my_users
FOR EACH ROW
EXECUTE FUNCTION save_deleted_user();


-- Deleting a user to see the trigger in action
DELETE FROM my_users WHERE username = 'john_doe';


