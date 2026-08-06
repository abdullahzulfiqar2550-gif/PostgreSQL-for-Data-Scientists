CREATE TABLE salary(
    id INT PRIMARY KEY,
    amount INT);

CREATE TABLE salary_total(
    total_amount INT);

INSERT INTO salary_total VALUES (0);

select * from salary_total;


CREATE OR REPLACE FUNCTION total_insert()
RETURNS TRIGGER
AS
$$
BEGIN
    UPDATE salary_total
    SET total_amount = total_amount + NEW.amount;
    RETURN NEW;
END;
$$
LANGUAGE plpgsql;

CREATE TRIGGER total
BEFORE INSERT
ON salary
FOR EACH ROW
EXECUTE FUNCTION total_insert();

INSERT INTO salary VALUES (1,50000);
SELECT * FROM salary_total;
SELECT * FROM salary;


CREATE OR REPLACE FUNCTION total_update()
RETURNS TRIGGER
AS
$$
BEGIN
    UPDATE salary_total
    SET total_amount = total_amount + NEW.amount - OLD.amount;
    RETURN NEW;
END;
$$
LANGUAGE plpgsql;

CREATE TRIGGER total1
BEFORE UPDATE
ON salary
FOR EACH ROW
EXECUTE FUNCTION total_update();

UPDATE salary SET amount = 30000 WHERE id = 1;
SELECT * FROM salary_total;


CREATE OR REPLACE FUNCTION total_delete()
RETURNS TRIGGER
AS
$$
BEGIN
    UPDATE salary_total
    SET total_amount = total_amount - OLD.amount;
    RETURN OLD;
END;
$$
LANGUAGE plpgsql;

CREATE TRIGGER total2
AFTER DELETE
ON salary
FOR EACH ROW
EXECUTE FUNCTION total_delete();

DELETE FROM salary WHERE id = 1;

SELECT * FROM salary_total;

DROP TRIGGER total ON salary;
DROP TRIGGER total1 ON salary;
DROP TRIGGER total2 ON salary;

DROP FUNCTION total_insert();
DROP FUNCTION total_update();
DROP FUNCTION total_delete();

DROP TABLE salary_total;
DROP TABLE salary;