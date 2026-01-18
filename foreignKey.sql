
CREATE TABLE "user" (
    id SERIAL PRIMARY KEY,
    username VARCHAR(50) NOT NULL
   
);

CREATE TABLE post (
    id SERIAL PRIMARY KEY,
    title TEXT,
    user_id INT,
    FOREIGN KEY (user_id) REFERENCES "user"(id) 
);



INSERT INTO "user" (username) 
VALUES 
   ('alice'), 
   ('bob'),
   ('charlie'),
   ('david');

INSERT INTO post (title, user_id) 
VALUES 
   ('Enjoying a sunny day with alice', 2), 
   ('Batash just share an amazing recipe', 1),
   ('Exploring adventures with charlie', 1),
   ('Nodi wisdom always leaves me inspired', 3);

DROP TABLE post;

DROP TABLE "user";


SELECT * FROM post;

SELECT * FROM "user";


--insert value valid id--
INSERT INTO post (title, user_id) 
VALUES
    ('A day out with friends', 4);


--insert value invalid id-- (error diba)
INSERT INTO post (title, user_id)
VALUES
    ('Learning SQL foreign keys', 10);

ALTER TABLE post
    ALTER COLUMN user_id set not NULL;

INSERT INTO post (title, user_id)
VALUES
    ('Another post without user', NULL); 


------------------------------- Deletion constraint on Delete user -----------------------------
-- Restrict delete --> ON DELETE RESTRICT / ON DELETE NO ACTION (default behavior)

-- Cascading delete --> ON DELETE CASCADE
CREATE TABLE post (
    id SERIAL PRIMARY KEY,
    title TEXT,
    user_id INT,
    FOREIGN KEY (user_id) REFERENCES "user"(id) ON DELETE CASCADE
);
-- Set null on delete --> ON DELETE SET NULL
CREATE TABLE post (
    id SERIAL PRIMARY KEY,
    title TEXT,
    user_id INT,
    FOREIGN KEY (user_id) REFERENCES "user"(id) ON DELETE SET NULL
);

--Set default value --> ON DELETE SET DEFAULT DEFAULT 2:-(default value set kora thakbe)
CREATE TABLE post (
    id SERIAL PRIMARY KEY,
    title TEXT,
    user_id INT,
    FOREIGN KEY (user_id) REFERENCES "user"(id) ON DELETE SET DEFAULT DEFAULT 2
);


--- default behavior -----
DELETE FROM "user"
WHERE id = 5,6;  -- error diba karon foreign key reference ase post table e

