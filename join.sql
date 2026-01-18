CREATE TABLE "user1"(
    id SERIAL PRIMARY KEY,
    username VARCHAR(50) NOT NULL
)

CREATE table post1(
    id SERIAL PRIMARY kEY,
    title TEXT,
    user_id INTEGER REFERENCES "user"(id)

)

INSERT INTO "user1"(username)
VALUES
   ('emma'),
   ('oliver'),
   ('ava'),
   ('liam');

INSERT INTO post1(title, user_id)
VALUES
   ('Exploring the city with emma', 1),
   ('oliver shares his travel tips', 2),
   ('ava cooking up a storm', 3),
   ('liam discusses tech trends', 3);


SELECT * FROM post1;
SELECT * FROM "user1";


---------------------------inner join example----------------------------
 SELECT * FROM 
 post1 p LEFT JOIN "user1" as u
   ON
 p.user_id = u.id;


SELECT title, username FROM 
 post1 JOIN "user1"
   ON 
 post1.user_id = "user1".id;


 SELECT p.id post_id,u.id as users_id FROM
 post1 p JOIN "user1" u
   ON
  p.user_id = u.id; 


--------------------------------Left join example----------------------------
INSERT INTO post1(id,title, user_id)
VALUES
   (5, 'A solo adventure', NULL);

 SELECT * FROM post1;  



 SELECT * FROM 
-- post1  LEFT JOIN "user1"
 post1  LEFT OUTER JOIN "user1"  
   ON
 post1.user_id = "user1".id;


 --------------------------------Right join example----------------------------
    SELECT * FROM
    -- post1 p RIGHT JOIN "user1" as u
   "user1" as u RIGHT OUTER JOIN   post1 p
        ON
    p.user_id = u.id;


--------------------------------Full join example----------------------------
  SELECT * FROM
   post1 FULL OUTER JOIN "user1"
        ON
    post1.user_id = "user1".id;

---------------------------------Cross join example----------------------------
  SELECT * FROM
   post1 CROSS JOIN "user1";        

  