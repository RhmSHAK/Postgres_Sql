SELECT * FROM student;

SELECT country, COUNT(*) FROM student
 GROUP BY country;

 SELECT country, AVG(age) FROM student
 GROUP BY country;


---filtering groups with HAVING to show only  countries  with average age greater than 20---
 SELECT country, AVG(age) FROM student
 GROUP BY country
    HAVING AVG(age) > 20;


    SELECT country, sum(age) FROM student 
    GROUP BY country ORDER BY sum(age) DESC;

 SELECT extract(YEAR FROM dob), COUNT(*) FROM student
 GROUP BY dob;   

