select current_schema();
create schema public;
create database uet;
create schema demos;
select current_schema();
CREATE TABLE emp(
    id SERIAL PRIMARY KEY,
    age INT,
    salary NUMERIC(10,2),
    cgpa FLOAT,
    name VARCHAR(100),
    gender CHAR(1),
    address TEXT,
    joining_date DATE,
    login_time TIMESTAMP,
    project_duration INTERVAL,
    is_active BOOLEAN);

INSERT INTO datademo(age, salary, cgpa, name, gender, address, joining_date, login_time, project_duration, is_active)
VALUES(19,500000.50,3.4,'Abdullah','M','Model, Town','2026-01-15',CURRENT_TIMESTAMP,INTERVAL '6 months',TRUE);

SELECT * FROM datademo;

SELECT column_name,data_type
FROM information_schema.columns
WHERE table_name = 'datademo';