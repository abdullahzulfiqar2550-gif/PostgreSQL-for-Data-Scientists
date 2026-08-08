CREATE TABLE employeess(id INT,name VARCHAR(30),salary INT);
INSERT INTO employeess VALUES (1,'Abdullah',50000),(2,'Samran',70000),(3,'Imran',60000);

CREATE OR REPLACE PROCEDURE show_message() LANGUAGE plpgsql AS 
$$ BEGIN RAISE NOTICE 'Welcome to PostgreSQL'; END; 
$$;
CALL show_message();

CREATE OR REPLACE PROCEDURE show_employeess(IN eid INT) LANGUAGE plpgsql AS 
$$ BEGIN RAISE NOTICE '%',(SELECT name FROM employeess WHERE id=eid); END;
$$;
CALL show_employeess(2);

CREATE OR REPLACE PROCEDURE update_salary(IN eid INT,IN newsalary INT) LANGUAGE plpgsql AS $$ BEGIN UPDATE employeess SET salary=newsalary WHERE id=eid; END; $$;
CALL update_salary(1,80000);

SELECT * FROM employeess;

CREATE OR REPLACE PROCEDURE bonus(INOUT amount INT) LANGUAGE plpgsql AS $$ BEGIN amount:=amount+5000; END; $$;
CALL bonus(10000);

DROP PROCEDURE show_message();
DROP PROCEDURE show_employeess(INT);
DROP PROCEDURE update_salary(INT,INT);
DROP PROCEDURE bonus(INT);
DROP TABLE employeess;

