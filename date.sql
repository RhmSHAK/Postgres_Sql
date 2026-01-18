-- Active: 1767694221158@@127.0.0.1@5432@ph

SHOW timezone;

SELECT now();


CREATE TABLE timeZ (
    ts TIMESTAMP without time zone,
     tsz TIMESTAMP with time zone
);


INSERT INTO timeZ (ts, tsz)
VALUES
('2024-06-01 12:00:00', '2024-06-05 10:00:00'),
('2024-12-01 14:00:00', '2024-12-06 11:00:00');

SELECT * FROM timeZ;

SELECT current_time;
SELECT current_date;

SELECT now()::date;
SELECT now()::time;

SELECT to_char(now(), 'DD-MM-YYYY') AS formatted_date;
SELECT to_char(now(), 'HH:MI:SS AM') AS formatted_time;

SELECT CURRENT_DATE + INTERVAL '7 days' AS next_week;
SELECT CURRENT_DATE - INTERVAL '1 month' AS last_month;


SELECT AGE(CURRENT_DATE, '1997-07-25') AS age_difference;

SELECT *,age(CURRENT_DATE,dob) FROM student;

SELECT EXTRACT(YEAR FROM CURRENT_DATE) AS current_year;
SELECT EXTRACT(day FROM '10-01-2600'::date) AS current_month;
SELECT EXTRACT(DOW FROM '10-01-2600'::date) AS day_of_week;


SELECT 1::BOOLEAN;
