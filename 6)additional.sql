CREATE INDEX idx_employee_name ON employee(emp_name);
CREATE UNIQUE INDEX idx_language ON employee(language_id);
CREATE INDEX idx_high_score ON employee(score) WHERE score>=9.0;
CREATE INDEX idx_upper_name ON employee(UPPER(emp_name));
SELECT indexname FROM pg_indexes WHERE tablename='employee';

DROP INDEX idx_employee_name;
DROP INDEX idx_location_score;
DROP INDEX idx_high_score;
DROP INDEX idx_upper_name;


BEGIN;
INSERT INTO employee VALUES (10123,'Demo Employee','Lahore',2025,8.9,'AI',1);
COMMIT;

SELECT * FROM employee;


BEGIN;
DELETE FROM employee WHERE emp_id=10123;
ROLLBACK;

SELECT * FROM employee;


BEGIN;
UPDATE employee SET location='Model Town' WHERE emp_id=2;
SAVEPOINT s1;
UPDATE employee SET score=9.9 WHERE emp_id=2;
ROLLBACK TO s1;
COMMIT;

SELECT * FROM employee;

CREATE VIEW employee_view AS
SELECT emp_id,emp_name,location FROM employee;

SELECT * FROM employee_view;

UPDATE employee_view SET location='Model Town' WHERE emp_id=3;

DROP VIEW employee_view;

SELECT * FROM employee;

CREATE MATERIALIZED VIEW employee_salary AS
SELECT e.emp_id, e.emp_name,i.salary
FROM employee e
JOIN income i
ON e.emp_id=i.emp_id;


UPDATE employee_salary SET salary=5 WHERE emp_id=1;

SELECT * FROM employee_salary;
REFRESH MATERIALIZED VIEW employee_salary;
DROP MATERIALIZED VIEW employee_salary;



