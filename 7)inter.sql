CREATE EXTENSION IF NOT EXISTS hstore;
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

CREATE TYPE emp_status AS ENUM ('Active','Inactive');
CREATE DOMAIN positive_salary AS NUMERIC CHECK (VALUE>0);

CREATE TABLE demo(id UUID DEFAULT uuid_generate_v4(), 
skills TEXT[], 
info JSON, 
profile JSONB, 
status emp_status, 
salary positive_salary, 
attrs HSTORE);

INSERT INTO demo(skills,info,profile,status,salary,attrs) VALUES (ARRAY['Python','SQL'],'{"age":25,"city":"LAHORE"}','{"dept":"AI","exp":2}','Active',50000,'lang=>"English",hobby=>"Coding"');

SELECT skills FROM demo;
SELECT skills[1] FROM demo;
SELECT ARRAY_LENGTH(skills,1) FROM demo;

SELECT uuid_generate_v4();

SELECT info FROM demo;
SELECT info->'age' FROM demo;
SELECT info->>'city' FROM demo;

SELECT profile FROM demo;
SELECT profile->'dept' FROM demo;
SELECT profile->>'dept' FROM demo;
SELECT profile-'exp' FROM demo;

SELECT attrs FROM demo;
SELECT attrs->'lang' FROM demo;

SELECT status FROM demo;
SELECT salary FROM demo;

SELECT TO_CHAR(CURRENT_DATE,'DD-MM-YYYY');
SELECT TO_TIMESTAMP('2025-08-08 10:30:45','YYYY-MM-DD HH24:MI:SS');
SELECT AGE('2025-07-23','2020-07-23');
SELECT DATE_TRUNC('month',CURRENT_TIMESTAMP);

