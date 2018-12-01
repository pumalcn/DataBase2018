-- Database: lab1

-- DROP DATABASE lab1;

CREATE DATABASE lab1
    WITH 
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'Kazakh_Kazakhstan.1251'
    LC_CTYPE = 'Kazakh_Kazakhstan.1251'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;
    
CREATE TABLE users (
	id SERIAL CONSTRAINT users_id PRIMARY KEY,
    firstname VARCHAR(50) NOT NULL,
    lastname VARCHAR(50) NOT NULL
);
ALTER TABLE users ADD COLUMN isadmin INTEGER DEFAULT 1;
ALTER TABLE users 
				ALTER COLUMN isadmin TYPE BOOLEAN USING isadmin::boolean;
ALTER TABLE users 
				ALTER COLUMN isadmin SET DEFAULT FALSE;
CREATE TABLE tasks (
	id SERIAL,
    name VARCHAR(50),
    user_id INTEGER
); 
DROP TABLE tasks;

DROP DATABASE lab1;