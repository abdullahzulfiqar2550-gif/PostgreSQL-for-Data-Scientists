CREATE TEMP TABLE temp_emp(id INT,name VARCHAR(30));
INSERT INTO temp_emp VALUES (1,'Abdullah'),(2,'Samran'),(3,'Bilal');
SELECT * FROM temp_emp;

CREATE TEMP TABLE temp_delete(id INT) ON COMMIT DELETE ROWS;
INSERT INTO temp_delete VALUES (1),(2);
SELECT * FROM temp_delete;

BEGIN;
CREATE TEMP TABLE temp_deletee(id INT) ON COMMIT DELETE ROWS;
INSERT INTO temp_deletee VALUES (1),(2);
SELECT * FROM temp_deletee;
COMMIT;

SELECT * FROM temp_delete;

BEGIN;
CREATE TEMP TABLE temp_drop(id INT) ON COMMIT DROP;
INSERT INTO temp_drop VALUES (1);
SELECT * FROM temp_drop;
COMMIT;

BEGIN;
CREATE TEMP TABLE temp_preserve(id INT) ON COMMIT PRESERVE ROWS;
INSERT INTO temp_preserve VALUES (1),(2);
SELECT * FROM temp_preserve;
COMMIT;

SELECT * FROM temp_preserve;


SELECT * FROM temp_preserve;

DROP TABLE temp_delete;