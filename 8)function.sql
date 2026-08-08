CREATE OR REPLACE FUNCTION add_numbers(a INT,b INT) RETURNS INT AS 
$$ 
BEGIN RETURN a+b;  
END ; 
$$ LANGUAGE plpgsql;
SELECT add_numbers(10 ,20);

CREATE OR REPLACE FUNCTION check_number(n INT) RETURNS TEXT AS
$$
BEGIN IF n>0 THEN RETURN 'Positive'; 
ELSE RETURN 'Negative or Zero'; 
END IF;
END; $$ LANGUAGE plpgsql;
SELECT check_number(15);
SELECT check_number(-5);


CREATE OR REPLACE FUNCTION variable_demo() RETURNS INT AS 
$$
DECLARE x INT:=100; BEGIN RETURN x; 
END; $$ LANGUAGE plpgsql;
SELECT variable_demo();

CREATE OR REPLACE FUNCTION for_demo() RETURNS INT AS 
$$ 
DECLARE s INT:=0; BEGIN FOR i IN 1..5 LOOP s:=s+i; 
END LOOP; RETURN s; END;
$$ LANGUAGE plpgsql;
SELECT for_demo();

DROP FUNCTION add_numbers(a INT,b INT);
DROP FUNCTION check_number(n INT);
DROP FUNCTION variable_demo();
DROP FUNCTION for_demo();
