
SELECT current_schema()

CREATE SCHEMA company;

SELECT schema_name
FROM information_schema.schemata
WHERE schema_name = 'company';

CREATE TABLE company.department(
    dept_id SERIAL PRIMARY KEY,
    dept_name VARCHAR(50));

INSERT INTO company.department(dept_name)
VALUES
('AI'),
('Machine Learning'),
('Data Science');

SELECT * FROM company.department;

SHOW search_path;

SET search_path to 'company';

DROP SCHEMA company CASCADE;