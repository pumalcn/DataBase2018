CREATE DATABASE lab2;

CREATE TABLE countries(
  country_id SERIAL PRIMARY KEY,
  country_name VARCHAR(50),
  region_id INT,
  population INT
);

INSERT INTO countries
	VALUES (DEFAULT , 'RUSSIA', 5, 1200000);
INSERT INTO countries (country_id, country_name)
	VALUES (DEFAULT , 'GERMANY');

UPDATE countries SET region_id = NULL ;

INSERT INTO countries (country_id, country_name, region_id, population)
	VALUES (DEFAULT , 'UK', 4, 53000),
       	   (DEFAULT , 'JAPAN', 7, 300000),
       	   (DEFAULT , 'USA', 45, 3000057);

ALTER TABLE countries
    ALTER COLUMN country_name SET DEFAULT 'Kazakhstan';

INSERT INTO countries 
	VALUES (7, DEFAULT, 2, 1000205);
                             
INSERT INTO countries (country_id , country_name)
	VALUES (DEFAULT, DEFAULT);

CREATE TABLE countries_new(
	LIKE countries
);

INSERT INTO countries_new
	SELECT * FROM countries;

UPDATE countries_new SET region_id = 1
	WHERE region_id IS NULL;

UPDATE countries_new SET population = population*1.1
    RETURNING country_name, population AS "New Population";

DELETE FROM countries
	WHERE population < 100000;

DELETE FROM countries_new
	AS cn USING countries AS co
	WHERE cn.country_id=co.country_id
	RETURNING *;

DELETE FROM countries
RETURNING *;